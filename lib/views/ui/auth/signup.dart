import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/controllers/login_provider.dart';
import 'package:jobhub/controllers/signup_provider.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (context, signUpNotifier, child) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              child: GestureDetector(
                onTap: () {
                  Get.back;
                },
                child: Icon(CupertinoIcons.arrow_left),
              ),
              text: "Sign Up",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                  text: "Hello, Welcome",
                  style: appstyle(
                    30,
                    Color(kDark.value),
                    FontWeight.w600,
                  ),
                ),
                ReusableText(
                  text: "Fill the details to signup for an account",
                  style: appstyle(
                    16,
                    Color(kDarkGrey.value),
                    FontWeight.w600,
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomTextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  hintText: "full Name",
                  validator: (name) {
                    if (name!.isEmail) {
                      return "Please write your Name";
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  validator: (email) {
                    if (email!.isEmail || !email.contains("@")) {
                      return "Please write a valid Email";
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  obscureText: signUpNotifier.isObsecure,
                  hintText: "Password",
                  validator: (password) {
                    if (signUpNotifier.passwordValidator(password ?? "")) {
                      return "Please write a valid password";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      signUpNotifier.isObsecure = !signUpNotifier.isObsecure;
                    },
                    child: Icon(
                      signUpNotifier.isObsecure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(kDark.value),
                    ),
                  ),
                ),
                const HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginPage());
                    },
                    child: ReusableText(
                      text: "Login",
                      style: appstyle(
                        14,
                        Color(kDark.value),
                        FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(text: 'Sign Up', onTap: () {}),
              ],
            ),
          ));
    });
  }
}
