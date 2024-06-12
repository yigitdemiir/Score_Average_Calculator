// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/data/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/harf_dropdorn_widget.dart';
import 'package:dinamik_ortalama_hesapla/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/liste_goster.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formkey = GlobalKey<FormState>();
  double secilenHarf = 4;
  double secilenKredi = 1;
  String secilenDers = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
          Expanded(
            child: ListeGoster(
              myOnDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: HarfDropdownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarf = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKredi = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios),
                color: Sabitler.anaRenk,
                iconSize: 32,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          secilenDers = newValue!;
        });
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
      validator: (value) {
        if (value!.length < 2) {
          return "Geçerli Ders Giriniz";
        } else
          return null;
      },
    );
  }

  _dersEkleVeOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenecekDers = Ders(secilenDers, secilenHarf, secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.ortalamaHesapla());
      setState(() {});
      formkey.currentState!.reset();
    }
  }
}
