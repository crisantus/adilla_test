import 'package:flutter/material.dart';

import '../constant/colors.dart';

class AdiilaButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onTap;
  final Color btnColor;

  const AdiilaButton({
    Key? key,
    required this.buttonName,
    this.onTap,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: btnColor),
        child: Center(
            child: Text(
          buttonName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}

class AdiilaButtonBorder extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onTap;
  final Color btnColor;

  const AdiilaButtonBorder({
    Key? key,
    required this.buttonName,
    this.onTap,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: kDefaultAppColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: btnColor),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
            color: kDefaultAppColor,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}

class AdiilaButtonBorder1 extends StatelessWidget {
  final Widget buttonName;
  final VoidCallback? onTap;
  final Color btnColor;

  const AdiilaButtonBorder1({
    Key? key,
    required this.buttonName,
    this.onTap,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: kDefaultAppColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: btnColor),
        child: Center(child: buttonName),
      ),
    );
  }
}
