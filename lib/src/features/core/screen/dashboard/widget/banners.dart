import 'package:flutter/material.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var themeColor = isDark ? tSecondaryColor : tCardBgColor;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDark ? tSecondaryColor : tCardBgColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Image(
                        image: AssetImage(tBookmarkIcon),
                        width: 30,
                      ),
                    ),
                    Flexible(
                      child: Image(
                        image: AssetImage(tBannerImage1),
                        width: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Text(
                  tDashboardBannerTitle1,
                  style: txtTheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tDashboardSubTitle,
                  style: txtTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: tDashboardCardPadding),

        // ----- 2nd Banner ----
        Expanded(
            child: Column(
          // -- Card --
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: themeColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Image(
                          image: AssetImage(tBookmarkIcon),
                          width: 30,
                        ),
                      ),
                      Flexible(
                        child: Image(
                          image: AssetImage(tBannerImage1),
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    tDashboardBannerTitle2,
                    style: txtTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tDashboardSubTitle,
                    style: txtTheme.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    print("Tap View All");
                  },
                  child: const Text("View ALL")),
            )
          ],
        ))
      ],
    );
  }
}
