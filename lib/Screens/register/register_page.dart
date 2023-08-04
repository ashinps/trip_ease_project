import 'package:flutter/material.dart';
import '/Screens/Home/homepage.dart';
import '/Screens/Login/login_page.dart';

class Regstrpage extends StatefulWidget {
  const Regstrpage({Key? key}) : super(key: key);

  @override
  State<Regstrpage> createState() => _RegstrpageState();
}

class _RegstrpageState extends State<Regstrpage> {

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
      body: Center(
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
                          if (value == null || value.isEmpty) {
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
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
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
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passEnable = !passEnable;
                            });
                          },
                          icon: Icon(passEnable ? Icons.visibility:Icons.visibility_off))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
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
                          if (value == null || value.isEmpty) {
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Loginpage(),));
                        }, child: (const Text('Login',style: TextStyle(fontSize: 15),)))])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
