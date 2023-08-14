import 'package:flutter/material.dart';
import 'package:trip_ease_project/Screens/Home/homepage.dart';
import 'package:trip_ease_project/Screens/forgot_password/forgot-password.dart';
import 'package:trip_ease_project/Screens/register/register_page.dart';

import 'sign_in.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text("Welcome",style: TextStyle(fontSize: 40),),
          ),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage(),));
            }, child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:70,vertical: 12.0),
              child: const Text('Log in'),
            )),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const RegisterPage(),));
          }, child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 67,vertical: 12),
            child: const Text('Sign up'),
          )),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 22),
            child: OutlinedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black)
                ),
                onPressed: (){
                    signInWithGoogle().then((result){
                      if(result != null){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
                      }
                    });
                },

                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Image(height:32 ,width: 32,
                        image: AssetImage("assets/images/google-logo.png")),
                    SizedBox(width: 10,),
                    Text("Login with Google")]),
                )),
          )
        ],
      ),
    );
  }
}


class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}


class _LoginpageState extends State<Loginpage> {

  //variables
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var email="", password="";
  final _formKey = GlobalKey<FormState>();

  bool passEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(    //Scaffold
      body: ListView(
          children:[
            Center(
            child:
                 Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const CircleAvatar(
                           radius: 150,
                           backgroundColor: Colors.white,
                           backgroundImage: AssetImage('assets/images/img_1.jpg'),
                         ),
                         // Image.asset("assets/images/img_1.jpg",height: 300,width: 300,),


                         Form(
                           key: _formKey,
                           child: Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: Column(
                               children: [

                                 //emailField
                               TextFormField(
                               controller: emailController,
                               decoration: const InputDecoration(
                                 hintText: 'example@gmail.com',
                                 border: OutlineInputBorder(),
                                 labelText: "Email"
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty|| !RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                   return 'Please enter your email';
                                 }
                                 return null;
                               }
                             ),

                                 const SizedBox(height: 20),

                                 //passField
                                 TextFormField(
                                   obscureText: !passEnable,
                                   validator: (value) {
                                     if (value == null || value.isEmpty||!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$').hasMatch(value)) {
                                       return 'Please enter your password';
                                     }
                                     return null;
                                   },
                                   controller: passController,
                                   decoration: InputDecoration(
                                       hintText: '(8+chars,1lowercase,1uppercase,1digit,1symbol)',
                                       hintStyle: TextStyle(fontSize: 14),
                                       border: const OutlineInputBorder(),
                                       labelText: "Password",
                                       suffixIcon: IconButton(
                                           onPressed: (){
                                            setState(() {
                                              passEnable = !passEnable;
                                         });
                                       },
                                      icon: Icon(passEnable ?
                                      Icons.visibility: Icons.visibility_off)))),
                               ]
                             )
                           )
                         ),

                 Padding(
                   padding: const EdgeInsets.all(10.0),
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children:[
                         TextButton(onPressed: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Forgotpw(),));
                         },child: const Text("Forgot password?")),
                         ],)

                 ),

                 SizedBox(
                   height: 40, width: 200,
                   child: ElevatedButton(
                     onPressed: (){
                     setState(() {
                       if(_formKey.currentState!.validate()){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage(),));
                       }
                     });
                 },child: const Text("Login",
                   style:TextStyle(fontSize: 15)),
                 ),
                 ),

                 const SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Don't have an account?"),
                     TextButton(onPressed: () {
                       Navigator.pushReplacement(context, MaterialPageRoute(
                         builder: (context) => const RegisterPage(),));
                         },child: const Text("Sign Up"),),
                   ],
                 )
                ]
       )
              )
              ]
      )
    );
  }
}
