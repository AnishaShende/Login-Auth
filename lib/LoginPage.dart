
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/SignUpPage.dart';
import 'package:logindemo/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("Assets/images/login.jpg"),
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                children: [
                  SizedBox(height: h*0.01,),
                  Text("Hello! Welcome to Gita app :)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900)),
                  Text("Please Sign-in to continue ^_^",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                  const SizedBox(height: 50,),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email, color: Colors.amber.shade900,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white54,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.amber.shade900,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white54,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text("Forgot your password?",style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: AuthController.instance.login(emailController.text.trim(), passwordController.text.trim()),
              child: Container(
                width: w*0.4,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // image: DecorationImage(
                  //   image: AssetImage("images/login.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                  color: Colors.amber.shade900,
                ),
                child: const Center(child: Text("Sign In <3", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: h*0.1),
            RichText(text: TextSpan(
              text: "Don't have an account :( ", style: const TextStyle(color: Colors.black54),
            children: [TextSpan(text: "Create One.", style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap=(() => Get.to(()=>const SignUpPage()))
            ),
            ], 
            ),
            ),
          ],
        ),
      ),
    );
  }
}
