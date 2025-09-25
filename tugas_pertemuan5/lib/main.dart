import 'package:flutter/material.dart';

void main() => runApp(BeritaApp());

class BeritaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Daftar Berita', home: BeritaPage());
  }
}

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> daftarBerita = [
    {
      'judul': 'Wednesday Season 2 Pecahkan Rekor',
      'deskripsi':
          'Musim kedua serial Wednesday mencetak 50 juta penonton dalam 5 hari.',
      'gambar': 'assets/berita/wednesday.jpg',
    },
    {
      'judul': 'Film Merah Putih: One for All',
      'deskripsi':
          'Film animasi Indonesia ini menuai kontroversi soal kualitas dan pendanaan.',
      'gambar': 'assets/berita/merahputih.jpg',
    },
    {
      'judul': 'Demon Slayer: Infinity Castle',
      'deskripsi':
          'Film anime ini meraih 1,2 juta penonton hanya dalam 3 hari penayangan.',
      'gambar': 'assets/berita/demonslayer.jpg',
    },
    {
      'judul': 'Timo Tjahjanto Debut di Hollywood',
      'deskripsi':
          'Sutradara Indonesia memamerkan karya film Hollywood pertamanya, Nobody 2.',
      'gambar': 'assets/berita/nobody2.jpeg',
    },
    {
      'judul': 'Spider-Man: Brand New Day Ditunda',
      'deskripsi':
          'Syuting film terbaru Spider-Man ditunda karena kecelakaan saat syuting.',
      'gambar': 'assets/berita/spiderman.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Berita Film Terkini')),
      body: ListView.builder(
        itemCount: daftarBerita.length,
        itemBuilder: (context, index) {
          final berita = daftarBerita[index];
          return ListTile(
            leading: Image.asset(
              berita['gambar']!,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(berita['judul']!),
            subtitle: Text(berita['deskripsi']!),
            trailing: Icon(Icons.bookmark_border),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mengalihkan ke halaman berita')),
              );
            },
          );
        },
      ),
    );
  }
}
