import 'package:flutter/material.dart';

class DashboardCategoriesModel {
  final String title, heading, subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
      this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("JS", "Java Script", "10 Lessons", () {
      print("Title1");
    }),
    DashboardCategoriesModel("F", "Flutter ", "11 Lessons", () {
      print("Title2");
    }),
    DashboardCategoriesModel("H", "HTML", "18 Lessons", () {
      print("Title3");
    }),
    DashboardCategoriesModel("K", "Kotliln", "20 Lessons", () {
      print("Title4");
    }),
    DashboardCategoriesModel("P", "Python", "101 Lessons", () {
      print("Title5");
    }),
  ];
}
