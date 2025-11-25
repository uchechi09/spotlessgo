import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Text("Or sign in with "),
        InkWell(
          onTap: () {},
          child: Image.asset(
            "assets/images/google.png",
            width: 30,
            height: 30,
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
