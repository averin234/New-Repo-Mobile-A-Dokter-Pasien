import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:adokter/app/modules/daftar_antrian/controllers/daftar_antrian_controller.dart';

class HorizontalWeekCalendarPackage1 extends GetView<DaftarAntrianController> {
  const HorizontalWeekCalendarPackage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Tanggal Antrean',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 15,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CalendarTimeline(
            initialDate: DateTime.parse(controller.date.value),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100, 15, 15),
            onDateSelected: (date) {
              controller.date.value = DateFormat('yyyy-MM-dd').format(date);
            },
            leftMargin: 60,
            monthColor: Colors.black,
            dayColor: Colors.grey,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: const Color(0xff00AFC1),
            dotsColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
