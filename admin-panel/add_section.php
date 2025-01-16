<?php
$page_title = (isset($_GET['section_id'])) ? 'Edit Section' : 'Add Section';
include("includes/header.php");

$mp3_qry = "SELECT * FROM tbl_mp3 Where tbl_mp3.status=1";
$mp3_result = mysqli_query($mysqli, $mp3_qry);

if (isset($_POST['submit']) and isset($_GET['add'])  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['section_title'])) ||
        (!isset($_POST['section_books']) || count($_POST['section_books']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_album.php?add=yes");
        exit;
    }

    $data = array(
        'section_title'  =>  validate_input($_POST['section_title']),
        'section_books'  =>  implode(',', $_POST['section_books'])
    );

    $qry = Insert('tbl_home_section', $data);

    $_SESSION['msg'] = "10";

    header("Location:home_section.php");
    exit;
}
$count = 0;
if (isset($_GET['section_id'])) {
    $qry = "SELECT * FROM tbl_home_section where id='" . $_GET['section_id'] . "'";
    $result = mysqli_query($mysqli, $qry);
    $row = mysqli_fetch_assoc($result);
    $count = $result->num_rows;
}

if (isset($_POST['submit']) &&   $count > 0  && PURCHASE == '') {
    if (
        empty(validate_input($_POST['section_title'])) ||
        (!isset($_POST['section_books']) || count($_POST['section_books']) <= 0)
    ) {
        $_SESSION['msg'] = "15";
        $_SESSION['class'] = 'error';
        header("Location:add_album.php?add=yes");
        exit;
    }

    $data = array(
        'section_title'  =>  validate_input($_POST['section_title']),
        'section_books'  =>  implode(',', $_POST['section_books'])
    );

    $category_edit = Update('tbl_home_section', $data, "WHERE id = '" . $_GET['section_id'] . "'");


    $_SESSION['msg'] = "11";
    header("Location:home_section.php");
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
                            <input type="hidden" name="section_id" value="<?php if ($count > 0) {
                                                                                _e($_GET['section_id']);
                                                                            } ?>" />
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">Section Title</label>
                                <input type="text" class="form-control" name="section_title" id="floatingName" value="<?php if ($count > 0) {
                                                                                                                        _e($row['section_title']);
                                                                                                                    }  ?>" class="form-control">
                            </div>
                            <div class="col-12">
                                <label for="inputNanme4" class="form-label">MP3</label>
                                <select name="section_books[]" multiple="" class="form-control label ui selection fluid dropdown">
                                    <option value="" disabled>--Select Artist--</option>
                                    <?php
                                    while ($mp3_row = mysqli_fetch_array($mp3_result)) {
                                    ?>
                                        <option value="<?php _e($mp3_row['id']); ?>" <?php
                                                                                        if ($count > 0) {
                                                                                            if (in_array($mp3_row['id'], explode(",", $row['section_books']))) {
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
<?php include("includes/footer.php"); ?>