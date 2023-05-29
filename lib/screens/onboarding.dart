import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../model/onboarding_model.dart';
import '../widget/maincontent.dart';
import '../widget/navigation_type.dart';
import '../widget/skip_button.dart';
import '../widget/steps.dart';
import 'signup_1.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> _list = OnboardingModel.list;
  int page = 0;
  final _controller = PageController();
  int _currentPage = 0;
  final int _numPages = 3;
  var showAnimatedContainer = false;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
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
    SizeConfig().init(context);

    _controller.addListener(() {
      setState(() {
        page = _controller.page!.round();
      });
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // showAnimatedContainer
            //     ? Center(
            //         child: MyAnimatedContainer(),
            //       )
            //     :
            SafeArea(
              child: Column(
                children: [
                  const SkipButton(),
                  Expanded(
                    child: PageView.builder(
                        onPageChanged: (int page) {
                          setState(
                            () {
                              _currentPage = page;
                            },
                          );
                        },
                        controller: _controller,
                        itemCount: _list.length,
                        itemBuilder: (context, index) => MainContent(
                              list: _list,
                              index: index,
                            )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                        StepsContainer(
                          page: page,
                          list: _list,
                          controller: _controller,
                          showAnimatedContainerCallBack: (value) {
                            setState(() {
                              showAnimatedContainer = value;
                              if (value) {
                               
                                  Navigator.push(
                                    context,
                                    SlideTransition2(
                                      const SignUp1(),
                                    ),
                                  );
                               
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 4,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
