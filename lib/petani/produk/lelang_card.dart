import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class lelangCard extends StatelessWidget {
  final String title, harga, img, waktu;
  final Function press;
  const lelangCard({
    Key key,
    this.title,
    this.harga,
    this.img,
    this.press,
    this.waktu,
  }) : super(key: key);

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
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Size size = MediaQuery.of(context).size;
    return (isLandscape)
        ? Container(
            margin: EdgeInsets.only(right: 6.w),
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: InkWell(
              onTap: press,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          img,
                          width: size.width * 0.21,
                          height: size.width * 0.13,
                        )),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 5.0,
                        ),
                        width: 75.w,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        width: 138,
                        child: Text(
                          harga,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 53.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        width: 60,
                        child: Text(
                          waktu,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          )
        :
        /////////////////////////////////////////////////
        //Potrait
        Container(
            margin: EdgeInsets.only(right: 6.w),
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.27,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: InkWell(
              onTap: press,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.r),
                        child: Image.asset(
                          img,
                          width: size.width * 0.36,
                          height: size.width * 0.3,
                        )),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 16.0,
                        ),
                        width: 138.w,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 17.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        width: 138,
                        child: Text(
                          harga,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        width: 65,
                        child: Text(
                          waktu,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                ],
              ),
            ),
          );
  }
}
