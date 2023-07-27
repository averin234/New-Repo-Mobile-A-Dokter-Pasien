import 'package:flutter/material.dart';

import '../../../../data/model/homepage/detail_klinik.dart';

class WidgetInfo extends StatefulWidget {
  final DetailKlinik detailklinik;
  const WidgetInfo({Key? key, required this.detailklinik}) : super(key: key);

  @override
  _WidgetInfoState createState() => _WidgetInfoState();
}

class _WidgetInfoState extends State<WidgetInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        image: const DecorationImage(
          image: AssetImage("assets/images/frame1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 0),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/dokter1.png',
                height: 110,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "A-Dokter Pasien",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00AFC1)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aplikasi dokter berbasis cloud untuk meningkatkan kualitas pelayanan praktek dokter mandiri",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              // Icon(Icons.arrow_forward_ios_outlined, size: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
