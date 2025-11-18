import 'package:flutter/material.dart';
import 'kucing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListKucingScreen(),
    );
  }
}

class ListKucingScreen extends StatefulWidget {
  const ListKucingScreen({super.key});

  @override
  State<ListKucingScreen> createState() => _ListKucingScreenState();
}

class _ListKucingScreenState extends State<ListKucingScreen> {
  List<Kucing> daftarKucing = [
    Kucing('Milo', 3.5, 'Putih'),
    Kucing('Luna', 4.2, 'Abu-abu'),
    Kucing('Leo', 5.0, 'Oren'),
  ];

  void makan(int index) {
    setState(() {
      daftarKucing[index].makan();
    });
  }

  void lari(int index) {
    setState(() {
      daftarKucing[index].lari();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kucing')),
      body: ListView.builder(
        itemCount: daftarKucing.length,
        itemBuilder: (context, index) {
          final kucing = daftarKucing[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: ${kucing.nama}', style: const TextStyle(fontSize: 18)),
                  Text('Warna Bulu: ${kucing.warnaBulu}', style: const TextStyle(fontSize: 16)),
                  Text('Berat: ${kucing.berat.toStringAsFixed(1)} kg', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => makan(index),
                        child: const Text('Makan'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => lari(index),
                        child: const Text('Lari'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}