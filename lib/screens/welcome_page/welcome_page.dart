import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trip_ease_project/screens/home/homepage.dart';
import 'package:trip_ease_project/screens/login/login_page.dart';
import 'package:trip_ease_project/screens/register/register_page.dart';

import 'package:trip_ease_project/utils/sign_in.dart';

class WelcomePage extends StatelessWidget {
  Future<bool> isLoggedIn()async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('LoggedIn')?? false;
  }
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Welcome Title
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Welcome",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'ChelaOne'
                  )),
            ),

            //Login Button
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage(),));
              }, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal:70,vertical: 12.0),
              child: Text('Log in'),
            ),),
            const SizedBox(height: 12,),

            //Sign up Button
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const RegisterPage(),));
                }, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 67,vertical: 12),
              child: Text('Sign up'),
            )),
            const SizedBox(height: 12,),

            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: ()async {
                bool loggedIn = await isLoggedIn();
                if (loggedIn) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return const Homepage();
                    },
                    ),
                  );
                } else {
                  await signInWithGoogle().then((result) {
                    if (result != null) {
                      SharedPreferences.getInstance().then((pref){
                        pref.setBool('LoggedIn', true);
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Homepage();
                          },
                        ),
                      );
                    }
                  });
                }
              },
              icon: Image.asset('assets/images/google-logo.png',
                height: 48,),
              label: const Text('Sign in with Google'),
            )
          ],
        ),
      ),
    );
  }
}