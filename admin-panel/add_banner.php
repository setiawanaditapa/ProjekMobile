<?php
$page_title = (isset($_GET['banner_id'])) ? 'Edit Banner' : 'Add Banner';
include("includes/header.php");

$mp3_qry = "SELECT * FROM tbl_mp3 Where tbl_mp3.status=1 ORDER BY mp3_title DESC";
$mp3_result = mysqli_query($mysqli, $mp3_qry);

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['banner_title'])) ||
        empty(validate_input($_POST['banner_sort_info'], true)) ||
        ((isset($_FILES['banner_image']) && empty($_FILES['banner_image']['name'])))||
        (!isset($_POST['banner_songs']) || count($_POST['banner_songs']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_banner.php?add=yes");
        exit;
    }

    $file_name = str_replace(" ", "-", $_FILES['banner_image']['name']);
    $banner_image = rand(0, 99999) . "_" . $file_name;

    $tpath1 = 'images/' . $banner_image;
    $pic1 = compress_image($_FILES["banner_image"]["tmp_name"], $tpath1, 80);

    $thumbpath = 'images/thumbs/' . $banner_image;
    $thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');

    $data = array(
        'banner_title'  =>  validate_input($_POST['banner_title']),
        'banner_sort_info'  =>  validate_input($_POST['banner_sort_info'], ENT_QUOTES, "UTF-8"),
        'banner_image'  =>  validate_input($banner_image),
        'banner_songs'  =>  implode(',', $_POST['banner_songs']),
    );

    $qry = Insert('tbl_banner', $data);

    $_SESSION['msg'] = "10";

    header("Location:manage_banners.php");
    exit;
}
$count = 0;
if (isset($_GET['banner_id'])) {
    $qry = "SELECT * FROM tbl_banner where bid='" . $_GET['banner_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}

if (isset($_POST['submit']) &&   $count > 0  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['banner_title'])) ||
        empty(validate_input($_POST['banner_sort_info'], true)) ||
        ((isset($_FILES['banner_image']) && empty($_FILES['banner_image']['name'])) && empty($row['banner_image']))||
        (!isset($_POST['banner_songs']) || count($_POST['banner_songs']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_banner.php?banner_id=" . $_GET['banner_id']);
        exit;
    }
    if ($_FILES['banner_image']['name'] != "") {

        unlink('images/' . $row['banner_image']);
        unlink('images/thumbs/' . $row['banner_image']);

        $file_name = str_replace(" ", "-", $_FILES['banner_image']['name']);

        $banner_image = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $banner_image;
        $pic1 = compress_image($_FILES["banner_image"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$banner_image;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300');
    } else {
        $banner_image = $row['banner_image'];
    }

    $data = array(
        'banner_title'  =>  validate_input($_POST['banner_title']),
        'banner_sort_info'  =>  validate_input($_POST['banner_sort_info'], ENT_QUOTES, "UTF-8"),
        'banner_image'  =>  validate_input($banner_image),
        'banner_songs'  =>  implode(',', $_POST['banner_songs']),
    );

    $banner_edit = Update('tbl_banner', $data, "WHERE bid = '" . $_GET['banner_id'] . "'");


    $_SESSION['msg'] = "11";
    header("Location:manage_banners.php");
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
                            <input type="hidden" name="banner_id" value="<?php if ($count > 0) {
                                                                                _e($_GET['banner_id']);
                                                                            } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Banner Title</label>
                                <input type="text" class="form-control" name="banner_title" id="floatingName" value="<?php if ($count > 0) {
                                                                                                                        _e($row['banner_title']);
                                                                                                                    }  ?>" class="form-control">
                            </div>
                            <div class="col-12">
                                <br><label for="inputNanme4" class="form-label">Banner Sort Info</label>
                                <textarea name="banner_sort_info" id="banner_sort_info" class="form-control">
                                    <?php if ($count > 0) {
                                        _e($row['banner_sort_info'], true);
                                    } ?>
                                </textarea>
                                <script>
                                    CKEDITOR.replace('banner_sort_info');
                                </script>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Banner Image</label>
                                <input type="file" name="banner_image" class="form-control" value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation()" id="fileupload">
                                <?php if ($count > 0) { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="images/thumbs/<?php _e($row['banner_image']); ?>" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } else { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } ?>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">MP3</label>
                                <select name="banner_songs[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="" disabled>--Select MP3--</option>
                                    <?php
                                    while ($mp3_row = mysqli_fetch_array($mp3_result)) {
                                    ?>
                                        <option value="<?php _e($mp3_row['id']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if (in_array($mp3_row['id'], explode(",", $row['banner_songs']))) {
                                                                                        ?> selected <?php
                                                                                            }
                                                                                        }
                                                        ?>>
                                            <?php _e($mp3_row['mp3_title']); ?>

                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
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