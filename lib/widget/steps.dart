import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../constant/colors.dart';
import '../model/onboarding_model.dart';

class StepsContainer extends StatelessWidget {
  final int page;
  final List<OnboardingModel> list;
  final PageController controller;
  final Function showAnimatedContainerCallBack;
  const StepsContainer({
    Key? key,
    required this.page,
    required this.list,
    required this.controller,
    required this.showAnimatedContainerCallBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * 4.5,
      height: SizeConfig.defaultSize! * 4.5,
      child: Stack(
        children: [
          SizedBox(
            width: SizeConfig.defaultSize! * 4.5,
            height: SizeConfig.defaultSize! * 4.5,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kDefaultAppColor),
                value: (page + 1) / (list.length + 1)),
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (page < list.length && page != list.length - 1) {
                  controller.animateToPage(page + 1,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInCirc);
                  showAnimatedContainerCallBack(false);
                } else {
                  showAnimatedContainerCallBack(true);
                }
              },
              child: Container(
                width: SizeConfig.defaultSize! * 3.5,
                height: SizeConfig.defaultSize! * 3.5,
                decoration: BoxDecoration(
                    color: kDefaultAppColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0))),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
