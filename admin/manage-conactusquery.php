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

// Mark as read
if(isset($_GET['eid']))
{
  $eid=intval($_GET['eid']);
  $status=1;

  $sql = "UPDATE tblcontactusquery SET status=:status WHERE id=:eid";
  $query = $dbh->prepare($sql);
  $query->bindParam(':status',$status, PDO::PARAM_STR);
  $query->bindParam(':eid',$eid, PDO::PARAM_STR);
  $query->execute();

  $msg = "Marked as Read successfully";
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

  <title>ProModel Car Rental | Admin Manage Queries</title>

  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-social.css">
  <link rel="stylesheet" href="css/bootstrap-select.css">
  <link rel="stylesheet" href="css/fileinput.min.css">
  <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
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

            <h2 class="page-title">Manage Contact Us Queries</h2>

            <div class="panel panel-default">
              <div class="panel-heading">User queries</div>
              <div class="panel-body">

                <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Contact No</th>
                      <th>Message</th>
                      <th>Posting date</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>#</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Contact No</th>
                      <th>Message</th>
                      <th>Posting date</th>
                      <th>Action</th>
                    </tr>
                  </tfoot>
                  <tbody>

                    <?php
                    $sql = "SELECT * FROM tblcontactusquery";
                    $query = $dbh->prepare($sql);
                    $query->execute();
                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                    $cnt=1;

                    if($query->rowCount() > 0){
                      foreach($results as $result){ ?>
                        <tr>
                          <td><?php echo htmlentities($cnt);?></td>
                          <td><?php echo htmlentities($result->name);?></td>
                          <td><?php echo htmlentities($result->EmailId);?></td>
                          <td><?php echo htmlentities($result->ContactNumber);?></td>
                          <td><?php echo htmlentities($result->Message);?></td>
                          <td><?php echo htmlentities($result->PostingDate);?></td>

                          <?php if($result->status==1){ ?>
                            <td>Read</td>
                          <?php } else { ?>
                            <td>
                              <a href="#" onclick="markRead(<?php echo (int)$result->id; ?>); return false;">Pending</a>
                            </td>
                          <?php } ?>

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
    function markRead(id){
      Swal.fire({
        title: 'Mark this query as Read?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'Cancel'
      }).then((result) => {
        if(result.isConfirmed){
          // نفس الصفحة مع eid
          window.location.href = 'manage-conactusquery.php?eid=' + id;
        }
      });
    }
  </script>

  <?php if(!empty($msg)){ ?>
  <script>
    Swal.fire({
      icon: 'success',
      title: 'Done',
      text: <?php echo json_encode($msg); ?>,
      timer: 1500,
      showConfirmButton: false
    });
  </script>
  <?php } ?>

</body>
</html>
<?php } ?>
