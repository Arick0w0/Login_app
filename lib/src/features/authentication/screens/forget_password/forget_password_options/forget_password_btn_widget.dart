import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: Colors.black26,
          color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color getColorBasedOnTheme(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode ? Colors.grey.shade800 : Colors.black26;
  }
}
