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

$msg = "";
$error = "";

if(isset($_GET['del']))
{
  $id = intval($_GET['del']);
  $sql = "DELETE FROM tblsubscribers WHERE id=:id";
  $query = $dbh->prepare($sql);
  $query->bindParam(':id',$id, PDO::PARAM_STR);

  if($query->execute()){
    $msg="Subscriber info deleted";
  } else {
    $error="Something went wrong while deleting";
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
  <meta name="theme-color" content="#3e454c">

  <title>ProModel Car Rental | Admin Manage Subscribers</title>

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
  <!-- Admin Stye -->
  <link rel="stylesheet" href="css/style.css">

  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
  <?php include('includes/header.php');?>

  <div class="ts-main-content">
    <?php include('includes/leftbar.php');?>
    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row">
          <div class="col-md-12">

            <h2 class="page-title">Manage Subscribers</h2>

            <div class="panel panel-default">
              <div class="panel-heading">Subscribers Details</div>
              <div class="panel-body">

                <!-- حذفنا succWrap/errorWrap عشان ما تظهر مع البوب -->

                <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Email Id</th>
                      <th>Subscription Date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>#</th>
                      <th>Email Id</th>
                      <th>Subscription Date</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>

                    <?php
                    $sql = "SELECT * from tblsubscribers";
                    $query = $dbh->prepare($sql);
                    $query->execute();
                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                    $cnt=1;

                    if($query->rowCount() > 0){
                      foreach($results as $result){ ?>
                        <tr>
                          <td><?php echo htmlentities($cnt);?></td>
                          <td><?php echo htmlentities($result->SubscriberEmail);?></td>
                          <td><?php echo htmlentities($result->PostingDate);?></td>
                          <td>
                            <a href="#" onclick="deleteSubscriber(<?php echo (int)$result->id; ?>); return false;">
                              <i class="fa fa-close"></i>
                            </a>
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

  <script>
    function deleteSubscriber(id){
      Swal.fire({
        title: 'Delete this subscriber?',
        text: "This action can't be undone.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete',
        cancelButtonText: 'Cancel'
      }).then((result) => {
        if(result.isConfirmed){
          // نفس الصفحة مع del
          window.location.href = 'manage-subscribers.php?del=' + id;
        }
      });
    }
  </script>

  <?php if(!empty($error)){ ?>
  <script>
    Swal.fire({
      icon: 'error',
      title: 'Error',
      text: <?php echo json_encode($error); ?>
    });
  </script>
  <?php } ?>

  <?php if(!empty($msg)){ ?>
  <script>
    Swal.fire({
      icon: 'success',
      title: 'Deleted',
      text: <?php echo json_encode($msg); ?>,
      timer: 1400,
      showConfirmButton: false
    });
  </script>
  <?php } ?>

</body>
</html>
<?php } ?>
