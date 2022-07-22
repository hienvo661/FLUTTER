// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sale_app/Src/Auth/Components/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 91, 224, 95),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 10,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //email
                  CutomTextField(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    hintText: 'Enter your email',
                  ),
                  SizedBox(height: 17),
                  //password
                  CutomTextField(
                    isSecret: true,
                    icon: Icons.lock_outline,
                    label: 'Password',
                    hintText: 'Enter your password',
                  ),
                  SizedBox(height: 25),
                  //button login
                  Container(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: () {
                        print('Login');
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          print('forget password');
                        },
                        child: Text('Forget your password?')),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Divider(height: 1, color: Colors.black),
                      ),
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Flexible(
                        child: Divider(height: 1, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        print('Register now');
                      },
                      child: Text(
                        'REGISTER NOW',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
