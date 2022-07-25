// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Components/custom_text_field.dart';
import 'package:sale_app/Src/Pages/Screen/AllScreen.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/auth/SignUpScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // name app
                    Text.rich(
                      TextSpan(
                        style: AppStyles.h1.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                        children: [
                          TextSpan(
                            text: 'Green',
                          ),
                          TextSpan(
                              text: 'grocer',
                              style: AppStyles.h1.copyWith(
                                  color: Appcolor.logoColor, fontSize: 40))
                        ],
                      ),
                    ),
                    //Categories
                    SizedBox(
                      height: 40,
                      child: DefaultTextStyle(
                        style: AppStyles.h1.copyWith(
                          fontSize: 25,
                          color: Color.fromARGB(255, 55, 55, 55),
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText('AWESOME'),
                            TyperAnimatedText('OPTIMISTIC'),
                            TyperAnimatedText('DIFFERENT'),
                          ],
                        ),
                      ),
                    ),
                    // Text(
                    //   'Frutas',
                    //   style: AppStyles.h1.copyWith(
                    //       fontSize: 25, color: Color.fromARGB(255, 55, 55, 55)),
                    // )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      //email
                      CustomTextField(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 15),
                      //password
                      CustomTextField(
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
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => AllScreen()),
                            );
                            print('Login');
                          },
                          child: Text(
                            'LOGIN',
                            style: AppStyles.h1,
                          ),
                        ),
                      ),
                      //Button forget
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              print('forget password');
                            },
                            child: Text('Forget your password?')),
                      ),
                      // giải phân cách
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Divider(
                                height: 1, color: Colors.black.withAlpha(90)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Don\'t have an account?',
                              style: AppStyles.h2,
                            ),
                          ),
                          Flexible(
                            child: Divider(
                                height: 1, color: Colors.black.withAlpha(90)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Button Rigister

                      // Align(
                      //   alignment: Alignment.center,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       print('Register now');
                      //     },
                      //     child: Text(
                      //       'REGISTER NOW',
                      //       style: TextStyle(
                      //           color: Colors.blue,
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side: BorderSide(
                              width: 1.5,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SignUpScreen()),
                            );
                            print('Register now');
                          },
                          child: Text(
                            'REGISTER NOW',
                            style: AppStyles.h1
                                .copyWith(color: Appcolor.registerColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
