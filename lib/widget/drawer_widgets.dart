import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'alart_dialog.dart';

class DrawerAdillia extends StatelessWidget {
  const DrawerAdillia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            stops: const [
              0.1,
              0.9,
            ],
            colors: [
              kDefaultAppColor,
              Colors.purple,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Crisantus Ik",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    const DrawerCard(
                      image: "assets/images/profile.png",
                      name: "Profile",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const DrawerCard(
                      image: "assets/images/bag.png",
                      name: "Porfolio",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const DrawerCard(
                      image: "assets/images/payment.png",
                      name: "Payment",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DrawerCard(
                      image: "assets/images/investment.png",
                      name: "Investment",
                      widget: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'comming soon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    DrawerCard(
                      image: "assets/images/insurerance.png",
                      name: "Insurerance",
                      widget: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text(
                            'comming soon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const DrawerCard(
                      image: "assets/images/navi.png",
                      name: "Budgeting",
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    InkWell(
                      onTap: () {
                        anyStatus(context);
                      },
                      child: const DrawerCard(
                        image: "assets/images/logout.png",
                        name: "Log Out",
                      ),
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

class DrawerCard extends StatelessWidget {
  final String image;
  final String name;
  final Widget? widget;
  const DrawerCard({
    Key? key,
    required this.image,
    required this.name,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: 0.7,
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        widget ?? Container()
      ],
    );
  }
}
