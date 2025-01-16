<?php
include("includes/header.php");

$qry_cat = "SELECT COUNT(*) as num FROM tbl_category";
$total_category = mysqli_fetch_array(mysqli_query($mysqli, $qry_cat));
$total_categorys = $total_category['num'];

$qry_artist = "SELECT COUNT(*) as num FROM tbl_artist";
$total_artist = mysqli_fetch_array(mysqli_query($mysqli, $qry_artist));
$total_artists = $total_artist['num'];

$qry_album = "SELECT COUNT(*) as num FROM tbl_album";
$total_album = mysqli_fetch_array(mysqli_query($mysqli, $qry_album));
$total_albums = $total_album['num'];

$qry_songs = "SELECT COUNT(*) as num FROM tbl_mp3";
$total_songs = mysqli_fetch_array(mysqli_query($mysqli, $qry_songs));
$total_songs = $total_songs['num'];

$qry_playlists = "SELECT COUNT(*) as num FROM tbl_playlist";
$total_playlists = mysqli_fetch_array(mysqli_query($mysqli, $qry_playlists));
$total_playlists = $total_playlists['num'];

$qry_users = "SELECT COUNT(*) as num FROM tbl_users";
$total_users = mysqli_fetch_array(mysqli_query($mysqli, $qry_users));
$total_users = $total_users['num'];

$qry_banners = "SELECT COUNT(*) as num FROM tbl_banner";
$total_banners = mysqli_fetch_array(mysqli_query($mysqli, $qry_banners));
$total_banners = $total_banners['num'];

$cat_qry = "SELECT * FROM tbl_category Where tbl_category.status=1 ORDER BY tbl_category.cid DESC LIMIT 5";
$cat_result = mysqli_query($mysqli, $cat_qry);


$tbl_mp3_view = "SELECT * FROM tbl_mp3 join tbl_category ON tbl_mp3.cat_id = tbl_category.cid
WHERE tbl_mp3.status=1 AND tbl_category.status=1 ORDER BY tbl_mp3.total_views DESC LIMIT 5";
$tbl_mp3_view_result = mysqli_query($mysqli, $tbl_mp3_view);

$tbl_artist = "SELECT * FROM tbl_artist WHERE tbl_artist.a_status=1 ORDER BY tbl_artist.id DESC LIMIT 5";
$tbl_artist_result = mysqli_query($mysqli, $tbl_artist);

$recent_mp3s = "SELECT * FROM tbl_mp3 join tbl_category ON tbl_mp3.cat_id = tbl_category.cid
WHERE tbl_mp3.status=1 AND tbl_category.status=1 ORDER BY tbl_mp3.id DESC LIMIT 5";
$recent_mp3s_result = mysqli_query($mysqli, $recent_mp3s);
?>
<main id="main" class="main">

	<div class="pagetitle">
		<h1>Dashboard</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		</nav>
	</div><!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- Sales Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card category-card">
							<a href="manage_category.php">
								<div class="card-body">
									<h5 class="card-title">Categories</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-diagram-3-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_categorys)); ?></h6>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div><!-- End Sales Card -->

					<!-- Revenue Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card wallpaper-card">
							<a href="manage_artist.php">
								<div class="card-body">
									<h5 class="card-title">Artists</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-person-square"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_artists)); ?></h6>
										</div>
									</div>
								</div>
							</a>

						</div>
					</div>
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card gif-card">
							<a href="manage_album.php">
								<div class="card-body">
									<h5 class="card-title">Albums</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-book-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_albums)); ?></h6>
										</div>
									</div>

								</div>
							</a>
						</div>

					</div>
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card download-card">
							<a href="manage_mp3.php">
								<div class="card-body">
									<h5 class="card-title">Mp3 Songs</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-book-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_songs)); ?></h6>
										</div>
									</div>

								</div>
							</a>
						</div>

					</div>
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card gif-download-card">
							<a href="manage_playlist.php">
								<div class="card-body">
									<h5 class="card-title">Playlists</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-book-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_playlists)); ?></h6>
										</div>
									</div>

								</div>
							</a>
						</div>

					</div>
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card users-card">
							<a href="manage_users.php">
								<div class="card-body">
									<h5 class="card-title">Users</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-book-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_users)); ?></h6>
										</div>
									</div>

								</div>
							</a>
						</div>

					</div>
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card users-card">
							<a href="manage_banners.php">
								<div class="card-body">
									<h5 class="card-title">Banners</h5>

									<div class="d-flex align-items-center">
										<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi-book-fill"></i>
										</div>
										<div class="ps-3">
											<h6><?php _e(thousandsNumberFormat($total_banners)); ?></h6>
										</div>
									</div>

								</div>
							</a>
						</div>

					</div>
					<!-- End Customers Card -->

					<?php
					$selectedYear = isset($_GET['year']) ? $_GET['year'] : date('Y');
					$query = "SELECT DATE_FORMAT(created_at, '%Y-%m') as month, COUNT(*) as user_count FROM tbl_users WHERE YEAR(created_at) = ? GROUP BY DATE_FORMAT(created_at, '%Y-%m')";

					$stmt = mysqli_prepare($mysqli, $query);
					mysqli_stmt_bind_param($stmt, 's', $selectedYear);
					mysqli_stmt_execute($stmt);
					$result = mysqli_stmt_get_result($stmt);

					$response = array('labels' => array(), 'data' => array());

					while ($row = mysqli_fetch_assoc($result)) {
						$response['labels'][] = $row['month'];
						$response['data'][] = $row['user_count'];
					}

					if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
						header('Content-Type: application/json');
						echo json_encode($response);
					} else {
					?>
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Users Chart</h5>

									<label for="yearSelect">Select Year:</label>
									<select id="yearSelect">
										<?php
										$currentYear = date('Y');
										$years = range($currentYear - 2, $currentYear);
										foreach ($years as $year) {
											$selected = ($year == $selectedYear) ? 'selected' : '';
											echo "<option value='$year' $selected>$year</option>";
										}
										?>
									</select>

									<canvas id="barChart" style="max-height: 400px;"></canvas>
									<script>
										document.addEventListener("DOMContentLoaded", () => {
											let chart;

											function initializeChart(labels, data) {
												chart = new Chart(document.querySelector('#barChart'), {
													type: 'bar',
													data: {
														labels: labels,
														datasets: [{
															label: 'Bar Chart',
															data: data,
															backgroundColor: 'rgba(54, 162, 235, 0.2)',
															borderColor: 'rgb(54, 162, 235)',
															borderWidth: 1
														}]
													},
													options: {
														scales: {
															y: {
																beginAtZero: true
															}
														}
													}
												});
											}

											initializeChart(<?php echo json_encode($response['labels']); ?>, <?php echo json_encode($response['data']); ?>);

											document.getElementById('yearSelect').addEventListener('change', function() {
												let selectedYear = this.value;
												window.location.href = `home.php?year=${selectedYear}`;
											});
										});
									</script>
								</div>
							</div>
						</div>
					<?php
					}
					?>

					<!-- Top Selling -->
					<div class="col-12">
						<div class="card top-selling overflow-auto">
							<div class="card-body pb-0">
								<h5 class="card-title">Recent Songs</h5>
								<div class="table-responsive">
									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Title</th>
												<th scope="col">Images</th>
												<th scope="col">Views</th>
												<th scope="col">Downloads</th>
											</tr>
										</thead>
										<tbody>
											<?php
											while ($tbl_mp3_view_result_row = mysqli_fetch_array($recent_mp3s_result)) {
											?>
												<tr>

													<td><?php _e($tbl_mp3_view_result_row['mp3_title']); ?></td>
													<td scope="row">
														<img src="images/<?php echo $tbl_mp3_view_result_row['mp3_thumbnail']; ?>" class="home_image_size" alt="" />
													</td>
													<td><?php _e($tbl_mp3_view_result_row['total_views']); ?></td>
													<td><?php _e($tbl_mp3_view_result_row['total_download']); ?></td>
												</tr>
											<?php
											}
											?>
										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div><!-- End Top Selling -->

				</div>
			</div><!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-4">
				<!-- News & Updates Traffic -->
				<div class="card">
					<div class="card-body pb-0">
						<h5 class="card-title">Top View Songs</h5>
						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Images</th>
									<th scope="col">Views</th>
									<th scope="col">Downloads</th>
								</tr>
							</thead>
							<tbody>
								<?php
								while ($tbl_mp3_view_result_row = mysqli_fetch_array($tbl_mp3_view_result)) {
								?>
									<tr>

										<td><?php _e($tbl_mp3_view_result_row['mp3_title']); ?></td>
										<td scope="row">
											<img src="images/<?php echo $tbl_mp3_view_result_row['mp3_thumbnail']; ?>" class="home_image_size" alt="" />
										</td>
										<td><?php _e($tbl_mp3_view_result_row['total_views']); ?></td>
										<td><?php _e($tbl_mp3_view_result_row['total_download']); ?></td>
									</tr>
								<?php
								}
								?>
							</tbody>
						</table>
					</div>
				</div><!-- End News & Updates -->
				<div class="card top-selling overflow-auto">
					<div class="card-body pb-0">
						<h5 class="card-title">Recent Category</h5>

						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Image</th>
								</tr>
							</thead>
							<tbody>
								<?php
								while ($cat_row = mysqli_fetch_array($cat_result)) {
								?>
									<tr>

										<td><?php _e($cat_row['category_name']); ?></td>
										<td scope="row">
											<img src="images/thumbs/<?php echo $cat_row['category_image']; ?>" class="home_image_size" alt="" />
										</td>
									</tr>
								<?php
								}
								?>
							</tbody>
						</table>

					</div>

				</div>
				<div class="card top-selling overflow-auto">
					<div class="card-body pb-0">
						<h5 class="card-title">Recent Artist</h5>

						<table class="table table-borderless">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Image</th>
								</tr>
							</thead>
							<tbody>
								<?php
								while ($tbl_artist_row = mysqli_fetch_array($tbl_artist_result)) {
								?>
									<tr>

										<td><?php _e($tbl_artist_row['artist_name']); ?></td>
										<td scope="row">
											<img src="images/thumbs/<?php echo $tbl_artist_row['artist_image']; ?>" class="home_image_size" alt="" />
										</td>
									</tr>
								<?php
								}
								?>
							</tbody>
						</table>

					</div>

				</div>
			</div>


		</div><!-- End Right side columns -->

		</div>
	</section>

</main><!-- End #main -->
<?php include("includes/footer.php"); ?>