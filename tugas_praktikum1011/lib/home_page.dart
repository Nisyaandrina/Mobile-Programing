import 'package:flutter/material.dart';
import 'login_page.dart';
import 'session_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Logout"),
        content: const Text("Apakah kamu yakin ingin logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Tidak"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Ya"),
          ),
        ],
      ),
    );

    if (result == true) {
      await SessionManager.logout();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Logout berhasil"),
          backgroundColor: const Color(0xFF4CAF50),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _confirmLogout(context),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: SessionManager.getUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Text(
                "Welcome, ${snapshot.data}!",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return const Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}