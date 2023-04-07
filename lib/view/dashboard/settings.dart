import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing/controllers/profile_controller.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/services/session_manager.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.barlow(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => ProfileController(),
          child:
              Consumer<ProfileController>(builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                  stream:
                      ref.child(SessionController().userId.toString()).onValue,
                  builder: ((context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xFF8696A0), width: 4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: provider.image == null
                                      ? map['profile'].toString() == ""
                                          ? const Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 35,
                                            )
                                          : Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                map['profile'].toString(),
                                              ),
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                              errorBuilder:
                                                  (context, object, stack) {
                                                return Container(
                                                  child: const Icon(
                                                    Icons.error_outline,
                                                  ),
                                                );
                                              },
                                            )
                                      : Image.file(
                                          File(provider.image!.path).absolute),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              provider.pickImage(context);
                            },
                            child: const CircleAvatar(
                              radius: 14,
                              backgroundColor: Color(0xFF1F97AF),
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Account informatiom',
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.showUserNameDialogAlert(
                                  context, map['userName']);
                            },
                            child: ReusableRow(
                              title: 'Username',
                              value: map['userName'],
                              iconData: Icons.person_outline,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.showPhoneDialogAlert(
                                  context, map['phone']);
                            },
                            child: ReusableRow(
                              title: 'Phone',
                              value: map['phone'],
                              iconData: Icons.phone_outlined,
                            ),
                          ),
                          ReusableRow(
                            title: 'Email',
                            value: map['email'],
                            iconData: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Legal policies',
                            style: GoogleFonts.robotoMono(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.aboutScreen);
                              },
                              child: RichText(
                                text: const TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.info,
                                      color: Color(0xFF8696A0),
                                      size: 17,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'About',
                                    style: TextStyle(
                                      color: Color(0xFF8696A0),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          Divider(
                              color: const Color(0xFF1F97AF).withOpacity(0.4)),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteName.helpScreen);
                              },
                              child: RichText(
                                text: const TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.question_mark_outlined,
                                      color: Color(0xFF8696A0),
                                      size: 17,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Helps',
                                    style: TextStyle(
                                      color: Color(0xFF8696A0),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          Divider(
                              color: const Color(0xFF1F97AF).withOpacity(0.4)),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                FirebaseAuth auth = FirebaseAuth.instance;

                                auth.signOut().then((value) {
                                  SessionController().userId = '';
                                  Navigator.pushNamed(
                                      context, RouteName.loginView);
                                });
                              },
                              child: RichText(
                                text: const TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.logout_outlined,
                                      color: Color(0xFF8696A0),
                                      size: 17,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Logout',
                                    style: TextStyle(
                                      color: Color(0xFF8696A0),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  }),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  const ReusableRow(
      {super.key,
      required this.title,
      required this.iconData,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Color(0xFF8696A0)),
          ),
          leading: Icon(iconData, color: const Color(0xFF8696A0)),
          trailing: Text(
            value,
            style: const TextStyle(color: Color(0xFF8696A0)),
          ),
        ),
        Divider(color: const Color(0xFF1F97AF).withOpacity(0.4))
      ],
    );
  }
}
