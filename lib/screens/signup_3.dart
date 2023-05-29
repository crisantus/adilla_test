import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../config/size_config.dart';
import '../constant/colors.dart';
import '../widget/adiila_button.dart';
import '../widget/adiila_text_feild.dart';
import '../widget/navigation_type.dart';
import 'login.dart';

class Signup3 extends StatefulWidget {
  const Signup3({Key? key}) : super(key: key);

  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              PlayAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 80.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return SizedBox(
                    //width: double.infinity,
                    height: value,
                    //color: Colors.pink,
                    child: Text(
                      "Complete your\nProfile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kDefaultAppColor,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.defaultSize! * 2.5),
                    ),
                  );
                },
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "username",
                prefixIcon: Icons.cruelty_free_sharp,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "First name",
                prefixIcon: Icons.account_box_outlined,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "Last name",
                prefixIcon: Icons.account_box_outlined,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "Phone Number",
                prefixIcon: Icons.phone_android_outlined,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "Invite Code",
                prefixIcon: Icons.manage_accounts_rounded,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              const AdiilaTextField(
                innerHint: "Password",
                prefixIcon: Icons.lock_clock_outlined,
                //controller: controller,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text.rich(
                  TextSpan(
                    text: "By Signing Up , You're ageering to our ",
                    style: const TextStyle(
                      color: kLightGreyColor,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: kDefaultAppColor),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      const TextSpan(
                        text: " and ",
                        style: TextStyle(
                          color: kLightGreyColor,
                        ),
                      ),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: kDefaultAppColor),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2.5,
              ),
              AdiilaButton(
                buttonName: "Create Account",
                onTap: () {
                  Navigator.push(
                    context,
                    SlideTransition2(
                      const LoginScreen(),
                    ),
                  );
                },
                btnColor: kDefaultAppColor,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
