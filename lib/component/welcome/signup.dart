import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      child: Center(
        child: FadeInUp(
          delay: const Duration(milliseconds: 1600),
          child: SizedBox(
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have any account ? ',
                  style: TextStyle(
                    fontSize: height * 0.015,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('The button is clicked!');
                          },
                        style: TextStyle(
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
