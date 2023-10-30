import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/models/user/user_model.dart';
import 'package:login_app/src/features/core/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var themeColor = isDark ? tSecondaryColor : tCardBgColor;
    var iconTheme = isDark ? tCardBgColor : tSecondaryColor;

    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: iconTheme,
        ),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headline4,
        ),
        elevation: 0,
        backgroundColor: themeColor,
        // backgroundColor: tPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  //Controllers
                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(
                    // -Warp this Widget whit FutureBuilder
                    children: [
                      // -- IMAGE whit ICON
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(tProfileImage),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tPrimaryColor),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields --------------------------------
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: fullName,
                            decoration: const InputDecoration(
                              label: Text(tFullName),
                              prefixIcon: Icon(LineAwesomeIcons.user),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: phoneNo,
                            decoration: const InputDecoration(
                                label: Text(tPhoneNo),
                                prefixIcon: Icon(LineAwesomeIcons.phone)),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: password,
                            decoration: const InputDecoration(
                                label: Text(tPassword),
                                prefixIcon: Icon(LineAwesomeIcons.fingerprint)),
                          ),

                          const SizedBox(height: tFormHeight),

                          //submint Form
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final user = UserModel(
                                  fullName: fullName.text.trim(),
                                  email: email.text.trim(),
                                  password: password.text.trim(),
                                  phoneNo: phoneNo.text.trim(),
                                );
                                await controller.updateRecord(user);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder()),
                              child: const Text(tEditProfile,
                                  style: TextStyle(color: tDarkColor)),
                            ),
                          ),
                          const SizedBox(height: tFormHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text.rich(
                                TextSpan(
                                  text: tJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: tJoinedAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.1),
                                      elevation: 0,
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none),
                                  child: const Text(tDelate))
                            ],
                          )
                        ],
                      ))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
