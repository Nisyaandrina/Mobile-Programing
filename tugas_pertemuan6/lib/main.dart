import 'package:flutter/material.dart';
import 'form_page.dart';
import 'hasil_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulir Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormMahasiswaPage(),
        '/hasil': (context) => const HasilPage(),
      },
    );
  }
}
