<?php
session_start();
include('includes/config.php');

// حالة السويت أليرت
$adminLoginStatus = ""; // success | invalid

if(isset($_POST['login']))
{
  $email = $_POST['username'];
  $password = md5($_POST['password']);

  $sql ="SELECT UserName,Password FROM admin WHERE UserName=:email and Password=:password";
  $query= $dbh->prepare($sql);
  $query->bindParam(':email', $email, PDO::PARAM_STR);
  $query->bindParam(':password', $password, PDO::PARAM_STR);
  $query->execute();

  if($query->rowCount() > 0)
  {
    $_SESSION['alogin'] = $_POST['username'];
    $adminLoginStatus = "success";
  }
  else{
    $adminLoginStatus = "invalid";
  }
}
?>
<!doctype html>
<html lang="en" class="no-js">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>ProModel Car Rental  | Admin Login</title>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link rel="stylesheet" href="css/bootstrap-select.css">
  <link rel="stylesheet" href="css/fileinput.min.css">
  <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
  <link rel="stylesheet" href="css/style.css">
</head>

<body>

  <div class="login-page bk-img" style="background-image: url(img/login-bg.jpg);">
    <div class="form-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-offset-3">
            <h1 class="text-center text-bold mt-4x" style="color:#fff">Admin | Sign in</h1>
            <div class="well row pt-2x pb-3x bk-light">
              <div class="col-md-8 col-md-offset-2">
                <form method="post" id="adminLoginForm">

                  <label class="text-uppercase text-sm">Your Username</label>
                  <input type="text" placeholder="Username" name="username" class="form-control mb" required>

                  <label class="text-uppercase text-sm">Password</label>
                  <input type="password" placeholder="Password" name="password" class="form-control mb" required>

                  <button class="btn btn-primary btn-block" name="login" type="submit" id="loginBtn">LOGIN</button>

                </form>

                <p style="margin-top: 4%" align="center"><a href="../index.php">Back to Home</a></p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Loading Scripts -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap-select.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.dataTables.min.js"></script>
  <script src="js/dataTables.bootstrap.min.js"></script>
  <script src="js/Chart.min.js"></script>
  <script src="js/fileinput.js"></script>
  <script src="js/chartData.js"></script>
  <script src="js/main.js"></script>

  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Optional: Loading popup عند الضغط على Login -->
  <script>
    document.getElementById("adminLoginForm").addEventListener("submit", function () {
      Swal.fire({
        title: 'Signing in...',
        text: 'Please wait',
        allowOutsideClick: false,
        allowEscapeKey: false,
        didOpen: () => {
          Swal.showLoading();
        }
      });
    });
  </script>

  <?php if($adminLoginStatus=="invalid"){ ?>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      Swal.fire({
        icon: 'error',
        title: 'Invalid Details',
        text: 'Username or password is incorrect.',
        confirmButtonText: 'Try Again'
      });
    });
  </script>
  <?php } ?>

<?php if($adminLoginStatus=="success"){ ?>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    Swal.fire({
      icon: 'success',
      title: 'Welcome Admin 👋',
      text: 'Logging you in...',
      timer: 1800,
      showConfirmButton: false,
      allowOutsideClick: false
    });

    setTimeout(function(){
      window.location.href = 'dashboard.php';
    },1800);
  });
</script>
<?php } ?>


</body>
</html>
