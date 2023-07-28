import 'package:flutter/material.dart';
import '/Screens/Home/Homepage.dart';
import '/Screens/forgotpassword/forgotpass.dart';
import '/Screens/register/register_page.dart';


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
                                 border: OutlineInputBorder(),
                                 labelText: "Email"
                               ),
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
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
                                     if (value == null || value.isEmpty) {
                                       return 'Please enter your password';
                                     }
                                     return null;
                                   },
                                   controller: passController,
                                   decoration: InputDecoration(
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
                 TextButton(onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(
                     builder: (context) => const Regstrpage(),));
                     },child: const Text("Register"),)
                ]
       )
              )
              ]
      )
    );
  }
}
