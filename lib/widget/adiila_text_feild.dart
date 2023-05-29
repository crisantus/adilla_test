import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/colors.dart';

class AdiilaTextField extends StatelessWidget {
  final String? hint;
  final String? innerHint;
  final Color? hintColour;
  final FontWeight? hintWeight;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? formatters;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enabled;
  final TextInputType? textInputType;
  final bool multiline;
  final int? maxLength;
  final Color? boaderColor;
  final IconData prefixIcon;

  const AdiilaTextField(
      {Key? key,
      this.hint,
      this.multiline = false,
      this.controller,
      this.formatters,
      this.onChanged,
      this.obscureText = false,
      this.hintColour,
      this.hintWeight,
      this.innerHint,
      this.suffixIcon,
      this.enabled = true,
      this.textInputType,
      this.maxLength,
      required this.prefixIcon,
      this.boaderColor})
      : super(key: key);

  final Color borderColor = Colors.grey;
  final Color textfieldColor = Colors.white;
  final Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            constraints: BoxConstraints(
              maxHeight: multiline ? size.width * 12 : 70,
            ),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     border: Border.all(color: borderColor),
            //     color: textfieldColor),
            child: TextField(
              maxLines: multiline ? null : 1,
              controller: controller,
              cursorColor: kDefaultAppColor,
              inputFormatters: formatters,
              style: const TextStyle(
                color: Colors.black,
              ),
              onChanged: (v) => onChanged?.call(v),
              obscureText: obscureText,
              enabled: enabled,
              maxLength: maxLength,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: innerHint,
                hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
                prefixIcon: Icon(prefixIcon, color: kLightGreyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    color: kDefaultAppColor,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ))
      ],
    );
  }
}

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     this.validateField,
//     this.suffixIcon,
//     required this.labelText,
//     this.onPressed,
//     this.obsecureText = false,
//   }) : super(key: key);

//   final controller;
//   final suffixIcon;

//   final String? labelText;
//   final validateField;
//   final onPressed;
//   final bool isPasswordVisible = false;
//   final bool obsecureText;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
//       height: 60,
//       width: double.infinity,
//       child: TextFormField(
//         obscureText: obsecureText,
//         validator: validateField,
//         controller: controller,
//         style: const TextStyle(color: Colors.black),
//         cursorColor: kDefaultAppColor,
//         decoration: InputDecoration(
//             suffixIcon: suffixIcon,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
//             ),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 1, color: Colors.grey.shade700)),
//             hintText: '  $labelText  ',
//             hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14),
//             labelText: labelText,
//             labelStyle:
//                 TextStyle(color: Colors.grey.shade700, letterSpacing: 0.5)),
//       ),
//     );
//   }
// }
