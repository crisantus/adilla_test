import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../constant/colors.dart';
import '../screens/signup_1.dart';
import 'navigation_type.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                SlideTransition2(
                  const SignUp1(),
                ),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 1.4, //14
                  color: kDefaultAppColor,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
