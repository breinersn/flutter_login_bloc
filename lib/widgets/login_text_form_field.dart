import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final String iconPath, initialValue, hintText, labelText;
  final FormFieldValidator<String> validator;
  final void Function(String) onFieldSubmitted;
  final bool obscureText;

  const LoginTextFormField(
      {super.key,
      required this.focusNode,
      required this.iconPath,
      required this.initialValue,
      required this.hintText,
      required this.labelText,
      required this.validator,
      required this.onFieldSubmitted,
      required this.obscureText});

  // LoginTextFormField(
  //     {Key key,
  //     @required this.iconPath,
  //     this.initialValue = '',
  //     this.hintText='',
  //     this.labelText='',
  //     this.validator,
  //     this.focusNode,
  //     this.obscureText=false,
  //     this.onFieldSubmitted})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Container(
            width: 70,
            height: 40,
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(iconPath, color: Colors.black54),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.light,
      textInputAction: TextInputAction.next,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      obscureText: obscureText,
    );
  }
}
