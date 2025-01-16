<?php
$page_title = (isset($_GET['artist_id'])) ? 'Edit Artist' : 'Add Artist';
include("includes/header.php");

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['artist_name'])) ||
        (!isset($_FILES['artist_image']['size']) || $_FILES['artist_image']['size'] == 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_artist.php?add=yes");
        exit;
    }

    $file_name = str_replace(" ", "-", $_FILES['artist_image']['name']);
    $artist_image = rand(0, 99999) . "_" . $file_name;

    $tpath1 = 'images/' . $artist_image;
    $pic1 = compress_image($_FILES["artist_image"]["tmp_name"], $tpath1, 80);

    $thumbpath='images/thumbs/'.$artist_image;   
    $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300'); 

    $data = array(
        'artist_name'  =>  validate_input($_POST['artist_name']),
        'artist_image'  =>  validate_input($artist_image)
    );

    $qry = Insert('tbl_artist', $data);

    $_SESSION['msg'] = "10";

    header("Location:manage_artist.php");
    exit;
}
$count = 0;
if (isset($_GET['artist_id'])) {
    $qry = "SELECT * FROM tbl_artist where id='" . $_GET['artist_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}

if (isset($_POST['submit']) &&   $count > 0  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['artist_name'])) ||
        ((isset($_FILES['artist_image']) && empty($_FILES['artist_image']['name'])) && empty($row['artist_image']))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_artist.php?artist_id=" . $_GET['artist_id']);
        exit;
    }
    if ($_FILES['artist_image']['name'] != "") {

        unlink('images/' . $row['artist_image']);
        unlink('images/thumbs/' . $row['artist_image']);
        
        $file_name = str_replace(" ", "-", $_FILES['artist_image']['name']);

        $artist_image = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $artist_image;
        $pic1 = compress_image($_FILES["artist_image"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$artist_image;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300'); 
    } 
    else 
    {
        $artist_image = $row['artist_image'];
    }

    $data = array(
        'artist_name'  =>  validate_input($_POST['artist_name']),
        'artist_image'  =>  validate_input($artist_image)
    );

    $category_edit = Update('tbl_artist', $data, "WHERE id = '" . $_GET['artist_id'] . "'");


    $_SESSION['msg'] = "11";
    header("Location:manage_artist.php");
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
                            <input type="hidden" name="artist_id" value="<?php if ($count > 0) {  _e($_GET['artist_id']); } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Artist Name</label>
                                <input type="text" class="form-control" name="artist_name" id="floatingName"  value="<?php if ($count > 0) {
                                                                                                                                    _e($row['artist_name']);
                                                                                                                                }  ?>" class="form-control">
                            </div>
                            <div class="col-12">
                            <label for="inputNanme4" class="form-label">Artist Image</label>
                                    <input type="file" name="artist_image" class="form-control"  value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation()" id="fileupload">
                                    <?php if ($count > 0) { ?>
                                                <div class="fileupload_img" id="uploadPreview"><img type="image" src="images/thumbs/<?php _e($row['artist_image']); ?>" alt="image" style="width: 150px;height:200px;margin-top: 10px;" /></div>
                                            <?php } else { ?>
                                                <div class="fileupload_img" id="uploadPreview"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 150px;height:200px;margin-top: 10px;" /></div>
                                            <?php } ?>
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
<script type="text/javascript">
    function fileValidation() {
        var fileInput = document.getElementById('fileupload');
        var filePath = fileInput.value;
        var allowedExtensions = /(\.png|.PNG|.jpg|.JPG|.jpeg|.JPEG)$/i;
        if (!allowedExtensions.exec(filePath)) {
            alert('Please upload file having extension .png, .PNG, .JPG , .jpg,.jpeg,.JPEG only.');
            fileInput.value = '';
            return false;
        } else {
            //image preview
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('uploadPreview').innerHTML = '<img src="' + e.target.result + '" style="width:150px;height:200px;margin-top: 10px;"/>';
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    }
</script>
<?php include("includes/footer.php"); ?>