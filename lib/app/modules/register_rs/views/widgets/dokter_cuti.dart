import 'package:flutter/material.dart';

class DokterCuti extends StatelessWidget {
  const DokterCuti({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Keterangan',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Dokter Absen dari Tgl 10-07-2023 s/d Tgl 17-07-2023',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
