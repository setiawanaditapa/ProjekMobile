<?php
$page_title = (isset($_GET['geners_id'])) ? 'Edit Geners' : 'Add Geners';
include("includes/header.php");

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['geners_name']))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_geners.php?add=yes");
        exit;
    }

    $data = array(
        'geners_name'  =>  validate_input($_POST['geners_name'])
    );

    $qry = Insert('tbl_geners', $data);

    $_SESSION['msg'] = "10";

    header("Location:manage_geners.php");
    exit;
}
$count = 0;
if (isset($_GET['geners_id'])) {
    $qry = "SELECT * FROM tbl_geners where id='" . $_GET['geners_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}

if (isset($_POST['submit']) &&   $count > 0  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['geners_name']))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_geners.php?geners_id=" . $_GET['geners_id']);
        exit;
    }
   
    $category_image = $row['category_image'];
  
    $data = array(
        'geners_name'  =>  validate_input($_POST['geners_name'])
    );

    $category_edit = Update('tbl_geners', $data, "WHERE id = '" . $_GET['geners_id'] . "'");


    $_SESSION['msg'] = "11";
    header("Location:manage_geners.php");
    exit;
}
?>
<main id="main" class="main">
    <section class="section">
        <div class="row  g-3">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body g-3"><br>
                        <div class="pagetitle mb-5">
                            <h1><?php _e($page_title); ?></h1>

                        </div><!-- End Page Title -->
                        <!-- Floating Labels Form -->
                        <form class="row g-3" action="" name="addeditcategory" method="post"  enctype="multipart/form-data">
                            <br><br>
                            <input type="hidden" name="geners_id" value="<?php if ($count > 0) {  _e($_GET['geners_id']); } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Geners Name</label>
                                <input type="text" class="form-control" name="geners_name" id="floatingName"  value="<?php if ($count > 0) {
                                                                                                                                    _e($row['geners_name']);
                                                                                                                                }  ?>" class="form-control">
                            </div>
                            <div class="text-center">
                                <button type="submit" name="submit" class="btn button btn-primary <?php _e(PURCHASE); ?>">Save</button>
                                <button type="reset" class="btn btn-secondary">Reset</button>
                            </div>
                        </form>
                    </div>
             </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->
<?php include("includes/footer.php"); ?>