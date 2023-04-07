import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing/component/input_text_field.dart';
import 'package:missing/component/login_button.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 70,
                ),
                const SizedBox(
                  height: 20,
                ),

                //LOGIN
                Text(
                  'LOGIN',
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
                                myController: emailController,
                                focusNode: emailFocusNode,
                                onFiledSubmittedValue: (value) {},
                                keyBoardType: TextInputType.emailAddress,
                                obscureText: false,
                                hint: 'Email',
                                onValidator: (value) {
                                  return value.isEmpty ? 'enter email' : null;
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
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteName.forgotScreen);
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Forgot password?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ChangeNotifierProvider(
                          create: (_) => LoginController(),
                          child: Consumer<LoginController>(
                              builder: (context, provider, child) {
                            return LoginButton(
                              title: 'Login',
                              loading: provider.loading,
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  provider.login(context, emailController.text,
                                      passwordController.text);
                                }
                              },
                            );
                          })),
                      const SizedBox(
                        height: 10,
                      ),
                      //don't have account
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteName.registerScreen);
                        },
                        child: const Center(
                          child: Text.rich(
                            TextSpan(
                                text: 'Don\'t have account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Register here',
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
          ),
        ),
      ),
    );
  }
}
