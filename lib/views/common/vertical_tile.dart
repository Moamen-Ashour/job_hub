import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/reusable_text.dart';
import 'package:jobhub/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        height: hieght * 0.18,
        width: width,
        color: Color(
          kLightGrey.value,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(
                        kLightGrey.value,
                      ),
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/slack.png"),
                    ),
                    WidthSpacer(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: "Slack",
                          style: appstyle(
                            20,
                            Color(kDark.value),
                            FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.5,
                          child: ReusableText(
                              text: "Mobile Developer",
                              style: appstyle(
                                  18, Color(kDarkGrey.value), FontWeight.w600)),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(kLight.value),
                      child: Icon(Ionicons.chevron_forward),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "12k",
                      style: appstyle(23, Color(kDark.value), FontWeight.w600)),
                  ReusableText(
                      text: "/monthly",
                      style: appstyle(
                          23, Color(kDarkGrey.value), FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
