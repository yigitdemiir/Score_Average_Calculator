// ignore_for_file: sort_child_properties_last

import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static Map<String, double> dersNotlari = {
    "AA": 4.0,
    "BA": 3.5,
    "BB": 3.0,
    "CB": 2.7,
    "CC": 2.5,
    "DC": 2.0,
    "DD": 1.7,
    "FD": 1.5,
    "FF": 1.0,
  };

  static List<int> tumKrediler() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.dersHarfi * element.dersKredisi);
      toplamKredi = toplamKredi + element.dersKredisi;
    });
    return toplamNot / toplamKredi;
  }
}
