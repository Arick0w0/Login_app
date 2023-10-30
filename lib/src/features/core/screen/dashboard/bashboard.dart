import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/core/screen/dashboard/widget/appbar.dart';
import 'package:login_app/src/features/core/screen/dashboard/widget/banners.dart';
import 'package:login_app/src/features/core/screen/dashboard/widget/categories.dart';
import 'package:login_app/src/features/core/screen/dashboard/widget/search.dart';
import 'package:login_app/src/features/core/screen/dashboard/widget/top_courses.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    // -- Variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Text header ---
              Text(
                tDashboardTitle,
                style: txtTheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headline2,
              ),
              const SizedBox(height: tDashboardPadding),

              // -- Search Box --
              DashboardSearch(txtTheme: txtTheme),
              const SizedBox(height: tDashboardPadding),

              // -- Categories -- finish
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(height: tDashboardPadding),

              // -- Banners --
              DashboardBanner(txtTheme: txtTheme),
              SizedBox(height: tDashboardPadding),

              // -- Top Course -- finish
              Text(tDashboardTopCourses,
                  style: txtTheme.headline4?.apply(fontSizeFactor: 1.2)),
              DashboardTopCourse(txtTheme: txtTheme),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
