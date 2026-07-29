import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/modul_ajar.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Identitas
  final _judulController = TextEditingController();
  final _mapelController = TextEditingController();
  final _faseController = TextEditingController();
  final _kelasController = TextEditingController();
  final _waktuController = TextEditingController();
  
  // Inti
  final _tujuanController = TextEditingController();
  final _kegiatanController = TextEditingController();
  final _asesmenController = TextEditingController();
  
  // Lampiran
  final _bahanBacaanController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _mapelController.dispose();
    _faseController.dispose();
    _kelasController.dispose();
    _waktuController.dispose();
    _tujuanController.dispose();
    _kegiatanController.dispose();
    _asesmenController.dispose();
    _bahanBacaanController.dispose();
    super.dispose();
  }

  void _simpanModul() {
    if (_formKey.currentState!.validate()) {
      final modul = ModulAjar(
        id: const Uuid().v4(),
        judul: _judulController.text,
        mataPelajaran: _mapelController.text,
        fase: _faseController.text,
        kelas: _kelasController.text,
        alokasiWaktu: _waktuController.text,
        tujuanPembelajaran: _tujuanController.text,
        kegiatanPembelajaran: _kegiatanController.text,
        asesmen: _asesmenController.text,
        bahanBacaan: _bahanBacaanController.text,
      );
      dummyModulAjar.add(modul);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Modul Ajar berhasil disimpan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Modul Ajar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              _simpanModul();
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            } else {
              Navigator.pop(context);
            }
          },
          steps: [
            Step(
              title: const Text('Informasi Umum'),
              isActive: _currentStep >= 0,
              content: Column(
                children: [
                  TextFormField(
                    controller: _judulController,
                    decoration: const InputDecoration(labelText: 'Judul Modul'),
                    validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  TextFormField(
                    controller: _mapelController,
                    decoration: const InputDecoration(labelText: 'Mata Pelajaran'),
                    validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _faseController,
                          decoration: const InputDecoration(labelText: 'Fase (contoh: E)'),
                          validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _kelasController,
                          decoration: const InputDecoration(labelText: 'Kelas (contoh: 10)'),
                          validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _waktuController,
                    decoration: const InputDecoration(labelText: 'Alokasi Waktu (contoh: 2 x 45 menit)'),
                    validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Komponen Inti'),
              isActive: _currentStep >= 1,
              content: Column(
                children: [
                  TextFormField(
                    controller: _tujuanController,
                    decoration: const InputDecoration(labelText: 'Tujuan Pembelajaran'),
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: _kegiatanController,
                    decoration: const InputDecoration(labelText: 'Kegiatan Pembelajaran'),
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: _asesmenController,
                    decoration: const InputDecoration(labelText: 'Asesmen'),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Lampiran'),
              isActive: _currentStep >= 2,
              content: Column(
                children: [
                  TextFormField(
                    controller: _bahanBacaanController,
                    decoration: const InputDecoration(labelText: 'Bahan Bacaan Guru & Peserta Didik'),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
