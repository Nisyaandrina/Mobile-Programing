import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  const HasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Formulir'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const Text(
                  'Data Mahasiswa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                _buildItem('Nama', data['nama']),
                _buildItem('NPM', data['npm']),
                _buildItem('Email', data['email']),
                _buildItem('Nomor HP', data['noHP']),
                _buildItem('Jenis Kelamin', data['gender']),
                _buildItem('Alamat', data['alamat']),
                _buildItem('Tanggal Lahir', data['tglLahir']),
                _buildItem('Jam Bimbingan', data['jamBimbingan']),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value?.isNotEmpty == true ? value! : '-',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
