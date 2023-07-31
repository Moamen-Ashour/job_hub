import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/controllers/exports.dart';
import 'package:jobhub/controllers/login_provider.dart';
import 'package:jobhub/models/request/auth/profile_update_model.dart';
import 'package:jobhub/services/helpers/auth_helper.dart';
import 'package:jobhub/views/common/custom_btn.dart';
import 'package:jobhub/views/common/custom_textfield.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController skill0 = TextEditingController();
  TextEditingController skill1 = TextEditingController();
  TextEditingController skill2 = TextEditingController();
  TextEditingController skill3 = TextEditingController();
  TextEditingController skill4 = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    location.dispose();
    skill0.dispose();
    skill1.dispose();
    skill2.dispose();
    skill3.dispose();
    skill4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
        return Form(
          key: loginNotifier.profileFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 60.h,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                      text: "Personal Details",
                      style: appstyle(
                        35,
                        Color(kDark.value),
                        FontWeight.bold,
                      )),
                  Consumer<ImageUpLoader>(
                    builder: (context, imageUploader, childe) {
                      return imageUploader.imageFile.isEmpty
                          ? GestureDetector(
                              onTap: () {
                                imageUploader.pickImage();
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(kLightBlue.value),
                                child: Center(
                                  child: Icon(
                                    Icons.photo_filter_rounded,
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                imageUploader.imageFile.clear();
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(kLightBlue.value),
                                backgroundImage:
                                    FileImage(File(imageUploader.imageFile[0])),
                              ));
                    },
                  )
                ],
              ),
              HeightSpacer(size: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: location,
                      hintText: "Location",
                      keyboardType: TextInputType.text,
                      validator: (location) {
                        if (location!.isEmpty) {
                          return "Please enter a valid location";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: phone,
                      hintText: "Phone",
                      keyboardType: TextInputType.phone,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return "Please enter a valid phone";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    ReusableText(
                        text: "Professional Skills",
                        style: appstyle(
                          30,
                          Color(kDark.value),
                          FontWeight.bold,
                        )),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill0,
                      hintText: "Profesional Skills ",
                      keyboardType: TextInputType.phone,
                      validator: (skill0) {
                        if (skill0!.isEmpty) {
                          return "Please enter a skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill1,
                      hintText: "Profesional Skills ",
                      keyboardType: TextInputType.phone,
                      validator: (skill1) {
                        if (skill1!.isEmpty) {
                          return "Please enter a skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill2,
                      hintText: "Profesional Skills ",
                      keyboardType: TextInputType.phone,
                      validator: (skill2) {
                        if (skill2!.isEmpty) {
                          return "Please enter a skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill3,
                      hintText: "Profesional Skills ",
                      keyboardType: TextInputType.phone,
                      validator: (skill3) {
                        if (skill3!.isEmpty) {
                          return "Please enter a skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 10),
                    CustomTextField(
                      controller: skill4,
                      hintText: "Profesional Skills ",
                      keyboardType: TextInputType.phone,
                      validator: (skill4) {
                        if (skill4!.isEmpty) {
                          return "Please enter a skill";
                        } else {
                          return null;
                        }
                      },
                    ),
                    HeightSpacer(size: 20),
                    CustomButton(
                      onTap: () {},
                      text: "Update Profile",
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
