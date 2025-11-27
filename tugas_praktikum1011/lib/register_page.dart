import 'package:flutter/material.dart';
import '../model/user.dart';
import '../database/db_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _register() async {
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

    User newUser = User(username: username, password: password);

    try {
      await DBHelper.instance.registerUser(newUser);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text("Registrasi berhasil!"), backgroundColor: Colors.green),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registrasi gagal: ${e.toString()}"), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
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
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () => setState(() => _obscureText = !_obscureText),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _register, child: const Text("Daftar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}