import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late ExpandableController controller;

  @override
  void initState() {
    super.initState();

    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      appBar: AppBar(
        title: Text(
          'Help',
          style: GoogleFonts.barlow(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.help,
                  color: Color(0xFF8696A0),
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color(0xFF151E29),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'How to register a missing person: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'On the homepage click on this ',
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.add,
                                    size: 17,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                TextSpan(text: ' icon and then click on this '),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.person_add,
                                  size: 17,
                                  color: Color(0xFFFFFFFF),
                                )),
                                TextSpan(
                                  text:
                                      ' icon and after that proceed with filling the necessary details of a missing person',
                                ),
                              ],
                              style: TextStyle(
                                color: Color(0xFF8696A0),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color(0xFF151E29),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'How to upload profile picture: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      'On the homepage navigate on the top right corner and click on this ',
                                ),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.settings,
                                  size: 17,
                                  color: Color(0xFFFFFFFF),
                                )),
                                TextSpan(text: ' icon and then click on this '),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.add,
                                  size: 17,
                                  color: Color(0xFFFFFFFF),
                                )),
                                TextSpan(
                                  text:
                                      ' icon and then upload your profile picture',
                                ),
                              ],
                              style: TextStyle(
                                color: Color(0xFF8696A0),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color(0xFF151E29),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'How to update username: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      'On the homepage navigate on the top right corner and click on this ',
                                ),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.settings,
                                  size: 17,
                                  color: Color(0xFFFFFFFF),
                                )),
                                TextSpan(
                                    text:
                                        ' icon and then tap on your username and then enter your new username and update '),
                              ],
                              style: TextStyle(
                                color: Color(0xFF8696A0),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color(0xFF151E29),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'How to update phone number: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      'On the homepage navigate on the top right corner and click on this ',
                                ),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.settings,
                                  size: 17,
                                  color: Color(0xFFFFFFFF),
                                )),
                                TextSpan(
                                    text:
                                        ' icon and then tap on your number and then enter the new number and update '),
                              ],
                              style: TextStyle(
                                color: Color(0xFF8696A0),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
