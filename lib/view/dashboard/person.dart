import 'dart:collection';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:missing/component/input_text_field.dart';
import 'package:missing/component/login_button.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/utils/utils.dart';

class MissingPerson extends StatefulWidget {
  const MissingPerson({Key? key}) : super(key: key);

  @override
  State<MissingPerson> createState() => _MissingPersonState();
}

class _MissingPersonState extends State<MissingPerson> {
  bool showSpinner = false;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  XFile? imageFile;

  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final hairColorController = TextEditingController();
  final missingController = TextEditingController();
  final contactController = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final ageFocusNode = FocusNode();
  final heightFocusNode = FocusNode();
  final hairColorFocusNode = FocusNode();
  final missingFocusNode = FocusNode();
  final contactFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      appBar: AppBar(
        title: Text(
          'Missing person',
          style: GoogleFonts.barlow(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  child: imageFile == null
                      ? InkWell(
                          onTap: () async {
                            _showDialog();
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
                        )
                      : Image.file(
                          File(imageFile!.path),
                          height: 200,
                          width: 200,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: fullNameController,
                                focusNode: fullNameFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Name',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'name is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: ageController,
                                focusNode: ageFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Age',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'age is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: heightController,
                                focusNode: heightFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Height',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'height is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: hairColorController,
                                focusNode: hairColorFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Hair color',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'hair color is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: missingController,
                                focusNode: missingFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Missing date | Location',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'missing date is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F97AF),
                            border: Border.all(
                              color: const Color(0xFF1F97AF),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InputTextField(
                                myController: contactController,
                                focusNode: contactFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.phone,
                                obscureText: false,
                                hint: 'Contact',
                                onValidator: (value) {
                                  return value.isEmpty
                                      ? 'phone number is required'
                                      : null;
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0, left: 22.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              minimumSize: const Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            child: showSpinner
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      CircularProgressIndicator(
                                          color: Colors.black),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        'Please wait...',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : const Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                            onPressed: () async {
                              if (imageFile == null) {
                                Utils.toastMessage('Please select an image');

                                if (showSpinner) return;
                                setState(() => showSpinner = true);
                                await Future.delayed(
                                    const Duration(seconds: 8));
                                setState(() => showSpinner = false);
                              } else {
                                if (showSpinner) return;
                                setState(() => showSpinner = true);
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                setState(() => showSpinner = false);

                                if (_formKey.currentState!.validate()) {
                                  String fullName = fullNameController.text;
                                  String age = ageController.text;
                                  String height = heightController.text;
                                  String hairColor = hairColorController.text;
                                  String missingDate = missingController.text;
                                  String contact = contactController.text;

                                  firebase_storage.Reference storageRef =
                                      firebase_storage.FirebaseStorage.instance
                                          .ref()
                                          .child('PeopleImages')
                                          .child(
                                              "${new DateTime.now().microsecondsSinceEpoch}.${imageFile?.path}");
                                  firebase_storage.UploadTask uploadTask =
                                      storageRef.putFile(File(imageFile!.path));

                                  await Future.value(uploadTask);
                                  final imageUrl =
                                      await storageRef.getDownloadURL();
                                  String url = imageUrl.toString();
                                  DatabaseReference databaseReference =
                                      FirebaseDatabase.instance
                                          .ref()
                                          .child('MissingPeoplePosts');
                                  String? uploadId =
                                      databaseReference.push().key;
                                  HashMap map = HashMap();
                                  map['fullname'] = fullName;
                                  map['age'] = age;
                                  map['height'] = height;
                                  map['haircolor'] = hairColor;
                                  map['missingdatelocation'] = missingDate;
                                  map['contactdetails'] = contact;
                                  map['image'] = url;

                                  databaseReference.child(uploadId!).set(map);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                      context, RouteName.homeScreen);

                                  Utils.toastMessage('Post added successfully');
                                }
                              }
                              // ignore: use_build_context_synchronously
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: const Text('You want to take a picture from?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Text('Gallery'),
                    onTap: () {
                      pickGalleryImage();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: const Text('Camera'),
                    onTap: () {
                      pickCameraImage();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future pickGalleryImage() async {
    imageFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {});
    Navigator.of(context).pop();
  }

  Future pickCameraImage() async {
    imageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    setState(() {});
    Navigator.of(context).pop();
  }
}
