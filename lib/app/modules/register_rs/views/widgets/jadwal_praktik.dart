import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adokter/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:intl/intl.dart' as intl;
import 'package:adokter/app/routes/app_pages.dart';

import '../../controllers/register_rs_controller.dart';

class JadwalPraktik extends StatelessWidget {
  final Jadwal jadwal;
  final Items items;
  const JadwalPraktik({super.key, required this.jadwal, required this.items});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterRsController());
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_POLI,
          arguments: {'jadwal': jadwal, 'items': items}),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.rangeHari(jadwal.rangeHari ?? ''),
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.access_time_filled, color: Colors.blueAccent),
                const SizedBox(
                  width: 10,
                ),
                Text(
                    "${intl.DateFormat('HH:mm').format(DateTime.parse(jadwal.jamMulai!))} - ${intl.DateFormat('HH:mm').format(DateTime.parse(jadwal.jamAkhir!))}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
