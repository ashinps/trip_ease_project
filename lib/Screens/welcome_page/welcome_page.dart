import 'package:flutter/material.dart';
import 'package:trip_ease_project/screens/Home/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/sign_in.dart';
import '../Login/login_page.dart';
import '../register/register_page.dart';


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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage(),));
              }, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal:70,vertical: 12.0),
              child: Text('Log in'),
            ),),
            SizedBox(height: 12,),

            //Sign up Button
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const RegisterPage(),));
                }, child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67,vertical: 12),
              child: const Text('Sign up'),
            )),
            SizedBox(height: 12,),

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
                      return Homepage();
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
                            return Homepage();
                          },
                        ),
                      );
                    }
                  });
                }
              },
              icon: Image.asset('assets/images/google-logo.png',
                height: 48,),
              label: Text('Sign in with Google'),
            )
          ],
        ),
      ),
    );
  }
}