<?php
session_start();
error_reporting(0);
include('includes/config.php');

if(strlen($_SESSION['alogin'])==0)
{	
  header('location:index.php');
  exit();
}
else{

$msg="";
$error="";

// Inactive
if(isset($_REQUEST['eid']))
{
  $eid=intval($_GET['eid']);
  $status="0";
  $sql = "UPDATE tbltestimonial SET status=:status WHERE id=:eid";
  $query = $dbh->prepare($sql);
  $query->bindParam(':status',$status, PDO::PARAM_STR);
  $query->bindParam(':eid',$eid, PDO::PARAM_STR);
  $query->execute();

  $msg="Testimonial set to Inactive";
}

// Active
if(isset($_REQUEST['aeid']))
{
  $aeid=intval($_GET['aeid']);
  $status=1;

  $sql = "UPDATE tbltestimonial SET status=:status WHERE id=:aeid";
  $query = $dbh->prepare($sql);
  $query->bindParam(':status',$status, PDO::PARAM_STR);
  $query->bindParam(':aeid',$aeid, PDO::PARAM_STR);
  $query->execute();

  $msg="Testimonial Activated Successfully";
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
  <meta name="theme-color" content="#3e454c">

  <title>ProModel Car Rental | Admin Manage Testimonials</title>

  <!-- Font awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Sandstone Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Bootstrap Datatables -->
  <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
  <!-- Bootstrap social button library -->
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <!-- Bootstrap select -->
  <link rel="stylesheet" href="css/bootstrap-select.css">
  <!-- Bootstrap file input -->
  <link rel="stylesheet" href="css/fileinput.min.css">
  <!-- Awesome Bootstrap checkbox -->
  <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
  <!-- Admin Style -->
  <link rel="stylesheet" href="css/style.css">

  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <style>
    .errorWrap {
      padding: 10px;
      margin: 0 0 20px 0;
      background: #fff;
      border-left: 4px solid #dd3d36;
      -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
      box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    }
    .succWrap{
      padding: 10px;
      margin: 0 0 20px 0;
      background: #fff;
      border-left: 4px solid #5cb85c;
      -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
      box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    }
  </style>
</head>

<body>
<?php include('includes/header.php');?>

<div class="ts-main-content">
  <?php include('includes/leftbar.php');?>
  <div class="content-wrapper">
    <div class="container-fluid">

      <div class="row">
        <div class="col-md-12">
          <h2 class="page-title">Manage Testimonials</h2>

          <div class="panel panel-default">
            <div class="panel-heading">User Testimonials</div>
            <div class="panel-body">

              <!-- (اختياري) إذا بدك ما تظهر الرسائل القديمة نهائيًا زي ما عملنا بصفحات ثانية احذف هذا البلوك -->
              <!--
              <?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php }
              else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
              -->

              <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Testimonials</th>
                    <th>Posting date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <?php 
                $sql = "SELECT tblusers.FullName,tbltestimonial.UserEmail,tbltestimonial.Testimonial,
                        tbltestimonial.PostingDate,tbltestimonial.status,tbltestimonial.id
                        from tbltestimonial 
                        join tblusers on tblusers.Emailid=tbltestimonial.UserEmail";
                $query = $dbh->prepare($sql);
                $query->execute();
                $results=$query->fetchAll(PDO::FETCH_OBJ);
                $cnt=1;

                if($query->rowCount() > 0){
                  foreach($results as $result){ ?>
                    <tr>
                      <td><?php echo htmlentities($cnt);?></td>
                      <td><?php echo htmlentities($result->FullName);?></td>
                      <td><?php echo htmlentities($result->UserEmail);?></td>
                      <td><?php echo htmlentities($result->Testimonial);?></td>
                      <td><?php echo htmlentities($result->PostingDate);?></td>
                      <td>
                        <?php if($result->status==0){ ?>
                          <a href="#" onclick="changeStatus('activate',<?php echo (int)$result->id;?>); return false;">Inactive</a>
                        <?php } else { ?>
                          <a href="#" onclick="changeStatus('deactivate',<?php echo (int)$result->id;?>); return false;">Active</a>
                        <?php } ?>
                      </td>
                    </tr>
                <?php $cnt++; } } ?>
                </tbody>
              </table>

            </div>
          </div>

        </div>
      </div>

    </div>
  </div>
</div>

<!-- Loading Scripts (نفس باقي صفحات الأدمن عشان السايدبار يطلع نفس الشي) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/fileinput.js"></script>
<script src="js/chartData.js"></script>
<script src="js/main.js"></script>

<script>
function changeStatus(type,id){

  let title = (type === 'activate') ? 'Activate this testimonial?' : 'Set testimonial inactive?';
  let url   = (type === 'activate') ? 'testimonials.php?aeid='+id : 'testimonials.php?eid='+id;

  Swal.fire({
    title: title,
    icon: 'question',
    showCancelButton: true,
    confirmButtonText: 'Yes',
    cancelButtonText: 'Cancel'
  }).then((result)=>{
    if(result.isConfirmed){
      window.location.href = url;
    }
  });
}
</script>

<?php if(!empty($msg)){ ?>
<script>
Swal.fire({
  icon:'success',
  title:'Done',
  text: <?php echo json_encode($msg); ?>,
  timer:1700,
  showConfirmButton:false
});
</script>
<?php } ?>

</body>
</html>
<?php } ?>
