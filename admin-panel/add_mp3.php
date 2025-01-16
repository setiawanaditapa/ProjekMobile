<?php
$page_title = (isset($_GET['mp3_id'])) ? 'Edit Mp3' : 'Add Mp3';
include("includes/header.php");

$file_path = getBaseUrl();

$cat_qry = "SELECT * FROM tbl_category Where tbl_category.status=1 ORDER BY category_name DESC";
$cat_result = mysqli_query($mysqli, $cat_qry);

$album_qry = "SELECT * FROM tbl_album Where tbl_album.status=1  ORDER BY  album_name DESC";
$album_result = mysqli_query($mysqli, $album_qry);

$artist_qry = "SELECT * FROM tbl_artist Where tbl_artist.a_status=1  ORDER BY artist_name DESC";
$artist_result = mysqli_query($mysqli, $artist_qry);

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    $mp3_type = trim($_POST['mp3_type']);
    if (
        empty(validate_input($_POST['mp3_title'])) ||
        empty(validate_input($_POST['mp3_duration'])) ||
        empty(validate_input($_POST['cat_id'])) ||
        (!isset($_POST['mp3_artist']) || count($_POST['mp3_artist']) <= 0) ||
        empty(validate_input($_POST['album_id'])) ||
        empty(validate_input($mp3_type)) ||
        ($mp3_type == 'server_url' && empty($_POST['mp3_url'])) ||
        ($mp3_type == 'local' && (!isset($_FILES['mp3_local']) || $_FILES['mp3_local']['size'] == 0)) ||
        (!isset($_FILES['mp3_thumbnail']['size']) || $_FILES['mp3_thumbnail']['size'] == 0) ||
        (!isset($_FILES['mp3_cover']['size']) || $_FILES['mp3_cover']['size'] == 0) ||
        empty(validate_input($_POST['mp3_description'], true)) ||
        empty(validate_input($_POST['mp3_lyrics'], true))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_mp3.php?add=yes");
        exit;
    }

    if ($mp3_type == 'server_url') {
        $mp3_url = validate_input(trim($_POST['mp3_url']));
    } else {
        $path = "uploads/";
        $mp3_local = rand(0, 99999) . "_" . str_replace(" ", "-", $_FILES['mp3_local']['name']);

        $tmp = $_FILES['mp3_local']['tmp_name'];

        if (move_uploaded_file($tmp, $path . $mp3_local)) {
            $mp3_url = $file_path.$mp3_local;
        } else {
            _e("Error in uploading mp3 file !!");
            exit;
        }
    }


    $file_name = str_replace(" ", "-", $_FILES['mp3_thumbnail']['name']);
    $mp3_thumbnail = rand(0, 99999) . "_" . $file_name;

    $tpath1 = 'images/' . $mp3_thumbnail;
    $pic1 = compress_image($_FILES["mp3_thumbnail"]["tmp_name"], $tpath1, 80);

    $thumbpath = 'images/thumbs/' . $mp3_thumbnail;
    $thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');
    
    
    $file_name2 = str_replace(" ", "-", $_FILES['mp3_cover']['name']);
    $mp3_cover = rand(0, 99999) . "_" . $file_name2;

    $tpath11 = 'images/' . $mp3_cover;
    $pic11 = compress_image($_FILES["mp3_cover"]["tmp_name"], $tpath11, 80);

    $thumbpath1 = 'images/thumbs/' . $mp3_cover;
    $thumb_pic11 = create_thumb_image($tpath11, $thumbpath1, '300', '300');


    $data = array(
        'mp3_title'  =>  validate_input($_POST['mp3_title'], ENT_QUOTES, "UTF-8"),
        'mp3_duration'  =>  validate_input($_POST['mp3_duration']),
        'cat_id'  => $_POST['cat_id'],
        'mp3_artist'  => implode(',', $_POST['mp3_artist']),
        'album_id'  =>  validate_input($_POST['album_id']),
        'mp3_type'  =>  validate_input($mp3_type),
        'mp3_url'  =>  validate_input($mp3_url),
        'mp3_thumbnail'  =>  validate_input($mp3_thumbnail),
        'mp3_cover'  =>  validate_input($mp3_cover),
        'mp3_description'  =>  validate_input($_POST['mp3_description'], ENT_QUOTES, "UTF-8"),
        'mp3_lyrics'  =>  validate_input($_POST['mp3_lyrics'], ENT_QUOTES, "UTF-8")
    );

    $qry = Insert('tbl_mp3', $data);

    $_SESSION['msg'] = "10";
    $_SESSION['class'] = "success";
    header("Location:manage_mp3.php");
    exit;
}
$count = 0;
if (isset($_GET['mp3_id'])) {

    $qry = "SELECT * FROM tbl_mp3 where id='" . $_GET['mp3_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}
if (isset($_POST['submit']) and isset($_GET['mp3_id'])  && PURCHASE == '') {
    $mp3_type = trim($_POST['mp3_type']);
    if (
        empty(validate_input($_POST['mp3_title'])) ||
        empty(validate_input($_POST['mp3_duration'])) ||
        empty(validate_input($_POST['cat_id'])) ||
        (!isset($_POST['mp3_artist']) || count($_POST['mp3_artist']) <= 0) ||
        empty(validate_input($_POST['album_id'])) ||
        empty(validate_input($mp3_type)) ||
        ($mp3_type == 'server_url' && empty($_POST['mp3_url'])) ||
        ($mp3_type == 'local' && (!isset($_FILES['mp3_local']) || $_FILES['mp3_local']['size'] == 0) && empty($row['mp3_url'])) ||
        ((isset($_FILES['mp3_thumbnail']) && empty($_FILES['mp3_thumbnail']['name'])) && empty($row['mp3_thumbnail'])) ||
        empty(validate_input($_POST['mp3_description'], true)) ||
        empty(validate_input($_POST['mp3_lyrics'], true))
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_mp3.php?mp3_id=" . $_GET['mp3_id']);
        exit;
    }

    if ($mp3_type == 'server_url') {
        $mp3_url = htmlentities(trim($_POST['mp3_url']));
        if ($row['mp3_type'] == 'local') {
            unlink('uploads/' . basename($row['mp3_url']));
        }
    } else {
        $path = "uploads/"; //set your folder path
        if ($_FILES['mp3_local']['name'] != "") {
            unlink('uploads/' . basename($row['mp3_url']));
            $ext = pathinfo($_FILES['mp3_local']['name'], PATHINFO_EXTENSION);
            $mp3_local = rand(0, 99999) . $_POST['mp3_id'] . "_mp3." . $ext;
            $tmp = $_FILES['mp3_local']['tmp_name'];
            if (move_uploaded_file($tmp, $path . $mp3_local)) {
                $mp3_url =$mp3_local;
            } else {
                _e("Error in uploading mp3 file !!");
                exit;
            }
        } else {
            $mp3_url = basename($row['mp3_url']);
        }
    }
    if ($_FILES['mp3_thumbnail']['name'] != "") {

        unlink('images/' . $row['mp3_thumbnail']);
        unlink('images/thumbs/' . $row['mp3_thumbnail']);

        $file_name = str_replace(" ", "-", $_FILES['mp3_thumbnail']['name']);

        $mp3_thumbnail = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $mp3_thumbnail;
        $pic1 = compress_image($_FILES["mp3_thumbnail"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$mp3_thumbnail;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300');
    } else {
        $mp3_thumbnail = $row['mp3_thumbnail'];
    }
    
    if ($_FILES['mp3_cover']['name'] != "") {

        unlink('images/' . $row['mp3_cover']);
        unlink('images/thumbs/' . $row['mp3_cover']);

        $file_name = str_replace(" ", "-", $_FILES['mp3_cover']['name']);

        $mp3_cover = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $mp3_cover;
        $pic1 = compress_image($_FILES["mp3_cover"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$mp3_cover;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300');
    } else {
        $mp3_cover = $row['mp3_cover'];
    }

    $data = array(
        'mp3_title'  =>  validate_input($_POST['mp3_title'], ENT_QUOTES, "UTF-8"),
        'mp3_duration'  =>  validate_input($_POST['mp3_duration']),
        'cat_id'  =>  $_POST['cat_id'],
        'mp3_artist'  => implode(',', $_POST['mp3_artist']),
        'album_id'  =>  validate_input($_POST['album_id']),
        'mp3_type'  =>  validate_input($mp3_type),
        'mp3_url'  =>  validate_input($mp3_url),
        'mp3_thumbnail'  =>  validate_input($mp3_thumbnail),
        'mp3_cover'  =>  validate_input($mp3_cover),
        'mp3_description'  =>  validate_input($_POST['mp3_description'], ENT_QUOTES, "UTF-8"),
        'mp3_lyrics'  =>  validate_input($_POST['mp3_lyrics'], ENT_QUOTES, "UTF-8")
    );

    $qry = Update('tbl_mp3', $data, "WHERE id = '" . $_POST['mp3_id'] . "'");


    $_SESSION['msg'] = "11";
    $_SESSION['class'] = "success";
    header("Location:manage_mp3.php");
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

                        <form class="row g-3" action="" method="post" enctype="multipart/form-data">
                            <br><br>
                            <input type="hidden" name="mp3_id" value="<?php if ($count > 0) {
                                                                            _e($_GET['mp3_id']);
                                                                        } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Title</label>
                                <input type="text" class="form-control" name="mp3_title" value="<?php if ($count > 0) {
                                                                                                    _e($row['mp3_title']);
                                                                                                } ?>" id="floatingName" class="form-control">
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Category</label>
                                <select name="cat_id" class="form-control label ui selection fluid dropdown">
                                    <option value="">--Select Category--</option>
                                    <?php
                                    while ($cat_row = mysqli_fetch_array($cat_result)) {
                                    ?>
                                      <option value="<?php _e($cat_row['cid']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if ($cat_row['cid'] == $row['cat_id']) {
                                                                                        ?> selected <?php
                                                                                                }
                                                                                            }
                                                                                                    ?>>
                                            <?php _e($cat_row['category_name']); ?>

                                        </option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Album</label>
                                <select name="album_id" class="form-control label ui selection fluid dropdown">
                                    <option value="">--Select Album--</option>
                                    <?php
                                    while ($album_row = mysqli_fetch_array($album_result)) {
                                    ?>
                                        <option value="<?php _e($album_row['aid']); ?>" <?php if ($count > 0) {
                                                                                            if ($album_row['aid'] == $row['album_id']) { ?>selected<?php }
                                                                                                                                            } ?>><?php _e($album_row['album_name']); ?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                           <div class="col-12">
                                <label for="inputNanme4" class="form-label">Artist</label>
                                <select name="mp3_artist[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="">--Select Artist--</option>
                                    <?php
                                    $selected_artists = explode(',', $row['mp3_artist']);
                            
                                    while ($artist_row = mysqli_fetch_array($artist_result)) {
                                        ?>
                                        <option value="<?php _e($artist_row['artist_name']); ?>" 
                                            <?php
                                            if (in_array($artist_row['artist_name'], $selected_artists)) { 
                                                echo "selected"; 
                                            } 
                                            ?>
                                        ><?php _e($artist_row['artist_name']); ?></option>
                                    <?php
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="inputName4" class="form-label">Upload Type</label>
                                <select name="mp3_type" id="mp3_type" class="form-control label ui selection fluid dropdown" required>
                                    <option value="server_url" <?php if ($count > 0 && $row['mp3_type'] == 'server_url') {
                                                                    echo 'selected';
                                                                } ?>>From Server(URL)</option>
                                    <option value="local" <?php if ($count > 0 && $row['mp3_type'] == 'local') {
                                                                echo 'selected';
                                                            } ?>>Browse From Device</option>
                                </select><br>
                            </div>

                               <div id="mp3_url_display" class="form-group row col-12">
                                   <label for="inputName4" class="form-label">Song URL</label>
                                   <input type="text" class="form-control" name="mp3_url" value="<?php if ($count > 0) {
                                                                                                        _e($row['mp3_url']);
                                                                                                    } ?>" id="mp3_url">
                               </div>
                            
                               <div class="col-12" id="mp3_local_display">
                                   <label for="inputNanme4" class="form-label">Song File</label>
                                   <input type="file" name="mp3_local" class="form-control" value="fileupload_audio" accept="audio/mp3" onchange="audioFileValidation()" id="fileupload_audio">
                                   <br />
                                   <br />
                                   <?php
                                    $mp3_file = $row['mp3_url'];
                                    $mp3_URL = $row['mp3_url'];
                                    if ($row['mp3_type'] == 'local') {
                                        $mp3_URL = $file_path . 'uploads/' . basename($row['mp3_url']);
                                        $mp3_file = 'uploads/' . basename($row['mp3_url']);
                                    }
                                    ?>
                                   <div class="fileupload_audio" id="uploadPreview_audio">
                                       <audio controls>
                                           <source src="<?php _e($mp3_file); ?>" type="audio/mp3">
                                           Your browser does not support the audio tag.
                                       </audio>
                                   </div>
                               </div>
 
                             <div class="col-12">
                                <label for="inputNanme4" class="form-label">Duration</label>
                                <input type="text" class="form-control" name="mp3_duration" value="<?php if ($count > 0) {
                                                                                                        _e($row['mp3_duration']);
                                                                                                    } ?>" id="floatingName" class="form-control">
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Mp3 Thumbnail</label>
                                <input type="file" name="mp3_thumbnail" class="form-control" value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation()" id="fileupload">
                                <?php if ($count > 0) { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="images/thumbs/<?php _e($row['mp3_thumbnail']); ?>" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } else { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } ?>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Mp3 Cover</label>
                                <input type="file" name="mp3_cover" class="form-control" value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation2()" id="fileupload2">
                                <?php if ($count > 0) { ?>
                                    <div class="fileupload_img" id="uploadPreview2"><img type="image" src="images/thumbs/<?php _e($row['mp3_cover']); ?>" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } else { ?>
                                    <div class="fileupload_img" id="uploadPreview2"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } ?>
                            </div>
                            <div class="col-12">
                                <br><label for="inputNanme4" class="form-label">Song Description</label>
                                <textarea name="mp3_description" id="mp3_description" class="form-control">
                                    <?php if ($count > 0) {
                                        _e($row['mp3_description'], true);
                                    } ?>
                                </textarea>
                                <script>
                                    CKEDITOR.replace('mp3_description');
                                </script>
                            </div>
                            <div class="col-12">
                                <br><label for="inputNanme4" class="form-label">Song Lyrics</label>
                                <textarea name="mp3_lyrics" id="mp3_lyrics" class="form-control">
                                    <?php if ($count > 0) {
                                        _e($row['mp3_lyrics'], true);
                                    } ?>
                                </textarea>
                                <script>
                                    CKEDITOR.replace('mp3_lyrics');
                                </script>
                            </div>
                            <br>
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
    function fileValidation2() {
        var fileInput = document.getElementById('fileupload2');
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
                    document.getElementById('uploadPreview2').innerHTML = '<img src="' + e.target.result + '" style="width:150px;height:200px;margin-top: 10px;"/>';
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    }
    function audioFileValidation() {
        var fileInput = document.getElementById('fileupload_audio');
        var filePath = fileInput.value;
        var allowedExtensions = /(\.mp3)$/i;
        if (!allowedExtensions.exec(filePath)) {
            alert('Please upload a file with the .mp3 extension only.');
            fileInput.value = '';
            return false;
        } else {
            // Audio preview
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('uploadPreview_audio').innerHTML = '<audio controls><source src="' + e.target.result + '" type="audio/mp3">Your browser does not support the audio tag.</audio>';
                };
                reader.readAsDataURL(fileInput.files[0]);
            }
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function(e) {
        function handleInitialState() {
            var type = $("#mp3_type").val();
            if (type == "server_url") {
                $("#mp3_url_display").show();
                $("#mp3_local_display").hide();
                $("#mp3_local").val('');
                $("#audio").attr('src', '');
            } else {
                $("#mp3_url_display").hide();
                $("#mp3_local_display").show();
            }
        }
        handleInitialState();
        $("#mp3_type").change(function() {
            var type = $(this).val();
            if (type == "server_url") {
                $("#mp3_url_display").show();
                $("#mp3_local_display").hide();
                $("#mp3_local").val('');
                $("#audio").attr('src', '');
            } else {
                $("#mp3_url_display").hide();
                $("#mp3_local_display").show();
            }
        });
    });
</script>

<?php include("includes/footer.php"); ?>