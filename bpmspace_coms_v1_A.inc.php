<?php
  // Includes
  require_once(__DIR__.'/src/DatabaseHandler.inc.php'); // For AuthKey from Config
  require_once(__DIR__.'/src/AuthHandler.inc.php');

  // Check if authenticated via Token
  $rawtoken = JWT::getBearerToken();
  try {
    $token = JWT::decode($rawtoken, AUTH_KEY);
  }
  catch (Exception $e) {
    // Invalid Token!
    http_response_code(401);
    header("Location: login.php");
    exit();
  }
  // Token vaild but expired
  if (property_exists($token, "exp")) {
    if (($token->exp - time()) <= 0) {
      http_response_code(401);
      header("Location: login.php");
      exit();
    }
  }

  //---------------> Token vaild    

  echo "Hello "/*.var_export($token, true)*/."! ";
  if (property_exists($token, "exp"))
    echo "Your Token will expire in ".number_format((($token->exp - time()) / 60), 2, ',', '.')."min. To log out, clear the cookies.";
  else
    echo "Your Token will never be expiring.";

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Title -->
  <title>bpmspace_coms_v1_A - [IPMSProject]</title>
  <!-- CSS via CDN -->
  <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">-->
  <link rel="stylesheet" href="https://bootswatch.com/4/cosmo/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css"/>
  <link rel="stylesheet" href="css/muster.css">
  <style>
    html {position: relative; min-height: 100%;}
    body {margin-bottom: 60px;}
    .footer {position: absolute; bottom: 0; width: 100%; height: 60px; line-height: 60px; background-color: #f5f5f5; font-size: 12px;}
  </style>
  <!-- JS via CDN -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
</head>
<body><!-- body content starts here  -->
<!--<h1>&nbsp;</h1>-->
<main role="main">
  <div class="container-fluid">
    <div class="text-center text-primary initloadingtext">
      <h1><i class="fa fa-spinner fa-pulse"></i> Loading...</h1>
    </div>
    <div class="card mainapp collapse">
      <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
                      <li class="nav-item">
              <a class="nav-link" href="#coms_certificate" data-toggle="tab">
                <i class="fa fa-book"></i>&nbsp;
                <span class="table_alias">Certificates</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_certificate_participant" data-toggle="tab">
                <i class="fa fa-certificate"></i>&nbsp;
                <span class="table_alias">Certificate Participant</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_exam" data-toggle="tab">
                <i class="fa fa-exclamation-triangle"></i>&nbsp;
                <span class="table_alias">Exam</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_exam_event" data-toggle="tab">
                <i class="fa fa-exclamation-circle"></i>&nbsp;
                <span class="table_alias">Exam Event</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_participant" data-toggle="tab">
                <i class="fa fa-group"></i>&nbsp;
                <span class="table_alias">Participants</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_participant_exam_event" data-toggle="tab">
                <i class="fa fa-eye"></i>&nbsp;
                <span class="table_alias">Participant Exam Event</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_proctor" data-toggle="tab">
                <i class="fa fa-user"></i>&nbsp;
                <span class="table_alias">Proctor</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_trainer" data-toggle="tab">
                <i class="fa fa-male"></i>&nbsp;
                <span class="table_alias">Trainer</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_training_organisation" data-toggle="tab">
                <i class="fa fa-bank"></i>&nbsp;
                <span class="table_alias">Training Organisation</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_training_organisation_proctor" data-toggle="tab">
                <i class="fa fa-user"></i>&nbsp;
                <span class="table_alias">Training Organisation Proctor</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#coms_training_organisation_trainer" data-toggle="tab">
                <i class="fa fa-female"></i>&nbsp;
                <span class="table_alias">Training Organisation Trainer</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#state" data-toggle="tab">
                <i class="fa fa-square"></i>&nbsp;
                <span class="table_alias">State</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#state_machines" data-toggle="tab">
                <i class="fa fa-square"></i>&nbsp;
                <span class="table_alias">Statemachines</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#state_rules" data-toggle="tab">
                <i class="fa fa-square"></i>&nbsp;
                <span class="table_alias">Staterules</span>
              </a>
            </li>
        </ul>
      </div>
      <div class="card-body">
        <div class="tab-content">
                      <div role="tabpanel" class="tab-pane" id="coms_certificate"><div class="table_coms_certificate"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_certificate_participant"><div class="table_coms_certificate_participant"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_exam"><div class="table_coms_exam"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_exam_event"><div class="table_coms_exam_event"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_participant"><div class="table_coms_participant"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_participant_exam_event"><div class="table_coms_participant_exam_event"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_proctor"><div class="table_coms_proctor"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_trainer"><div class="table_coms_trainer"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_training_organisation"><div class="table_coms_training_organisation"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_training_organisation_proctor"><div class="table_coms_training_organisation_proctor"></div></div>
            <div role="tabpanel" class="tab-pane" id="coms_training_organisation_trainer"><div class="table_coms_training_organisation_trainer"></div></div>
            <div role="tabpanel" class="tab-pane" id="state"><div class="table_state"></div></div>
            <div role="tabpanel" class="tab-pane" id="state_machines"><div class="table_state_machines"></div></div>
            <div role="tabpanel" class="tab-pane" id="state_rules"><div class="table_state_rules"></div></div>
        </div>
      </div>
    </div>
  </div>
</main>  <!--  Footer -->
  <footer class="footer">
    <div class="container">
      <span class="text-muted">
        <b>bpmspace_coms_v1_A</b> is using
        <a target="_blank" href="http://php.net/">PHP</a>,&nbsp;
        <a target="_blank" href="http://getbootstrap.com/">Bootstrap4</a>,&nbsp;
        <a target="_blank" href="https://jquery.com/">jQuery</a>,&nbsp;
        <a target="_blank" href="http://visjs.org/">visjs</a>
      </span>
    </div>
  </footer>
  <!-- JS -->
  <script src="js/muster.js"></script>
  <script>
    $(document).ready(function() {
      DB.init('api.php', function(){
        // Message when everything is ready
        console.log('Everything ready!')
        // First Tab selection
        $('.nav-tabs .nav-link:first').addClass('active')
        $('.tab-content .tab-pane:first').addClass('active')
        // Loading disable
        $('.initloadingtext').hide();
        $('.mainapp').show();
      });
    });
  </script>
</body>
</html>
