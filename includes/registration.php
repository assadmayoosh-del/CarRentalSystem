<?php
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}

require_once("includes/config.php"); // تأكدي موجود

$signupStatus = ""; // success | error | exists

if(isset($_POST['signup']))
{
  $fname   = trim($_POST['fullname']);
  $email   = trim($_POST['emailid']);
  $mobile  = trim($_POST['mobileno']); // ✅ تصحيح الاسم
  $password= md5($_POST['password']);

  // ✅ تحقق سريع من صحة الإيميل
  if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    $signupStatus = "error";
  } else {

    // ✅ فحص: هل الإيميل موجود مسبقًا؟
    $checkSql = "SELECT EmailId FROM tblusers WHERE EmailId = :email LIMIT 1";
    $checkQuery = $dbh->prepare($checkSql);
    $checkQuery->bindParam(':email', $email, PDO::PARAM_STR);
    $checkQuery->execute();

    if($checkQuery->rowCount() > 0){
      // موجود مسبقًا
      $signupStatus = "exists";
    } else {

      // ✅ الإدخال إذا مش موجود
      $sql="INSERT INTO tblusers(FullName,EmailId,ContactNo,Password)
            VALUES(:fname,:email,:mobile,:password)";
      $query = $dbh->prepare($sql);
      $query->bindParam(':fname',$fname,PDO::PARAM_STR);
      $query->bindParam(':email',$email,PDO::PARAM_STR);
      $query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
      $query->bindParam(':password',$password,PDO::PARAM_STR);

      if($query->execute()){
        $signupStatus = "success";
      } else {
        $signupStatus = "error";
      }
    }
  }
}
?>

<script>
function checkAvailability() {
  $("#loaderIcon").show();
  jQuery.ajax({
    url: "check_availability.php",
    data: 'emailid=' + $("#emailid").val(),
    type: "POST",
    success: function(data){
      $("#user-availability-status").html(data);
      $("#loaderIcon").hide();
    },
    error: function (){
      $("#loaderIcon").hide();
    }
  });
}
</script>

<div class="modal fade" id="signupform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="signup_wrap">
            <div class="col-md-12 col-sm-6">
              <form method="post" name="signup">
                <div class="form-group">
                  <input type="text" class="form-control" name="fullname" placeholder="Full Name" required>
                </div>

                <div class="form-group">
                  <input type="text" class="form-control" name="mobileno" placeholder="Mobile Number" maxlength="10" required>
                </div>

                <div class="form-group">
                  <input type="email" class="form-control" name="emailid" id="emailid"
                         onBlur="checkAvailability()" placeholder="Email Address" required>
                  <span id="user-availability-status" style="font-size:12px;"></span>
                </div>

                <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>

                <div class="form-group checkbox">
                  <input type="checkbox" id="terms_agree" required checked>
                  <label for="terms_agree">I Agree with <a href="#">Terms and Conditions</a></label>
                </div>

                <div class="form-group">
                  <input type="submit" value="Sign Up" name="signup" class="btn btn-block" id="submit">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="modal-footer text-center">
        <p>Already got an account?
          <a href="#loginform" data-toggle="modal" data-dismiss="modal">Login Here</a>
        </p>
      </div>
    </div>
  </div>
</div>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php if($signupStatus=="success"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'success',
    title: 'Registration Completed 🎉',
    text: 'Now you can login to your account',
    confirmButtonText: 'Login Now'
  }).then(() => {
    $('#signupform').modal('hide');
    $('#loginform').modal('show');
  });
});
</script>
<?php } ?>

<?php if($signupStatus=="exists"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'warning',
    title: 'Email Already Exists',
    text: 'This email is already registered. Please login instead.',
    confirmButtonText: 'Go to Login'
  }).then(() => {
    $('#signupform').modal('hide');
    $('#loginform').modal('show');
  });
});
</script>
<?php } ?>

<?php if($signupStatus=="error"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'error',
    title: 'Registration Failed',
    text: 'Something went wrong. Please try again',
    confirmButtonText: 'Try Again'
  }).then(() => {
    $('#signupform').modal('show');
  });
});
</script>
<?php } ?>
