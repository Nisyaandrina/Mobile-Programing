import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'db_helper.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Map<String, dynamic>> users = [];
  bool isLoading = false;

  Future<void> fetchUsers() async {
    setState(() => isLoading = true);
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      await DBHelper.insertUsers(data);
      final localData = await DBHelper.getUsers();
      setState(() {
        users = localData;
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  Future<void> loadLocalUsers() async {
    final localData = await DBHelper.getUsers();
    setState(() {
      users = localData;
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocalUsers(); // ambil data dari lokal dulu
    fetchUsers();     // update dari server
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pengguna"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchUsers,
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text("${user['email']} - ${user['city']}"),
                );
              },
            ),
    );
  }
}