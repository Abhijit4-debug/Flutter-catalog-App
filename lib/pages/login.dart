import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String name = '';
  final formkey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (formkey.currentState.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.home);
      setState(() {
        changebutton = false;
      });
    }
  }

  bool changebutton = false;
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "welcome  $name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Usename",
                                labelText: "Username",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "please enter username";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "please enter username";
                                } else if (value.length < 6) {
                                  return "length should be greater than 6";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            InkWell(
                                onTap: () => MoveToHome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: changebutton ? 50 : 100,
                                  height: 50,
                                  alignment: Alignment.center,
                                  color: Colors.deepPurple,
                                  child: changebutton
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "submit",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                ))
                          ],
                        ))
                  ],
                ))));
  }
}
