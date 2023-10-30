import 'package:flutter/material.dart';

class DashboardTopCourseModel {
  final String title1, title2, image, subHeading;
  final VoidCallback? onPress;

  DashboardTopCourseModel(
      this.title1, this.image, this.title2, this.subHeading, this.onPress);

  static List<DashboardTopCourseModel> list = [
    DashboardTopCourseModel(
        "title1", "assets/images/dashboard/dash-01.png", "title1", "subTitle",
        () {
      print("Title1");
    }),
    DashboardTopCourseModel(
        "title2", "assets/images/dashboard/dash-01.png", "title2", "subTitle",
        () {
      print("Title2");
    }),
    DashboardTopCourseModel(
        "title3", "assets/images/dashboard/dash-01.png", "title3", "subTitle",
        () {
      print("Title3");
    }),
    DashboardTopCourseModel(
        "title4", "assets/images/dashboard/dash-01.png", "title4", "subTitle",
        () {
      print("Title4");
    }),
  ];
}
// "Programming Language",