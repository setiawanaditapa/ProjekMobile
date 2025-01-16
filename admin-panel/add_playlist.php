<?php
$page_title = (isset($_GET['playlist_id'])) ? 'Edit Playlist' : 'Add Playlist';
include("includes/header.php");

$file_path = getBaseUrl();

$mp3_qry = "SELECT * FROM tbl_mp3 Where tbl_mp3.status=1 ORDER BY mp3_title DESC";
$mp3_result = mysqli_query($mysqli, $mp3_qry);

$geners_qry = "SELECT * FROM tbl_geners Where tbl_geners.g_status=1  ORDER BY  geners_name DESC";
$geners_result = mysqli_query($mysqli, $geners_qry);

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['playlist_name'])) ||
        (!isset($_FILES['playlist_image']['size']) || $_FILES['playlist_image']['size'] == 0) ||
        (!isset($_POST['playlist_songs']) || count($_POST['playlist_songs']) <= 0) ||
        (!isset($_POST['geners_type']) || count($_POST['geners_type']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_playlist.php?add=yes");
        exit;
    }

    $file_name = str_replace(" ", "-", $_FILES['playlist_image']['name']);
    $playlist_image = rand(0, 99999) . "_" . $file_name;

    $tpath1 = 'images/' . $playlist_image;
    $pic1 = compress_image($_FILES["playlist_image"]["tmp_name"], $tpath1, 80);

    $thumbpath = 'images/thumbs/' . $playlist_image;
    $thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');


    $data = array(
        'playlist_name'  =>  validate_input($_POST['playlist_name'], ENT_QUOTES, "UTF-8"),
        'playlist_image'  =>  validate_input($playlist_image),
        'playlist_songs'  => implode(',', $_POST['playlist_songs']),
        'geners_type'  => implode(',', $_POST['geners_type'])
    );

    $qry = Insert('tbl_playlist', $data);

    $_SESSION['msg'] = "10";
    $_SESSION['class'] = "success";
    header("Location:manage_playlist.php");
    exit;
}
$count = 0;
if (isset($_GET['playlist_id'])) {

    $qry = "SELECT * FROM tbl_playlist where pid='" . $_GET['playlist_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}
if (isset($_POST['submit']) and isset($_GET['playlist_id'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['playlist_name'])) ||
        ((isset($_FILES['playlist_image']) && empty($_FILES['playlist_image']['name'])) && empty($row['playlist_image'])) ||
        (!isset($_POST['playlist_songs']) || count($_POST['playlist_songs']) <= 0) ||
        (!isset($_POST['geners_type']) || count($_POST['geners_type']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_mp3.php?playlist_id=" . $_GET['playlist_id']);
        exit;
    }

    if ($_FILES['playlist_image']['name'] != "") {

        unlink('images/' . $row['playlist_image']);
        unlink('images/thumbs/' . $row['playlist_image']);

        $file_name = str_replace(" ", "-", $_FILES['playlist_image']['name']);

        $playlist_image = rand(0, 99999) . "_" . $file_name;

        $tpath1 = 'images/' . $playlist_image;
        $pic1 = compress_image($_FILES["playlist_image"]["tmp_name"], $tpath1, 80);

        $thumbpath='images/thumbs/'.$playlist_image;   
        $thumb_pic1=create_thumb_image($tpath1,$thumbpath,'300','300');
    } else {
        $playlist_image = $row['playlist_image'];
    }

    $data = array(
        'playlist_name'  =>  validate_input($_POST['playlist_name'], ENT_QUOTES, "UTF-8"),
        'playlist_image'  =>  validate_input($playlist_image),
        'playlist_songs'  => implode(',', $_POST['playlist_songs']),
        'geners_type'  => implode(',', $_POST['geners_type'])
    );


    $qry = Update('tbl_playlist', $data, "WHERE pid = '" . $_POST['playlist_id'] . "'");


    $_SESSION['msg'] = "11";
    $_SESSION['class'] = "success";
    header("Location:manage_playlist.php");
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
                            <input type="hidden" name="playlist_id" value="<?php if ($count > 0) {
                                                                            _e($_GET['playlist_id']);
                                                                        } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Playlist Name</label>
                                <input type="text" class="form-control" name="playlist_name" value="<?php if ($count > 0) {
                                                                                                    _e($row['playlist_name']);
                                                                                                } ?>" id="floatingName" class="form-control">
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Playlist Image</label>
                                <input type="file" name="playlist_image" class="form-control" value="fileupload" accept=".png,.PNG,.jpg, .JPG ,.jpeg,.JPEG" onchange="fileValidation()" id="fileupload">
                                <?php if ($count > 0) { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="images/thumbs/<?php _e($row['playlist_image']); ?>" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } else { ?>
                                    <div class="fileupload_img" id="uploadPreview"><img type="image" src="assets/img/add-image.png" alt="image" style="width: 200px;height:200px;margin-top: 10px;" /></div>
                                <?php } ?>
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">MP3</label>
                                <select name="playlist_songs[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="">--Select MP3--</option>
                                    <?php
                                    while ($mp3_row = mysqli_fetch_array($mp3_result)) {
                                    ?>
                                      <option value="<?php _e($mp3_row['id']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if (in_array($mp3_row['id'], explode(",", $row['playlist_songs']))) {
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
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Geners</label>
                                <select name="geners_type[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="">--Select Geners--</option>
                                    <?php
                                    while ($geners_row = mysqli_fetch_array($geners_result)) {
                                    ?>
                                      <option value="<?php _e($geners_row['id']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if (in_array($geners_row['id'], explode(",", $row['geners_type']))) {
                                                                                        ?> selected <?php
                                                                                                }
                                                                                            }
                                                                                                    ?>>
                                            <?php _e($geners_row['geners_name']); ?>

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
                    document.getElementById('uploadPreview').innerHTML = '<img src="' + e.target.result + '" style="width:150px;height:200px;margin-top: 10px;"/>';
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