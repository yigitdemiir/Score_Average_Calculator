import 'package:dinamik_ortalama_hesapla/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

import 'constants/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Sabitler.baslikText,
      color: Sabitler.anaRenk,
      home: const OrtalamaHesaplaPage(),
    );
  }
}
