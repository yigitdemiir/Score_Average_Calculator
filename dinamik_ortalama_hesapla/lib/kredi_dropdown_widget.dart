import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropdownWidget({required this.onKrediSecildi, super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKredi = 1;

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
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: (kredi) {
          setState(() {
            secilenKredi = kredi!;
            widget.onKrediSecildi(kredi);
          });
        },
        underline: Container(),
        value: secilenKredi,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
