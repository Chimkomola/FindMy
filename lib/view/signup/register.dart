import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing/component/input_text_field.dart';
import 'package:missing/component/login_button.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/utils/utils.dart';
import 'package:missing/controllers/register_controller.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      body: SafeArea(
        child: Center(
          child: ChangeNotifierProvider(
            create: (_) => RegisterController(),
            child: Consumer<RegisterController>(
                builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Register
                    Text(
                      'REGISTER',
                      style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    myController: userNameController,
                                    focusNode: userNameFocusNode,
                                    onFiledSubmittedValue: (value) {},
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    hint: 'Username',
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'enter username'
                                          : null;
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    myController: phoneController,
                                    focusNode: phoneFocusNode,
                                    onFiledSubmittedValue: (value) {},
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    hint: 'Contact',
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'phone number'
                                          : null;
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    myController: emailController,
                                    focusNode: emailFocusNode,
                                    onFiledSubmittedValue: (value) {
                                      Utils.fieldFocus(context, emailFocusNode,
                                          passwordFocusNode);
                                    },
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    hint: 'Email',
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'enter email'
                                          : null;
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                                    myController: passwordController,
                                    focusNode: passwordFocusNode,
                                    onFiledSubmittedValue: (value) {},
                                    keyBoardType: TextInputType.emailAddress,
                                    obscureText: true,
                                    hint: 'Password',
                                    onValidator: (value) {
                                      return value.isEmpty
                                          ? 'enter password'
                                          : null;
                                    }),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginButton(
                            title: 'Sign in',
                            loading: provider.loading,
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                provider.register(
                                    context,
                                    userNameController.text,
                                    phoneController.text,
                                    emailController.text,
                                    passwordController.text);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //don't have account
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.loginView);
                            },
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                    text: 'Already have account?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Login here',
                                        style: TextStyle(
                                          color: Color(0xFF1F97AF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
