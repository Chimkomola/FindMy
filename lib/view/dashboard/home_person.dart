// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/services/session_manager.dart';
import 'package:missing/view/dashboard/person.dart';
import 'package:missing/view/dashboard/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool searchState = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref('MissingPeoplePosts');

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

  Widget missingperson() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const MissingPerson()));
        },
        focusColor: const Color(0xFF1F97AF),
        focusElevation: 16.0,
        backgroundColor: const Color(0xFF1F97AF),
        heroTag: 'Person',
        elevation: 2.0,
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget logout() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          FirebaseAuth auth = FirebaseAuth.instance;

          auth.signOut().then((value) {
            SessionController().userId = '';
            Navigator.pushNamed(context, RouteName.loginView);
          });
        },
        focusColor: const Color(0xFF1F97AF),
        focusElevation: 16.0,
        backgroundColor: const Color(0xFF1F97AF),
        heroTag: 'logging out',
        elevation: 2.0,
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'FIND',
              style: GoogleFonts.barlow(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              'MY',
              style: GoogleFonts.barlow(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: const Color(0xFF1F97AF),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // Go to settings page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SettingsScreen()));
            },
          )
        ],
      ),
      body: _buildStreamBuilderPerson(),
      floatingActionButton: AnimatedFloatingActionButton(
        colorEndAnimation: const Color(0xFF1F97AF),
        colorStartAnimation: const Color(0xFF1F97AF),
        animatedIconData: AnimatedIcons.add_event,
        fabButtons: <Widget>[
          missingperson(),
          logout(),
        ],
      ),
    );
  }

  _buildStreamBuilderPerson() {
    return StreamBuilder(
      stream: ref.onValue,
      builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        //check if data arrived
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
          List<dynamic> posts = [];
          posts.clear();
          posts = map.values.toList();
          //Display the posts
          return ListView.builder(
              itemCount: snapshot.data!.snapshot.children.length,
              itemBuilder: (BuildContext context, int index) {
                //Return the widget for the posts
                return CardUIPerson(
                    posts[index]['image'],
                    posts[index]['fullname'],
                    posts[index]['age'],
                    posts[index]['height'],
                    posts[index]['haircolor'],
                    posts[index]['missingdatelocation'],
                    posts[index]['contactdetails']);
              });
        }
      },
    );
  }

  Widget CardUIPerson(String image, String fullname, String age, String height,
      String haircolor, String missingdatelocation, String contactdetails) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(10),
        // ignore: avoid_unnecessary_containers
        child: Card(
          color: const Color(0xFF1F97AF),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => controller.toggle(),
                child: Image.network(
                  image,
                ),
              ),
              ScrollOnExpand(
                child: ExpandablePanel(
                  controller: controller,
                  theme: const ExpandableThemeData(
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                    tapHeaderToExpand: true,
                  ),
                  header: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      fullname,
                      style: GoogleFonts.barlow(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  collapsed: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age :$age",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Height :$height",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age :$age",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Height :$height",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hair Color :$haircolor",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Missing date | location :$missingdatelocation",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Contact details :$contactdetails",
                        style: GoogleFonts.barlow(
                            fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  builder: (_, collapsed, expanded) => Padding(
                    padding: const EdgeInsets.all(10).copyWith(top: 0),
                    child: Expandable(collapsed: collapsed, expanded: expanded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
