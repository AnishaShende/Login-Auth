import 'package:flutter/material.dart';
import 'package:logindemo/auth_controller.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: AuthController.instance.logOut(),
            child: Container(
                width: w * 0.4,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber.shade900,
                ),
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                )),
          )),
    );
  }
}
