import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../config/hex_colors.dart';
import '../../config/size_config.dart';
import '../../constant/colors.dart';
import '../../widget/quicklink.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  final int numPages = 3;

  final PageController _pageController1 = PageController(initialPage: 0);

  int currentPage1 = 0;

  final int numPages1 = 3;

  final PageController _pageController2 = PageController(initialPage: 0);

  int _currentPage2 = 0;

  final int _numPages2 = 3;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages2; i++) {
      list.add(i == _currentPage2 ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: isActive ? 20 : 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.purple : Colors.purpleAccent,
          borderRadius: BorderRadius.circular(8)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * 5.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomAnimationBuilder<double>(
                      control: Control.play, // bind state variable to parameter
                      tween: Tween(begin: 0.0, end: 0.9),
                      duration: const Duration(seconds: 2),
                      delay: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/user.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "Good Moring. ",
                            style: TextStyle(
                              color: kLightGreyColor,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Cadet <Annie/>",
                          style: TextStyle(
                            color: kDefaultAppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.notification_add_outlined,
                  color: kLightGreyColor,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(
                    () {
                      currentPage = page;
                    },
                  );
                },
                children: const <Widget>[
                  PaymentCard(
                    image: 'assets/images/cardonee.png',
                  ),
                  PaymentCard(
                    image: 'assets/images/cardtwo.png',
                  ),
                  PaymentCard(
                    image: 'assets/images/cardthree.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3,
                  width: 80,
                  decoration: BoxDecoration(
                    color: currentPage == 0
                        ? kDefaultAppColor
                        : kLightGreyColor.withOpacity(0.5),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  height: 3,
                  width: 80,
                  decoration: BoxDecoration(
                    color: currentPage == 1
                        ? kDefaultAppColor
                        : kLightGreyColor.withOpacity(0.5),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Container(
                  height: 3,
                  width: 80,
                  decoration: BoxDecoration(
                    color: currentPage == 2
                        ? kDefaultAppColor
                        : kLightGreyColor.withOpacity(0.5),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CustomAnimationBuilder<double>(
                control: Control.play, // bind state variable to parameter
                tween: Tween(begin: 0.0, end: 1.1),
                duration: const Duration(seconds: 2),
                delay: const Duration(seconds: 2),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Text(
                  "Quick Links",
                  style: TextStyle(
                      color: HexColor("#3D0072"),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomAnimationBuilder<double>(
              duration: const Duration(seconds: 1),
              control: Control.play, // bind state variable to parameter
              tween: Tween(begin: -100.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.translate(
                  // animation that moves childs from left to right
                  offset: Offset(value, 0),
                  child: child,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuickLinks(
                    image: 'assets/images/san.png',
                    color: HexColor("#8807F7"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  QuickLinks(
                    image: 'assets/images/save.png',
                    color: HexColor("##E8356D"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  QuickLinks(
                    image: 'assets/images/book.png',
                    color: HexColor("#14B8A6"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  QuickLinks(
                    image: 'assets/images/pay.png',
                    color: HexColor("#FACC15"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(width: 5, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/chart.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController1,
                onPageChanged: (int page) {
                  setState(
                    () {
                      currentPage1 = page;
                    },
                  );
                },
                children: const <Widget>[
                  AdillaPlan(
                    image: 'assets/images/savemoney.png',
                  ),
                  AdillaPlan(
                    image: 'assets/images/insure.png',
                  ),
                  AdillaPlan(
                    image: 'assets/images/invest.png',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    if (_pageController1.hasClients) {
                      _pageController1.animateToPage(
                        --currentPage1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: () {
                    if (_pageController1.hasClients) {
                      _pageController1.animateToPage(
                        ++currentPage1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController2,
                onPageChanged: (int page) {
                  setState(
                    () {
                      _currentPage2 = page;
                    },
                  );
                },
                children: const <Widget>[
                  AdillaPlan(
                    image: 'assets/images/component.png',
                  ),
                  AdillaPlan(
                    image: 'assets/images/frameone.png',
                  ),
                  AdillaPlan(
                    image: 'assets/images/frametwo.png',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}

class PaymentCard extends StatelessWidget {
  final String image;
  const PaymentCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(right: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        // border: Border.all(width: 5, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AdillaPlan extends StatelessWidget {
  final String image;
  const AdillaPlan({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 15, right: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        // border: Border.all(width: 5, color: Colors.greenAccent),
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
