import 'package:final_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_app/components/components.dart';
import 'package:final_app/components/under_part.dart';
import 'package:final_app/constants.dart';
import 'package:final_app/screens/screens.dart';
import 'package:final_app/widgets/widgets.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/electric-car.png",
                ),
                const PageTitleBar(title: 'Login to your account'),
                Padding(
                  padding: const EdgeInsets.only(top: 310.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        // iconButton(context),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // const Text(
                        //   "or use your email account",
                        //   style: TextStyle(
                        //       color: Colors.grey,
                        //       fontFamily: 'OpenSans',
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w600),
                        // ),
                        Form(
                          child: Column(
                            children: <Widget>[
                              // const RoundedInputField(
                              //     hintText: "Email", icon: Icons.email),
                              TextFieldContainer(
                                child: TextField(
                                  controller: emailController,
                                  cursorColor: kPrimaryColor,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                        color: kPrimaryColor,
                                      ),
                                      hintText: "email",
                                      hintStyle: const TextStyle(
                                          fontFamily: 'OpenSans'),
                                      border: InputBorder.none),
                                ),
                              ),

                              // const RoundedPasswordField(),
                              TextFieldContainer(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        color: kPrimaryColor,
                                      ),
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(fontFamily: 'OpenSans'),
                                      suffixIcon: Icon(
                                        Icons.visibility,
                                        color: kPrimaryColor,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),

                              // switchListTile(),
                              // RoundedButton(text: 'LOGIN', press: () {}),
                              // RoundedButton(
                              //   text: 'GUEST',
                              //   press: () {},
                              //   textColor: Colors.green,

                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Material(
                              //   color: kPrimaryColor,
                              //   borderRadius: BorderRadius.circular(50),
                              //   child: InkWell(
                              //     onTap: () async {
                              //       await FirebaseAuth.instance
                              //           .signInWithEmailAndPassword(
                              //               email: _emailController.text.trim(),
                              //               password: _passwordlController.text
                              //                   .trim());
                              //     },
                              //     borderRadius: BorderRadius.circular(50),
                              //     child: Container(
                              //       width: 290,
                              //       height: 50,
                              //       alignment: Alignment.center,
                              //       child: const Text(
                              //         'LOGIN',
                              //         style: TextStyle(
                              //           color: kPrimaryLightColor,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 18,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              // ElevatedButton(
                              //     onPressed: () async {
                              //       await FirebaseAuth.instance
                              //           .signInWithEmailAndPassword(
                              //               email: _emailController.text.trim(),
                              //               password: _passwordController.text
                              //                   .trim());
                              //     },
                              //     child: Text('signin')),

                              const SizedBox(
                                height: 10,
                              ),
                              Material(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(50),
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ));
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email:
                                                  emailController.text.trim(),
                                              password: passwordController.text
                                                  .trim());
                                    } on FirebaseAuthException catch (e) {
                                      print(e);
                                    }
                                    navigatorKey.currentState!
                                        .popUntil((route) => route.isFirst);
                                  },
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 290,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/images/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/twitter.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/google.jpg"),
    ],
  );
}

// Future signin() async {
//   showDialog(context: context, builder: builder)
//   try {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim());
//   } on FirebaseAuthException catch (e) {
//     print(e);
//   }
// }
