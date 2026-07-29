import 'package:flutter/material.dart';
import '../models/modul_ajar.dart';

class PreviewScreen extends StatelessWidget {
  final ModulAjar modul;

  const PreviewScreen({super.key, required this.modul});

  Widget _buildSection(BuildContext context, String title, String content) {
    if (content.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(content, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pratinjau Modul Ajar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'MODUL AJAR',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSection(context, 'I. INFORMASI UMUM', ''),
                Text('Judul: ${modul.judul}'),
                Text('Mata Pelajaran: ${modul.mataPelajaran}'),
                Text('Fase / Kelas: ${modul.fase} / ${modul.kelas}'),
                Text('Alokasi Waktu: ${modul.alokasiWaktu}'),
                const Divider(height: 32),
                _buildSection(context, 'II. KOMPONEN INTI', ''),
                _buildSection(context, 'A. Tujuan Pembelajaran', modul.tujuanPembelajaran),
                _buildSection(context, 'B. Kegiatan Pembelajaran', modul.kegiatanPembelajaran),
                _buildSection(context, 'C. Asesmen', modul.asesmen),
                const Divider(height: 32),
                _buildSection(context, 'III. LAMPIRAN', ''),
                _buildSection(context, 'Bahan Bacaan', modul.bahanBacaan),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
