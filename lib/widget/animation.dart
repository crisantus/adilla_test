import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../config/size_config.dart';

  final MovieTween tween = MovieTween()
    ..scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 2500))
        .tween('width', Tween(begin: 0.0, end: SizeConfig.screenWidth))
    ..scene(
            begin: const Duration(milliseconds: 0),
            duration: const Duration(milliseconds: 2500))
        .tween('height', Tween(begin: 0.0, end: 200.0));

 //Control control = Control.mirror;
//  CustomAnimationBuilder<double>(
//       duration: const Duration(seconds: 2),
//       control: control, // bind state variable to parameter
//       tween: Tween(begin: -50.0, end: 50.0),
//       builder: (context, value, child) {
//         return Transform.translate(
//           // animation that moves childs from left to right
//           offset: Offset(0, value),
//           child: child,
//         );
//       },
//       child: Image.asset(
//                       _list[index].image,
//                       height: SizeConfig.defaultSize! * 30,
//                       width: SizeConfig.defaultSize! * 30,
//                     ),
                  
//     )

