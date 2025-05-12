import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/components/valid.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/auth/sign_in.dart';
import 'package:explore_pc/widgets/mytext_form_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    address.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _phoneFocus.dispose();
    _addressFocus.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.29:8000/api/customer/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'UserName': name.text,
          'email': email.text,
          'UserPassword': password.text,
          'Phone': phone.text,
          'Address': address.text,
          'Image': null, // يمكنك إضافة رفع صورة لاحقاً
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        // تسجيل ناجح
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage(iscart: 2)),
        );
      } else {
        // خطأ في التسجيل
        setState(() {
          _errorMessage = responseData['message'] ?? 'فشل في التسجيل';
          if (responseData['errors'] != null) {
            _errorMessage = _parseErrors(responseData['errors']);
          }
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'حدث خطأ في الاتصال بالخادم';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _parseErrors(Map<String, dynamic> errors) {
    return errors.entries
        .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
        .join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final myColor = Mycolors().myColor;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(20),
            physics: const ClampingScrollPhysics(),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/sign up.png',
                      width: screenWidth / 1.5,
                    ),
                  ),
                  const Text(
                    "إنشاء حساب",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                    focusNode: _nameFocus,
                    valid: (val) => vaildInput(val!, 3, 255),
                    mycontroller: name,
                    label: "الاسم الكامل",
                    icon: const Icon(Icons.person),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    focusNode: _emailFocus,
                    valid: (val) => vaildInputemail(val!, 5, 255),
                    mycontroller: email,
                    label: "البريد الإلكتروني",
                    icon: const Icon(Icons.email),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    focusNode: _passwordFocus,
                    valid: (val) => vaildInput(val!, 6, 22),
                    mycontroller: password,
                    label: "كلمة المرور",
                    icon: const Icon(Icons.lock),
                    textAlign: TextAlign.left,
                    // obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    focusNode: _phoneFocus,
                    valid: (val) {
                      if (val != null) {
                        return vaildInput(val!, 9, 9);
                      }
                      if (val!.isEmpty) return 'حقل الهاتف مطلوب';
                      if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                        return 'يجب أن يحتوي الهاتف على أرقام فقط';
                      }

                      return null;
                    },
                    mycontroller: phone,
                    label: "رقم الهاتف",
                    icon: const Icon(Icons.phone),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    focusNode: _addressFocus,
                    valid: (val) => vaildInput(val!, 5, 255),
                    mycontroller: address,
                    label: "العنوان",
                    icon: const Icon(Icons.location_on),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 30),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: myColor,
                              foregroundColor: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "تسجيل",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      "لدي حساب تسجيل دخول",
                      style: TextStyle(color: myColor, fontSize: 15),
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
