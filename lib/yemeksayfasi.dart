import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'advert-service.dart';

class YemekSayfasi extends StatefulWidget {
  final isim;

  const YemekSayfasi({Key key, this.isim}) : super(key: key);
  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = Random().nextInt(10) + 1;
  int yemekNo = Random().nextInt(10) + 1;
  int tatliNo = Random().nextInt(10) + 1;
  int sayac = 0;
  final AdvertService _advertService = AdvertService();

  List<String> corbaAdlari = [
    'Mercimek Çorbası',
    'Tarhana Çorbası',
    'Tavuksuyu Çorbası',
    'Düğün Çorbası',
    'Yoğurtlu Çorba',
    'Karalahana Çorbası',
    'Domates Çorbası',
    'Süt Çorbası',
    'Yayla Çorbası',
    'Mantar Çorbası',
  ];
  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kurufasulye',
    'İçli Köfte',
    'Balık',
    'Nohut',
    'Patates Köfte',
    'Pilav',
    'Et',
    'Tavuk Haşlama',
  ];
  List<String> tatliAdlari = [
    'Künefe',
    'Baklava',
    'Fırında Sütlaç',
    'Keşkül',
    'Dondurma',
    'Kek',
    'Puding',
    'Pasta',
    'Şekerpare',
    'Kadayıf',
  ];

  void yemekleriYenile() {
    setState(() {
      corbaNo = Random().nextInt(10) + 1;
      yemekNo = Random().nextInt(10) + 1;
      tatliNo = Random().nextInt(10) + 1;
    });
  }

  @override
  void initState() {
    _advertService.showBanner();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '${widget.isim} için önerilenler;',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/corba_$corbaNo.jpg'),
              ),
            ),
            Text(
              corbaAdlari[corbaNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/yemek_$yemekNo.jpg'),
              ),
            ),
            Text(
              yemekAdlari[yemekNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/tatli_$tatliNo.jpg'),
              ),
            ),
            Text(
              tatliAdlari[tatliNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 5,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.grey[300],
                  onPressed: () {
                    sayac++;
                    yemekleriYenile();
                    if (sayac % 2 == 0) {
                      setState(() {
                        _advertService.showIntersitial();
                      });
                    }
                  },
                  child: Text(
                    'Degiştir',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20.0),
                FlatButton(
                  color: Colors.grey[300],
                  onPressed: () {
                    sayac = 0;
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kapat',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
