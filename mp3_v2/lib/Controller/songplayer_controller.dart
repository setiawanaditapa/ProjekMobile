import 'package:get/get.dart';
import 'package:musicplayer/Controller/user_controller.dart';
import '../httpmodel/favourite_model.dart';
import '../httpmodel/getfavourite_model.dart';
import '../service/httpservice.dart';

class SongPlayerController extends GetxController {
  String? postid;

  SongPlayerController({this.postid});

  final UserController userController = Get.put(UserController());

  RxBool isLike = false.obs;
  RxBool isShare = false.obs;
  RxBool isDownload = false.obs;
  RxBool isdelete = false.obs;
  RxString downloadingBookId = "".obs;

  @override
  void onInit() {
    isLike.value = false;
    getfavourite(postid: postid);
    super.onInit();
  }

  getfavourite({String? postid}) async {
    isLike.value = false;
    await HttpService()
        .getSongsStream(
      songId: postid,
      userId: userController.userId,
    )
        .listen((value) {
      if (value.onlineMp3.isNotEmpty) {
        isLike.value = value.onlineMp3[0].isFavorite;
      }
    });
  }

  Stream<FavouriteModel> favouriteBookController({String? userid, String? postid}) {
    return  HttpService().favouriteSongStream(userId: userid, postId: postid);
  }

  Stream<GetFavouriteModel> getfavouriteBookController({String? userid}) {
    return  HttpService().getFavouriteSongStream(userId: userid);
  }
}
