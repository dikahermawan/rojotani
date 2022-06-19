import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/layout.dart';

class keranjangPage extends StatefulWidget {
  @override
  _keranjangPageState createState() => _keranjangPageState();
}

class _keranjangPageState extends State<keranjangPage> {
  final allChecked = checkBoxModal(title: 'Pilih semua');
  final checkBoxList = [
    checkBoxModal(title: 'Produk 1'),
    checkBoxModal(title: 'Produk 2'),
    checkBoxModal(title: 'Produk 3')
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return new Scaffold(
        appBar: new AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              // Route route =
              //     MaterialPageRoute(builder: (context) => ());
              // Navigator.push(context, route);
            },
          ),
          title: Text(
            'Kerajang',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Mulish',
              color: Colors.black,
              fontSize: 22.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                ListTile(
                  onTap: () => onAllClicked(allChecked),
                  leading: Checkbox(
                      value: allChecked.value,
                      onChanged: (value) => onAllClicked(allChecked)),
                  title: Text(
                    allChecked.title,
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mulish'),
                  ),
                ),
                ...checkBoxList
                    .map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.only(left: 25.w),
                        onTap: () => onItemClicked(item),
                        leading: Checkbox(
                            value: item.value,
                            onChanged: (value) => onItemClicked(item)),
                        title: Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mulish'),
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        ));
  }

  onAllClicked(checkBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(checkBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class checkBoxModal {
  String title;
  bool value;

  checkBoxModal({@required this.title, this.value = false});
}
