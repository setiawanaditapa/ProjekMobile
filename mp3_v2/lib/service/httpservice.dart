import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:musicplayer/Constants/constant.dart';
import 'package:musicplayer/httpmodel/deleteaccount_model.dart';
import 'package:musicplayer/httpmodel/home_model.dart';
import 'package:musicplayer/httpmodel/singlesong_model.dart';
import '../httpmodel/albumsongs_model.dart';
import '../httpmodel/appdetails_model.dart';
import '../httpmodel/artistsong_model.dart';
import '../httpmodel/favourite_model.dart';
import '../httpmodel/getfavourite_model.dart';
import '../httpmodel/geners_list_model.dart';
import '../httpmodel/genersbyid_model.dart';
import '../httpmodel/generssong_model.dart';
import '../httpmodel/getuser_model.dart';
import '../httpmodel/getuserupdate_model.dart';
import '../httpmodel/homesection_model.dart';
import '../httpmodel/homesectionbyid_model.dart';
import '../httpmodel/login_model.dart';
import '../httpmodel/register_model.dart';
import '../httpmodel/search_model.dart';
import '../httpmodel/song_model.dart';

class HttpService {
  Stream<HomeMp3Data> getHomeStream({int? page}) async* {
    final response = await http.post(
      Uri.parse(postApi),
      body: {
        'data':
            '{"method_name":"home","package_name":"com.vpapps.onlinemp3","page":"${page ?? 1}"}'
      },
    );
    yield homeMp3DataFromJson(response.body);
  }

  Stream<List<LatestAlbum>> getLatestAlbumStream({int? page}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"album_list","package_name":"com.example.music.player","page":"${page ?? 1}"}'
    });

    final json = jsonDecode(response.body);
    List<LatestAlbum> albumList = [];
    json['ONLINE_MP3'].forEach((element) {
      albumList.add(LatestAlbum.fromJson(element));
    });

    yield albumList;
  }

  Stream<List<LatestArtist>> getArtistStream({int? page}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"artist_list","package_name":"com.example.music.player","page":"${page ?? 1}"}'
    });

    final json = jsonDecode(response.body);
    List<LatestArtist> artistList = [];
    json['ONLINE_MP3'].forEach((element) {
      artistList.add(LatestArtist.fromJson(element));
    });

    yield artistList;
  }

  Stream<List<TrendingSong>> getTrendingStream({int? page}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"trending_songs","package_name":"com.example.music.player","page":"${page ?? 1}","user_id":"148"}'
    });

    final json = jsonDecode(response.body);
    List<TrendingSong> trendingList = [];
    json['ONLINE_MP3'].forEach((element) {
      trendingList.add(TrendingSong.fromJson(element));
    });

    yield trendingList;
  }

  Stream<HomeSectionModel> getHomeSectionStream() async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"home_section","package_name":"com.example.music.player","page":"1"}'
    });

    yield homeSectionModelFromJson(response.body);
  }

  Stream<HomeSectionbyIdModel?> getHomeSectionbyIdStream(
      {String? id, String? userid}) async* {
    try {
      final response = await http.post(Uri.parse(postApi), body: {
        'data':
            '{"method_name":"home_section_id","package_name":"com.example.music.player","page":"1","homesection_id":"$id","user_id":"$userid"}'
      });

      yield homeSectionbyIdModelFromJson(response.body);
    } catch (e, t) {
      if (kDebugMode) {
        print(e);
        print(t);
      }
      yield null;
    }
  }

  Stream<SearchModel> getSearchStream({required String search}) async* {
    
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"song_search","package_name":"com.vpapps.onlinemp3","search_text":"$search","page":"1","search_type":"songs"}'
    });

    yield searchModelFromJson(response.body);
  }

  Stream<GenersModel> getGenersStream({int? page}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"geners_list","package_name":"com.vpapps.onlinemp3","page":"${page ?? 1}"}'
    });

    yield genersModelFromJson(response.body);
  }

  Stream<GenersModelById> getGenersByIdStream(
      {required int i, int? page}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"geners_playlist_list","package_name":"com.vinodflutter.musicPlayerDemo","geners_id":"$i","page":"${page ?? 1}"}'
    });
    yield genersModelByIdFromJson(response.body);
  }

  Stream<LoginModel> getLoginStream(
      {String? email,
      String? password,
      String? phone,
      String? authId,
      String? type}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"user_login","package_name":"com.vpapps.onlinemp3","email":"$email","password":"$password","auth_id":"$authId","type":"$type"}'
    });
    yield loginModelFromJson(response.body);
  }

  Stream<RegisterModel> getRegisterStream(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? image,
      String? authId,
      String? type}) async* {
    Map<String, dynamic> data = {
      'data':
          '{"method_name":"user_register","package_name":"com.vinodflutter.musicPlayerDemo","name":"$name","email":"$email","password":"$password","phone":"$phone","type":"$type","auth_id":"$authId","user_image":"$image"}'
    };
    final response = await http.post(Uri.parse(postApi), body: data);
    yield registerModelFromJson(response.body);
  }

  Stream<GetUserModel> getUserServiceStream({String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"user_profile","package_name":"com.vinodflutter.musicPlayerDemo","user_id":"$userId"}'
    });
    yield getUserModelFromJson(response.body);
  }

  Stream<GetUserUpdateModel> getUserUpdateServiceStream(
      {String? userId,
      String? name,
      String? email,
      String? password,
      String? phone,
      File? userImage}) async* {
    var request = http.MultipartRequest('POST', Uri.parse(postApi));
    request.fields['data'] =
        '{"method_name":"user_profile_update","package_name":"com.vpapps.onlinemp3","user_id":"$userId","name":"$name","email":"$email","password":"$password","phone":"$phone"}';

    if (userImage != null) {
      request.files
          .add(await http.MultipartFile.fromPath('user_image', userImage.path));
    }

    http.Response response =
        await http.Response.fromStream(await request.send());
    yield getUserUpdateModelFromJson(response.body);
  }

  Stream<AlbumSongsModel> getAlbumSongsStream(
      {String? albumId, String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"album_songs","package_name":"com.example.music.player","page":"1","album_id":"$albumId","user_id":"$userId"}'
    });
    yield albumSongsModelFromJson(response.body);
  }

  Stream<ArtistSongsModel?> getArtistSongsStream(
      {String? artistName, String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"artist_name_songs","package_name":"com.example.music.player","page":"1","artist_name":"$artistName","user_id":"$userId"}'
    });
    if (response.statusCode == 200) {
      yield artistSongsModelFromJson(response.body);
    } else {
      yield null;
    }
  }

  Stream<GenersSongsModel> getGenersSongsStream(
      {String? pId, String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"playlist_songs","package_name":"com.example.music.player","page":"1","playlist_id":"$pId","user_id":"$userId"}'
    });
    yield genersSongsModelFromJson(response.body);
  }

  Stream<SongModel> getSongsStream(
      {String? songId, String? userId, String? dId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"single_song","package_name":"com.example.music.player","song_id":"$songId","device_id":"$dId","user_id":"$userId"}'
    });
    yield songModelFromJson(response.body);
  }

  Stream<FavouriteModel> favouriteSongStream(
      {String? userId, String? postId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"favorite_post","package_name":"com.example.music.player","user_id":"$userId","post_id":"$postId"}'
    });
    yield favouriteModelFromJson(response.body);
  }

  Stream<GetFavouriteModel> getFavouriteSongStream({String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"user_favourite_song","package_name":"com.example.music.player","user_id":"$userId"}'
    });
    yield getFavouriteModelFromJson(response.body);
  }

  Stream<AppDetailsModel> getAppDetailsServiceStream() async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"app_details","package_name":"com.vinodflutter.musicPlayerDemo"}'
    });
    yield appDetailsModelFromJson(response.body);
  }

  Stream<DeleteProfileModel?> deleteAccountServiceStream(
      {String? userId}) async* {
    print("This is UserId ${userId}");
    var body = {
      'data':
          '{"method_name":"delete_userdata","package_name":"com.example.music.player","user_id":"$userId"}'
    };

    final response = await http.post(Uri.parse(postApi), body: body);
    print("user_login--StatusCode-- ${response.statusCode}");
    if (response.statusCode == 200) {
      yield deleteProfileModelFromJson(response.body);
    } else {
      yield null;
    }
  }

  Stream<SingleSongModel> getSingleSongStream(
      {String? songId, String? userId}) async* {
    final response = await http.post(Uri.parse(postApi), body: {
      'data':
          '{"method_name":"single_song","package_name":"com.example.music.player","song_id":"$songId","device_id":"","user_id":"$userId"}'
    });
    yield singleSongModelFromJson(response.body);
  }
}
