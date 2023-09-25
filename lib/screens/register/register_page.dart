import 'package:flutter/material.dart';
import 'package:trip_ease_project/screens/home/homepage.dart';
import 'package:trip_ease_project/screens/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //variables
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();

  //boolean
  bool passEnable = false;
  bool confirmPassEnable = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //Title
                const Text("Register", style: TextStyle(fontSize: 30),),


                //Registration Form
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [


                        //username field
                        TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                            validator: (value) {
                              if (value == null || value.isEmpty|| !RegExp(r'^[a-zA-Z0-9_-]{3,20}$').hasMatch(value) ) {
                                return 'Please enter your name';
                              }
                              return null;
                            }
                        ),


                        const SizedBox(height: 20),


                        //email address field
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'example@gmail.com',
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                            validator: (value) {
                              if (value == null || value.isEmpty||  !RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Please enter your email';
                              }
                              return null;
                            }
                        ),


                        const SizedBox(height: 20),


                        //password field
                        TextFormField(
                          obscureText: !passEnable,
                          controller: passController,
                          decoration: InputDecoration(
                            hintText: '(8+chars,1lowercase,1uppercase,1digit,1symbol)',
                            labelText: "Password",
                            hintStyle: const TextStyle(fontSize: 14),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passEnable = !passEnable;
                                });
                              },
                              icon: Icon(passEnable ? Icons.visibility:Icons.visibility_off))),
                            validator: (value) {
                              if (value == null || value.isEmpty|| !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$').hasMatch(value)) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                        ),


                        const SizedBox(height: 20),


                        //Confirm password field
                        TextFormField(
                          obscureText: !confirmPassEnable,
                          controller: confirmPassController,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  confirmPassEnable = !confirmPassEnable;
                                });
                              },
                              icon: Icon(confirmPassEnable ? Icons.visibility:Icons.visibility_off))
                          ),
                            validator: (value) {
                              if (value == null || value.isEmpty|| value != passController.text) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                        ),

                        const SizedBox(height: 20),

                        //Register button
                        SizedBox(
                          height:40, width: 200,
                          child: ElevatedButton(
                            onPressed:(){
                              setState(() {
                                if(_formKey.currentState!.validate()){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage(),));
                                }
                              });
                            },
                            child: const Text('Register',style: TextStyle(
                              fontSize: 15
                            ),),
                          ),
                        ),

                        //Goto Login page
                        const SizedBox(height: 20),
                        Align(alignment:Alignment.center,child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[const Text('Already have an account?'),
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                            }, child: (const Text('Login',style: TextStyle(fontSize: 15),)))])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
