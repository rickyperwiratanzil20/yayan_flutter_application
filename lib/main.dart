// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:yayan_flutter_application/DrawerScreen.dart';
import 'package:yayan_flutter_application/WisataHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Indonesia',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Wisata Indonesia'),
        ),
        body: Stack(
          children: [
            DrawerScreen(),
            WisataHome(),
          ],
        ),
      ),
    );
  }
}
