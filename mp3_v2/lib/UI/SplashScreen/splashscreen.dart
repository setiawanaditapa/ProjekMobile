import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:musicplayer/Ads/appAds.dart';
import 'package:musicplayer/Constants/constant.dart';
import 'package:musicplayer/Constants/dynamic_link.dart';
import 'package:musicplayer/UI/OnBoardingScreen/onboardingscreen.dart';
import '../../Constants/Custom_widget/textwidget.dart';
import '../../Controller/user_controller.dart';
import '../BottomNavigatorBar/bottomnavigatorbar.dart';
import '../DownloadScreen/downloadscreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController userController = Get.put(UserController());

  Future<void> initialLinkFunction() async {
    initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      getDeviceInfo();
    }

    initialLinkFunction().whenComplete(() {
      initPlugin(context);
      if (initialLink == null) {
        Connectivity()
            .onConnectivityChanged
            .listen((List<ConnectivityResult> result) {
          if (result == ConnectivityResult.none) {
            Future.delayed(Duration(seconds: 3), () {
              Get.off(() => DownloadScreen(), transition: Transition.native);
            });
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              userController.getuser().whenComplete(() {
                Get.off(() => userController.userId != null ||
                        userController.isguest.value
                    ? MyBottomNavigationBar()
                    : OnBoardingScreen());
              });
            });
          }
        });
      } else {
        initDynamicLinks();
      }
    });

    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffecc27b),
          Color.fromARGB(255, 230, 186, 110),
          Color.fromARGB(255, 228, 180, 98),
          Color.fromARGB(255, 222, 172, 86)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  'assets/image/MusicPro.png',
                  height: 200.h,
                  width: 200.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextWidget.regular('Music Player',
                  fontSize: 30.0.sp, fontFamily: "Poppins-Medium"),
            ],
          ),
        ),
      ),
    ));
  }
}
