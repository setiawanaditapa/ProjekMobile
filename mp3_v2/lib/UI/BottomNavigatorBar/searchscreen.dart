import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:musicplayer/Constants/Custom_widget/cachednetworkimage.dart';
import 'package:musicplayer/UI/SongScreen/songscreen.dart';
import 'package:musicplayer/Ads/appAds.dart';
import 'package:shimmer/shimmer.dart';
import '../../Constants/Custom_widget/textwidget.dart';
import '../../Constants/audio_constant.dart';
import '../../Constants/constant.dart';
import '../../Controller/search_controller.dart';
import '../../httpmodel/search_model.dart';
import '../../service/httpservice.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final SearchingController searchController = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KeyboardVisibilityBuilder(builder: (context, iskey) {
                if (!iskey) {
                  searchController.focusNode3.unfocus();
                }
                return Obx(() {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          child: TextField(
                            controller: searchController.search.value,
                            onChanged: (value) {
                              // searchController.search.value.text
                              //         .toLowerCase() ==
                              //     value;
                              // searchController.update();
                              // searchController.isSearch.value =
                              //     value.isNotEmpty;
                            },
                            onSubmitted: (value) {
                              searchController.search.value.text
                                      .toLowerCase() ==
                                  value;
                              searchController.update();
                              searchController.isSearch.value = false;
                            },
                            onTap: () {
                              searchController.isSearch.value = true;
                            },
                            focusNode: searchController.focusNode3,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    borderSide: BorderSide.none),
                                border: InputBorder.none,
                                hintText: 'songsearch'.tr,
                                hintStyle: const TextStyle(
                                    fontFamily: "Poppins-Medium"),
                                prefixIconConstraints:
                                    BoxConstraints(maxHeight: 25.h),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SvgPicture.asset(
                                    "assets/icons/searchoutline.svg",
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context).iconTheme.color!,
                                        BlendMode.srcIn),
                                  ),
                                ),
                                suffixIcon: searchController.isSearch.value
                                    ? IconButton(
                                        splashRadius: 1,
                                        onPressed: () {
                                          searchController.search.value.clear();
                                          searchController.focusNode3.unfocus();
                                          searchController.update();
                                          searchController.isSearch.value =
                                              false;
                                        },
                                        autofocus: false,
                                        icon: SvgPicture.asset(
                                            "assets/icons/close.svg",
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .iconTheme
                                                    .color!,
                                                BlendMode.srcIn),
                                            height: 25.h),
                                      )
                                    : null),
                          ),
                        ),
                      ),
                    ],
                  );
                });
              }),
              SizedBox(height: 5.h),

              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      AdmobAds().bannerAds(),
                      SizedBox(height: 10.h),
                      GetBuilder<SearchingController>(
                        init: SearchingController(),
                        assignId: true,
                        builder: (logic) {
                          return StreamBuilder<SearchModel>(
                              stream: HttpService().getSearchStream(
                                  search: searchController.search.value.text),
                              builder: (context, snapshot) {
                                print("testint ${snapshot.connectionState}");
                                if (snapshot.hasData &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {
                                  if (snapshot.data!.onlineMp3.isNotEmpty) {
                                    return AnimationLimiter(
                                      child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(
                                            top: 7.h, left: 5.w, right: 5.w),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:
                                            snapshot.data!.onlineMp3.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 10.0.r,
                                                mainAxisSpacing: 12.0.r,
                                                childAspectRatio: 0.9,
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () async {
                                              showLoader(context);
                                              songListModel.clear();
                                              for (int i = 0;
                                                  i <
                                                      snapshot.data!.onlineMp3
                                                          .length;
                                                  i++) {
                                                songListModel.add(SongListModel(
                                                    id: snapshot
                                                        .data!.onlineMp3[i].id,
                                                    image: snapshot
                                                        .data!
                                                        .onlineMp3[i]
                                                        .mp3ThumbnailB,
                                                    artist: snapshot.data!
                                                        .onlineMp3[i].mp3Artist,
                                                    title: snapshot.data!
                                                        .onlineMp3[i].mp3Title,
                                                    url: snapshot.data!
                                                        .onlineMp3[i].mp3Url));
                                              }
                                              await selectSong(index: index)
                                                  .whenComplete(() =>
                                                      hideLoader(context));
                                              Get.to(
                                                  () => SongScreen(
                                                        id: snapshot
                                                            .data!
                                                            .onlineMp3[index]
                                                            .id,
                                                      ),
                                                  transition: Transition.native,
                                                  duration: const Duration(
                                                      seconds: 1));
                                            },
                                            child: AnimationConfiguration
                                                .staggeredGrid(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              columnCount: 2,
                                              child: ScaleAnimation(
                                                child: FadeInAnimation(
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: ImageView(
                                                          imageUrl: snapshot
                                                              .data!
                                                              .onlineMp3[index]
                                                              .mp3ThumbnailB,
                                                          height: 162.h,
                                                          width: 170.w,
                                                          radius: 15.r,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5.w),
                                                      TextWidget.regular(
                                                          snapshot
                                                              .data!
                                                              .onlineMp3[index]
                                                              .mp3Title,
                                                          fontFamily:
                                                              "Poppins-Medium",
                                                          fontSize: 16.sp),
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
                                      child: TextWidget.regular(
                                          'nosearchdatafound'.tr,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 15.sp),
                                    );
                                  }
                                } else {
                                  return Shimmer.fromColors(
                                    baseColor: shimmerGreen,
                                    highlightColor: shimmerLightGreen,
                                    child: GridView.builder(
                                      padding: EdgeInsets.only(
                                          top: 7.h, left: 5.w, right: 5.w),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: 8,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 10.0.r,
                                              mainAxisSpacing: 12.0.r,
                                              childAspectRatio: 0.9,
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              height: 162.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                            ),
                                            const SizedBox(height: 6),
                                            Container(
                                              height: 15.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r)),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                }
                              });
                        },
                      ),
                    ],
                  ),
                ),
              )

              /// Ads
            ],
          ),
        ),
      ),
    );
  }
}
