import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  final TextEditingController? email;
  final TextEditingController? password;
  final bool obscureText;
  final Widget icon;
  final void Function()? onPressed;
  const CenterPart({
    required this.obscureText,
    required this.icon,
    required this.email,
    required this.password,
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),
        TextFormField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        )
      ],
    );
  }
}
