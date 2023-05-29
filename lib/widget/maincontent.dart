import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../config/size_config.dart';
import '../constant/colors.dart';
import '../model/onboarding_model.dart';
import 'animation.dart';

class MainContent extends StatefulWidget {
  const MainContent(
      {Key? key, required List<OnboardingModel> list, required this.index})
      : _list = list,
        super(key: key);

  final List<OnboardingModel> _list;
  final int index;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  Control control = Control.play;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PlayAnimationBuilder<Movie>(
                tween: tween, // Pass in tween
                duration: tween.duration, // Obtain duration
                builder: (context, value, child) {
                  return SizedBox(
                    width: value.get('width'), // Get animated values
                    height: value.get('height'),
                    // color: value.get('color'),
                    child: Image.asset(
                      widget._list[widget.index].image,
                      height: SizeConfig.defaultSize! * 30,
                      width: SizeConfig.defaultSize! * 30,
                    ),
                  );
                },
              )),
          CustomAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            control: control, // bind state variable to parameter
            tween: Tween(begin: -10.0, end: 10.0),
            builder: (context, value, child) {
              return Transform.translate(
                // animation that moves childs from left to right
                offset: Offset(0, value),
                child: child,
              );
            },
            child: Text(
              widget._list[widget.index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kDefaultAppColor,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.defaultSize! * 2.9),
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize,
          ),
          Text(
            widget._list[widget.index].text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kLightGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.defaultSize! * 1.0),
          ),
        ],
      ),
    );
  }
}
