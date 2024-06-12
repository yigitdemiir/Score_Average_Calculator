import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;

  const HarfDropdownWidget({required this.onHarfSecildi, super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarf = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: Sabitler.borderRadius,
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
      // ignore: sort_child_properties_last
      child: DropdownButton(
        value: secilenHarf,
        items: _itemOlustur(),
        onChanged: (value) {
          setState(() {
            secilenHarf = value!;
            widget.onHarfSecildi(secilenHarf);
          });
        },
        underline: Container(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  List<DropdownMenuItem<double>> _itemOlustur() {
    List<DropdownMenuItem<double>> items = [];
    DataHelper.dersNotlari.forEach((key, value) {
      items.add(
        DropdownMenuItem(
          child: Text(key),
          value: value,
        ),
      );
    });
    return items;
  }
}
