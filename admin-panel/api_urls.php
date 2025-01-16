<?php
$page_title = "Example API urls";
include("includes/header.php");

$file_path = 'https://' . $_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']) . '/';
?>
<style type="text/css">
    /* width */
    ::-webkit-scrollbar {
        width: 10px;
    }

    /* Track */
    ::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
        background: #888;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
</style>
<main id="main" class="main">
    <section class="section">
        <div class="row  g-3">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body g-3"><br>
                        <div class="pagetitle mb-5">
                            <h1><?php _e($page_title); ?></h1>

                        </div><!-- End Page Title -->
                        <pre style="overflow-x: scroll !important;">
                        <br><b>API URL</b> <?php echo $file_path."api.php" ?>
                                        <br><br><b>Home Videos</b> (Method: home)
                                        <br><b>All Songs</b> (Method: all_songs)(Parameter: page)
                                        <br><b>Latest Songs</b> (Method: latest)(Parameter: page)
                                        <br><b>Category List</b> (Method: cat_list)(Parameter: page)
                                        <br><b>Songs List By Cat ID</b> (Method: cat_songs)(Parameter: cat_id,page)
                                        <br><b>Recent Artist List</b> (Method: recent_artist_list)
                                        <br><b>Artist List</b> (Method: artist_list)(Parameter: page)
                                        <br><b>Artist Album List</b> (Method: artist_album_list)(Parameter: artist_id,page)
                                        <br><b>Songs List By Artist Name</b> (Method: artist_name_songs)(Parameter: artist_name,page)
                                        <br><b>Album List</b> (Method: album_list)(Parameter: page)
                                        <br><b>Songs List By Album ID</b> (Method: album_songs)(Parameter: album_id,page)
                                        <br><b>Playlist List</b> (Method: playlist)(Parameter: page)
                                        <br><b>Songs List By Playlist ID</b> (Method: playlist_songs)(Parameter: playlist_id,page)
                                        <br><b>Homesection List</b> (Method: home_section)(Parameter: page)
                                        <br><b>Songs List By Homesection ID</b> (Method: home_section_id)(Parameter: homesection_id,page)
                                        <br><b>Single Song</b> (Method: single_song)(Parameter: song_id,device_id)
                                        <br><b>Song Download </b> (Method: song_download)(Parameter: song_id)
                                        <br><b>Songs Search</b> (Method: song_search)(Parameter: search_text,search_type,page)(For Particualr : search_type=album,artist,songs)
                                        <br><b>Song Rating </b> (Method: song_rating)(Parameter: post_id,device_id,rate)
                                        <br><b>User Register</b>(Method: user_register)(Parameter: name, email, password, phone, auth_id, type(Normal, Google, Facebook))
                                        <br><b>User Login</b>(Method: user_login)(Parameter: email, password, auth_id, type[Normal, Google, Facebook])
                                        <br><b>User Profile</b>(Method: user_profile)(Parameter:user_id)
                                        <br><b>User Profile Update</b>(Method: user_profile_update)(Parameter:user_id,name,email,password,phone,user_image)
                                        <br><b>Forgot Password</b>(Method: forgot_pass)(Parameter:user_email)
                                        <br><b>Report Songs</b>(Method: song_report)(Parameter:user_id,song_id,report)
                                        <br><b>Song Suggestion</b>(Method: song_suggest)(Parameter:user_id,song_title,message,song_image)
                                        <br><b>App Details</b>(Method: app_details)
                                </pre>
                    </div>
                </div>

            </div>
        </div>
    </section>

</main>
<?php include("includes/footer.php"); ?>