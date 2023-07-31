import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_bar.dart';
import 'package:jobhub/views/common/app_style.dart';
import 'package:jobhub/views/common/drawer/drawer_widget.dart';
import 'package:jobhub/views/common/heading_widget.dart';
import 'package:jobhub/views/common/height_spacer.dart';
import 'package:jobhub/views/common/search.dart';
import 'package:jobhub/views/common/vertical_tile.dart';
import 'package:jobhub/views/ui/jobs/job_page.dart';
import 'package:jobhub/views/ui/search/searchpage.dart';

import 'jobs/widgets/horizontal_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: DrawerWidget(),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(
                12.h,
              ),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpacer(size: 10),
              Text(
                "Search \n Find & Apply",
                style: appstyle(
                  40,
                  Color(kDark.value),
                  FontWeight.bold,
                ),
              ),
              HeightSpacer(size: 40),
              SearchWidget(
                onTap: () {
                  Get.to(() => const SearchPage());
                },
              ),
              HeightSpacer(size: 30),
              HeadingWidget(
                text: 'Popular Jobs',
                onTap: () {},
              ),
              HeightSpacer(size: 15),
              SizedBox(
                height: hieght * 0.28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return JobHorizontalTile(
                        onTap: () {
                          Get.to(() => const JobPage(
                                id: '12',
                                title: "Facebook",
                              ));
                        },
                      );
                    }),
              ),
              HeightSpacer(size: 20),
              HeadingWidget(
                text: 'Recently Posted',
                onTap: () {},
              ),
              HeightSpacer(size: 20),
              VerticalTile()
            ],
          ),
        ),
      )),
    );
  }
}
