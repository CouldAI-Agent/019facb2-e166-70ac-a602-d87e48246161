import 'package:flutter/material.dart';
import '../models/modul_ajar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul Ajar Kurikulum Merdeka'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: dummyModulAjar.isEmpty
          ? const Center(
              child: Text('Belum ada modul ajar. Silakan buat baru.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: dummyModulAjar.length,
              itemBuilder: (context, index) {
                final modul = dummyModulAjar[index];
                return Card(
                  child: ListTile(
                    title: Text(modul.judul),
                    subtitle: Text('${modul.mataPelajaran} - Fase ${modul.fase} / Kelas ${modul.kelas}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pushNamed(context, '/preview', arguments: modul);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.pushNamed(context, '/form');
          setState(() {}); // Refresh list
        },
        icon: const Icon(Icons.add),
        label: const Text('Buat Modul'),
      ),
    );
  }
}
