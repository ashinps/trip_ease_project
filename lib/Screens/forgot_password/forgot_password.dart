import 'package:flutter/material.dart';
class Forgotpw extends StatefulWidget {
  const Forgotpw({super.key});

  @override
  State<Forgotpw> createState() => _ForgotpwState();
}

class _ForgotpwState extends State<Forgotpw> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Please try to remember!"),
      ),
    );
  }
}
