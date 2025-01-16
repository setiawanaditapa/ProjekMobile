<?php

error_reporting(E_ALL);
ini_set('display_errors', 'On');

include("includes/connection.php");
include("language/language.php");
require_once('includes/function.php');
$site_logo =  $site_url . "assets/img/" . APP_LOGO;
if (isset($_SESSION['admin_name'])) {
   header("Location:home.php");
   exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="utf-8">
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <title><?php echo APP_NAME; ?></title>
   <meta content="" name="description">
   <meta content="" name="keywords">
   <link href="assets/img/<?php _e(APP_LOGO); ?>" rel="icon">
  <link href="assets/img/<?php _e(APP_LOGO); ?>" rel="apple-touch-icon">
   <link href="https://fonts.gstatic.com" rel="preconnect">
   <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
   <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
   <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
   <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
   <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
   <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
   <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
   <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
   <link href="assets/css/style.css" rel="stylesheet">
</head>

<body class="back-images">
   <main>
      <div class="container">

         <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
               <div class="row justify-content-center">
                  <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                     <div class="d-flex justify-content-center py-4">
                        <a href="#" class="logo d-flex align-items-center w-auto">
                           <img src="assets/img/<?php echo APP_LOGO; ?>" alt="">
                           <span class="d-none d-lg-block"><?php echo APP_NAME; ?></span>
                        </a>
                     </div><!-- End Logo -->

                     <div class="card mb-3">

                        <div class="card-body">

                           <div class="pt-4 pb-2">
                              <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                              <!-- <p class="text-center small">Username: <b>admin</b> Password: <b>admin</b></p> -->
                           </div>

                           <form action="login_db.php" method="post" class="row g-3 needs-validation" novalidate>

                              <div class="col-12">
                                 <label for="yourUsername" class="form-label">Username</label>
                                 <div class="input-group has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend"><i class="ri-user-2-fill"></i></span>
                                    <input type="text" name="username" class="form-control" id="yourUsername" required>
                                    <div class="invalid-feedback">Please enter your username.</div>
                                 </div>
                              </div>

                              <div class="col-12">
                                 <label for="yourUsername" class="form-label">password</label>
                                 <div class="input-group has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend"><i class="bi bi-three-dots"></i></span>
                                    <input type="password" name="password" class="form-control" id="yourPassword" required>
                                    <div class="invalid-feedback">Please enter your password!</div>
                                 </div>
                              </div>

                              <div class="col-12">
                                 <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                 </div>
                              </div>
                              <div class="col-12">
                                 <button class="btn btn-primary w-100" type="submit">Login</button>
                              </div>
                           </form>

                        </div>
                     </div>
                  </div>
               </div>
            </div>

         </section>

      </div>
   </main>

   <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
   <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
   <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="assets/vendor/chart.js/chart.umd.js"></script>
   <script src="assets/vendor/echarts/echarts.min.js"></script>
   <script src="assets/vendor/quill/quill.min.js"></script>
   <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
   <script src="assets/vendor/tinymce/tinymce.min.js"></script>
   <script src="assets/vendor/php-email-form/validate.js"></script>
   <script src="assets/js/main.js"></script>
   <script type="text/javascript" src="assets/js/vendor.js"></script>
   <script src="assets/js/notify.min.js"></script>

   <?php if (isset($_SESSION['msg'])) {  ?>

      <script type="text/javascript">
         $('.notifyjs-corner').empty();
         $.notify(
            '<?php _e($client_lang[$_SESSION["msg"]]); ?>', {
               position: "top center",
               className: '<?= isset($_SESSION["class"]) ? $_SESSION["class"] : "success" ?>'
            }
         );
      </script>

   <?php
      unset($_SESSION['msg']);
      unset($_SESSION['class']);
   }
   ?>
</body>

</html>