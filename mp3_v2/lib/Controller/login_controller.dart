import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicplayer/Constants/constant.dart';
import 'package:musicplayer/Controller/user_controller.dart';
import 'package:musicplayer/UI/BottomNavigatorBar/bottomnavigatorbar.dart';
import 'package:musicplayer/UI/LoginScreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../Constants/audio_constant.dart';
import '../httpmodel/deleteaccount_model.dart';
import '../httpmodel/login_model.dart';
import '../service/httpservice.dart';

class LoginController extends GetxController {
  final UserController userController = Get.put(UserController());

  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  GlobalKey<FormState> regformKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetformKey = GlobalKey<FormState>();

  RxBool passwordVisible = true.obs;
  RxBool conpasswordVisible = true.obs;

  TextEditingController useremail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController regname = TextEditingController();
  TextEditingController regemail = TextEditingController();
  TextEditingController regpass = TextEditingController();
  TextEditingController regconform = TextEditingController();
  TextEditingController regphone = TextEditingController();
  TextEditingController foremail = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  setString(String responseString, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, responseString);
  }

  Future<UserCredential?> register(
      {String? email, String? password, String? name, String? phone, String? type, String? deviceId, String? authId}) async {
    UserCredential? credential;
    try {
      credential = await auth.createUserWithEmailAndPassword(email: email!, password: password!).then((_) async {
        await HttpService()
            .getRegisterStream(name: name, email: email, password: password, phone: phone, image: '', type: "normal", authId: _.user?.uid)
            .listen((value) {
          print('hello how are you  000');
          if (value.onlineMp3[0].success == "1" || value.onlineMp3[0].success == "0") {
            commonSnackBar(title: 'Register SuccessFully..', massageType: MassageType.success);
            Get.to(() => LoginScreen());
          } else {
            commonSnackBar(title: value.onlineMp3[0].msg, massageType: MassageType.error);
            signOut();
          }
        });
        return credential;
      });
    } catch (e) {
      commonSnackBar(title: e.toString(), massageType: MassageType.error);
      print(e);
    }
    return credential;
  }

  Future<Stream<DeleteProfileModel?>> deleteAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return (await HttpService().deleteAccountServiceStream(userId: prefs.getString('user_id')));
  }

  Future<LoginModel?> signIn({String? email, String? password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!).whenComplete(() async {
        await HttpService().getLoginStream(email: email, password: password).listen((value) async {
          if (value.onlineMp3[0].success == "1") {
            commonSnackBar(title: value.onlineMp3[0].msg, massageType: MassageType.success);
            await prefs.setString('user_id', value.onlineMp3[0].userId!);
            await userController.getuser().whenComplete(() {
              Get.offAll(() => MyBottomNavigationBar());
            });
          } else {
            commonSnackBar(title: value.onlineMp3[0].msg, massageType: MassageType.error);
            signOut();
          }
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<UserCredential?> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['email']);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential authCredential =
            GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
        UserCredential result = await FirebaseAuth.instance.signInWithCredential(authCredential);
        print('email =====> ${result.user}');
        await HttpService()
            .getRegisterStream(
                email: result.user!.email,
                name: result.user!.displayName ?? result.user!.email!.split("@").first,
                type: "Google",
                image: result.user!.photoURL,
                phone: result.user!.phoneNumber,
                authId: result.user!.uid)
            .listen((value) async {
          print('value ================> ${value.onlineMp3[0].success}');

          if (value.onlineMp3[0].success == "1" || value.onlineMp3[0].success == "0") {
            await prefs.setString('user_id', value.onlineMp3[0].userId);
            await userController.getuser().whenComplete(() {
              if (userController.userId != null) {
                commonSnackBar(title: value.onlineMp3[0].msg, massageType: MassageType.success);
                Get.offAll(() => MyBottomNavigationBar());
              }
            });
          } else {
            commonSnackBar(title: value.onlineMp3[0].msg, massageType: MassageType.error);
            signOut();
          }
        });

        return result;
      } else {
        if (kDebugMode) {
          print("Google SignIn Error");
        }
        return null;
      }
    } catch (e, t) {
      print('$e \n $t');
    }
    return null;
  }

  Future<void> doSignInApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oAuthProvider = OAuthProvider('apple.com');
      final firebaseauth = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(firebaseauth);
      final firebaseUser = authResult.user;
      String? appleName = firebaseUser!.displayName ?? firebaseUser.email!.split("@").first;
      String? appleEmail = firebaseUser.email;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await HttpService()
          .getRegisterStream(name: appleName, email: appleEmail, image: firebaseUser.photoURL, type: "Apple", authId: firebaseUser.uid)
          .listen((value) async {
        if (value.onlineMp3[0].success == "1") {
          await prefs.setString('user_id', value.onlineMp3[0].userId);
          await userController.getuser().whenComplete(() {
            if (userController.userId != null) {
              commonSnackBar(title: value.onlineMp3[0].email, massage: value.onlineMp3[0].msg, massageType: MassageType.success);
              Get.offAll(() => MyBottomNavigationBar());
            }
          });
        } else {
          commonSnackBar(title: value.onlineMp3[0].email, massage: value.onlineMp3[0].msg, massageType: MassageType.error);
          signOut();
        }
      });
    } catch (e, t) {
      print('Apple login Error $e');
      print('Apple login Trace $t');
    }
  }

  Future<UserCredential?> facebookSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      LoginResult result = await FacebookAuth.instance.login(permissions: ['email', 'public_profile']);
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
          final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);

          await HttpService()
              .getRegisterStream(
                  email: userCredential.user!.email,
                  name: userCredential.user!.displayName,
                  type: "Facebook",
                  image: userCredential.user!.photoURL,
                  phone: userCredential.user!.phoneNumber,
                  authId: userCredential.user!.uid)
              .listen((value) async {
            if (value.onlineMp3[0].success == "1") {
              await prefs.setString('user_id', value.onlineMp3[0].userId);
              await userController.getuser().whenComplete(() {
                if (userController.userId != null) {
                  commonSnackBar(title: value.onlineMp3[0].email, massage: value.onlineMp3[0].msg, massageType: MassageType.success);
                  Get.offAll(() => MyBottomNavigationBar());
                }
              });
            } else {
              commonSnackBar(title: value.onlineMp3[0].email, massage: value.onlineMp3[0].msg, massageType: MassageType.error);
              signOut();
            }
          });
          return userCredential;
        case LoginStatus.cancelled:
          return null;
        case LoginStatus.failed:
          return null;
        default:
          return null;
      }
    } on FirebaseAuthException catch (e, stacktrace) {
      if (kDebugMode) {
        print("Error $e");
        print("StackTrace $stacktrace");
      }
    }
    return null;
  }

  Future signOut() async {
    assetsAudioPlayer.stop();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userController.isguest.value) {
      prefs.clear();
      prefs.remove('guest');
      Get.offAll(() => LoginScreen());
    } else {
      await auth.signOut();
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();
      prefs.remove('email');
      prefs.remove('user_id');
      prefs.clear();
      Get.offAll(() => LoginScreen());
    }
  }
}
