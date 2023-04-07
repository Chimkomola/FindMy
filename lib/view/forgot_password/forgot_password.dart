import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing/component/input_text_field.dart';
import 'package:missing/component/login_button.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/controllers/forgot_password_controller.dart';
import 'package:missing/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151E29),
      appBar: AppBar(
        title: Text(
          'Forgot Password',
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
                //LOGIN
                Text(
                  'Enter your email address\nto recover your password',
                  style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
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
                      ChangeNotifierProvider(
                        create: (_) => ForgotPasswordController(),
                        child: Consumer<ForgotPasswordController>(
                            builder: (context, provider, child) {
                          return LoginButton(
                            title: 'Recover',
                            loading: provider.loading,
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                provider.forgotPassword(
                                    context, emailController.text);
                              }
                            },
                          );
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
}
