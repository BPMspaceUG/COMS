<?php

  // Includes
  include_once '../phpSecureLogin/includes/db_connect.inc.php';
  include_once '../phpSecureLogin/includes/functions.inc.php';
  sec_session_start();
  
  if(login_check($mysqli) != true) {
    header("Location: ../index.php?error_messages='You are not logged in!'");
    exit();
  }
  else {
    $logged = 'in';
  }

  // Parameter and inputstream
  $params = json_decode(file_get_contents('php://input'), true);
  $command = $params["cmd"];  
  

  
  /****************************
    S T A T E     E N G I N E  
  ****************************/
  class StateEngine {
    private $db;
    // tables
    private $table = 'connections'; // root element
    private $table_states = 'state';
    private $table_rules = 'state_rules';
    // columns
    private $colname_rootID = 'id';
    private $colname_stateID = 'state_id_ext';
    
    private $colname_stateID_at_TblStates = 'state_id';
    private $colname_stateName = 'name';
    private $colname_from = ' state_id_FROM';
    private $colname_to = 'state_id_TO';
    

    public function __construct($db/*, $tbl_root, $tbl_states, $tbl_rules, $col_rootID, $col_stateID, $colname_stateID_at_TblStates*/) {
      $this->db = $db;
      /*
      $this->table = $tbl_root;
      $this->table_states = $tbl_states;
      $this->table_rules = $tbl_rules;
      $this->colname_rootID = $col_rootID;
      $this->colname_stateID = $col_stateID;
      $this->colname_stateID_at_TblStates = $colname_stateID_at_TblStates;
      */
    }
    private function getResultArray($result) {
      $results_array = array();
      while ($row = $result->fetch_assoc()) {
        $results_array[] = $row;
      }
      return $results_array;
    }
    public function getActState($id) {
      settype($id, 'integer');
      $query = "SELECT a.".$this->colname_stateID." AS 'id', b.".
        $this->colname_stateName." AS 'name' FROM ".$this->table." AS a INNER JOIN ".
        $this->table_states." AS b ON a.".$this->colname_stateID."=b.".$this->colname_stateID_at_TblStates.
        " WHERE ".$this->colname_rootID." = $id;";
      $res = $this->db->query($query);
      return $this->getResultArray($res);
    }
    public function getStates() {
      $query = "SELECT state_id AS 'id', name FROM ".$this->table_states;
      $res = $this->db->query($query);
      return $this->getResultArray($res);
    }
    public function getEntryPointByTablename($tablename) {
      $query = "SELECT state_id AS 'id' FROM ".$this->table_states." WHERE tablename = '$tablename';";
      $res = $this->db->query($query);
      $r = $this->getResultArray($res);
      return (int)$r[0]['id'];
    }
    public function getStateAsObject($stateid) {
      settype($id, 'integer');
      $query = "SELECT ".$this->colname_stateID_at_TblStates." AS 'id', ".
        $this->colname_stateName." AS 'name' FROM ".$this->table_states.
        " WHERE ".$this->colname_stateID_at_TblStates." = $stateid;";
      $res = $this->db->query($query);
      return $this->getResultArray($res);
    }
    public function getNextStates($actstate) {
      settype($actstate, 'integer');
      $query = "SELECT a.".$this->colname_to." AS 'id', b.".
        $this->colname_stateName." AS 'name' FROM ".$this->table_rules." AS a JOIN ".
        $this->table_states." AS b ON a.".$this->colname_to."=b.".$this->colname_stateID_at_TblStates.
        " WHERE ".$this->colname_from." = $actstate;";
      $res = $this->db->query($query);
      return $this->getResultArray($res);
    }

    public function setState($ElementID, $stateID) {

      // get actual state from element
      $actstateObj = $this->getActState($ElementID);
      if (count($actstateObj) == 0) return false;
      $actstateID = $actstateObj[0]["id"];
      $db = $this->db;
      $roottable = $this->table;

      // check transition, if allowed
      $trans = $this->checkTransition($actstateID, $stateID);
      // check if transition is possible
      if ($trans) {        
        $newstateObj = $this->getStateAsObject($stateID);
        $scripts = $this->getTransitionScripts($actstateID, $stateID);
        
        // Execute all scripts from database at transistion
        foreach ($scripts as $script) {
          // Set path to scripts
          $scriptpath = "functions/".$script["transistionScript"]; 

          // -----------> Standard Result
          $script_result = array(
            "allow_transition" => true,
            "show_message" => false,
            "message" => ""
          );
          
          // If script exists then load it
          if (trim($scriptpath) != "functions/" && file_exists($scriptpath))
            include_once($scriptpath);

          // update state in DB, when plugin says yes
          if (@$script_result["allow_transition"] == true) {
            $query = "UPDATE ".$this->table." SET ".$this->colname_stateID." = ".$stateID.
              " WHERE ".$this->colname_rootID." = ".$ElementID.";";
            $res = $this->db->query($query);
          }

          // Return
          return json_encode($script_result);
        }
        
      }
      return false; // exit
    }
    public function checkTransition($fromID, $toID) {
      settype($fromID, 'integer');
      settype($toID, 'integer');
      $query = "SELECT * FROM ".$this->table_rules." WHERE ".$this->colname_from." = $fromID ".
        "AND ".$this->colname_to." = $toID;";
      $res = $this->db->query($query);
      $cnt = $res->num_rows;
      return ($cnt > 0);
    }
    public function getTransitionScripts($fromID, $toID) {
      settype($fromID, 'integer');
      settype($toID, 'integer');
      $query = "SELECT transistionScript FROM ".$this->table_rules." WHERE ".
      "sqms_state_id_FROM = $fromID AND sqms_state_id_TO = $toID;";
      $return = array();
      $res = $this->db->query($query);
      $return = $this->getResultArray($res);
      return $return;
    }
  }



  //RequestHandler Class Definition starts here
  class RequestHandler {
    // Variables
    private $db;
    private $SE;

    public function __construct() {
      // create DB connection object - Data comes from config file
      $db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
      // check connection
      if($db->connect_errno){
        printf("Connect failed: %s", mysqli_connect_error());
        exit();
      }
      $db->query("SET NAMES utf8");
      $this->db = $db;
      $this->SE = new StateEngine($this->db);
    }
    // Format data for output
    private function parseToJSON($result) {
      $results_array = array();
      if (!$result) return false;
      while ($row = $result->fetch_assoc()) {
        $results_array[] = $row;
      }
      return json_encode($results_array);
    }
    private function buildSQLWherePart($primarycols, $rowcols) {
      $where = "";
      foreach ($primarycols as $col) {
        $where = $where . $col . "='" . $rowcols[$col] . "'";
        $where = $where . " AND ";
      }
      $where = substr($where, 0, -5); // remove last ' AND ' (5 chars)
      return $where;
    }
    private function buildSQLUpdatePart($cols, $primarycols, $rows) {
      $update = "";
      // Convert everything to lowercase      
      $primarycols = array_map('strtolower', $primarycols);
      //$cols = array_map('strtolower', $cols);
      // Loop every element
      foreach ($cols as $col) {
        // update only when no primary column
        if (!in_array($col, $primarycols)) {
          $update = $update . $col."='".$this->db->real_escape_string($rows[$col])."'";
          $update = $update . ", ";
        }
      }
      $update = substr($update, 0, -2); // remove last ' ,' (2 chars)
      return $update;
    }
    public function init() {
      // Send data from config file
      global $config_tables_json;
      return $config_tables_json;
    }
    //================================== CREATE
    public function create($param) {
      // Inputs
      $tablename = $param["table"];
      $rowdata = $param["row"];
      // Split array
      foreach ($rowdata as $key => $value) {
        $keys[] = $this->db->real_escape_string($key);
        // Check if has stateengine
        if ($value == '%!%PLACE_EP_HERE%!%') {
          $EP = $this->SE->getEntryPointByTablename($tablename);
          $value = $EP;
        }
        $vals[] = $this->db->real_escape_string($value);
      }
      // Operation
      $query = "INSERT INTO ".$tablename." (".implode(",", $keys).") VALUES ('".implode("','", $vals)."');";
      $res = $this->db->query($query);
      // Output
      return $res ? "1" : "0";
    }
    //================================== READ

    public function read($param) {
      // Parameters
      $where = isset($param["where"]) ? $param["where"] : "";
      $orderby = isset($param["orderby"]) ? $param["orderby"] : "";
      $ascdesc = isset($param["ascdesc"]) ? $param["ascdesc"] : "";
      $joins = isset($param["join"]) ? $param["join"] : "";

      // ORDER BY
      $ascdesc = strtolower(trim($ascdesc));
      if ($ascdesc == "asc" || $ascdesc == "") $ascdesc == "ASC";
      if ($ascdesc == "desc") $ascdesc == "DESC";
      if (trim($orderby) <> "")
        $orderby = " ORDER BY ".$param["orderby"]." ".$ascdesc;
      else
        $orderby = " "; // ORDER BY replacer_id DESC";

      // LIMIT
      // TODO: maybe if limit Start = -1 then no limit is used
      $limit = " LIMIT ".$param["limitStart"].",".$param["limitSize"];

      // JOIN
      $join_from = $param["tablename"]." AS a"; // if there is no join
      $sel = array();
      $sel_raw = array();
      $sel_str = "";
      if (count($joins) > 0) {
        // Multi-join
        for ($i=0;$i<count($joins);$i++) {
          $join_from .= " JOIN ".$joins[$i]["table"]." AS t$i ON ".
                        "t$i.".$joins[$i]["col_id"]."= a.".$joins[$i]["replace"];
          $sel[] = "t$i.".$joins[$i]["col_subst"]." AS '".$joins[$i]["replace"]."'";
          $sel_raw[] = "t$i.".$joins[$i]["col_subst"];
        }
        $sel_str = ",".implode(",", $sel);
      }

      // SEARCH
      if (trim($where) <> "") {
        // Get columns from the table
        $res = $this->db->query("SHOW COLUMNS FROM ".$param["tablename"].";");
        $k = [];
        while ($row = $res->fetch_array()) { $k[] = $row[0]; } 
        $k = array_merge($k, $sel_raw); // Additional JOIN-columns     
        // xxx LIKE = '%".$param["where"]."%' OR yyy LIKE '%'
        $q_str = "";
        foreach ($k as $key) {
          $prefix = "";
          // if no "." in string then refer to first table
          if (strpos($key, ".") === FALSE) $prefix = "a.";
          $q_str .= " ".$prefix.$key." LIKE '%".$where."%' OR ";
        }
        // Remove last 'OR '
        $q_str = substr($q_str, 0, -3);

        $where = " WHERE ".$q_str;
      }
      // Concat final query
      $query = "SELECT ".$param["select"].$sel_str." FROM ".$join_from.$where.$orderby.$limit.";";
      $query = str_replace("  ", " ", $query);
      $res = $this->db->query($query);
      // Return result as JSON
      return $this->parseToJSON($res);
    }
    //================================== UPDATE
    public function update($param) {
      // SQL
      $update = $this->buildSQLUpdatePart(array_keys($param["row"]), $param["primary_col"], $param["row"]);
      $where = $this->buildSQLWherePart($param["primary_col"], $param["row"]);
      $query = "UPDATE ".$param["table"]." SET ".$update." WHERE ".$where.";";
      $res = $this->db->query($query);
      // TODO: Check if rows where REALLY updated!
      // Output
      return $res ? "1" : "0";
    }
    //================================== DELETE
    public function delete($param) {
      /*  DELETE FROM table_name WHERE some_column=some_value AND x=1;  */
      $where = $this->buildSQLWherePart($param["primary_col"], $param["row"]);
      // Build query
      $query = "DELETE FROM ".$param["table"]." WHERE ".$where.";";
      $res = $this->db->query($query);
      // Output
      return $res ? "1" : "0";
    }
    //==== Statemachine -> substitue StateID of a Table with Statemachine
    public function getNextStates($param) {
      // Find right column (Maybe optimize with GUID)
      $row = $param["row"];
      $stateID = false;
      foreach ($row as $key => $value) {
        // if column contains *state_id*
        if (strpos($key, 'state') !== false) {
          $stateID = $value;
          break;
        }
      }
      // Return invalid
      if ($stateID === false) return json_encode(array());
      // execute query
      $res = $this->SE->getNextStates($stateID);
      return json_encode($res);
    }
    public function getStates($param) {
      // OUT: [{id: 1, name: 'unknown'}, {id: 2, name: 'test'}]
      $res = $this->SE->getStates();
      return json_encode($res);
    }
  }
  // Class Definition ends here
  // Request Handler ends here

  $RH = new RequestHandler();
  
  // check if at least a command is set
  if ($command != "") {
    // are there parameters?
    if ($params != "") {
      // execute with parameters
      $result = $RH->$command($params["paramJS"]);
    } else {
      // only execute
      $result = $RH->$command();
    }
    // Output
    echo $result;
    exit();
  }
?><!DOCTYPE html>
<html lang="en-US">
<head>
  <title>bpmspace_coms_v2</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- CSS -->
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Custom CSS -->
  <style>
thead tr {background-color: #eee;}
.controllcoulm {min-width: 100px; width: 100px; background-color: #eee;}
/**********************************************************/
.panel-table .panel-body{ padding:0; }
.panel-table .panel-body .table-bordered{ border-style: none; margin:0;}
.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type { text-align:center; width: 100px; }
.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type { border-right: 0px; }
.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type { border-left: 0px; }
.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{ border-bottom: 0px; }
.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{ border-top: 0px; }
.panel-table .panel-footer .pagination{ margin:0; }
/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{ line-height: 34px; height: 34px; }
.panel-table .panel-heading .col h3{ line-height: 30px; height: 30px; }
.panel-table .panel-body .table-bordered > tbody > tr > td{ line-height: 34px; }
.fKeyLink {}
.fKeyLink:hover {text-decoration: none;}

[animate-on-change] { transition: all 1s; -webkit-transition: all 1s; }
[animate-on-change].changed { background-color: #cffda2; transition: none; -webkit-transition: none; }
/*
#bpm-liam-header { 
  margin-top: -20px; 
  margin-bottom: 10px; 
  padding-right: 50px;
}
#bpm-logo-care { 
  position:relativ;  
  z-index: 10;  
  margin-right: -20px;
}
#bpm-logo    { 
  position:relativ; 
  margin-bottom: 20px;
}
#bpm-menu {
  margin-right: 20px; 
  margin-left: 20px; 
  margin-bottom: 10px;
}
#bpm-content {
  margin-right: 20px; 
  margin-left: 20px; 
  margin-bottom: 10px;
}
#bpm-footer {
  margin-right: 10px; 
  margin-left: 10px; 
  margin-bottom: 10px;
}
*/
/* Table */
table th span {cursor: pointer;}
table th span:hover {color: steelblue;}
table tr td {white-space: nowrap;}
/* State Engine */
.state1 {background-color: greenyellow;}
.state2 {background-color: yellow;}
.state3 {background-color: red;}
.state4 {background-color: orange;}
.state5 {background-color: blue;}
.state6 {background-color: khaki;}
.state7 {background-color: lightblue;}
.state8 {background-color: lightyellow;}
.state9 {background-color: mediumorchid;}
.state10 {background-color: tan;}
.state11 {background-color: wheat;}
.state12 {background-color: darksalmon;}

  </style>
</head>
<body ng-app="genApp" ng-controller="genCtrl">
<!--  body menu starts here -->
<div class="container">  
  <!-- Company Header -->
  <div class="row">
    <div  class="row text-right">
      <div class="col-md-12">
        <a href='#' id="bpm-logo-care" class="btn collapsed" data-toggle="collapse" data-target="#bpm-logo, #bpm-liam-header">
          <i class="fa fa-caret-square-o-down"></i>
        </a>
      </div>
      <div class="col-md-12 collapse" id="bpm-liam-header">
        <?php include_once('../_header_LIAM.inc.php'); ?>          
      </div>
    </div>
  </div>
  <div class="row collapse">
    <div class="col-md-12" id="bpm-logo">
      <div class="col-md-6 ">
        <svg height="100" width="100">
          <rect fill="red" x="0" y="0" width="100" height="100" rx="15" ry="15"></rect>
          <text x="50" y="55" fill="white" text-anchor="middle" alignment-baseline="central">your logo</text>
        </svg>
      </div>
      <div class="col-md-6 ">
        <svg class="pull-right" height="100" width="200">
          <rect fill="blue" x="0" y="0" width="200" height="100" rx="15" ry="15"></rect>
          <text x="100" y="55" fill="white" text-anchor="middle" alignment-baseline="central">sample</text>
        </svg>
      </div>
    </div>
  </div>
  <!-- NAVIGATION -->
  <ul class="nav nav-tabs" role="tablist" id="myTabs">
    <li ng-repeat="table in tables | orderBy : 'table_alias' track by $index" role="presentation" ng-class="{active: ($index == 0)}">
      <a href="#{{table.table_name}}" aria-controls="{{table.table_name}}" data-toggle="tab" role="tab" ng-click="changeTab()">
        <i class="{{table.table_icon}}"></i>&nbsp;<span ng-bind="table.table_alias"></span>
      </a>
    </li>
  </ul> 
</div><!-- Loading Screen or Errors -->
<div class="container">
  <div class="alert alert-info" ng-show="isLoading">
    <p><i class="fa fa-cog fa-spin"></i> Loading ...</p>
  </div>
</div>
<!-- body content starts here  -->
<div class="container" id="content">

  <div class="row">
    <div class="col-xs-12 tab-content">

      <div ng-repeat="table in tables track by $index" class="tab-pane" ng-class="{active: ($index == 0)}" id="{{table.table_name}}">
        <div class="panel panel-primary panel-table" disabled>
          <div class="panel-heading">
            <h3 class="panel-title">
              <div class="pull-left" style="margin-top: .4em; font-weight: bold;">{{table.table_alias}}</div>
              <!-- Where filter -->
              <form class="form-inline pull-right">
                <div class="form-group">
                  <!-- ADD -->
                  <button class="btn btn-success" title="Add new entry" ng-hide="table.is_read_only" type="button"
                  	ng-click="addEntry(table.table_name);"><i class="fa fa-plus"></i></button>
                  <!-- SEARCH -->
                  <input type="text" class="form-control" style="width:200px;" placeholder="Search..."
                    ng-model="table.sqlwhere"/>
                  <!-- REFRESH -->
                  <button class="btn btn-default" title="Refresh table" 
                  	ng-click="refresh(table.table_name);"><i class="fa fa-refresh"></i></button>                  
                </div>
              </form>
              <div class="clearfix"></div>
            </h3>
          </div>
          <div class="panel-body table-responsive">
          	<!-- Display user info No Entries found -->
          	<table class="table table-bordered table-striped table-hover table-condensed" ng-if="table.count <= 0">
          		<thead>
          			<tr><th style="padding: 3em 0; font-weight: normal;">No entries found</th></tr>
          		</thead>          		
          	</table>
            <table class="table table-bordered table-striped table-hover table-condensed" ng-if="table.count > 0">
              <!-- ============= COLUMN HEADERS ============= -->
              <thead>
                <tr>                 
                  <th ng-repeat="(key, value) in table.rows[0]"
                    ng-if="getColByName(table, key).is_in_menu">
                    <span ng-click="sortCol(table, key)">{{getColAlias(table, key)}}
                      <i class="fa fa-caret-down" ng-show="table.sqlorderby == key && table.sqlascdesc == 'desc'"></i>
                      <i class="fa fa-caret-up" ng-show="table.sqlorderby == key && table.sqlascdesc == 'asc'"></i>
                    </span>
                  </th>
                  <th ng-hide="table.is_read_only"><em class="fa fa-cog"></em></th>
                </tr>
              </thead>
              <tbody>
                <!-- ============= CONTENT ============= -->
                <!-- TODO: do not insert cells via index... because of ORDER! -->
                <tr ng-repeat="row in table.rows" data-toggle='modal' data-target="modal-container-1">
                  <!-- Data entries -->
                  <td ng-repeat="(key, value) in row" ng-if="getColByName(table, key).is_in_menu">
                    <!-- Substitue State Machine -->
                    <div ng-if="(( key.indexOf('state') >= 0) && table.se_active)">
                      <button class="btn" ng-class="'state'+ value"
                        ng-click="openSEPopup(table, row)">{{substituteSE(table.table_name, value)}}</button>
                    </div>
                    <!-- Cell -->
                    <span ng-if="!(( key.indexOf('state') >= 0) && table.se_active)">
                   		{{value | limitTo: 50}}{{value.length > 50 ? '...' : ''}}
                   	</span>
                  </td>
                  <!-- Edit options -->
                  <td class="controllcoulm" ng-hide="table.is_read_only">
                    <!-- Update Button -->
                    <a class="btn btn-default" data-toggle="modal" data-target="#modal" 
                      ng-click="editEntry(table, row)" title="Edit">
                      <i class="fa fa-pencil"></i>
                    </a>
                    <!-- Delete Button -->
                    <button id="del{{$index}}" class="btn btn-danger" title="Delete"
                      ng-click="send('delete', {row:row, colum:$index, table:table})">
                      <i class="fa fa-times"></i></button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="panel-footer">
              <div class="row">
                <div class="col col-xs-6">
                  <span class="text-primary">
                    <span>{{table.count}} Entries total</span>
                    <span ng-if="getNrOfPages(table) > 0"> - Page {{table.PageIndex + 1}} of {{ getNrOfPages(table) }}</span>
                  </span>
                </div>
                <div class="col col-xs-6">
                  <ul class="pagination pull-right"><!-- visible-xs -->
                    <!-- JUMP to first page -->
                    <li ng-class="{disabled: table.PageIndex <= 0}">
                      <a href="" ng-click="gotoPage(0, table)">«</a>
                    </li>          
                    <!-- Page Buttons -->
                    <li ng-repeat="btn in getPageination(table.table_name)"
                      ng-class="{disabled: btn + table.PageIndex == table.PageIndex}">
                      <a href="" ng-click="gotoPage(btn + table.PageIndex, table)">{{btn + table.PageIndex + 1}}</a>
                    </li>
                    <!-- JUMP to last page -->
                     <li ng-class="{disabled: (table.PageIndex + 1) >= (table.count / PageLimit)}">
                      <a href="" ng-click="gotoPage(999999, table)">»</a>
                    </li>
                  </ul>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal for Editing DataRows -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">
          <span ng-if="createNewEntry"><i class="fa fa-plus"></i> Create Entry</span>
          <span ng-if="!createNewEntry"><i class="fa fa-pencil"></i> Edit Entry</span>
        </h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <!-- Add if is in menu -->
          <div class="form-group" ng-repeat="(key, value) in selectedTask"
            ng-if="getColByName(selectedTable, key).is_in_menu">
          	<div ng-hide="selectedTable.se_active && (key.indexOf('state_id') >= 0)">
              <!-- LABEL -->
	            <label for="inputX" class="col-sm-3 control-label">{{getColAlias(selectedTable, key)}}</label>
              <!-- VALUE -->
              <div class="col-sm-9">
                <!-- TODO: Read Only -->                
                <!-- Foreign Key (FK) -->
                <span ng-if="getColByName(selectedTable, key).foreignKey.table != ''">
                	<p class="form-control-static">
                    <a href="#" class="fKeyLink"
                      ng-click="openFK(getColByName(selectedTable, key).foreignKey.table)">
                      <i class="fa fa-key"></i> {{value}}</a>
                  </p>
                </span>
                <!-- NO FK -->
                <span ng-if="getColByName(selectedTable, key).foreignKey.table == ''">
	                <!-- Number  -->
	                <input class="form-control" type="number" string-to-number 
	                  ng-if="getColByName(selectedTable, key).COLUMN_TYPE.indexOf('int') >= 0
	                  && getColByName(selectedTable, key).COLUMN_TYPE.indexOf('tiny') < 0"
	                  ng-model="selectedTask[key]">
	                <!-- Text -->
	                <input class="form-control" type="text"
	                  ng-if="getColByName(selectedTable, key).COLUMN_TYPE.indexOf('int') < 0
	                  && getColByName(selectedTable, key).COLUMN_TYPE.indexOf('long') < 0"
	                  ng-model="selectedTask[key]">
	                <!-- LongText (probably HTML) -->
	                <textarea class="form-control" rows="3"
	                  ng-if="getColByName(selectedTable, key).COLUMN_TYPE.indexOf('longtext') >= 0"
	                  ng-model="selectedTask[key]"></textarea>
	                <!-- TODO: Date -->
	                <!-- TODO: Boolean (tinyint or boolean)
	                <input class="form-control" type="checkbox"
	                  ng-show="table.columnsX[$index].COLUMN_TYPE.indexOf('tinyint') >= 0 &&
	                  !table.columnsX[$index].is_read_only"
	                  ng-model="table.newRows[0][$index]">
	                <!-- Datatype -->
	                <!--<div><small class="text-muted">{{ getColByName(selectedTable, key).COLUMN_TYPE }}</small></div>-->
	              </span>
	            </div>
	          </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
      	<span ng-if="!createNewEntry">
        	<button class="btn btn-primary" ng-click="saveEntry()"><i class="fa fa-floppy-o"></i> Save</button>
        	<button class="btn btn-primary" ng-click="saveEntry()" data-dismiss="modal"><i class="fa fa-floppy-o"></i> Save &amp; Close</button>
        </span>
        <span ng-if="createNewEntry">
        	<button class="btn btn-success" data-dismiss="modal" ng-click="send('create', {row: selectedTask, table: selectedTable})"><i class="fa fa-plus"></i> Create</button>
        </span>
        &nbsp;
        <button class="btn btn-default pull-right" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal for ForeignKey -->
<div class="modal fade" id="myFKModal" tabindex="-1" role="dialog" aria-labelledby="myFKModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myFKModalLabel"><i class="fa fa-key"></i> Select a Foreign Key</h4>
      </div>
      <div class="modal-body">
        <p>Search: <input class="form-control" type="text" autofocus></p>
        <div>
          <table class="table table-bordered table-striped table-hover table-condensed table-responsive">
            <thead>
              <tr>
                <th ng-repeat="(key, value) in FKTbl.rows[0]" ng-if="getColByName(FKTbl, key).is_in_menu">
                  <span>{{getColAlias(FKTbl, key)}}</span>
                </th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="row in FKTbl.rows" ng-click="selectFK(row)" style="cursor: pointer;">
                <td ng-repeat="(key, value) in row" ng-if="getColByName(FKTbl, key).is_in_menu">
                  {{value | limitTo: 50}}{{value.length > 50 ? '...' : ''}}
                </td>
              </tr>
            </tbody>
          </table>
        </div>        
        <span class="text-primary">
          <span>{{FKTbl.count}} Entries total</span>
          <span ng-if="getNrOfPages(FKTbl) > 0"> - Page {{FKTbl.PageIndex + 1}} of {{ getNrOfPages(FKTbl) }}</span>
        </span>
      </div>
      <div class="modal-footer">
        <div class="row">
          <div class="col-xs-8">
            <ul class="pagination" style="margin:0; padding:0;">
              <li ng-class="{disabled: FKTbl.PageIndex <= 0}"><a href="" ng-click="gotoPage(0, FKTbl)">«</a></li>          
              <li ng-repeat="btn in getPageination(FKTbl.table_name)"
                ng-class="{disabled: btn + FKTbl.PageIndex == FKTbl.PageIndex}">
                <a href="" ng-click="gotoPage(btn + FKTbl.PageIndex, FKTbl)">{{btn + FKTbl.PageIndex + 1}}</a>
              </li>
              <li ng-class="{disabled: (FKTbl.PageIndex + 1) >= (FKTbl.count / PageLimit)}">
                <a href="" ng-click="gotoPage(999999, FKTbl)">»</a>
              </li>
            </ul>
          </div>        
          <div class="col-xs-4">
            <button class="btn btn-default pull-right" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal for StateEngine -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Go to next State</h4>
      </div>
      <div class="modal-body">
        <p></p>
      </div>
      <div class="modal-footer">
        <span class="pull-left">
          <span>Goto &rarr; </span>
          <span ng-repeat="state in selectedTable.nextstates">
            <!--<pre>{{state}}</pre>-->
            <button type="button" class="btn" ng-class="'state'+state.id" ng-click="gotoState(state)" >{{state.name}}</button>
          </span>
        </span>
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- content ends here -->  <!--  Footer -->
  <div class="container">
    <div class="footer">
      <div class="row text-center">
        <small>
          <ul class="list-inline">
            <li><b>bpmspace_coms_v2</b></li>
            <li>using</li>
            <li><a target="_blank" href="http://getbootstrap.com/">Bootstrap</a></li>
            <li><a target="_blank" href="https://jquery.com/">jQuery</a></li>
            <li><a target="_blank" href="https://angularjs.org/">AngularJS</a></li>
            <li><a target="_blank" href="http://php.net/">PHP</a></li>
            <li><a target="_blank" href="https://github.com/peredurabefrog/phpSecureLogin">phpSecureLogin</a></li>
          </ul>
        </small>
      </div>
    </div>
  </div>
  <!-- JS -->
  <script type="text/javascript" src="../js/angular.min.js"></script>
  <script type="text/javascript" src="../js/angular-sanitize.min.js"></script>
  <script type="text/javascript" src="../js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap.min.js"></script>
  <!-- the line below gets replaced with the generated table -->
  <!-- replaceDBContent -->
  <!-- Angular handling-script -->
  <script type="text/javascript">
var app = angular.module("genApp", [])
//--- Controller
app.controller('genCtrl', function ($scope, $http) {
  $scope.tables = []
  $scope.isLoading = true
  $scope.PageLimit = 10 // default = 10
  $scope.selectedTask = []
  $scope.FKTbl = []
  $scope.createNewEntry = false

  $scope.saveEntry = function() {
    // Task is already loaded in memory
    $scope.send('update')
  }
  $scope.editEntry = function(table, row) {
  	$scope.createNewEntry = false
  	$scope.loadRow(table, row)
  }
  $scope.addEntry = function(table_name) {
    t = $scope.getTableByName(table_name)
    // create empty element
    var newRow = {}
    t.columns.forEach(function(col){
      // check if auto_inc
      if (col.EXTRA != 'auto_increment')
        newRow[col.COLUMN_NAME] = ''
    })
    // load into scope
    $scope.loadRow(t, newRow)
    $scope.createNewEntry = true
    // show modal
    $('#modal').modal('show')
  }
  $scope.getColAlias = function(table, col_name) {
  	res = ''
  	table.columns.forEach(function(col){
  		// Compare names
  		if (col.COLUMN_NAME == col_name)
  			res = col.column_alias
  	})
  	if (res == '') return col_name; else return res;
  }
  $scope.getColByName = function(table, col_name) {
    res = null // empty object
    table.columns.forEach(function(col){
      // Compare names
      if (col.COLUMN_NAME == col_name)
        res = col
    })
    if (res === null) return null; else return res;
  }
  $scope.sortCol = function(table, columnname) {
    console.log("Clicked -----------> SORT <-----------")
    table.sqlascdesc = (table.sqlascdesc == "desc") ? "asc" : "desc"
    table.sqlorderby = columnname
    $scope.refresh(table.table_name)
  }
  $scope.getSortIcon = function(table, colname) {
    return "fa fa-arrow";
  }
  $scope.openFK = function(table_name) {
    console.log("-> FK", table_name)
    // Get the table from foreign key
    $scope.FKTbl = $scope.getTableByName(table_name)
    console.log("FK:", $scope.FKTbl)
    $('#myFKModal').modal('show')
  }
  $scope.selectFK = function(row) {
    console.log("Selected FK:", row)
    // Write the new key in the current model
    console.log($scope.selectedTask)
    // 1. Know the right KEY which has to be edited

    // 2. Save the value, like:
    $scope.selectedTask.sqms_language_id.id = row.sqms_language_id
    // 3. Save the substituted value in the model
    $scope.selectedTask.sqms_language_id = row.language
    // Close modal
    $('#myFKModal').modal('hide')
  }
  $scope.getPageination = function(table_name) {
    NrOfButtons = 5
    t = $scope.getTableByName(table_name)
    if (!t) return
    NrOfPages = $scope.getNrOfPages(t)

    // [x] Case 1: Pages are less then NrOfBtns => display all
    if (NrOfPages <= NrOfButtons) {
      pages = new Array(NrOfPages)
      for (var i=0;i<pages.length;i++)
        pages[i] = i - t.PageIndex
    } else {
      // [x] Case 2: Pages > NrOfBtns display NrOfBtns
      pages = new Array(NrOfButtons)
      // [x] Case 2.1 -> Display start edge
      if (t.PageIndex < Math.floor(pages.length / 2))
        for (var i=0;i<pages.length;i++) pages[i] = i - t.PageIndex
      // [x] Case 2.2 -> Display middle
      else if ((t.PageIndex >= Math.floor(pages.length / 2))
        && (t.PageIndex < (NrOfPages - Math.floor(pages.length / 2))))
        for (var i=0;i<pages.length;i++) pages[i] = -Math.floor(pages.length / 2) + i 
      // [x] Case 2.3 -> Display end edge
      else if (t.PageIndex >= NrOfPages - Math.floor(pages.length / 2)) {
        for (var i=0;i<pages.length;i++) pages[i] = NrOfPages - t.PageIndex + i - pages.length
      }
    }
    return pages
  }
  $scope.loadRow = function(tbl, row) {  	
    $scope.selectedTask = angular.copy(row)
    $scope.selectedTable = tbl
  }
  $scope.gotoPage = function(newIndex, table) {
  	lastPageIndex = Math.ceil(table.count / $scope.PageLimit) - 1
    // Check borders
  	if (newIndex < 0) newIndex = 0 // Lower limit
  	if (newIndex > lastPageIndex) newIndex = lastPageIndex // Upper Limit
    // Set new index
  	table.PageIndex = newIndex
  	$scope.refresh(table.table_name)
  }
  $scope.openSEPopup = function(tbl, row) {
    $scope.loadRow(tbl, row) // select current Row
    $scope.send("getNextStates")
  }
  $scope.gotoState = function(nextstate) {
    // TODO: Optimize ... check on serverside if possible etc.
    res = null
    for (property in $scope.selectedTask) {
      if (property.indexOf('state_id') >= 0)
        res = property
    }
    $scope.selectedTask[res] = nextstate.id
    $scope.send('update')
  }
  $scope.getTableByName = function(tablename) {
    if (typeof tablename != "string") return
    return $scope.tables.find(function(t){
      return t.table_name == tablename;
    })
  }
  $scope.getNrOfPages = function(table) {
    if (table) return Math.ceil(table.count / $scope.PageLimit)
  }
  $scope.initTables = function() {
  	console.log("init Tables...")
    // Request data from config file
  	$http({
  		url: window.location.pathname,
  		method: 'POST',
  		data: {cmd: 'init', paramJS: ''}
  	}).success(function(resp){
      // Init each table
  		resp.forEach(function(t){
        // If table is in menu
        if (t.is_in_menu) {
          // Add where, sqlwhere, order
          t.sqlwhere = ''
          t.sqlwhere_old = ''
          t.sqlorderby = ''
          t.sqlascdesc = ''
          t.nextstates = []
          t.statenames = []
          t.PageIndex = 0
          // Push into angular scope
          $scope.tables.push(t)
          console.log("Added Table:", t)
        }
      })
      // Refresh each table
      $scope.tables.forEach(function(t){$scope.refresh(t.table_name);})
      // GUI
      $scope.isLoading = false
  	});	
  }
  $scope.countEntries = function(table_name) {  	
    t = $scope.getTableByName(table_name)
    // Get columns from columns
    joins = []
    t.columns.forEach(function(col) {
      if (col.foreignKey.table != "") { // Check if there is a substitute for the column
        col.foreignKey.replace = col.COLUMN_NAME
        joins.push(col.foreignKey)
      }
    })
    $http({
      method: 'POST',
      url: window.location.pathname,
      data: {
        cmd: 'read',
        paramJS: {
          select: "COUNT(*) AS cnt",
          tablename: t.table_name,
          limitStart: 0,
          limitSize: 1,
          where: t.sqlwhere,
          orderby: t.sqlorderby,
          ascdesc: t.sqlascdesc,
          join: joins
        }
      }
    }).success(function(response){
      // Counting done
      console.log("Counted entries from [", table_name, "] ...", response)
      t = $scope.getTableByName(table_name)
      t.count = response[0].cnt
    });
  }

  //------------------------------------------------------- Statemachine functions

  $scope.substituteSE = function(tablename, stateID) {
    t = $scope.getTableByName(tablename)
    // Converts stateID -> Statename
    res = stateID
    t.statenames.forEach(function(state){
      if (parseInt(state.id) == parseInt(stateID))
        res = state.name
    })
    return res
  }
  $scope.getStatemachine = function(table_name) {
    t = $scope.getTableByName(table_name)
    // Check if table has a state engine
    if (!t.se_active) return
    console.log("get states from table [", table_name, "]")

  	$http({
  		url: window.location.pathname,
  		method: 'post',
  		data: {
  			cmd: 'getStates',
  			paramJS: {tablename: table_name}
  	}
  	}).success(function(response){
      // Save statemachine at the table
      $scope.getTableByName(table_name).statenames = response
  	})
  }

  //-------------------------------------------------------

  // Refresh Function
  $scope.refresh = function(table_name) {
  	console.log("Started refreshing", table_name)
    t = $scope.getTableByName(table_name)
    // Search-Event(set LIMIT Param to 0)
    if (t.sqlwhere != t.sqlwhere_old)
    	t.PageIndex = 0
    // Get columns from columns
    sel = []
    joins = []
    t.columns.forEach(function(col) {
      // TODO: -> better on server side
      if (col.foreignKey.table != "") { // Check if there is a substitute for the column
        col.foreignKey.replace = col.COLUMN_NAME
        joins.push(col.foreignKey)
      } else 
        sel.push("a."+col.COLUMN_NAME)
    })
    str_sel = sel.join(",")

  	// Request from server
  	$http({
  		url: window.location.pathname,
  		method: 'POST',
  		data: {
  		cmd: 'read',
  		paramJS: {
  			tablename: t.table_name,
  			limitStart: t.PageIndex * $scope.PageLimit,
  			limitSize: $scope.PageLimit,
  			select: str_sel,
        where: t.sqlwhere,
        orderby: t.sqlorderby,
       	ascdesc: t.sqlascdesc,
        join: joins
  		}
  	}
  	}).success(function(response){
      console.log("Refreshed [", table_name, "] ...", response)
      t = $scope.getTableByName(table_name)      
      t.rows = response // Save cells in tablevar
      t.sqlwhere_old = t.sqlwhere
      if (response.length >= $scope.PageLimit)
      	// countrequest if nr of entries >= PageLimit
        $scope.countEntries(table_name)
      else {
      	// Save nr of entries in table
        if (t.PageIndex == 0)
        	t.count = response.length
      }
      // Get the states from table
      $scope.getStatemachine(table_name)
  	})
  }

  // --------------------------
  
  $scope.initTables()

  // --------------------------

  $scope.filterFKeys = function(table, row) {
    var result = {}
    keys = Object.keys(row) // get column names
    for (var i=0;i<keys.length;i++) {
      col = keys[i]
      if ($scope.getColByName(table, col).foreignKey.table == "") {
        result[col] = row[col]
      } else {
        // TODO: Substitue with the new ID
        console.log($scope.selectedTask[col], row[col])
        //if ($scope.selectedTask[col] != row[col])
        //  result[col] = $scope.selectedTask[col].id
      }
    }
    return result
  }

  /* Allround send for changes to DB */
  $scope.send = function(cud, param){
    // TODO: remove this
    // load in memory
    if (param) $scope.loadRow(param.table, param.row)

    console.log("-> Send [", cud, "] Params:", param)
    var body = {cmd: 'cud', paramJS: {}}

    t = $scope.selectedTable
    //console.log("Selected Table:", t)

    // TODO: probably not the best idea to send the primary columns from client
    // better assebmle them on the server side

    // Function which identifies _all_ primary columns
    function getPrimaryColumns(col) {
      var resultset = []
      for (var i = 0; i < col.length-1; i++) {
        if (col[i].COLUMN_KEY.indexOf("PRI") >= 0)
          resultset.push(col[i].COLUMN_NAME)
      }
      return resultset;
    }


    // Assemble data for Create, Update, Delete Functions
  	if (cud == 'create' || cud == 'delete' || cud == 'update'
     || cud == 'getNextStates' || cud == 'getStates') {
     		// Confirmation when deleting
        if (cud == 'delete') {
      		IsSure = confirm("Do you really want to delete this entry?")
      		if (!IsSure) return
        }
  		  // if Sure -> continue
  		  body.paramJS = {
    			row: $scope.selectedTask,
    			primary_col: getPrimaryColumns(t.columns),
    			table: t.table_name
    		}
        // Filter out foreign keys
        if (cud == 'update')
          body.paramJS.row = $scope.filterFKeys(t, body.paramJS.row)

        // Check if state_machine
        if (cud == 'create')
          body.paramJS.row.state_id = '%!%PLACE_EP_HERE%!%';

  	} else {
  		// Unknown Command
      console.log('unknown command: ', cud)
      return
    }
    // ------------------- Finally -> Send request
    console.log("### POST", "Command:", cud, "Params:", body.paramJS)
    // Send request to server
    $http({
      url: window.location.pathname,
      method: 'POST',
      data: {
        cmd: cud,
        paramJS: body.paramJS
      }
    }).success(function(response) {
      // Response
      console.log("ResponseData: ", response)
      //-------------------- table data was modified
      if (response != 0 && (cud == 'delete' || cud == 'update' || cud == 'create')) {
        // hide modals
        $('#myModal').modal('hide') // Hide stateModal
        // CREATE - Done
        if (cud == 'create') {
          $('#modal').modal('hide') // Hide create-modal
          // TODO: Maybe jump to entry which was created
        }
        // Refresh table
        $scope.refresh(body.paramJS.table)
      }
      //---------------------- StateEngine (List Transitions)
      else if (cud == 'getNextStates') {
        $scope.getTableByName(body.paramJS.table).nextstates = response
        $('#myModal').modal('show')
      }
      else if (cud == 'getStates') {
      	alert("WTF")
      }
      else {
        alert("An Error occoured while "+cud+" command.")
      }
    })

  }
})
//--- Directives
/*
app.directive('animateOnChange', function($timeout) {
  return function(scope, element, attr) {
    scope.$watch(attr.animateOnChange, function(nv,ov) {
      // TODO: only animate when cmd [update] was sent
      if (nv != ov) {
        element.addClass('changed');
        $timeout(function() {element.removeClass('changed');}, 1500);
      }
    })
  }
})
*/
app.directive('stringToNumber', function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      ngModel.$parsers.push(function(value) { return '' + value; })
      ngModel.$formatters.push(function(value) { return parseFloat(value); })
    }
  }
})</script>       
</body>
</html>