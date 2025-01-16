<?php
$page_title = (isset($_GET['album_id'])) ? 'Edit Album' : 'Add Album';
include("includes/header.php");

$artist_qry = "SELECT * FROM tbl_artist Where tbl_artist.a_status=1 order by tbl_artist.artist_name DESC";
$artist_result = mysqli_query($mysqli, $artist_qry);

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['album_name'])) ||
        (!isset($_POST['artist_ids']) || count($_POST['artist_ids']) <= 0) ||
        (!isset($_FILES['album_image']['size']) || $_FILES['album_image']['size'] == 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_album.php?add=yes");
        exit;
    }

    $file_name = str_replace(" ", "-", $_FILES['album_image']['name']);
    $album_image = rand(0, 99999) . "_" . $file_name;

    $tpath1 = 'images/' . $album_image;
    $pic1 = compress_image($_FILES["album_image"]["tmp_name"], $tpath1, 80);

    $thumbpath = 'images/thumbs/' . $album_image;
    $thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');

    $data = array(
        'album_name'  =>  validate_input($_POST['album_name']),
        'artist_ids'  =>  implode(',', $_POST['artist_ids']),
        'album_image'  =>  validate_input($album_image)
    );

    $qry = Insert('tbl_album', $data);

    $_SESSION['msg'] = "10";

    header("Location:manage_album.php");
    exit;
}
$count = 0;
if (isset($_GET['album_id'])) {
    $qry = "SELECT * FROM tbl_album where aid='" . $_GET['album_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}

if (isset($_POST['submit']) &&   $count > 0  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['album_name'])) ||
        (!isset($_POST['artist_ids']) || count($_POST['artist_ids']) <= 0) ||
        ((isset($_FILES['album_image']) && empty($_FILES['album_image']['name'])) && empty($row['album_image']))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_album.php?album_id=" . $_GET['album_id']);
        exit;
    }
    if ($_FILES['album_image']['name'] != "") {

        unlink('images/' . $row['album_image']);
        unlink('images/thumbs/' . $row['album_image']);

        $file_name = str_replace(" ", "-", $_FILES['album_image']['name']);

        $album_image = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $album_image;
        $pic1 = compress_image($_FILES["album_image"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$album_image;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300');
    } else {
        $album_image = $row['album_image'];
    }

    $data = array(
        'album_name'  =>  validate_input($_POST['album_name']),
        'artist_ids'  =>  implode(',', $_POST['artist_ids']),
        'album_image'  =>  validate_input($album_image)
    );

    $category_edit = Update('tbl_album', $data, "WHERE aid = '" . $_GET['album_id'] . "'");


    $_SESSION['msg'] = "11";
    header("Location:manage_album.php");
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
                        <form class="row g-3" action="" name="addeditcategory" method="post" enctype="multipart/form-data">
                            <br><br>
                            <input type="hidden" name="album_id" value="<?php if ($count > 0) {
                                                                                _e($_GET['album_id']);
                                                                            } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Album Name</label>
                                <input type="text" class="form-control" name="album_name" id="floatingName" value="<?php if ($count > 0) {
                                                                                                                        _e($row['album_name']);
                                                                                                                    }  ?>" class="form-control">
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Artist</label>
                                <select name="artist_ids[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="" disabled>--Select Artist--</option>
                                    <?php
                                    while ($artist_row = mysqli_fetch_array($artist_result)) {
                                    ?>
                                        <option value="<?php _e($artist_row['id']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if (in_array($artist_row['id'], explode(",", $row['artist_ids']))) {
                                                                                        ?> selected <?php
                                                                                            }
                                                                                        }
                                                        ?>>
                                            <?php _e($artist_row['artist_name']); ?>

                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Album Image</label>
                                <input type="file" name="album_image" class="form-control" value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation()" id="fileupload">
                                <?php if ($count > 0) { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="images/thumbs/<?php _e($row['album_image']); ?>" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } else { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
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
                    document.getElementById('uploadPreview').innerHTML = '<img src="' + e.target.result + '" style="width:200px;height:200px;margin-top: 10px;"/>';
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    }
</script>
<?php include("includes/footer.php"); ?>