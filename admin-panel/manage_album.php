<?php
include("includes/header.php");
$page_title = "Manage Album";
$add_page_title = "Add Album";

$_GET = validate_input($_GET);
$tableName = "tbl_album";
$targetpage = "manage_album.php";
$limit = 10;

$searchInput = isset($_GET['keyword']) ? $_GET['keyword'] : '';
if ($searchInput != "") {
    $query = "SELECT COUNT(*) as num  FROM tbl_album WHERE `album_name` LIKE '%$searchInput%'";
    $total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query));
    $total_pages = $total_pages['num'];
} else {
    $query = "SELECT COUNT(*) as num FROM $tableName";
    $total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query));
    $total_pages = $total_pages['num'];
}

$stages = 3;
$page = 0;
if (isset($_GET['page'])) {
    $page = mysqli_real_escape_string($mysqli, $_GET['page']);
}
if ($page) {
    $start = ($page - 1) * $limit;
} else {
    $start = 0;
}

if ($searchInput != "") {
    $sql_query = "SELECT * FROM tbl_album WHERE `album_name` LIKE '%$searchInput%' ORDER BY tbl_album.`aid` DESC LIMIT $start, $limit";
    $result = mysqli_query($mysqli, $sql_query) or die(mysqli_error($mysqli));
} else {
    $sql_query = "SELECT * FROM tbl_album ORDER BY tbl_album.`aid` DESC LIMIT $start, $limit";
    $result = mysqli_query($mysqli, $sql_query) or die(mysqli_error($mysqli));
}

$artist_qry = "SELECT * FROM tbl_artist";
$artist_result = mysqli_query($mysqli, $artist_qry);
if (!$artist_result) {
    die("Error in SQL query: " . mysqli_error($mysqli));
}
$artist = array();
while ($row = mysqli_fetch_array($artist_result)) {
    $artist[$row['id']] = $row['artist_name'];
}
?>
<main id="main" class="main">

    <div class="row">
        <div class="col-lg-3">
            <div class="pagetitle">
                <h1><?php _e($page_title); ?></h1>
            </div>
        </div>
        <div class="col-lg-6">
            <form method="GET" id="searchForm" action="">
                <input class="form-control input-sm" placeholder="Search here..." aria-controls="DataTables_Table_0" type="search" name="keyword" value="<?php if (isset($_GET['keyword'])) {
                                                                                                                                                                _e($_GET['keyword']);
                                                                                                                                                            } ?>" required>
            </form>
        </div>
        <div class="col-lg-3 float-right">
            <div class="d-flex justify-content-end">
                <a href="add_album.php?add=yes">
                    <button type="button" class="btn btn-outline-primary btn-lg"><?php _e($add_page_title); ?></button>
                </a>
            </div>
        </div>
    </div><br>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Album</th>
                                        <th style="width: 20%;">Artist</th>
                                        <th>Album Image</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    while ($row = mysqli_fetch_array($result)) {
                                    ?>
                                        <tr>
                                            <td><?php _e($row['album_name']); ?></td>
                                            <td scope="row">
                                                <?php
                                                $artist_ids = explode(',', $row['artist_ids']);
                                                foreach ($artist_ids as $artist_id) {
                                                    if (isset($artist[$artist_id])) {
                                                        _e($artist[$artist_id] . ",");
                                                    }
                                                }
                                                ?>
                                            </td>
                                            <td>
                                                <?php if (empty($row['album_image'])) { ?>
                                                    <img src="assets/images/add-image.png" />
                                                <?php } else { ?>
                                                    <img type="image" src="images/thumbs/<?php _e($row['album_image']); ?>" class="image_size" alt="image" />
                                                <?php } ?>
                                            </td>
                                            <td>
                                                <?php if ($row['status'] != "0") { ?>
                                                    <a title="Change Status" class="toggle_btn_a" href="javascript:void(0)" data-id="<?php _e($row['aid']); ?>" data-action="deactive" data-column="status"><span class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i><span>Enable</span></span></a>

                                                <?php } else { ?>
                                                    <a title="Change Status" class="toggle_btn_a" href="javascript:void(0)" data-id="<?php _e($row['aid']); ?>" data-action="active" data-column="status"><span class="btn btn-danger"><i class="fa fa-check" aria-hidden="true"></i><span>Disable </span></span></a>
                                                <?php } ?>
                                            </td>
                                            <td>
                                                <a href="add_album.php?album_id=<?php _e($row['aid']); ?>" class="btn btn-primary">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                                <a href="javascript:void(0)" data-id="<?php _e($row['aid']); ?>" class="btn btn-danger btn_delete_a btn_cust" data-toggle="tooltip" data-tooltip="Delete !">
                                                    <i class="bi bi-trash-fill"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    <?php
                                    }
                                    ?>
                                </tbody>
                            </table>
                            <!-- End Table with stripped rows -->
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12 d-flex justify-content-end paginationRight">
                        <nav aria-label="Page navigation example">
                            <?php
                            include("pagination.php");
                            ?>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        $(".toggle_btn_a").on("click", function(e) {
            e.preventDefault();
            var _for = $(this).data("action");
            var _id = $(this).data("id");
            var _column = $(this).data("column");
            var _table = 'tbl_album';

            $.ajax({
                type: 'post',
                url: 'processdata.php',
                dataType: 'json',
                data: {
                    id: _id,
                    for_action: _for,
                    column: _column,
                    table: _table,
                    'action': 'toggle_status',
                    'tbl_id': 'aid'
                },
                success: function(res) {
                    console.log(res);
                    if (res.status == '1') {
                        location.reload();
                    }
                }
            });

        });
        $(".btn_delete_a").click(function(e) {

            e.preventDefault();

            var _ids = $(this).data("id");
            var _table = 'tbl_album';

            swal({
                    title: "Are you sure to delete this?",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonClass: "btn-warning",
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Yes",
                    cancelButtonText: "No",
                    closeOnConfirm: false,
                    closeOnCancel: false,
                    showLoaderOnConfirm: true
                },
                function(isConfirm) {
                    if (isConfirm) {

                        $.ajax({
                            type: 'post',
                            url: 'processdata.php',
                            dataType: 'json',
                            data: {
                                id: _ids,
                                'action': 'multi_delete',
                                'tbl_nm': _table
                            },
                            success: function(res) {
                                console.log(res);
                                if (res.status == '1') {
                                    swal({
                                        title: "Successfully",
                                        text: "Album is deleted.",
                                        type: "success"
                                    }, function() {
                                        location.reload();
                                    });
                                } else if (res.status == '-2') {
                                    swal(res.message);
                                }
                            }
                        });
                    } else {
                        swal.close();
                    }
                });
        });
    </script>
</main>
<?php include("includes/footer.php"); ?>