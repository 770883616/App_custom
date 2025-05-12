import 'package:explore_pc/auth/sign_in.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double screnwidth = MediaQuery.of(context).size.width;
    Color myColor = hexToColor("#09B0EA");
    //bool notify = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('images/sign up.png',
                      width: screnwidth / 1.5),
                ),
                Container(
                  child: Text(
                    "إنشاء حساب",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                      decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Text("الاسم"),
                    suffixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: myColor)),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                      decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Text("رقم الهاتف "),
                    suffixIcon: Icon(Icons.mobile_friendly),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: myColor)),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                      decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Text("كلمة السر"),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: myColor)),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "تسجيل",
                      style: TextStyle(fontSize: 30),
                    ),
                    elevation: 10,
                    splashColor: Colors.blue,
                    color: myColor,
                    height: 45,
                    minWidth: 300,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "لدي حساب  تسجيل دخول ",
                      style: TextStyle(color: myColor, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
