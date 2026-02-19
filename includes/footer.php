<?php
$subscribeStatus = ""; // success | exists | error

if(isset($_POST['emailsubscibe']))
{
  $subscriberemail = trim($_POST['subscriberemail']);

  // فحص صحة الإيميل
  if(!filter_var($subscriberemail, FILTER_VALIDATE_EMAIL)){
    $subscribeStatus = "error";
  } else {

    // هل الايميل مشترك مسبقًا؟
    $sql ="SELECT SubscriberEmail FROM tblsubscribers WHERE SubscriberEmail=:subscriberemail LIMIT 1";
    $query= $dbh->prepare($sql);
    $query->bindParam(':subscriberemail', $subscriberemail, PDO::PARAM_STR);
    $query->execute();

    if($query->rowCount() > 0)
    {
      $subscribeStatus = "exists";
    }
    else
    {
      $sql="INSERT INTO tblsubscribers(SubscriberEmail) VALUES(:subscriberemail)";
      $query = $dbh->prepare($sql);
      $query->bindParam(':subscriberemail',$subscriberemail,PDO::PARAM_STR);

      if($query->execute()){
        $subscribeStatus = "success";
      } else {
        $subscribeStatus = "error";
      }
    }
  }
}
?>

<footer>
  <div class="footer-top">
    <div class="container">
      <div class="row">
      
        <div class="col-md-6">
          <h6>About Us</h6>
          <ul>
            <li><a href="page.php?type=aboutus">About Us</a></li>
            <li><a href="page.php?type=faqs">FAQs</a></li>
            <li><a href="page.php?type=privacy">Privacy</a></li>
            <li><a href="page.php?type=terms">Terms of use</a></li>
            <li><a href="admin/">Admin Login</a></li>
          </ul>
        </div>
  
        <div class="col-md-3 col-sm-6">
          <h6>Subscribe Newsletter</h6>
          <div class="newsletter-form">
            <form method="post">
              <div class="form-group">
                <input type="email" name="subscriberemail" class="form-control newsletter-input" required placeholder="Enter Email Address" />
              </div>
              <button type="submit" name="emailsubscibe" class="btn btn-block">
                Subscribe <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
              </button>
            </form>
            <p class="subscribed-text">*We send great deals and latest auto news to our subscribed users very week.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-push-6 text-right">
          <div class="footer_widget">
            <p>Connect with Us:</p>
            <ul>
              <li><a href="https://www.facebook.com/profile.php?id=61584374474714&mibextid=ZbWKwL"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
              <li><a href="https://x.com/ProModelCar2026?t=VpwPsg66cFlDKyJ0LcPZBA&s=09"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
              <li><a href="https://www.instagram.com/promodelcar_2026?igsh=cmV6Nmp2dG9naWtl"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
          <p class="copy-right">ProModel Car Rental.</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- SweetAlert2 (Popup فقط، ما بغير التصميم) -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php if($subscribeStatus === "success"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'success',
    title: 'Subscribed ✅',
    text: 'You have subscribed successfully!',
    timer: 1800,
    showConfirmButton: false
  });
});
</script>
<?php } ?>

<?php if($subscribeStatus === "exists"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'info',
    title: 'Already Subscribed',
    text: 'This email is already subscribed.',
    confirmButtonText: 'OK'
  });
});
</script>
<?php } ?>

<?php if($subscribeStatus === "error"){ ?>
<script>
document.addEventListener("DOMContentLoaded", function() {
  Swal.fire({
    icon: 'error',
    title: 'Oops!',
    text: 'Something went wrong or email is invalid. Please try again.',
    confirmButtonText: 'OK'
  });
});
</script>
<?php } ?>
