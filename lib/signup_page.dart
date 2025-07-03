import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ketentuan.dart';
import 'package:flutter_application_1/privasi.dart';
import 'main.dart'; // Import halaman login
import 'signin.dart';

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Tambahkan di atas Scaffold
    void showMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://archify-images-prod.s3.ap-southeast-1.amazonaws.com/blog/xl/wt5u4gqg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Content
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
                'SIGN UP',
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
              const SizedBox(height: 20),
              buildTextField(
                'Konfirmasi Password',
                'Konfirmasi password',
                confirmPasswordController,
                true,
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
                  onPressed: ()
                  // Aksi register
                  {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword =
                        confirmPasswordController.text.trim();

                    if (email.isEmpty ||
                        password.isEmpty ||
                        confirmPassword.isEmpty) {
                      showMessage(context, 'Semua field harus diisi');
                    } else if (password != confirmPassword) {
                      showMessage(
                        context,
                        'Password dan konfirmasi harus sama',
                      );
                    } else {
                      showMessage(context, 'Registrasi berhasil');
                      Navigator.pop(context); // Kembali ke halaman login
                    }
                  },

                  child: Text(
                    'Register',
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
                    'Sudah Punya Akun?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Kembali ke halaman login
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login Sekarang',
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
