import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/models/request/auth/login_model.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/services/helpers/auth_helper.dart';
import 'package:jobhub/views/ui/auth/update_user.dart';
import 'package:jobhub/views/ui/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends ChangeNotifier {
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool newState) {
    _obscureText = newState;
    notifyListeners();
  }

  bool _firstTime = true;

  bool get firstTime => _firstTime;

  set firstTime(bool newState) {
    _firstTime = newState;
    notifyListeners();
  }

  bool? _entrypoint;

  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool("entrypoint") ?? false;
    loggedIn = prefs.getBool("loggedIn") ?? false;
  }

  final loginFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();

  bool validateAndSave() {
    final form = loginFormKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool profileValidateAndSave() {
    final form = profileFormKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userLogin(LoginModel model) {
    AuthHelper.login(model).then((response) {
      if (response && firstTime) {
        Get.off(() => const PersonalDetails());
      } else if (response && !firstTime) {
        Get.off(() => const MainScreen());
      } else if (!response) {
        Get.snackbar(
          "Sign Failed",
          "Please Check You Credentials",
          colorText: Color(kLight.value),
          backgroundColor: Colors.red,
          icon: Icon(Icons.add_alert),
        );
      }
    });
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.remove("token");
    _firstTime = false;
  }

  updateProfile(ProfileUpdateReq profileUpdateReq) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("userId");
    print(userId);

    AuthHelper.updateProfile(profileUpdateReq, userId ?? "").then((response) {
      if (response) {
        Get.snackbar(
          "Profile Updated",
          "Enjoy your search",
          colorText: Color(kDark.value),
          backgroundColor: Color(kLightBlue.value),
          icon: const Icon(Icons.add_alert),
        );

        Future.delayed(const Duration(seconds: 3))
            .then((value) => Get.offAll(() => const MainScreen()));
      } else {
        Get.snackbar(
          "Updating Failed",
          "Please Try Again",
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }
}
