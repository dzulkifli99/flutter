import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  void editProfile(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit profil ditekan')));
  }

  void viewOrders(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Lihat pesanan ditekan')));
  }

  void signOut(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logout ditekan')));
    Navigator.of(context).popUntil((route) => route.isFirst); // kembali ke awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101840),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text("Profil"),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF1A2A6C).withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.green, size: 40),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasbyallah",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "hasby9874@gmail.com",
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        Text(
                          "083233875755",
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => editProfile(context),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.receipt_long, color: Colors.white),
                title: Text("Pesanan", style: TextStyle(color: Colors.white)),
                onTap: () => viewOrders(context),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Sign Out", style: TextStyle(color: Colors.white)),
                onTap: () => signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
