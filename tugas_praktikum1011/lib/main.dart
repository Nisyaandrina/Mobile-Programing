import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'session_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getHome() async {
    bool loggedIn = await SessionManager.isLoggedIn();
    return loggedIn ? const HomePage() : const LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF640B0B)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF640B0B),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF640B0B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: FutureBuilder(
        future: _getHome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return snapshot.data ?? const LoginPage();
        },
      ),
    );
  }
}