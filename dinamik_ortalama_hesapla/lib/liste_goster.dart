// ignore_for_file: prefer_const_constructors

import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class ListeGoster extends StatelessWidget {
  final Function myOnDismiss;

  const ListeGoster({required this.myOnDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              var ders = tumDersler[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  myOnDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].dersAdi),
                      subtitle: Text(
                          "Not değeri: ${ders.dersHarfi} Kredi Değeri: ${ders.dersKredisi}"),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((ders.dersHarfi * ders.dersKredisi)
                            .toStringAsFixed(1)),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: tumDersler.length,
          )
        : Container(
            child: Center(
              child: Text(
                "Lütfen Ders Ekleyin",
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}
