<?php
error_reporting(0);
require("includes/connection.php");
require("includes/function.php");

$response = array();

if (PURCHASE == 'disabled') {
	$response['status'] = 1;
	$_SESSION['class'] = "error";
	$_SESSION['msg'] = "demo_mode";
	echo json_encode($response);
	exit();
} else {
	if (isset($_POST['action']) && trim($_POST['action']) != '') {
		switch ($_POST['action']) {
			case 'toggle_status':
				$id = $_POST['id'];
				$for_action = $_POST['for_action'];
				$column = $_POST['column'];
				$tbl_id = $_POST['tbl_id'];
				$table_nm = $_POST['table'];
			case 'toggle_status':
				$id = $_POST['id'];
				$for_action = $_POST['for_action'];
				$column = $_POST['column'];
				$tbl_id = $_POST['tbl_id'];
				$table_nm = $_POST['table'];

				if ($for_action == 'active') {
					$data = array($column  =>  '1');
					$edit_status = Update($table_nm, $data, "WHERE $tbl_id = '$id'");
					$_SESSION['msg'] = "13";
				} else {
					$data = array($column  =>  '0');
					$edit_status = Update($table_nm, $data, "WHERE $tbl_id = '$id'");
					$_SESSION['msg'] = "14";
				}

				$response['status'] = 1;
				$response['action'] = $for_action;
				echo json_encode($response);
				break;

			case 'admob_add':

				$id = $_POST['id'];
				$for_action = $_POST['for_action'];
				$column = $_POST['column'];
				$tbl_id = $_POST['tbl_id'];
				$table_nm = $_POST['table'];

				if ($for_action == 'deactive') {
					$data = array($column  =>  '1');
					$edit_status = Update($table_nm, $data, "WHERE $tbl_id = '$id'");
				} else {
					$data = array($column  =>  '0');
					$edit_status = Update($table_nm, $data, "WHERE $tbl_id = '$id'");
				}


				$response['status'] = 1;
				$response['action'] = $for_action;
				echo json_encode($response);
				break;


				$response['status'] = 1;
				$_SESSION['msg'] = "12";
				echo json_encode($response);
				break;

			case 'multi_delete':

				if (is_array($_POST['id'])) {
					$ids = implode(",", $_POST['id']);
				} else {
					$ids = $_POST['id'];
				}

				$tbl_nm = $_POST['tbl_nm'];

				if ($tbl_nm == 'tbl_category') {

					$sql = "SELECT * FROM $tbl_nm WHERE `cid` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['category_image'] != "") {
							unlink('images/' . $row['category_image']);
							unlink('images/thumbs/' . $row['category_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `cid` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_artist') {

					$sql = "SELECT * FROM $tbl_nm WHERE `id` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['artist_image'] != "") {
							unlink('images/' . $row['artist_image']);
							unlink('images/thumbs/' . $row['artist_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_album') {
					$sql = "SELECT * FROM $tbl_nm WHERE `aid` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['album_image'] != "") {
							unlink('images/' . $row['album_image']);
							unlink('images/thumbs/' . $row['album_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `aid` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_album') {
					$sql = "SELECT * FROM $tbl_nm WHERE `aid` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['album_image'] != "") {
							unlink('images/' . $row['album_image']);
							unlink('images/thumbs/' . $row['album_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `aid` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_geners') {
					$deleteSql = "DELETE FROM $tbl_nm WHERE `id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_home_section') {
					$deleteSql = "DELETE FROM $tbl_nm WHERE `id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_mp3') {
					$sql = "SELECT * FROM $tbl_nm WHERE `id` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['mp3_thumbnail'] != "") {
							unlink('images/' . $row['mp3_thumbnail']);
							unlink('images/thumbs/' . $row['mp3_thumbnail']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_playlist') {
					$sql = "SELECT * FROM $tbl_nm WHERE `pid` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['playlist_image'] != "") {
							unlink('images/' . $row['playlist_image']);
							unlink('images/thumbs/' . $row['playlist_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `pid` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_banner') {
					$sql = "SELECT * FROM $tbl_nm WHERE `bid` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);
					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['banner_image'] != "") {
							unlink('images/' . $row['banner_image']);
							unlink('images/thumbs/' . $row['banner_image']);
						}
					}
					$deleteSql = "DELETE FROM $tbl_nm WHERE `bid` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				}
				else if ($tbl_nm == 'tbl_users') {

					$sql = "SELECT * FROM tbl_users WHERE `id` IN ($ids)";
					$res = mysqli_query($mysqli, $sql);

					while ($row = mysqli_fetch_assoc($res)) {
						if ($row['user_image'] != "") {
							unlink('images/' . $row['user_image']);
						}
					}
					$deleteSql = "DELETE FROM tbl_users WHERE `id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);

					$deleteSql = "DELETE FROM tbl_song_suggest WHERE `user_id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);

					$deleteSql = "DELETE FROM tbl_reports WHERE `user_id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);

					$deleteSql = "DELETE FROM tbl_favorite WHERE `user_id` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);

					$deleteSql = "DELETE FROM tbl_rating WHERE `ip` IN ($ids)";
					mysqli_query($mysqli, $deleteSql);
				} 

				$_SESSION['msg'] = "12";
				$response['status'] = 1;
				echo json_encode($response);
				break;

			case 'multi_action': {

					$action = $_POST['for_action'];
					$tbl_nm = $_POST['table'];

					if (is_array($_POST['id'])) {
						$ids = implode(",", $_POST['id']);
					} else {
						$ids = $_POST['id'];
					}

					if ($action == 'enable') {
						$sql = "UPDATE $tbl_nm SET `status`='1' WHERE `id` IN ($ids)";
						mysqli_query($mysqli, $sql);
						$_SESSION['msg'] = "13";
					} else if ($action == 'disable') {
						$sql = "UPDATE $tbl_nm SET `status`='0' WHERE `id` IN ($ids)";
						if (mysqli_query($mysqli, $sql)) {
							$_SESSION['msg'] = "14";
						}
					} else if ($action == 'slider') {
						$sql = "UPDATE $tbl_nm SET `featured`='1' WHERE `id` IN ($ids)";
						mysqli_query($mysqli, $sql);
						$_SESSION['msg'] = "22";
					} else if ($action == 'remove_slider') {
						$sql = "UPDATE $tbl_nm SET `featured`='0' WHERE `id` IN ($ids)";
						if (mysqli_query($mysqli, $sql)) {
							$_SESSION['msg'] = "23";
						}
					} else if ($action == 'delete') 
					{
						if ($tbl_nm == 'tbl_mp3') {
							$sql = 'SELECT * FROM tbl_mp3 WHERE `id` IN (' . $ids . ')';

							$result = mysqli_query($mysqli, $sql);

							while ($row = mysqli_fetch_assoc($result)) {
								if ($row['mp3_thumbnail'] != "") {
									unlink('images/' . $row['mp3_thumbnail']);
									unlink('images/thumbs/' . $row['mp3_thumbnail']);
								}
							}

							mysqli_free_result($result);

							$deleteSql = "DELETE FROM tbl_mp3 WHERE `id` IN ($ids)";
							mysqli_query($mysqli, $deleteSql);
						}
						else if ($tbl_nm == 'tbl_home_section') {

							$deleteSql = "DELETE FROM tbl_home_section WHERE `id` IN ($ids)";
							mysqli_query($mysqli, $deleteSql);
						}

						$_SESSION['msg'] = "12";
					}

					$response['status'] = 1;

					echo json_encode($response);
					break;
				}

			default:
				# code...
				break;
		}
	}
}
