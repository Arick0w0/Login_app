import 'package:flutter/material.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/models/dashboard/top_course_model.dart';

class DashboardTopCourse extends StatelessWidget {
  const DashboardTopCourse({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var themeColor = isDark ? tSecondaryColor : tCardBgColor;

    final list = DashboardTopCourseModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 350,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: themeColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          list[index].title1,
                          style: txtTheme.headline3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Image(
                          image: AssetImage(list[index].image),
                          height: 110,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        onPressed: () {
                          if (list[index].onPress != null) {
                            list[index]
                                .onPress!(); // Invoke the callback function if it's not null.
                          }
                        },
                        child: Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashboardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(list[index].title2,
                              style: txtTheme.headline4,
                              overflow: TextOverflow.ellipsis),
                          Text(list[index].subHeading,
                              style: txtTheme.bodyText2,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
