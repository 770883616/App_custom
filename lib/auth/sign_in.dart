import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/components/valid.dart';
import 'package:explore_pc/constant/linkapi.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/auth/sign_up.dart';
import 'package:explore_pc/widgets/mytext_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Color _myColor = Mycolors().myColor;
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _errorMessage;

  // مثال لحفظ بيانات المستخدم بعد تسجيل الدخول الناجح

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse(LinkLogin),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'UserPassword': _passwordController.text,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // تسجيل الدخول ناجح
        // مثال لحفظ بيانات المستخدم بعد تسجيل الدخول الناجح
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('userName', 'UserName');
        // await prefs.setString('userImageUrl', 'Image');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage(iscart: 2)),
        );
      } else {
        // خطأ في تسجيل الدخول
        setState(() {
          _errorMessage = responseData['message'] ?? 'بيانات الدخول غير صحيحة';
          if (responseData['errors'] != null) {
            _errorMessage = responseData['errors']['email']?.join(', ') ??
                'بيانات الدخول غير صحيحة';
          }
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'فشل في التسجيل';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/login.png',
                      width: screenWidth / 2,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),

                  // رسالة الخطأ
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  MyTextFormField(
                    valid: (val) {
                      if (val!.isEmpty) return 'البريد الإلكتروني مطلوب';
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return 'البريد الإلكتروني غير صالح';
                      }
                      return null;
                    },
                    mycontroller: _emailController,
                    label: "البريد الإلكتروني",
                    icon: Icon(Icons.email),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30),

                  MyTextFormField(
                    valid: (val) {
                      if (val != null) {
                        return vaildInput(val, 6, 22);
                      }
                      if (val!.isEmpty) return 'كلمة المرور مطلوبة';

                      return null;
                    },
                    mycontroller: _passwordController,
                    label: "كلمة المرور",
                    icon: Icon(Icons.lock),
                    textAlign: TextAlign.left,
                    // obscureText: true,
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          // يمكنك إضافة صفحة استعادة كلمة المرور لاحقاً
                        },
                        child: Text(
                          "هل نسيت كلمة المرور؟",
                          style: TextStyle(color: _myColor),
                        ),
                      ),
                      Row(
                        children: [
                          Text("تذكرني"),
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: _myColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  _isLoading
                      ? CircularProgressIndicator(color: _myColor)
                      : SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _myColor,
                              foregroundColor: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "دخــول",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                  SizedBox(height: 30),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: Text(
                      "ليس لديك حساب؟ إنشاء حساب",
                      style: TextStyle(color: _myColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
