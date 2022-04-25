// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:yayan_flutter_application/WisataDataModel.dart';

class Detail extends StatelessWidget {
  final WisataDataModel wisataDataModel;
  const Detail({Key? key, required this.wisataDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(wisataDataModel.judul),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 300,
                image: AssetImage(wisataDataModel.gambar),
              ),
              Text(
                wisataDataModel.judul,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
