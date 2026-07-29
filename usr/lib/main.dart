import 'package:flutter/material.dart';
import 'models/modul_ajar.dart';
import 'screens/home_screen.dart';
import 'screens/form_screen.dart';
import 'screens/preview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pembuat Modul Ajar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/preview') {
          final modul = settings.arguments as ModulAjar;
          return MaterialPageRoute(
            builder: (context) => PreviewScreen(modul: modul),
          );
        }
        return null;
      },
    );
  }
}
