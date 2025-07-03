import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home1.dart';
import 'package:flutter_application_1/ketentuan.dart';
import 'package:flutter_application_1/privasi.dart';
import 'package:flutter_application_1/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String dummyEmail = '1com';
  final String dummyPassword = '111';

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showMessage(context, 'Email dan Password harus diisi');
    } else if (email == dummyEmail && password == dummyPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home1()),
      );
    } else {
      showMessage(context, 'Email atau Password salah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://archify-images-prod.s3.ap-southeast-1.amazonaws.com/blog/xl/wt5u4gqg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  'DIERRA\nRESTO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'SIGN IN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 40),
              buildTextField('Email', 'Masukkan email', emailController, false),
              const SizedBox(height: 20),
              buildTextField(
                'Password',
                'Masukkan password',
                passwordController,
                true,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Lupa kata sandi?',
                    style: TextStyle(color: Color(0xFF3300FF)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: login,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Punya Akun?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      'Register Sekarang',
                      style: TextStyle(color: Color(0xFF1D00FF)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Dengan membuat akun, kamu berarti menyetujui ',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    children: [
                      TextSpan(
                        text: 'Ketentuan ',
                        style: TextStyle(
                          color: Color(0xFF1D00FF),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KetentuanPengguna(),
                                  ),
                                );
                              },
                      ),
                      TextSpan(
                        text: ' & ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Kebijakan Privasi',
                        style: TextStyle(
                          color: Color(0xFF1D00FF),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KebijakanPrivasi(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint,
    TextEditingController controller,
    bool isPassword,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Archivo',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
