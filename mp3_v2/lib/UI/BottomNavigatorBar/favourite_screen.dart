import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:musicplayer/UI/SongScreen/songscreen.dart';
import 'package:musicplayer/Ads/appAds.dart';
import 'package:shimmer/shimmer.dart';
import '../../Constants/Custom_widget/cachednetworkimage.dart';
import '../../Constants/Custom_widget/textwidget.dart';
import '../../Constants/audio_constant.dart';
import '../../Constants/constant.dart';
import '../../Controller/songplayer_controller.dart';
import '../../Controller/user_controller.dart';
import '../../httpmodel/getfavourite_model.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  final SongPlayerController songPlayerController = Get.put(SongPlayerController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: TextWidget.regular('favourite'.tr, fontSize: 20.sp, fontFamily: "Poppins-Bold"),
        ),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5.h),

                /// Ads
                AdmobAds().bannerAds(),

                GetBuilder<SongPlayerController>(
                    init: SongPlayerController(),
                    builder: (logic) {
                      return StreamBuilder<GetFavouriteModel>(
                          stream: songPlayerController.getfavouriteBookController(userid: userController.userId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                songPlayerController.isLike.value = false;
                                songPlayerController.isLike.value =
                                    snapshot.data!.onlineMp3.isNotEmpty ? snapshot.data!.onlineMp3[0].isFavorite : false;
                              });
                              if (snapshot.data!.onlineMp3.isNotEmpty) {
                                return AnimationLimiter(
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.onlineMp3.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10.0.r, mainAxisSpacing: 12.0.r, childAspectRatio: 0.9, crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async {
                                          showLoader(context);

                                          songListModel.clear();
                                          for (int i = 0; i < snapshot.data!.onlineMp3.length; i++) {
                                            songListModel.add(SongListModel(
                                                id: snapshot.data!.onlineMp3[i].id,
                                                image: snapshot.data!.onlineMp3[i].mp3ThumbnailB,
                                                artist: snapshot.data!.onlineMp3[i].mp3Artist,
                                                title: snapshot.data!.onlineMp3[i].mp3Title,
                                                url: snapshot.data!.onlineMp3[i].mp3Url));
                                          }
                                          await selectSong(index: index).whenComplete(() => hideLoader(context));
                                          Get.to(
                                              () => SongScreen(
                                                    id: snapshot.data!.onlineMp3[index].id,
                                                  ),
                                              transition: Transition.native,
                                              duration: const Duration(seconds: 1));
                                        },
                                        child: AnimationConfiguration.staggeredGrid(
                                          position: index,
                                          duration: const Duration(milliseconds: 300),
                                          columnCount: 2,
                                          child: ScaleAnimation(
                                            child: FadeInAnimation(
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      alignment: Alignment.topRight,
                                                      children: [
                                                        ImageView(
                                                          imageUrl: snapshot.data!.onlineMp3[index].mp3ThumbnailB,
                                                          height: 165.h,
                                                          width: 170.w,
                                                          memCacheHeight: 340,
                                                          radius: 15.r,
                                                        ),
                                                        InkWell(
                                                          onTap: ()  {
                                                             songPlayerController
                                                                .favouriteBookController(
                                                                    postid: snapshot.data!.onlineMp3[index].id,
                                                                    userid: userController.userId)
                                                                .listen((val) async {
                                                                      val.onlineMp3[0].success == "1"
                                                                          ? songPlayerController.isLike.value = true
                                                                          : songPlayerController.isLike.value = false;
                                                                    })
                                                                .onDone(() { songPlayerController.update();});
                                                          },
                                                          child: Container(
                                                            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                                                            height: 30.h,
                                                            width: 30.w,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(50.r),
                                                            ),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.favorite_outlined,
                                                                color: Get.theme.colorScheme.primaryContainer,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.w),
                                                  TextWidget.regular(snapshot.data!.onlineMp3[index].mp3Title,
                                                      fontFamily: "Poppins-Medium", fontSize: 16.sp),
                                                  // IconButton(onPressed: onPressed, icon: icon)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Center(
                                    child: TextWidget.regular('nofavouritesong'.tr, fontSize: 20.sp, fontFamily: "Poppins-Medium"));
                              }
                            } else {
                              return Shimmer.fromColors(
                                baseColor: shimmerGreen,
                                highlightColor: shimmerLightGreen,
                                child: GridView.builder(
                                  padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: 8,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10.0.r, mainAxisSpacing: 10.0.r, childAspectRatio: 0.9, crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 170.h,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 15.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
