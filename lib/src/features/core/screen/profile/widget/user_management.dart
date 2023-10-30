import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/authentication/models/user/user_model.dart';
import 'package:login_app/src/features/core/controllers/profile_controller.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var themeColor = isDark ? tSecondaryColor : tCardBgColor;
    var iconTheme = isDark ? tCardBgColor : tSecondaryColor;
    var fieldtheme = isDark ? tSecondaryColor : tPrimaryColor;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              LineAwesomeIcons.angle_left,
              color: iconTheme,
            )),
        title: Text(
          "User Management ",
          style: Theme.of(context).textTheme.headline4,
        ),
        elevation: 0,
        backgroundColor: themeColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ALL Users", style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: 10),
              FutureBuilder(
                future: controller.getAllUser(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found.'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        UserModel user = snapshot.data![index];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: themeColor),
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: fieldtheme,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Icon(
                                LineAwesomeIcons.user_1,
                                color: iconTheme,
                              ),
                            ),
                            title: Text('${user.fullName}',
                                style: Theme.of(context).textTheme.headline4),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Phone: ${user.phoneNo}"),
                                Text("Email: ${user.email}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
