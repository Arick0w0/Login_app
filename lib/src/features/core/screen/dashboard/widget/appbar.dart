import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/core/screen/profile/profile_screen.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var themeColor = isDark ? tSecondaryColor : tCardBgColor;
    var iconTheme = isDark ? tCardBgColor : tSecondaryColor;

    return AppBar(
      leading: Icon(
        Icons.menu,
        color: iconTheme,
      ),
      title: Text(
        tAppName,
        style: Theme.of(context).textTheme.headline4,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: themeColor,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 17, top: 7, bottom: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: tCardBgColor),
          child: IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),

            // AuthenticationRepository.instance.logout();

            icon: const Image(
              image: AssetImage(tUserProfileImage),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
