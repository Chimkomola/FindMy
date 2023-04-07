import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF151E29),
        appBar: AppBar(
          title: Text(
            'About',
            style: GoogleFonts.barlow(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.info,
                color: Color(0xFF8696A0),
                size: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'About the application',
                style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'FIND',
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'MY ',
                    style: GoogleFonts.barlow(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF1F97AF),
                    ),
                  ),
                  const Text(
                    'is an application which focuses on posting people',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color(0xFF8696A0),
                    ),
                  ),
                ],
              ),
              const Text(
                'that are missing by filling in the important information that the app provides.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFF8696A0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This idea was implemented after a lot of young people started went missing in Malawi, so this was a big concern to me.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFF8696A0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Although there are several social media platforms, like whatsapp and facebook just to mention a few, this application provides the overall advantage of accessing all the people that have gone missing.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFF8696A0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Developers info',
                style: GoogleFonts.robotoMono(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Arnold Chimkomola is the one who developed the application and other than that, he is the CEO & founder of CHIMKOTECH LTD COMPANY.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFF8696A0),
                ),
              ),
            ]),
          ),
        )));
  }
}
