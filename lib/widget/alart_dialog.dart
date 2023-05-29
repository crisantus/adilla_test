import 'package:ardilla_test/screens/login.dart';
import 'package:flutter/material.dart';

import '../config/hex_colors.dart';

anyStatus(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Are sure you want to ",
                      style: TextStyle(
                        color: HexColor("#3D0072"),
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'LOG OUT?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#3D0072"),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlertBtn(
                          color: Colors.red.shade100,
                          name: "Confirm",
                          onTap: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const LoginScreen(),
                              ),
                            );
                          },
                          txtColor: Colors.red),
                      const SizedBox(
                        width: 10,
                      ),
                      AlertBtn(
                        color: Colors.white,
                        name: "No, Cancel",
                        onTap: () {
                          Navigator.pop(context);
                        },
                        txtColor: Colors.black,
                      ),
                    ],
                  )
                ],
              )),
        ),
      );
    },
  );
}

exitStatus(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              height: 160,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Are sure you want to ",
                      style: TextStyle(
                        color: HexColor("#3D0072"),
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'EXIT THE APP?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#3D0072"),
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AlertBtn(
                          color: Colors.red.shade100,
                          name: "Yes",
                          onTap: () {
                            // Navigator.pushAndRemoveUntil(
                            //     context, LoginScreen(), (route) => false);
                          },
                          txtColor: Colors.red),
                      const SizedBox(
                        width: 10,
                      ),
                      AlertBtn(
                        color: Colors.white,
                        name: "No",
                        onTap: () {
                          Navigator.pop(context);
                        },
                        txtColor: Colors.black,
                      ),
                    ],
                  )
                ],
              )),
        ),
      );
    },
  );
}

class AlertBtn extends StatelessWidget {
  final Color color;
  final Color txtColor;
  final String name;
  final VoidCallback onTap;
  const AlertBtn({
    Key? key,
    required this.color,
    required this.txtColor,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}
