import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../Controller/onboarding_controller.dart';
import 'Custom_widget/musicloader.dart';
import 'Language/language_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String image = 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/images/add-image.png';

// String postApi = "https://vocsyinfotech.in/envato/cc/flutter_musicplayer/api.php";
// String postApi = "https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/api.php";

String postApi = "https://zxmusic.my.id/api.php";
String image = 'https://zxmusic.my.id/images/add-image.png';

// String postApi = "http://192.168.1.11/mp3_v2/api.php";
// String image = 'http://192.168.1.11/mp3_v2/images/add-image.png';

bool isAndroidVersionUp13 = false;

Color green = Color(0xffecc27b); // Colors.green;
Color red = Colors.red;
Color yellow = Colors.yellow;
Color black = Colors.black;
Color shimmerGreen =
    Color.fromARGB(255, 236, 207, 156); // Colors.green.shade400;
Color shimmerLightGreen =
    Color.fromARGB(255, 240, 230, 215); // Colors.green.shade100;
Color green800 = Color(0xffecc27b); // Colors.green.shade800;
Color green600 = Color.fromARGB(255, 237, 193, 118); // Colors.green.shade600;
Color green400 = Color.fromARGB(255, 235, 195, 126); // Colors.green.shade400;
Color green300 = Color.fromARGB(255, 234, 198, 136); // Colors.green.shade300;
Color green200 = Color.fromARGB(255, 230, 206, 164); // Colors.green.shade200;

String? languagecode;

userLanguage() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  languagecode = sharedPreferences.getString(LAGUAGE_CODE) ?? 'en';
}

final OnboardingController onboardingController =
    Get.put(OnboardingController());

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => const Loading(),
  );
}

void hideLoader(BuildContext context) {
  Navigator.of(context).pop(const Loading());
}

// snackbar({title, message}) {
//   return Get.snackbar(title, message, backgroundColor: shimmerGreen, duration: const Duration(seconds: 2));
// }

List<Onboarding> onboardinglist = [
  Onboarding(
      title: "Welcome to Music Player",
      lottie: Lottie.asset('assets/lottie/image1.json'),
      description: "Music your emotions and make\n you to fool happy."),
  Onboarding(
      title: "Enjoy Music",
      lottie: Lottie.asset('assets/lottie/image2.json'),
      description:
          "Massive music for you to listen to,\n enjoy each moment of music."),
  Onboarding(
      title: "Music is Life",
      lottie: Lottie.asset('assets/lottie/image3.json'),
      description: "Music, when soft voices die,\n vibrates in the memory."),
];

class Onboarding {
  final String title;
  final Widget lottie;
  final String description;

  Onboarding(
      {required this.title, required this.lottie, required this.description});
}

Container buildDot(int index, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(right: 10.w),
    height: 13.r,
    width: 13.r,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: onboardingController.currentindex.value == index
            ? Colors.white
            : Colors.grey),
  );
}

getDeviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final allInfo = deviceInfo.data;
  print("App Ver : ${int.parse(allInfo['version']["release"])}");
  if (int.parse(allInfo['version']["release"]) >= 13) {
    isAndroidVersionUp13 = true;
  } else {
    isAndroidVersionUp13 = false;
  }
}

SnackbarController commonSnackBar({
  String? title,
  String? massage,
  Widget? icon,
  required MassageType massageType,
  double? borderRadius,
  Duration? duration,
  Color? textColor,
  bool? isDismissible,
  EdgeInsets? margin,
}) {
  return Get.snackbar(
    title ?? "",
    massage ?? "",
    icon: icon,
    snackPosition: SnackPosition.TOP,
    backgroundColor:
        MassageTypeByColor[massageType]?.withOpacity(0.7) ?? Colors.black,
    borderRadius: borderRadius ?? 12,
    margin: margin ?? const EdgeInsets.all(12),
    colorText: textColor ?? Colors.white,
    duration: duration ?? const Duration(seconds: 3),
    isDismissible: isDismissible ?? true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

enum MassageType {
  success,
  warning,
  error,
  info,
}

Map<MassageType, Color> MassageTypeByColor = {
  MassageType.success: green,
  MassageType.warning: yellow,
  MassageType.error: red,
  MassageType.info: black,
};
