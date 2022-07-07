import 'package:flutter/material.dart';

class akunPembeli extends StatefulWidget {
  const akunPembeli({Key key}) : super(key: key);

  @override
  State<akunPembeli> createState() => _akunPembeliState();
}

class _akunPembeliState extends State<akunPembeli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Pembeli'),
      ),
      body: Center(
        child: Text('Akun Pembeli'),
      ),
    );
  }
}
