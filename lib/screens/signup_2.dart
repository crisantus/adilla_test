import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../config/size_config.dart';
import '../constant/colors.dart';
import '../widget/adiila_button.dart';
import '../widget/navigation_type.dart';
import 'signup_3.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 35, left: 10),
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
              height: SizeConfig.defaultSize! * 5,
            ),
            Align(
              alignment: Alignment.center,
              child: PlayAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 300.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return SizedBox(
                    //width: double.infinity,
                    height: value,
                    //color: Colors.pink,
                    child: Image.asset(
                      "assets/images/arrows.png",
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 4,
            ),
          
            CustomAnimationBuilder<double>(
              control: Control.play, // bind state variable to parameter
              tween: Tween(begin: 0.0, end: 10.0),
              duration: const Duration(seconds: 2),
              delay: const Duration(seconds: 1),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Text(
                "Verify your email\naddress",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDefaultAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.defaultSize! * 0.25,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 4,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AdiilaButtonBorder(
                buttonName: "Open Email App",
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
              height: SizeConfig.defaultSize! * 2,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AdiilaButton(
                buttonName: "Continue",
                onTap: () {
                  Navigator.push(
                    context,
                    SlideTransition2(
                      const Signup3(),
                    ),
                  );
                },
                btnColor: kDefaultAppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
