<?php

error_reporting(E_ALL);
ini_set("log_errors", 1);
ini_set("error_log", "/home/mp3.aplikasii.com/public_html/php-error.log");
ini_set('display_errors', 'On');

include("includes/connection.php");
include("includes/function.php");
include("language/app_language.php");
include("/smtp_email.php");

define("APP_FROM_EMAIL", $settings_details['email_from']);
define("PACKAGE_NAME", $settings_details['package_name']);
define("API_LATEST_LIMIT", $settings_details['api_latest_limit']);
define("API_CAT_ORDER_BY", $settings_details['api_cat_order_by']);
define("API_CAT_POST_ORDER_BY", $settings_details['api_cat_post_order_by']);
date_default_timezone_set("Asia/Kolkata");
$file_path = getBaseUrl();
function generateRandomPassword($length = 10)
{
	$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$charactersLength = strlen($characters);
	$randomString = '';
	for ($i = 0; $i < $length; $i++) {
		$randomString .= $characters[rand(0, $charactersLength - 1)];
	}
	return $randomString;
}
function createRandomCode()
{
	$chars = "abcdefghijkmnopqrstuvwxyz023456789";
	srand((float)microtime() * 1000000);
	$i = 0;
	$pass = '';
	while ($i <= 7) {
		$num = rand() % 33;
		$tmp = substr($chars, $num, 1);
		$pass = $pass . $tmp;
		$i++;
	}
	return $pass;
}
function is_favorite($post_id, $user_id)
{
	global $mysqli;

	$sql = "SELECT * FROM tbl_favorite WHERE `post_id`='$post_id' AND `user_id`='$user_id'";
	$result = mysqli_query($mysqli, $sql);

	if (mysqli_num_rows($result) > 0) {
		return true;
	} else {
		return false;
	}
}

$get_method = checkSignSalt($_POST['data']);

if ($get_method['method_name'] == "home") {
	$limit = API_LATEST_LIMIT;
	$jsonObj_1 = array();

	$query1 = "SELECT * FROM tbl_banner WHERE status='1' ORDER BY tbl_banner.bid DESC";
	$sql1 = mysqli_query($mysqli, $query1);

	while ($data1 = mysqli_fetch_assoc($sql1)) {
		$row1['bid'] = $data1['bid'];
		$row1['banner_title'] = $data1['banner_title'];
		$row1['banner_sort_info'] = $data1['banner_sort_info'];
		$row1['banner_image'] = $file_path . 'images/' . $data1['banner_image'];
		$row1['banner_image_thumb'] = $file_path . 'images/thumbs/' . $data1['banner_image'];

		$songs_list = explode(",", $data1['banner_songs']);
		$total_songs = 0;

		foreach ($songs_list as $song_id) {
			$query01 = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0
			WHERE tbl_mp3.`id`='$song_id' AND tbl_category.`status`='1' AND tbl_mp3.`status`='1'";

			$sql01 = mysqli_query($mysqli, $query01);

			if (mysqli_num_rows($sql01) > 0) {
				while ($data01 = mysqli_fetch_assoc($sql01)) {
					$total_songs++;
					$row01['id'] = $data01['id'];
					$row01['cat_id'] = $data01['cat_id'];
					$row01['mp3_type'] = $data01['mp3_type'];
					$row01['mp3_title'] = $data01['mp3_title'];
					$row01['mp3_url'] = $file_path."uploads/".$data01['mp3_url'];
					$row01['mp3_thumbnail_b'] = $file_path . 'images/' . $data01['mp3_thumbnail'];
					$row01['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data01['mp3_thumbnail'];
					$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
					$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
					$row01['mp3_duration'] = $data01['mp3_duration'];
					$row01['mp3_artist'] = $data01['mp3_artist'];
					$row01['mp3_description'] = $data01['mp3_description'];
					$row01['total_rate'] = $data01['total_rate'];
					$row01['rate_avg'] = $data01['rate_avg'];
					$row01['total_views'] = $data01['total_views'];
					$row01['total_download'] = $data01['total_download'];
					$row01['cid'] = $data01['cid'];
					$row01['category_name'] = $data01['category_name'];
					$row01['category_image'] = $file_path . 'images/' . $data01['category_image'];
					$row01['category_image_thumb'] = $file_path . 'images/thumbs/' . $data01['category_image'];
					$row1['songs_list'][] = $row01;
				}
			} else {
				$row1['songs_list'] = array();
			}
		}
		$row1['total_songs'] = $total_songs;

		array_push($jsonObj_1, $row1);
		unset($row1['songs_list']);
	}
	$row['home_banner'] = $jsonObj_1;
	$jsonObj4 = array();

	$query4 = "SELECT * FROM tbl_album WHERE status='1' ORDER BY tbl_album.`aid` DESC LIMIT $limit";
	$sql4 = mysqli_query($mysqli, $query4);

	while ($data4 = mysqli_fetch_assoc($sql4)) {
		$row4['aid'] = $data4['aid'];
		$row4['album_name'] = $data4['album_name'];
		$row4['album_image'] = $file_path . 'images/' . $data4['album_image'];
		$row4['album_image_thumb'] = $file_path . 'images/thumbs/' . $data4['album_image'];

		array_push($jsonObj4, $row4);
	}

	$row['latest_album'] = $jsonObj4;
	$jsonObj3 = array();

	$query3 = "SELECT id,artist_name,artist_image FROM tbl_artist Where tbl_artist.a_status='1' ORDER BY tbl_artist.`id` DESC LIMIT $limit";
	$sql3 = mysqli_query($mysqli, $query3);

	while ($data3 = mysqli_fetch_assoc($sql3)) {
		$row3['id'] = $data3['id'];
		$row3['artist_name'] = $data3['artist_name'];
		$row3['artist_image'] = $file_path . 'images/' . $data3['artist_image'];
		$row3['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data3['artist_image'];

		array_push($jsonObj3, $row3);
	}

	$row['latest_artist'] = $jsonObj3;
	$jsonObj_2 = array();

	$start = date('Y-m-d', strtotime('today - 30 days'));
	$finish = date('Y-m-d', strtotime('today'));

	$query2 = "SELECT DISTINCT tbl_mp3.id, tbl_mp3.*,tbl_category.*, tbl_mp3_views.`views` FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0
			LEFT JOIN tbl_mp3_views ON tbl_mp3.`id`= tbl_mp3_views.`mp3_id`
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3_views.`date` BETWEEN '$start' AND '$finish' ORDER BY tbl_mp3_views.`views` DESC LIMIT $limit";

	$sql2 = mysqli_query($mysqli, $query2);

	while ($data2 = mysqli_fetch_assoc($sql2)) {
		$row2['id'] = $data2['id'];
		$row2['cat_id'] = $data2['cat_id'];
		$row2['mp3_type'] = $data2['mp3_type'];
		$row2['mp3_title'] = $data2['mp3_title'];
		$row2['mp3_url'] = $file_path."uploads/".$data2['mp3_url'];
		$row2['mp3_thumbnail_b'] = $file_path . 'images/' . $data2['mp3_thumbnail'];
		$row2['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data2['mp3_thumbnail'];
			$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
					$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row2['mp3_duration'] = $data2['mp3_duration'];
		$row2['mp3_artist'] = $data2['mp3_artist'];
		$row2['mp3_description'] = $data2['mp3_description'];
		$row2['total_rate'] = $data2['total_rate'];
		$row2['rate_avg'] = $data2['rate_avg'];
		$row2['total_views'] = $data2['total_views'];
		$row2['total_download'] = $data2['total_download'];
		$row2['cid'] = $data2['cid'];
		$row2['category_name'] = $data2['category_name'];
		$row2['category_image'] = $file_path . 'images/' . $data2['category_image'];
		$row2['category_image_thumb'] = $file_path . 'images/thumbs/' . $data2['category_image'];
		array_push($jsonObj_2, $row2);
	}
	$row['trending_songs'] = $jsonObj_2;

	$set['ONLINE_MP3'] = $row;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "home_section_id") {
	$user_id = isset($get_method['user_id']) ? $get_method['user_id'] : 0;
	$post_order_by = API_CAT_POST_ORDER_BY;
	$banner_id = $get_method['homesection_id'];

	$sql_banner = "SELECT * FROM tbl_home_section WHERE status='1' AND `id`='$banner_id' ORDER BY tbl_home_section.`id` DESC";
	$res_banner = mysqli_query($mysqli, $sql_banner);
	$row_banner = mysqli_fetch_assoc($res_banner);
	$songs_ids = trim($row_banner['section_books']);

	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3 LEFT JOIN tbl_category 
	ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 WHERE tbl_mp3.`id` IN ($songs_ids) AND tbl_mp3.`status`='1' AND tbl_category.`status`='1'";

	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));
	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$sql = "SELECT * FROM tbl_mp3 LEFT JOIN tbl_category 
	ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 WHERE tbl_mp3.`id` IN ($songs_ids) AND tbl_mp3.`status`='1' AND tbl_category.`status`='1' ORDER BY tbl_mp3.`id` LIMIT $limit, $page_limit";
	$result = mysqli_query($mysqli, $sql);

	while ($data = mysqli_fetch_assoc($result)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['album_id'] = $data['album_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['mp3_lyrics'] = $data['mp3_lyrics'];
		$row['lyrics'] = 'https://vocsyinfotech.website/envanto/admin_panel/onlinemusicplayer/uploads/lyrics.srt';
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] =  $data['total_download'];

		array_push($jsonObj, $row);
	}
	$set['ONLINE_MP3'] = $jsonObj;
	mysqli_free_result($result);
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "home_section") {
	$user_id = isset($_GET['user_id']) ? $_GET['user_id'] : 0;

	$query_rec = "SELECT COUNT(*) as num FROM tbl_home_section WHERE status = '1' ORDER BY tbl_home_section.`id` DESC";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$jsonObj = array();

	$query = "SELECT * FROM tbl_home_section WHERE status = '1' ORDER BY tbl_home_section.`id` DESC";

	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['id'] = $data['id'];
		$row['section_title'] = $data['section_title'];
		$row['song_list'] = $data['section_books'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "trending_songs") {
	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj_2 = array();
	$start = date('Y-m-d', strtotime('today - 30 days'));
	$finish = date('Y-m-d', strtotime('today'));

	$query2 = "SELECT DISTINCT tbl_mp3.id, tbl_mp3.*,tbl_category.* FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			LEFT JOIN tbl_mp3_views ON tbl_mp3.`id`= tbl_mp3_views.`mp3_id`
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3_views.`date` 
			BETWEEN '$start' AND '$finish' ORDER BY tbl_mp3_views.`views` DESC LIMIT $limit, $page_limit";
	$sql2 = mysqli_query($mysqli, $query2);

	while ($data2 = mysqli_fetch_assoc($sql2)) {
		$row2['id'] = $data2['id'];
		$row2['cat_id'] = $data2['cat_id'];
		$row2['mp3_type'] = $data2['mp3_type'];
		$row2['mp3_title'] = $data2['mp3_title'];
		$row2['mp3_url'] = $file_path."uploads/".$data2['mp3_url'];
		$row2['mp3_thumbnail_b'] = $file_path . 'images/' . $data2['mp3_thumbnail'];
		$row2['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data2['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row2['mp3_duration'] = $data2['mp3_duration'];
		$row2['mp3_artist'] = $data2['mp3_artist'];
		$row2['mp3_description'] = $data2['mp3_description'];
		$row2['total_rate'] = $data2['total_rate'];
		$row2['rate_avg'] = $data2['rate_avg'];
		$row2['total_views'] = $data2['total_views'];
		$row2['total_download'] = $data2['total_download'];
		$row2['cid'] = $data2['cid'];
		$row2['category_name'] = $data2['category_name'];
		$row2['category_image'] = $file_path . 'images/' . $data2['category_image'];
		$row2['category_image_thumb'] = $file_path . 'images/thumbs/' . $data2['category_image'];

		array_push($jsonObj_2, $row2);
	}

	$set['ONLINE_MP3'] = $jsonObj_2;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "all_songs") {

	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1'";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' ORDER BY tbl_mp3.`id` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_songs'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "latest") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' ORDER BY tbl_mp3.`id`";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = API_LATEST_LIMIT;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' ORDER BY tbl_mp3.`id` 
			DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "cat_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_category WHERE status=1";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();
	$cat_order = API_CAT_ORDER_BY;

	$query = "SELECT cid,category_name,category_image FROM tbl_category WHERE status=1 ORDER BY tbl_category.cid " . $cat_order . " LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "cat_songs") {
	$post_order_by = API_CAT_POST_ORDER_BY;
	$cat_id = $get_method['cat_id'];

	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			WHERE FIND_IN_SET('$cat_id', tbl_mp3.cat_id) AND tbl_category.`status`='1' AND tbl_mp3.`status`='1'";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));


	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 
			WHERE FIND_IN_SET('$cat_id', tbl_mp3.cat_id) AND tbl_category.`status`='1' AND tbl_mp3.`status`='1' ORDER BY tbl_mp3.`id` LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query) or die(mysqli_error());

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "recent_artist_list") {
	$jsonObj = array();
	$query = "SELECT id,artist_name,artist_image FROM tbl_artist Where tbl_artist.a_status=1 ORDER BY tbl_artist.`id` DESC LIMIT 10";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['id'] = $data['id'];
		$row['artist_name'] = $data['artist_name'];
		$row['artist_image'] = $file_path . 'images/' . $data['artist_image'];
		$row['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data['artist_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "geners_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_geners Where tbl_geners.g_status = 1 ORDER BY tbl_geners.`id`";

	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));
	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT id,geners_name FROM tbl_geners Where tbl_geners.g_status = 1 ORDER BY tbl_geners.`id` LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['geners_name'] = $data['geners_name'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "artist_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_artist Where tbl_artist.a_status=1 ORDER BY tbl_artist.`id`";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT id,artist_name,artist_image FROM tbl_artist Where tbl_artist.a_status=1 ORDER BY tbl_artist.`id` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);
	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];

		$row['id'] = $data['id'];
		$row['artist_name'] = $data['artist_name'];
		$row['artist_image'] = $file_path . 'images/' . $data['artist_image'];
		$row['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data['artist_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "artist_album_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_album WHERE status='1' AND FIND_IN_SET(" . $get_method['artist_id'] . ",tbl_album.artist_ids) ORDER BY tbl_album.`aid` DESC";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();
	$query = "SELECT * FROM tbl_album WHERE status='1' AND FIND_IN_SET(" . $get_method['artist_id'] . ",tbl_album.artist_ids) ORDER BY tbl_album.`aid` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['aid'] = $data['aid'];
		$row['artist_ids'] = $data['artist_ids'];
		$row['album_name'] = $data['album_name'];
		$row['album_image'] = $file_path . 'images/' . $data['album_image'];
		$row['album_image_thumb'] = $file_path . 'images/thumbs/' . $data['album_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "geners_playlist_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_playlist WHERE status='1' AND FIND_IN_SET(" . $get_method['geners_id'] . ",tbl_playlist.geners_type) ORDER BY tbl_playlist.`pid` DESC";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_playlist WHERE status='1' AND FIND_IN_SET(" . $get_method['geners_id'] . ",tbl_playlist.geners_type) ORDER BY tbl_playlist.`pid` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['pid'] = $data['pid'];
		$row['geners_type'] = $data['geners_type'];
		$row['playlist_name'] = $data['playlist_name'];
		$row['playlist_image'] = $file_path . 'images/' . $data['playlist_image'];
		$row['playlist_image_thumb'] = $file_path . 'images/thumbs/' . $data['playlist_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "artist_name_songs") {
	$post_order_by = API_CAT_POST_ORDER_BY;
	$artist_name = $get_method['artist_name'];

	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
 			WHERE FIND_IN_SET('" . $artist_name . "',tbl_mp3.`mp3_artist`) AND tbl_category.`status`='1' AND tbl_mp3.`status`='1'";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
 			WHERE FIND_IN_SET('" . $artist_name . "',tbl_mp3.`mp3_artist`) AND tbl_category.`status`='1' AND tbl_mp3.`status`='1' ORDER BY tbl_mp3.`id` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "album_list") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_album WHERE `status`='1' ORDER BY tbl_album.`aid` DESC";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_album WHERE `status`='1' ORDER BY tbl_album.`aid` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['aid'] = $data['aid'];
		$row['album_name'] = $data['album_name'];
		$row['album_image'] = $file_path . 'images/' . $data['album_image'];
		$row['album_image_thumb'] = $file_path . 'images/thumbs/' . $data['album_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "album_songs") {
	$post_order_by = API_CAT_POST_ORDER_BY;
	$album_id = $get_method['album_id'];

	$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
			LEFT JOIN tbl_category ON  FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
			LEFT JOIN tbl_album ON tbl_mp3.`album_id`= tbl_album.`aid` 
			WHERE tbl_mp3.`album_id`='$album_id' AND tbl_category.`status`='1' AND tbl_album.`status`='1' AND tbl_mp3.`status`='1'";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
			LEFT JOIN tbl_album ON tbl_mp3.`album_id`= tbl_album.`aid` 
			WHERE tbl_mp3.`album_id`='$album_id' AND tbl_category.`status`='1' AND tbl_album.`status`='1' AND tbl_mp3.`status`='1' ORDER BY tbl_mp3.`id` LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['id'] = $data['id'];
		$row['cat_id'] = $data['cat_id'];
		$row['album_id'] = $data['album_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];
		$row['aid'] = $data['aid'];
		$row['album_name'] = $data['album_name'];
		$row['album_image'] = $file_path . 'images/' . $data['album_image'];
		$row['album_image_thumb'] = $file_path . 'images/thumbs/' . $data['album_image'];

		array_push($jsonObj, $row);
	}
	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "playlist") {
	$query_rec = "SELECT COUNT(*) as num FROM tbl_playlist WHERE status='1' ORDER BY tbl_playlist.`pid` DESC";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	$page_limit = 10;
	$limit = ($get_method['page'] - 1) * $page_limit;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_playlist WHERE status='1' ORDER BY tbl_playlist.`pid` DESC LIMIT $limit, $page_limit";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['total_records'] = $total_pages['num'];
		$row['pid'] = $data['pid'];
		$row['playlist_name'] = $data['playlist_name'];
		$row['playlist_image'] = $file_path . 'images/' . $data['playlist_image'];
		$row['playlist_image_thumb'] = $file_path . 'images/thumbs/' . $data['playlist_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "playlist_songs") {
	$post_order_by = API_CAT_POST_ORDER_BY;
	$playlist_id = $get_method['playlist_id'];
	$jsonObj = array();

	$query = "SELECT * FROM tbl_playlist
  		where tbl_playlist.`status`='1' AND pid='" . $playlist_id . "'";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['pid'] = $data['pid'];
		$row['playlist_name'] = $data['playlist_name'];
		$row['playlist_image'] = $file_path . 'images/' . $data['playlist_image'];
		$row['playlist_image_thumb'] = $file_path . 'images/thumbs/' . $data['playlist_image'];

		$songs_list = explode(",", $data['playlist_songs']);

		$total_records = count($songs_list);

		foreach ($songs_list as $song_id) {
			$page_limit = 10;

			$limit = ($get_method['page'] - 1) * $page_limit;

			$query1 = "SELECT * FROM tbl_mp3
					LEFT JOIN tbl_category ON tbl_mp3.`cat_id`= tbl_category.`cid` 
					WHERE tbl_mp3.`id`='$song_id' AND tbl_category.`status`='1' AND tbl_mp3.`status`='1' LIMIT $limit, $page_limit";

			$sql1 = mysqli_query($mysqli, $query1);

			while ($data1 = mysqli_fetch_assoc($sql1)) {
				$row1['total_records'] = "$total_records";

				$row1['id'] = $data1['id'];
				$row1['cat_id'] = $data1['cat_id'];
				$row1['mp3_type'] = $data1['mp3_type'];
				$row1['mp3_title'] = $data1['mp3_title'];
				$row1['mp3_url'] = $file_path."uploads/".$data1['mp3_url'];


				$row1['mp3_thumbnail_b'] = $file_path . 'images/' . $data1['mp3_thumbnail'];
				$row1['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data1['mp3_thumbnail'];
				$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		        $row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];

				$row1['mp3_duration'] = $data1['mp3_duration'];
				$row1['mp3_artist'] = $data1['mp3_artist'];
				$row1['mp3_description'] = $data1['mp3_description'];
				$row1['total_rate'] = $data1['total_rate'];
				$row1['rate_avg'] = $data1['rate_avg'];
				$row1['total_views'] = $data1['total_views'];
				$row1['total_download'] = $data1['total_download'];

				$row1['cid'] = $data1['cid'];
				$row1['category_name'] = $data1['category_name'];
				$row1['category_image'] = $file_path . 'images/' . $data1['category_image'];
				$row1['category_image_thumb'] = $file_path . 'images/thumbs/' . $data1['category_image'];


				$row['songs_list'][] = $row1;
			}
		}

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "single_song") {
	$user_id = isset($get_method['user_id']) ? $get_method['user_id'] : 0;
	$device_id = isset($get_method['device_id']) ? $get_method['device_id'] : 0;
	$jsonObj = array();

	$query = "SELECT * FROM tbl_mp3
			LEFT JOIN tbl_category ON tbl_category.cid = tbl_mp3.cat_id
			WHERE tbl_mp3.`id`='" . $get_method['song_id'] . "' AND tbl_category.`status`='1' AND tbl_mp3.status='1'";
			

			
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['id'] = $data['id'];
		$row['is_favorite'] = is_favorite($data['id'], $user_id);
		$row['cat_id'] = $data['cat_id'];
		$row['mp3_type'] = $data['mp3_type'];
		$row['mp3_title'] = $data['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data['mp3_duration'];
		$row['mp3_artist'] = $data['mp3_artist'];
		$row['mp3_description'] = $data['mp3_description'];
		$row['mp3_lyrics'] = $data['mp3_lyrics'];
		$row['lyrics'] = 'https://vocsyinfotech.website/envanto/admin_panel/onlinemusicplayer/uploads/lyrics.srt';
		$row['total_rate'] = $data['total_rate'];
		$row['rate_avg'] = $data['rate_avg'];
		$row['total_views'] = $data['total_views'];
		$row['total_download'] = $data['total_download'];
		$row['cid'] = $data['cid'];
		$row['category_name'] = $data['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data['category_image'];
		$cat_id = trim($data['cat_id']);
		$id = $data['id'];
		$query01 = "SELECT * FROM tbl_mp3 LEFT JOIN tbl_category ON tbl_mp3.`cat_id`= tbl_category.`cid` WHERE tbl_mp3.`cat_id` IN ($cat_id) AND tbl_mp3.`id` != $id LIMIT 10";
		$sql01 = mysqli_query($mysqli, $query01);

		if (mysqli_num_rows($sql01) > 0) {
			while ($data0123 = mysqli_fetch_assoc($sql01)) {
				$row0123['id'] = $data0123['id'];
				$row0123['is_favorite'] = is_favorite($data0123['id'], $user_id);
				$row0123['cat_id'] = $data0123['cat_id'];
				$row0123['mp3_type'] = $data0123['mp3_type'];
				$row0123['mp3_title'] = $data0123['mp3_title'];
				$row0123['mp3_url'] = $file_path."uploads/".$data0123['mp3_url'];
				$row0123['mp3_thumbnail_b'] = $file_path . 'images/' . $data0123['mp3_thumbnail'];
				$row0123['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data0123['mp3_thumbnail'];
				$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		        $row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
				$row0123['mp3_duration'] = $data0123['mp3_duration'];
				$row0123['mp3_artist'] = $data0123['mp3_artist'];
				$row0123['mp3_description'] = $data0123['mp3_description'];
				$row0123['mp3_lyrics'] = $data0123['mp3_lyrics'];
				$row0123['lyrics'] = 'https://vocsyinfotech.website/envanto/admin_panel/onlinemusicplayer/uploads/lyrics.srt';
				$row0123['total_rate'] = $data0123['total_rate'];
				$row0123['rate_avg'] = $data0123['rate_avg'];
				$row0123['total_views'] = $data0123['total_views'];
				$row0123['total_download'] = $data0123['total_download'];
				$row0123['cid'] = $data0123['cid'];
				$row0123['category_name'] = $data0123['category_name'];
				$row0123['category_image'] = $file_path . 'images/' . $data0123['category_image'];
				$row0123['category_image_thumb'] = $file_path . 'images/thumbs/' . $data0123['category_image'];

				$row['related_songs'][] = $row0123;
			}
		} else {
			$row['related_songs'] = array();
		}
		
	    if ($device_id) {
            $query1 = mysqli_query($mysqli, "SELECT * FROM tbl_rating WHERE post_id = '" . $get_method['song_id'] . "' && ip = '" . $device_id . "'");
            
            $data1 = mysqli_fetch_assoc($query1);
            if ($data1 !== null) {
                $row['user_rate'] = $data1['rate'];
            } else {
                $row['user_rate'] = 0;
            }
        }

		array_push($jsonObj, $row);
		unset($row['related_songs']);
	}

	$view_qry = mysqli_query($mysqli, "UPDATE tbl_mp3 SET total_views = total_views + 1 WHERE id = '" . $get_method['song_id'] . "'");

	$mp3_id = $get_method['song_id'];
	$date = date('Y-m-d');

	$start = (date('D') != 'Mon') ? date('Y-m-d', strtotime('last Monday')) : date('Y-m-d');
	$finish = (date('D') != 'Sat') ? date('Y-m-d', strtotime('next Saturday')) : date('Y-m-d');


	$query = "SELECT * FROM tbl_mp3_views WHERE mp3_id='$mp3_id' and date BETWEEN '$start' AND '$finish'";
	$sql = mysqli_query($mysqli, $query);


	if (mysqli_num_rows($sql) > 0) {

		$query1 = "UPDATE tbl_mp3_views SET views=views+1 WHERE mp3_id='$mp3_id' and date BETWEEN '$start' AND '$finish'";
		$sql1 = mysqli_query($mysqli, $query1);
	} else {

		$data = array(
			'mp3_id'  =>  $mp3_id,
			'views'  =>  1,
			'date'  =>  $date
		);

		$qry = Insert('tbl_mp3_views', $data);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "song_download") {
	$jsonObj = array();
	$view_qry = mysqli_query($mysqli, "UPDATE tbl_mp3 SET total_download = total_download + 1 WHERE id = '" . $get_method['song_id'] . "'");

	$total_dw_sql = "SELECT * FROM tbl_mp3 WHERE id='" . $get_method['song_id'] . "'";
	$total_dw_res = mysqli_query($mysqli, $total_dw_sql);
	$total_dw_row = mysqli_fetch_assoc($total_dw_res);
	$jsonObj = array('total_download' => $total_dw_row['total_download']);

	$set['ONLINE_MP3'][] = $jsonObj;
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "song_search") {
	if ($get_method['search_type'] == "songs") {
		$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
					LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
					WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3.`mp3_title` like '%" . addslashes($get_method['search_text']) . "%' 
				    ORDER BY tbl_mp3.mp3_title";

		$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

		$page_limit = 10;

		$limit = ($get_method['page'] - 1) * $page_limit;

		$jsonObj0 = array();

		$query0 = "SELECT * FROM tbl_mp3
					LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
					WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3.`mp3_title` like '%" . addslashes($get_method['search_text']) . "%' 
				ORDER BY tbl_mp3.mp3_title LIMIT $limit, $page_limit";

		$sql0 = mysqli_query($mysqli, $query0) or die(mysqli_error());

		while ($data0 = mysqli_fetch_assoc($sql0)) {
			$row0['total_data'] = $total_pages['num'];
			$row0['id'] = $data0['id'];
			$row0['cat_id'] = $data0['cat_id'];
			$row0['mp3_type'] = $data0['mp3_type'];
			$row0['mp3_title'] = $data0['mp3_title'];
			$row0['mp3_url'] = $file_path."uploads/".$data0['mp3_url'];
			$row0['mp3_thumbnail_b'] = $file_path . 'images/' . $data0['mp3_thumbnail'];
			$row0['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data0['mp3_thumbnail'];
			$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		    $row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
			$row0['mp3_duration'] = $data0['mp3_duration'];
			$row0['mp3_artist'] = $data0['mp3_artist'];
			$row0['mp3_description'] = $data0['mp3_description'];
			$row0['total_rate'] = $data0['total_rate'];
			$row0['rate_avg'] = $data0['rate_avg'];
			$row0['total_views'] = $data0['total_views'];
			$row0['total_download'] = $data0['total_download'];
			$row0['cid'] = $data0['cid'];
			$row0['category_name'] = $data0['category_name'];
			$row0['category_image'] = $file_path . 'images/' . $data0['category_image'];
			$row0['category_image_thumb'] = $file_path . 'images/thumbs/' . $data0['category_image'];

          
          
          
			array_push($jsonObj0, $row0);
		}
      
      
      	if ($get_method['search_text']) {
			$postdata = [
				'search'   => $get_method['search_text'],
			];

			$url =   'http://103.193.179.98:3005/search';
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt($ch, CURLOPT_HTTPHEADER,  ['Content-Type:  application/json']);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postdata));
			$chresult = curl_exec($ch);
			$result =  json_decode($chresult, true);

			$no_img =  "https://$_SERVER[HTTP_HOST]/images/no-img.jpeg";
			foreach ($result as $key => $value) {


				if (isset($value['mp3_url'])) {
					$row0['total_data'] = "1";
					$row0['id'] = "-1";
					$row0['cat_id'] = "-1";
					$row0['mp3_type'] = "online";
					$row0['mp3_title'] = isset($value['title']) ? $value['title'] : '';
					$row0['mp3_url'] =  $value['mp3_url'];
					$row0['mp3_thumbnail_b'] = isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;
					$row0['mp3_thumbnail_s'] = isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;
					$row0['mp3_cover'] =  isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;
					$row0['mp3_cover_thumb'] = isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;
					$row0['mp3_duration'] = gmdate("i:s",  $value['duration']); //  "05:01"; // $value['duration'];
					$row0['mp3_artist'] = "_";
					$row0['mp3_description'] = ""; // $value['description'] == null ? "" : $value['description'];
					$row0['total_rate'] = "0";
					$row0['rate_avg'] = "0";
					$row0['total_views'] = "0";
					$row0['total_download'] = "0";
					$row0['cid'] = "7"; // $data0['cid'];
					$row0['category_name'] = isset($value['genre']) ? $value['genre'] : ""; //$value['genre'] == null ? "" : $value['genre'];
					$row0['category_image'] =  isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;
					$row0['category_image_thumb'] =  isset($value['thumbnail']) ? $value['thumbnail'] : $no_img;

					array_push($jsonObj0, $row0);
				}
			}
		}

		$set['ONLINE_MP3'] = $jsonObj0;
	} else if ($get_method['search_type'] == "artist") {
		$query_rec = "SELECT COUNT(*) as num FROM tbl_artist
					WHERE tbl_artist.a_status=1 AND tbl_artist.`artist_name` like '%" . addslashes($get_method['search_text']) . "%' 
				 ORDER BY tbl_artist.artist_name";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

		$page_limit = 10;

		$limit = ($get_method['page'] - 1) * $page_limit;

		$jsonObj2 = array();

		$query2 = "SELECT * FROM tbl_artist
					WHERE tbl_artist.a_status=1 AND tbl_artist.`artist_name` like '%" . addslashes($get_method['search_text']) . "%' 
				ORDER BY tbl_artist.artist_name LIMIT $limit, $page_limit";

		$sql2 = mysqli_query($mysqli, $query2) or die(mysqli_error());

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			$row2['total_data'] = $total_pages['num'];
			$row2['id'] = $data2['id'];
			$row2['artist_name'] = $data2['artist_name'];
			$row2['artist_image'] = $file_path . 'images/' . $data2['artist_image'];
			$row2['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data2['artist_image'];

			array_push($jsonObj2, $row2);
		}

		$set['ONLINE_MP3'] = $jsonObj2;
	} else if ($get_method['search_type'] == "album") {
		$query_rec = "SELECT COUNT(*) as num FROM tbl_album
					WHERE tbl_album.`album_name` AND tbl_album.`status`='1' like '%" . addslashes($get_method['search_text']) . "%' 
				    ORDER BY tbl_album.album_name";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

		$page_limit = 10;

		$limit = ($get_method['page'] - 1) * $page_limit;

		$jsonObj1 = array();

		$query1 = "SELECT * FROM tbl_album
					WHERE tbl_album.`album_name`  like '%" . addslashes($get_method['search_text']) . "%' AND tbl_album.`status`='1'
					ORDER BY tbl_album.album_name LIMIT $limit, $page_limit";

		$sql1 = mysqli_query($mysqli, $query1) or die(mysqli_error());

		while ($data1 = mysqli_fetch_assoc($sql1)) {
			$row1['total_data'] = $total_pages['num'];
			$row1['aid'] = $data1['aid'];
			$row1['artist_ids'] = $data1['artist_ids'] ? $data1['artist_ids'] : '';
			$row1['album_name'] = $data1['album_name'];
			$row1['album_image'] = $file_path . 'images/' . $data1['album_image'];
			$row1['album_image_thumb'] = $file_path . 'images/thumbs/' . $data1['album_image'];

			array_push($jsonObj1, $row1);
		}

		$set['ONLINE_MP3'] = $jsonObj1;
	} else {
		$query_rec = "SELECT COUNT(*) as num FROM tbl_mp3
					LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
					WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3.`mp3_title` like '%" . addslashes($get_method['search_text']) . "%' 
					ORDER BY tbl_mp3.mp3_title";
		$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

		$page_limit = 10;
		$limit = ($get_method['page'] - 1) * $page_limit;
		$jsonObj0 = array();

		$query0 = "SELECT * FROM tbl_mp3
					LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.cid, tbl_mp3.cat_id) > 0
					WHERE tbl_mp3.`status`='1' AND tbl_category.`status`='1' AND tbl_mp3.`mp3_title` like '%" . addslashes($get_method['search_text']) . "%' 
				    ORDER BY tbl_mp3.mp3_title LIMIT $limit, $page_limit";
		$sql0 = mysqli_query($mysqli, $query0) or die(mysqli_error());

		while ($data0 = mysqli_fetch_assoc($sql0)) {
			$row0['total_data'] = $total_pages['num'];
			$row0['id'] = $data0['id'];
			$row0['cat_id'] = $data0['cat_id'];
			$row0['mp3_type'] = $data0['mp3_type'];
			$row0['mp3_title'] = $data0['mp3_title'];
			$row0['mp3_url'] = $file_path."uploads/".$data0['mp3_url'];
			$row0['mp3_thumbnail_b'] = $file_path . 'images/' . $data0['mp3_thumbnail'];
			$row0['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data0['mp3_thumbnail'];
			$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		    $row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
			$row0['mp3_duration'] = $data0['mp3_duration'];
			$row0['mp3_artist'] = $data0['mp3_artist'];
			$row0['mp3_description'] = $data0['mp3_description'];
			$row0['total_rate'] = $data0['total_rate'];
			$row0['rate_avg'] = $data0['rate_avg'];
			$row0['total_views'] = $data0['total_views'];
			$row0['total_download'] = $data0['total_download'];
			$row0['cid'] = $data0['cid'];
			$row0['category_name'] = $data0['category_name'];
			$row0['category_image'] = $file_path . 'images/' . $data0['category_image'];
			$row0['category_image_thumb'] = $file_path . 'images/thumbs/' . $data0['category_image'];

			array_push($jsonObj0, $row0);
		}

		$row['search_songs'] = $jsonObj0;
		$jsonObj1 = array();

		$query1 = "SELECT * FROM tbl_album
					WHERE tbl_album.`status`='1' AND tbl_album.`album_name` like '%" . addslashes($get_method['search_text']) . "%' 
				ORDER BY tbl_album.album_name LIMIT 20";
		$sql1 = mysqli_query($mysqli, $query1) or die(mysqli_error());

		while ($data1 = mysqli_fetch_assoc($sql1)) {
			$row1['aid'] = $data1['aid'];
			$row1['artist_ids'] = $data1['artist_ids'] ? $data1['artist_ids'] : '';
			$row1['album_name'] = $data1['album_name'];
			$row1['album_image'] = $file_path . 'images/' . $data1['album_image'];
			$row1['album_image_thumb'] = $file_path . 'images/thumbs/' . $data1['album_image'];

			array_push($jsonObj1, $row1);
		}
		$row['search_album'] = $jsonObj1;
		$jsonObj2 = array();
		$query2 = "SELECT * FROM tbl_artist
					WHERE tbl_artist.a_status=1 AND tbl_artist.artist_name like '%" . addslashes($get_method['search_text']) . "%' 
					ORDER BY tbl_artist.artist_name LIMIT 20";

		$sql2 = mysqli_query($mysqli, $query2) or die(mysqli_error());
		while ($data2 = mysqli_fetch_assoc($sql2)) {
			$row2['id'] = $data2['id'];
			$row2['artist_name'] = $data2['artist_name'];
			$row2['artist_image'] = $file_path . 'images/' . $data2['artist_image'];
			$row2['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data2['artist_image'];

			array_push($jsonObj2, $row2);
		}

		$row['search_artist'] = $jsonObj2;

		$set['ONLINE_MP3'] = $row;
	}


	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "song_rating") {
	$ip = $get_method['device_id'];
	$post_id = $get_method['post_id'];
	$therate = $get_method['rate'];

	$query_rec = "SELECT COUNT(*) as num FROM tbl_rating where post_id  = '$post_id' && ip = '$ip'";
	$total_pages = mysqli_fetch_array(mysqli_query($mysqli, $query_rec));

	if ($total_pages['num'] == 0) {
		$data = array(
			'post_id'  => $post_id,
			'rate'  =>  $therate,
			'ip'  => $ip,
		);
		$qry = Insert('tbl_rating', $data);
		$query = mysqli_query($mysqli, "select * from tbl_rating where post_id  = '$post_id' ");

		while ($data = mysqli_fetch_assoc($query)) {
			$rate_db[] = $data;
			$sum_rates[] = $data['rate'];
		}

		if (@count($rate_db)) {
			$rate_times = count($rate_db);
			$sum_rates = array_sum($sum_rates);
			$rate_value = $sum_rates / $rate_times;
			$rate_bg = (($rate_value) / 5) * 100;
		} else {
			$rate_times = 0;
			$rate_value = 0;
			$rate_bg = 0;
		}

		$rate_avg = round($rate_value);

		$sql = "update tbl_mp3 set total_rate=total_rate + 1,rate_avg='$rate_avg' where id='" . $post_id . "'";

		mysqli_query($mysqli, $sql);

		$total_rat_sql = "SELECT * FROM tbl_mp3 WHERE id='" . $post_id . "'";
		$total_rat_res = mysqli_query($mysqli, $total_rat_sql);
		$total_rat_row = mysqli_fetch_assoc($total_rat_res);

		$set['ONLINE_MP3'][] = array('total_rate' => $total_rat_row['total_rate'], 'rate_avg' => $total_rat_row['rate_avg'], 'msg' => $app_lang['rate_success'], 'success' => '1');
	} else {

		$set['ONLINE_MP3'][] = array('msg' => $app_lang['rate_already'], 'success' => '0');
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "song_report") {
	$report = $get_method['report'];

	$qry1 = "INSERT INTO tbl_reports (`user_id`,`song_id`,`report`) VALUES ('" . $get_method['user_id'] . "','" . $get_method['song_id'] . "','" . $report . "')";
	$result1 = mysqli_query($mysqli, $qry1);

	$set['ONLINE_MP3'][] = array('msg' => $app_lang['report_success'], 'success' => '1');

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "song_suggest") {
	$user_id = $get_method['user_id'];
	$song_title = $get_method['song_title'];
	$message = $get_method['message'];

	if ($_FILES['song_image']['name'] != "") {
		$song_image = rand(0, 99999) . "_" . $_FILES['song_image']['name'];
		$tpath1 = 'images/suggest/' . $song_image;
		$pic1 = compress_image($_FILES["song_image"]["tmp_name"], $tpath1, 80);

		$tpath1 = 'images/' . $song_image;
		$pic1 = compress_image($_FILES["song_image"]["tmp_name"], $tpath1, 80);

		$thumbpath = 'images/thumbs/' . $song_image;
		$thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');

		$qry1 = "INSERT INTO tbl_song_suggest (`user_id`,`song_title`,`song_image`,`message`) VALUES ('" . $user_id . "','" . $song_title . "','" . $song_image . "','" . $message . "')";
		$result1 = mysqli_query($mysqli, $qry1);


		$set['ONLINE_MP3'][] = array('msg' => $app_lang['suggest_success'], 'success' => '1');
	} else {
		$qry1 = "INSERT INTO tbl_song_suggest (`user_id`,`song_title`,`message`) VALUES ('" . $user_id . "','" . $song_title . "','" . $message . "')";
		$result1 = mysqli_query($mysqli, $qry1);

		$set['ONLINE_MP3'][] = array('msg' => $app_lang['suggest_success'], 'success' => '1');
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "user_register") {
	$user_type = trim($get_method['type']);
	$device_id = trim($get_method['device_id']);
	$email = addslashes(trim($get_method['email']));
	$auth_id = addslashes(trim($get_method['auth_id']));
	$registration_on = strtotime(date('d-m-Y h:i A'));
	$user_code = createRandomCode();

	if ($user_type == 'Google' || $user_type == 'google') {
		$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
		$res = mysqli_query($mysqli, $sql);
		$num_rows = mysqli_num_rows($res);
		$row = mysqli_fetch_assoc($res);

		if ($num_rows == 0) {
			$dataUser = array(
				'user_type' => 'Google',
				'device_id' => 0,
				'user_code'  => $user_code,
				'name'  =>  addslashes(trim($get_method['name'])),
				'email'  =>  trim($get_method['email']),
				'phone'  =>  addslashes(trim($get_method['phone'])),
				'user_image'  =>  addslashes(trim($get_method['user_image'])),
				'is_duplicate'  => 0,// $is_duplicate,
				'registration_on' => strtotime(date('d-m-Y h:i A')),
				'auth_id'  =>  $auth_id,
				'status'  =>  '1',
			);

			$register_user = Insert('tbl_users', $dataUser);
			$user_id = mysqli_insert_id($mysqli);
			$set['ONLINE_MP3'][] = array('user_id' => strval($user_id), 'name' => $get_method['name'], 'user_image' => $get_method['user_image'], 'email' => $get_method['email'], 'success' => '1', 'msg' => 'register successfully', 'auth_id' => $auth_id);
		} else {
			$sql_device = "SELECT * FROM tbl_users WHERE  `id` <> '" . $row['id'] . "'";
			$res_device = mysqli_query($mysqli, $sql_device);

			$data = array(
				'auth_id'  =>  $auth_id,
			);

			$update = Update('tbl_users', $data, "WHERE id = '" . $row['id'] . "'");

			$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
			$res = mysqli_query($mysqli, $sql);
			$num_rows = mysqli_num_rows($res);

			if ($row['user_type'] == "Google" || $row['user_type'] == "google") {
				$msg = "User already register google";
			} else if ($row['user_type'] == "Facebook" || $row['user_type'] == "facebook") {
				$msg = "User already register facebook";
			} else if ($row['user_type'] == "Apple" || $row['user_type'] == "apple") {
				$msg = "User already register apple";
			} else if ($row['user_type'] == "Normal" || $row['user_type'] == "normal") {
				$msg = "User already register";
			}

			if ($num_rows == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $msg, 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['status'] == 2) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['account_deactive'], 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['status'] == 0) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['account_blocked'], 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['is_deleted'] == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['user_deleted'], 'auth_id' => $auth_id, 'success' => '0');
			} else {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'success' => '1', 'msg' => 'login successfully', 'auth_id' => $auth_id);
			}
		}
	} else if ($user_type == 'Facebook' || $user_type == 'facebook') {
		$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
		$res = mysqli_query($mysqli, $sql);
		$num_rows = mysqli_num_rows($res);
		$row = mysqli_fetch_assoc($res);

		if ($num_rows == 0) {
			$user_code = createRandomCode();
			$dataUser = array(
				'user_type' => 'Facebook',
				'device_id' => '0',
				'user_code'  => $user_code,
				'name'  =>  addslashes(trim($get_method['name'])),
				'email'  =>  trim($get_method['email']),
				'phone'  =>  addslashes(trim($get_method['phone'])),
				'user_image'  =>  addslashes(trim($get_method['user_image'])),
				'is_duplicate'  => 0,// $is_duplicate,
				'registration_on' => strtotime(date('d-m-Y h:i A')),
				'auth_id'  =>  $auth_id,
				'status'  =>  '1',
			);

			$register_user = Insert('tbl_users', $dataUser);
			$user_id = mysqli_insert_id($mysqli);
			$set['ONLINE_MP3'][] = array('user_id' => strval($user_id), 'name' => $get_method['name'], 'user_image' => $get_method['user_image'], 'email' => $get_method['email'], 'success' => '1', 'msg' => 'register successfully', 'auth_id' => $auth_id);
		} else {
			$is_duplicate = '';
			$sql_device = "SELECT * FROM tbl_users WHERE `id` <> '" . $row['id'] . "'";
			$res_device = mysqli_query($mysqli, $sql_device);

			$data = array(
				'auth_id'  =>  $auth_id,
			);
			$update = Update('tbl_users', $data, "WHERE id = '" . $row['id'] . "'");

			$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
			$res = mysqli_query($mysqli, $sql);
			$num_rows = mysqli_num_rows($res);

			if ($row['user_type'] == "Google" || $row['user_type'] == "google") {
				$msg = "User already register google";
			} else if ($row['user_type'] == "Facebook" || $row['user_type'] == "facebook") {
				$msg = "User already register facebook";
			} else if ($row['user_type'] == "Apple" || $row['user_type'] == "apple") {
				$msg = "User already register apple";
			} else if ($row['user_type'] == "Normal" || $row['user_type'] == "normal") {
				$msg = "User already register normal";
			}
			if ($num_rows == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $msg, 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['status'] == 2) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['account_deactive'], 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['status'] == 0) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['account_blocked'], 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['is_deleted'] == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['user_deleted'], 'auth_id' => $auth_id, 'success' => '0');
			} else {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'user_image' => $row['user_image'], 'name' => $row['name'], 'email' => $row['email'], 'success' => '1', 'msg' => 'login successfully', 'auth_id' => $auth_id);
			}
		}
	} else if ($user_type == 'Apple' || $user_type == 'apple') {
		$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
		$res = mysqli_query($mysqli, $sql);
		$num_rows = mysqli_num_rows($res);
		$row = mysqli_fetch_assoc($res);

		if ($num_rows == 0) {
			$user_code = createRandomCode();
			$data = array(
				'user_type' => 'Apple',
				'device_id' => '0',
				'user_code'  => $user_code,
				'name'  => addslashes(trim($get_method['name'])),
				'user_image'  => addslashes(trim($get_method['user_image'])),
				'email'  =>  addslashes(trim($get_method['email'])),
				'phone'  =>  addslashes(trim($get_method['phone'])),
				'auth_id'  =>  addslashes(trim($get_method['auth_id'])),
				'status'  =>  '1'
			);

			$qry = Insert('tbl_users', $data);
			$user_id = mysqli_insert_id($mysqli);
			$set['ONLINE_MP3'][] = array('user_id' => strval($user_id), 'name' => $get_method['name'], 'user_image' => $get_method['user_image'], 'email' => $get_method['email'], 'success' => '1', 'msg' => 'register successfully', 'auth_id' => $auth_id);
		} else {
			$nameee = $get_method['name'];
			$email = addslashes(trim($get_method['email']));
			if (empty($nameee) && empty($email)) {
				$data = array(
					'auth_id'  =>  $auth_id
				);
			} else if (empty($nameee)) {
				$data = array(
					'auth_id'  =>  $auth_id,
					'email' => $email
				);
			} elseif (empty($email)) {
				$data = array(
					'auth_id'  =>  $auth_id,
					'name' => $nameee
				);
			} else {
				$data = array(
					'auth_id'  =>  $auth_id,
					'name' => $nameee,
					'email' => $email
				);
			}
			$update = Update('tbl_users', $data, "WHERE id = '" . $row['id'] . "'");
			$user_id = $row['id'];

			$sql = "SELECT * FROM tbl_users WHERE (`email` = '$email')";
			$res = mysqli_query($mysqli, $sql);
			$num_rows = mysqli_num_rows($res);

			if ($row['user_type'] == "Google" || $row['user_type'] == "google") {
				$msg = "User already register google";
			} else if ($row['user_type'] == "Facebook" || $row['user_type'] == "facebook") {
				$msg = "User already register facebook";
			} else if ($row['user_type'] == "Apple" || $row['user_type'] == "apple") {
				$msg = "Login successfully";
			} else if ($row['user_type'] == "Normal" || $row['user_type'] == "normal") {
				$msg = "User already register normal";
			}
			if ($num_rows == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $msg, 'auth_id' => $auth_id, 'success' => '1');
			} else if ($row['status'] == 0) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['account_deactive'], 'auth_id' => $auth_id, 'success' => '0');
			} else if ($row['is_deleted'] == 1) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => $app_lang['user_deleted'], 'auth_id' => $auth_id, 'success' => '0');
			} else {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'user_image' => $row['user_image'], 'email' => $row['email'], 'msg' => 'login successfully', 'auth_id' => $auth_id, 'success' => '1');
			}
		}
	} else if ($user_type == 'Normal' || $user_type == 'normal') {

		$qry = "SELECT * FROM tbl_users WHERE `email` = '$email'";
		$result = mysqli_query($mysqli, $qry);
		$row = mysqli_fetch_assoc($result);
		$qry = "SELECT * FROM tbl_users WHERE `email` = '$email'";
		$result = mysqli_query($mysqli, $qry);
		$row_count = mysqli_num_rows($result);

		if ($row_count > 0) {
			$set['ONLINE_MP3'][] = array('msg' => $app_lang['email_exist'], 'success' => '0');
		} else {
			$user_code = createRandomCode();
			$is_duplicate = 0;

			$sql_device = "SELECT * FROM tbl_users WHERE  `email` = '$email'";
			$res_device = mysqli_query($mysqli, $sql_device);
			if (isset($_FILES['user_image']['name']) && !empty($_FILES['user_image']['name'])) {
				$user_image = rand(0, 99999) . "_" . $_FILES['user_image']['name'];
				$tpath1 = 'images/' . $user_image;
				$pic1 = compress_image($_FILES["user_image"]["tmp_name"], $tpath1, 80);
				$thumbpath = 'images/thumbs/' . $user_image;
				$thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');
			} else {
				$user_image = '';
			}

			$dataUser = array(
				'user_type' => 'Normal',
				'device_id' => $device_id,
				'user_code'  => $user_code,
				'user_image' => $user_image,
				'name'  =>  addslashes(trim($get_method['name'])),
				'email'  =>  trim($get_method['email']),
				'password'  =>  password_hash($get_method['password'], PASSWORD_ARGON2I),
				'phone'  =>  addslashes(trim($get_method['phone'])),
				'is_duplicate'  =>  $is_duplicate,
				'registration_on' => strtotime(date('d-m-Y h:i A')),
				'status'  =>  '1',
			);

			$register_user = Insert('tbl_users', $dataUser);

			$user_id = mysqli_insert_id($mysqli);

			$set['ONLINE_MP3'][] = array('user_id' => strval($user_id), 'name' => $get_method['name'], 'user_image' => $get_method['user_image'], 'email' => $get_method['email'], 'success' => '1', 'msg' => $app_lang['register_success'], 'auth_id' => '');
		}
	}
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "user_login") {
	if (!isset($get_method['user_id'])) {
		$email = htmlentities(trim($get_method['email']));
		$password = trim($get_method['password']);

		$sql = "SELECT * FROM tbl_users WHERE `email` = '$email' AND (`user_type`='Normal' OR `user_type`='normal') AND `id` <> 0";
		$res = mysqli_query($mysqli, $sql);

		if (mysqli_num_rows($res) > 0) {
			$row = mysqli_fetch_assoc($res);
			$stored_hashed_password = $row['password'];
			$provided_hashed_password = password_hash($password, PASSWORD_ARGON2I);
			if (password_verify($password, $stored_hashed_password)) {
				if ($row['status'] == 0) {
					$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'user_image' => $row['user_image'], 'msg' => $app_lang['account_blocked'], 'auth_id' => '', 'success' => '0');
				} else if ($row['status'] == 2) {
					$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'user_image' => $row['user_image'], 'msg' => $app_lang['account_deactive'], 'auth_id' => '', 'success' => '0');
				} else if ($row['is_deleted'] == 1) {
					$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'user_image' => $row['user_image'], 'msg' => $app_lang['user_deleted'], 'auth_id' => '', 'success' => '0');
				} else {
					$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'user_image' => $row['user_image'], 'msg' => $app_lang['login_success'], 'auth_id' => '', 'success' => '1');
				}
			} else {
				$set['ONLINE_MP3'][] = array('msg' => $app_lang['invalid_password'], 'success' => '0');
			}
		} else {
			$set['ONLINE_MP3'][] = array('msg' => $app_lang['email_not_found'], 'success' => '0');
		}
	} else {
		$user_id = htmlentities(trim($get_method['user_id']));
		$sql = "SELECT * FROM tbl_users WHERE `id` = '$user_id'";
		$res = mysqli_query($mysqli, $sql);

		if (mysqli_num_rows($res) > 0) {
			$row = mysqli_fetch_assoc($res);

			if ($row['status'] == 0) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'auth_id' => '', 'user_image' => $row['user_image'], 'msg' => $app_lang['account_blocked'], 'success' => '0');
			} else if ($row['status'] == 2) {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'auth_id' => '', 'user_image' => $row['user_image'], 'msg' => $app_lang['account_deactive'], 'success' => '0');
			} else {
				$set['ONLINE_MP3'][] = array('user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'auth_id' => '', 'user_image' => $row['user_image'], 'msg' => $app_lang['login_success'], 'success' => '1');
			}
		} else {
			$set['ONLINE_MP3'][] = array('msg' => $app_lang['email_not_found'], 'success' => '0');
		}
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "user_profile") {
	$user_id = $get_method['user_id'];
	$qry = "SELECT * FROM tbl_users WHERE id = '$user_id'";
	$result = mysqli_query($mysqli, $qry);
	$row = mysqli_fetch_assoc($result);

	if (mysqli_num_rows($result) > 0) {
		$user_type = $row['user_type'];
		if ($row['user_image'] != '') {
			if ($user_type == 'Normal' || $user_type == 'normal') {
				$user_image = $file_path . 'images/' . $row['user_image'];
			} else {
				$user_image = $row['user_image'];
			}
		} else {
			$user_image = $file_path . 'images/add-image.png';
		}
		$phone = $row['phone'] ? $row['phone'] : '';

		$set['ONLINE_MP3'][] = array(
			'user_id' => $row['id'], 'name' => $row['name'], 'email' => $row['email'], 'phone' => $phone,
			'user_image' => $user_image, 'success' => '1'
		);
	} else {
		$set['ONLINE_MP3'][] = array('success' => '0');
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "delete_user_account") {
	$id = $get_method['user_id'];
	$email = $get_method['email'];

	$qry = "SELECT * FROM tbl_users WHERE id = '$id'";
	$result = mysqli_query($mysqli, $qry);

	if ($result->num_rows > 0) {

		deleted_user_copy($id, $email);

		Delete('tbl_comments', 'user_id=' . $id);
		Delete('tbl_reports', 'user_id=' . $id);
		Delete('tbl_users_redeem', 'user_id=' . $id);
		Delete('tbl_users_rewards_activity', 'user_id=' . $id);
		Delete('tbl_like', 'device_id=' . $id);

		Delete('tbl_favourite', 'user_id=' . $id);

		Delete('tbl_suspend_account', 'user_id=' . $id . '');

		$sql = "SELECT user_id FROM tbl_follows WHERE follower_id='$id'";
		$res = mysqli_query($mysqli, $sql);

		while ($row = mysqli_fetch_assoc($res)) {

			$updateSql = "UPDATE tbl_users SET total_followers= total_followers - 1  WHERE id = '" . $row['user_id'] . "'";

			$update = mysqli_query($mysqli, $updateSql) or die(mysqli_error($mysqli));
		}

		mysqli_free_result($res);

		$sql = "SELECT follower_id FROM tbl_follows WHERE `user_id`='$id'";
		$res_2 = mysqli_query($mysqli, $sql);

		while ($row_2 = mysqli_fetch_assoc($res_2)) {

			$updateSql = "UPDATE tbl_users SET total_following= total_following - 1  WHERE id = '" . $row_2['follower_id'] . "'";

			$update = mysqli_query($mysqli, $updateSql) or die(mysqli_error($mysqli));
		}


		Delete('tbl_follows', 'user_id=' . $id);
		Delete('tbl_follows', 'follower_id=' . $id);

		mysqli_free_result($res);

		$sql = "SELECT * FROM tbl_video WHERE `user_id`='$id' AND `video_type`='local'";
		$res = mysqli_query($mysqli, $sql);
		while ($row = mysqli_fetch_assoc($res)) {

			if (file_exists('images/' . $row['video_thumbnail'])) {
				unlink('images/' . $row['video_thumbnail']);
			}

			if (file_exists('uploads/' . basename($row['video_url']))) {
				unlink('uploads/' . basename($row['video_url']));
			}
		}

		Delete('tbl_video', 'user_id=' . $id);
		mysqli_free_result($res);

		$sql = "SELECT * FROM tbl_img_status WHERE `user_id`='$id'";
		$res = mysqli_query($mysqli, $sql);
		while ($row = mysqli_fetch_assoc($res)) {
			if (file_exists('images/' . $row['image_file'])) {
				unlink('images/' . $row['image_file']);
			}
		}

		Delete('tbl_img_status', 'user_id=' . $id);

		Delete('tbl_quotes', 'user_id=' . $id);


		$sql = "SELECT * FROM tbl_verify_user WHERE `user_id`='$id'";
		$res = mysqli_query($mysqli, $sql);
		while ($row = mysqli_fetch_assoc($res)) {

			if (file_exists('images/documents/' . $row['document'])) {
				unlink('images/documents/' . $row['document']);
			}
		}

		Delete('tbl_verify_user', 'user_id=' . $id);

		$row_user = mysqli_fetch_assoc($result);

		if (file_exists('images/' . $row_user['user_image'])) {
			unlink('images/' . $row_user['user_image']);
		}

		Delete('tbl_users', 'id=' . $id);

		$set['ONLINE_MP3'][] = array('success' => '1', 'msg' => $app_lang['account_deleted']);
	} else {
		$set['ONLINE_MP3'][] = array('success' => '0', 'msg' => $app_lang['error_msg']);
	}



	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "user_profile_update") {
	$jsonObj = array();
	$user_id = $get_method['user_id'];
	$qry = "SELECT * FROM tbl_users WHERE id = '" . $get_method['user_id'] . "'";
	$result = mysqli_query($mysqli, $qry);
	$row = mysqli_fetch_assoc($result);

	if ($user_id != "") {
		if ($_FILES['user_image']['name'] != "") {
			unlink('images/' . $row['user_image']);
			unlink('images/thumbs/' . $row['user_image']);
			$ext = pathinfo($_FILES['user_image']['name'], PATHINFO_EXTENSION);
			$user_image = rand(0, 99999) . "_userimage." . $ext;
			$tpath1 = 'images/' . $user_image;

			if ($ext != 'png') {
				$pic1 = compress_image($_FILES["user_image"]["tmp_name"], $tpath1, 80);
			} else {
				$tmp = $_FILES['user_image']['tmp_name'];
				move_uploaded_file($tmp, $tpath1);
			}
			$thumbpath = 'images/thumbs/' . $user_image;
			$thumb_pic1 = create_thumb_image($tpath1, $thumbpath, '300', '300');
			$user_image = $user_image;
		} else {
			$user_image = $row['user_image'];
		}

		if ($get_method['name'] != "") {
			$name = $get_method['name'];
		} else {
			$name = $row['name'];
		}
		if ($get_method['email'] != "") {
			$email = $get_method['email'];
		} else {
			$email = $row['email'];
		}
		if ($get_method['phone'] != "") {
			$phone = $get_method['phone'];
		} else {
			$phone = $row['phone'];
		}

		$data = array(
			'name'  =>  $name,
			'user_image'  => $user_image,
			'email'  =>  $email,
			'phone'  =>  $phone
		);

		$user_edit = Update('tbl_users', $data, "WHERE id = '" . $get_method['user_id'] . "'");
		$set['ONLINE_MP3'][] = array('msg' => $app_lang['update_success'], 'success' => '1');

		header('Content-Type: application/json; charset=utf-8');
		echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	} else {
		$set['ONLINE_MP3'][] = array('MSG' => "User Not Found...", 'success' => '1');

		header('Content-Type: application/json; charset=utf-8');
		echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();
	}
} else if ($get_method['method_name'] == "forgot_pass") {
	$email = htmlentities(trim($get_method['user_email']));
	$qry = "SELECT * FROM tbl_users WHERE `email` = '$email' AND `user_type`='Normal'";
	$result = mysqli_query($mysqli, $qry);
	$row = mysqli_fetch_assoc($result);
	
	if ($result->num_rows > 0) {
		$password = generateRandomPassword(7);
		$new_password = password_hash($password, PASSWORD_ARGON2I);
		$to = $row['email'];
		$recipient_name = $row['name'];
		$subject = '[IMPORTANT] ' . APP_NAME . ' Forgot Password Information';

		$message = '<div style="background-color: #f9f9f9;" align="center"><br />
					  <table style="font-family: OpenSans,sans-serif; color: #666666;" border="0" width="600" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFFF">
					    <tbody>
					      <tr>
					        <td colspan="2" bgcolor="#FFFFFF" align="center"><img src="' . $file_path . 'assets/img/' . APP_LOGO . '" alt="header" style="width:100px;height:auto"/></td>
					      </tr>
					      <tr>
					        <td width="600" valign="top" bgcolor="#FFFFFF"><br>
					          <table style="font-family:OpenSans,sans-serif; color: #666666; font-size: 10px; padding: 15px;" border="0" width="100%" cellspacing="0" cellpadding="0" align="left">
					            <tbody>
					              <tr>
					                <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0" style="font-family:OpenSans,sans-serif; color: #666666; font-size: 10px; width:100%;">
					                    <tbody>
					                      <tr>
					                        <td>
					                        	<p style="color: #262626; font-size: 24px; margin-top:0px;"><strong>' . $app_lang['dear_lbl'] . ' ' . $row['name'] . '</strong></p>
					                          <p style="color:#262626; font-size:20px; line-height:32px;font-weight:500;margin-top:5px;"><br>' . $app_lang['your_password_lbl'] . ': <span style="font-weight:400;">' . $password . '</span></p>
					                          <p style="color:#262626; font-size:17px; line-height:32px;font-weight:500;margin-bottom:30px;">' . $app_lang['thank_you_lbl'] . ' ' . APP_NAME . '</p>

					                        </td>
					                      </tr>
					                    </tbody>
					                  </table></td>
					              </tr>
					               
					            </tbody>
					          </table></td>
					      </tr>
					      <tr>
					        <td style="color: #262626; padding: 20px 0; font-size: 18px; border-top:5px solid #52bfd3;" colspan="2" align="center" bgcolor="#ffffff">' . $app_lang['email_copyright'] . ' ' . APP_NAME . '.</td>
					      </tr>
					    </tbody>
					  </table>
					</div>';

		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
		$headers .= 'From: <info@vocsyinfotech.website>' . "\r\n";
		$headers .= 'Cc: info@vocsyinfotech.website' . "\r\n";
		if (mail($to, $subject, $message, $headers)) {
			$sql = "UPDATE tbl_users SET `password`='$new_password' WHERE `id`='" . $row['id'] . "'";
			mysqli_query($mysqli, $sql);

			$set['ONLINE_MP3'][] = array('msg' => $app_lang['password_sent_mail'], 'success' => '1');
		} 
		else 
		{
			$set['ONLINE_MP3'][] = array('msg' => $app_lang['email_not_found'], 'success' => '0');
		}
	} else {
		$set['ONLINE_MP3'][] = array('msg' => $app_lang['email_not_found'], 'success' => '0');
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "app_details") {
	$jsonObj = array();
	$query = "SELECT * FROM tbl_settings WHERE id='1'";
	$sql = mysqli_query($mysqli, $query);

	while ($data = mysqli_fetch_assoc($sql)) {
		$row['package_name'] = $data['package_name'];
		$row['app_name'] = $data['app_name'];
		$row['app_logo'] = $data['app_logo'];
		$row['app_version'] = $data['app_version'];
		$row['app_author'] = $data['app_author'];
		$row['app_contact'] = $data['app_contact'];
		$row['app_email'] = $data['app_email'];
		$row['app_website'] = $data['app_website'];
		$row['app_description'] = stripslashes($data['app_description']);
		$row['app_developed_by'] = $data['app_developed_by'];

		$row['app_privacy_policy'] = stripslashes($data['app_privacy_policy']);

		$row['publisher_id'] = $data['publisher_id'];
		$row['interstital_ad'] = $data['interstital_ad'];
		$row['interstital_ad_id'] = $data['interstital_ad_id'];
		$row['interstital_ad_id_status'] = $data['interstital_ad_id_status'];
		$row['interstital_ad_click'] = $data['interstital_ad_click'];
		$row['banner_ad'] = $data['banner_ad'];
		$row['banner_ad_id'] = $data['banner_ad_id'];
		$row['banner_ad_id_status'] = $data['banner_ad_id_status'];
		$row['app_open_ad_id'] = $data['app_open_ad_id'];
		$row['app_open_ad_id_status'] = $data['app_open_ad_id_status'];

		$row['ios_interstital_ad'] = $data['ios_interstital_ad'];
		$row['ios_interstital_ad_id'] = $data['ios_interstital_ad_id'];
		$row['interstital_ad_id_ios_status'] = $data['interstital_ad_id_ios_status'];
		$row['ios_interstital_ad_click'] = $data['ios_interstital_ad_click'];
		$row['ios_banner_ad'] = $data['ios_banner_ad'];
		$row['ios_banner_ad_id'] = $data['ios_banner_ad_id'];
		$row['banner_ad_id_ios_status'] = $data['banner_ad_id_ios_status'];
		$row['ios_app_open_ad_id'] = $data['ios_app_open_ad_id'];
		$row['ios_app_open_ad_id_status'] = $data['ios_app_open_ad_id_status'];
		$row['song_download'] = $data['song_download'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "user_favourite_song") {
	$jsonObj = array();
	$user_id = $get_method['user_id'];

	$query = "SELECT * FROM tbl_favorite WHERE user_id='$user_id'";
	$sql = mysqli_query($mysqli, $query) or die(mysqli_error());
	while ($data = mysqli_fetch_assoc($sql)) {
		$post_id = $data['post_id'];
		$query_mp3 = "SELECT * FROM tbl_mp3 LEFT JOIN tbl_category ON FIND_IN_SET(tbl_category.`cid`, tbl_mp3.`cat_id`) > 0 WHERE tbl_mp3.`id`='" . $post_id . "' AND tbl_category.`status`='1' AND tbl_mp3.status='1'";
		$sql_mp3 = mysqli_query($mysqli, $query_mp3) or die(mysqli_error());
		$data_mp3 = mysqli_fetch_assoc($sql_mp3);
		$row['id'] = $data_mp3['id'];
		$row['is_favorite'] = is_favorite($data_mp3['id'], $user_id);
		$row['cat_id'] = $data_mp3['cat_id'];
		$row['mp3_type'] = $data_mp3['mp3_type'];
		$row['mp3_title'] = $data_mp3['mp3_title'];
		$row['mp3_url'] = $file_path."uploads/".$data_mp3['mp3_url'];
		$row['mp3_thumbnail_b'] = $file_path . 'images/' . $data_mp3['mp3_thumbnail'];
		$row['mp3_thumbnail_s'] = $file_path . 'images/thumbs/' . $data_mp3['mp3_thumbnail'];
		$row01['mp3_cover'] = $file_path . 'images/' . $data01['mp3_cover'];
		$row01['mp3_cover_thumb'] = $file_path . 'images/thumbs/' . $data01['mp3_cover'];
		$row['mp3_duration'] = $data_mp3['mp3_duration'];
		$row['mp3_artist'] = $data_mp3['mp3_artist'];
		$row['mp3_description'] = $data_mp3['mp3_description'];
		$row['mp3_lyrics'] = $data_mp3['mp3_lyrics'];
		$row['total_rate'] = $data_mp3['total_rate'];
		$row['rate_avg'] = $data_mp3['rate_avg'];
		$row['total_views'] = $data_mp3['total_views'];
		$row['total_download'] = $data_mp3['total_download'];
		$row['cid'] = $data_mp3['cid'];
		$row['category_name'] = $data_mp3['category_name'];
		$row['category_image'] = $file_path . 'images/' . $data_mp3['category_image'];
		$row['category_image_thumb'] = $file_path . 'images/thumbs/' . $data_mp3['category_image'];

		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "favorite_post") {
	$jsonObj = array();
	$user_id = $get_method['user_id'];
	$post_id = $get_method['post_id'];

	$sql = "SELECT * FROM tbl_favorite WHERE `post_id`='$post_id' AND `user_id`='$user_id'";
	$res = mysqli_query($mysqli, $sql);

	if (mysqli_num_rows($res) == 0) {
		$data = array(
			'post_id' => $post_id,
			'user_id'  => $user_id,
			'created_at'  =>  strtotime(date('d-m-Y h:i:s A'))
		);
		$qry = Insert('tbl_favorite', $data);
		$set['ONLINE_MP3'][] = array('MSG' => 'Music Favourite Is Successful...', 'success' => '1');
	} else {
		$deleteSql = "DELETE FROM tbl_favorite WHERE `post_id`='$post_id' AND `user_id`='$user_id'";

		if (mysqli_query($mysqli, $deleteSql)) {
			$set['ONLINE_MP3'][] = array('MSG' => 'Music Favourite Delete Successful...', 'success' => '1');
		} else {
			$set['ONLINE_MP3'][] = array('MSG' => 'Music Suggestion Delete Error...', 'success' => '1');
		}
	}
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "favorite_artist") {
	$jsonObj = array();
	$user_id = $get_method['user_id'];
	$artist_id = $get_method['artist_id'];

	$sql = "SELECT * FROM tbl_favorite_artist WHERE `artist_id`='$artist_id' AND `user_id`='$user_id'";
	$res = mysqli_query($mysqli, $sql);

	if (mysqli_num_rows($res) == 0) {
		$data = array(
			'artist_id' => $artist_id,
			'user_id'  => $user_id,
			'created_at'  =>  strtotime(date('d-m-Y h:i:s A'))
		);
		$qry = Insert('tbl_favorite_artist', $data);
		$set['ONLINE_MP3'][] = array('MSG' => 'Artist Favourite Is Successful...', 'success' => '1');
	} else {
		$deleteSql = "DELETE FROM tbl_favorite_artist WHERE `artist_id`='$artist_id' AND `user_id`='$user_id'";

		if (mysqli_query($mysqli, $deleteSql)) {
			$set['ONLINE_MP3'][] = array('MSG' => 'Artist Favourite Delete Successful...', 'success' => '1');
		} else {
			$set['ONLINE_MP3'][] = array('MSG' => 'Artist Suggestion Delete Error...', 'success' => '1');
		}
	}
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == 'user_favourite_artist') {
	$jsonObj = array();

	$user_id = $get_method['user_id'];
	$query = "SELECT * FROM tbl_favorite_artist WHERE user_id='$user_id'";
	$sql = mysqli_query($mysqli, $query) or die(mysqli_error());
	while ($data = mysqli_fetch_assoc($sql)) {
		$artist_id = $data['artist_id'];
		$query_mp3 = "SELECT * FROM tbl_artist WHERE tbl_artist.`id`='" . $artist_id . "'";
		$sql_mp3 = mysqli_query($mysqli, $query_mp3) or die(mysqli_error());
		$data_mp3 = mysqli_fetch_assoc($sql_mp3);
		$row['id'] = $data_mp3['id'];
		$row['artist_name'] = $data_mp3['artist_name'];
		$row['artist_image'] = $file_path . 'images/' . $data_mp3['artist_image'];
		$row['artist_image_thumb'] = $file_path . 'images/thumbs/' . $data_mp3['artist_image'];
		array_push($jsonObj, $row);
	}

	$set['ONLINE_MP3'] = $jsonObj;

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else if ($get_method['method_name'] == "delete_userdata") {
	$user_id = $get_method['user_id'];
	$sql = "SELECT * FROM tbl_users WHERE id = '$user_id'";
	$res = mysqli_query($mysqli, $sql);

	if (mysqli_num_rows($res) > 0) {
		$data = array(
			'is_deleted'  => 1,
		);

		$updatePlayerID = Update('tbl_users', $data, "WHERE `id` =" . $user_id);
		$set['ONLINE_MP3'][] = array('MSG' => 'This user Is Deleted Please Contact Admin', 'success' => '1');
	} else {
		$set['ONLINE_MP3'][] = array('MSG' => "User Not Found", 'success' => '0');
	}

	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
} else {
	$set['ONLINE_MP3'][] = array('msg' => 'Access denied OR Data not found', 'success' => '1');
	header('Content-Type: application/json; charset=utf-8');
	echo $val = str_replace('\\/', '/', json_encode($set, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
	die();
}
