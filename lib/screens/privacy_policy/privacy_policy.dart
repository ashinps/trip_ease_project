import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Privacy policy'),
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Text(
              // Insert your privacy policy text here
              '''Welcome to the Trip Ease (referred to as "we," "us," or "our") Trip Planner App. We are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines the types of information we may collect from you, how we use it, and the choices you have concerning your data. By using the Trip Ease Trip Planner App, you consent to the practices described in this Privacy Policy.
         Support mail id: support@gmail.com
          ''',
              style: TextStyle(
                fontSize: 20.0,

              ),
              textAlign: TextAlign.justify, // Set text alignment to justify
            ),
            ),
        );
  }
}