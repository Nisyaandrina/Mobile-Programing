import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'session_manager.dart';
import 'database/db_helper.dart';
import 'model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Username dan password tidak boleh kosong"), backgroundColor: Colors.red),
      );
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Password minimal 6 karakter"), backgroundColor: Colors.red),
      );
      return;
    }

    User? user = await DBHelper.instance.login(username, password);

    if (user != null) {
      await SessionManager.setLoginSession(username);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Login berhasil!"), backgroundColor: const Color(0xFF4CAF50)),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Username atau password salah"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => _obscureText = !_obscureText),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _login, child: const Text('Login')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                    },
                    child: const Text('Belum punya akun? Daftar di sini'),
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