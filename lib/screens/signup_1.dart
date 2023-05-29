import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../config/hex_colors.dart';
import '../config/size_config.dart';
import '../constant/colors.dart';
import '../widget/adiila_button.dart';
import '../widget/adiila_text_feild.dart';
import '../widget/navigation_type.dart';
import 'signup_2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);
  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  var controller = TextEditingController();
  String? change;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kDefaultAppColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: InkWell(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
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
                          delay: const Duration(seconds: 1),
                          // curve: Curves.easeOut,
                          builder: (context, value, child) {
                            return SizedBox(
                              width: value,
                              height: SizeConfig.defaultSize! * 6,
                              //color: Colors.pink,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  "Get Started",
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
                            "to create an account enter a valid email address",
                            style: TextStyle(
                              color: kLightGreyColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 4,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: AdiilaTextField(
                            innerHint: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            controller: controller,
                            onChanged: (value) {
                              setState(() {
                                change = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize! * 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: AdiilaButton(
                            buttonName: "Continue",
                            onTap: change != null
                                ? () {
                                    Navigator.push(
                                      context,
                                      SlideTransition2(
                                        const SignUp2(),
                                      ),
                                    );
                                  }
                                : () {},
                            btnColor: change != null
                                ? kDefaultAppColor
                                : const Color.fromARGB(255, 243, 177, 255),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                                    text: 'Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kDefaultAppColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          SlideTransition2(
                                            const SignUp2(),
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
