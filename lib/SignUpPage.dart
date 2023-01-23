import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logindemo/Welcome.dart';
import 'package:logindemo/auth_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    List images = ["g.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.32,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/images/signup.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.15,
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("Assets/images/profile.jpg"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                children: [
                  // Text("Hello! Welcome to Gita app :)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900)),
                  // Text("Please Sign-in to continue ^_^",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.amber.shade900,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white54,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(

                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.amber.shade900,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white54,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text("Forgot your password?",
                          style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: AuthController.instance.register(emailController.text.trim(), passwordController.text.trim()),
              child: Container(
                width: w * 0.4,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // image: DecorationImage(
                  //   image: AssetImage("images/login.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                  color: Colors.amber.shade900,
                ),
                child: Center(
                  //color: Colors.black87, fontWeight: FontWeight.bold
                  child: RichText(
                    text: TextSpan(
                      text: "Sign Up <3",
                      style: const TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() => const Welcome()),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  text: "Already have an account ?",
                  style: TextStyle(color: Colors.grey.shade800),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() => Get.back())),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            RichText(
              text: const TextSpan(
                text: "Sign Up using following method : ",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
                // children: [TextSpan(text: "Create One.", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),],
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                  2,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade500,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white38,
                            backgroundImage:
                                AssetImage("Assets/images/" + images[index]),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
