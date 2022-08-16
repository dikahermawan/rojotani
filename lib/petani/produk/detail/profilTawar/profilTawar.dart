import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rojotani/pelanggan/produk/detail/detailProduk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class profilTawar extends StatefulWidget {
  const profilTawar({Key key}) : super(key: key);

  @override
  State<profilTawar> createState() => _profilTawarState();
}

class _profilTawarState extends State<profilTawar> {
  var lelang_id, tawar_id, status_tawar = 'terima', pesan, _future;
  final _key = new GlobalKey<FormState>();

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 184, 15, 3),
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  update() async {
    SharedPreferences dataTawar = await SharedPreferences.getInstance();
    setState(() {
      tawar_id = dataTawar.getString('tawar_id');
    });
    Uri url = Uri.parse("http://192.168.43.56:8000/api/status/update");
    final response = await http.post(url, body: {
      'tawar_id': tawar_id,
      'status_tawar': status_tawar,
    });
    final data = jsonDecode(response.body);
    var value = data['success'];
    pesan = data['message'];

    if (value == 1) {
      print(pesan);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailProduk()),
        );
      });
    } else {
      errorSnackBar(context, 'Data sudah di input');
    }
  }

  getWar() async {
    SharedPreferences tawarPro = await SharedPreferences.getInstance();
    setState(() {
      tawar_id = tawarPro.getString('tawar_id');
    });
  }

  @override
  void initState() {
    super.initState();
    getWar();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(390, 844),
      context: context,
      minTextAdapt: true,
    );
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Profil Penawar + $tawar_id',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 23.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: InkWell(
            onTap: () {
              update();
            },
            child: Container(
                color: Colors.blue,
                height: MediaQueryHeight * 0.1,
                width: MediaQueryWidth * 0.3),
          ),
        )));
  }
}
