import 'package:ardilla_test/screens/signup_3.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../config/hex_colors.dart';
import '../config/size_config.dart';
import '../constant/colors.dart';
import '../widget/adiila_button.dart';
import '../widget/adiila_text_feild.dart';
import '../widget/navigation_type.dart';
import 'page_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controllerEmail = TextEditingController();
  var controllerPassword = TextEditingController();
  String? change;
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDefaultAppColor,
        elevation: 0.0,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: [
              Container(
                color: kDefaultAppColor,
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: PlayAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 90.0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return SizedBox(
                          width: double.infinity,
                          height: value,
                          //color: Colors.pink,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                height: 70,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Adiila",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              ),
              Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                margin: const EdgeInsets.only(
                  top: 150,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlayAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 400.0),
                          duration: const Duration(seconds: 2),
                          curve: Curves.easeOut,
                          delay: const Duration(seconds: 1),
                          builder: (context, value, child) {
                            return SizedBox(
                              width: value,
                              height: SizeConfig.defaultSize! * 6,
                              //color: Colors.pink,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Welcome !",
                                  style: TextStyle(
                                    color: HexColor("#3D0072"),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: const Text(
                            "Here’s how to Log in to access your account",
                            style: TextStyle(
                              color: kLightGreyColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: AdiilaTextField(
                            innerHint: "Email Address or Kode Hex",
                            prefixIcon: Icons.email_outlined,
                            controller: controllerEmail,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: AdiilaTextField(
                            innerHint: "Password",
                            prefixIcon: Icons.lock_clock_outlined,
                            controller: controllerPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: isPasswordVisible
                                  ? const Icon(Icons.visibility,
                                      //color: kLightGreyColor,
                                      color: Colors.red)
                                  : const Icon(Icons.visibility_off,
                                      //color: kLightGreyColor,
                                      color: Colors.red),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 40, bottom: 20, right: 20, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context, SlideTransition1(const ResetPassword()));
                              },
                              child: Text(
                                'forgot password?',
                                style: TextStyle(color: kDefaultAppColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 3,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: AdiilaButton(
                              buttonName: "Log in",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  SlideTransition2(
                                    const AppController(),
                                  ),
                                );
                              },
                              btnColor: kDefaultAppColor),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 1,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: AdiilaButtonBorder1(
                            buttonName: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: kDefaultAppColor),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Sign in with SAN ID",
                                  style: TextStyle(color: kDefaultAppColor),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                SlideTransition2(
                                  const Signup3(),
                                ),
                              );
                            },
                            btnColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 1,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text.rich(
                            TextSpan(
                              text: "Already a user? ",
                              style: const TextStyle(
                                color: kLightGreyColor,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Create Account',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kDefaultAppColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          SlideTransition2(
                                            const Signup3(),
                                          ),
                                        );
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
