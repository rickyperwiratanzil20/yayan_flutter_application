// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:yayan_flutter_application/WisataDataModel.dart';
import 'package:yayan_flutter_application/Detail.dart';

class WisataHome extends StatefulWidget {
  @override
  _WisataHomeState createState() => _WisataHomeState();
}

class _WisataHomeState extends State<WisataHome> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  static List<String> judul = [
    "Gunung Salak, Bogor",
    "Danau Toba, Sumatra Utara",
    "Pantai Lombok, Bali",
    "Gunung Merapi, Yogyakarta",
    "Air Terjun Sri Gethuk, Yogyakarta",
  ];

  static List gambar = [
    'assets/gunung_salak.jpg',
    'assets/danau_toba.png',
    'assets/pantai_lombok.jpg',
    'assets/gunung_merapi.jpg',
    'assets/air_terjun.jpg',
  ];

  final List<WisataDataModel> WisataData = List.generate(judul.length,
      (index) => WisataDataModel('${judul[index]}', '${gambar[index]}'));

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            isDrawerOpen
                ? GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                  )
                : GestureDetector(
                    child: Icon(Icons.menu),
                    onTap: () {
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    },
                  ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(WisataData[index].judul,
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text('Tekan Untuk Mengetahui Lebih Detail'),
                      leading: Image(
                        image: AssetImage(WisataData[index].gambar),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Detail(wisataDataModel: WisataData[index])));
                      },
                    ),
                  );
                },
                itemCount: judul.length,
              ),
            ),
          ],
        ));
  }
}
