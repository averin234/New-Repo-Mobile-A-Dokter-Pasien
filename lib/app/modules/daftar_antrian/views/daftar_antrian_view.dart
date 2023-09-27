import 'package:flutter/material.dart';
import 'package:adokter/app/modules/shammer/shimmer_antrian.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adokter/app/data/componen/fetch_data.dart';
import 'package:adokter/app/data/model/profile_pasien/data_px.dart';
import 'package:adokter/app/modules/daftar_antrian/controllers/daftar_antrian_controller.dart';
import 'package:adokter/app/modules/daftar_antrian/views/widgets/widget_listview_antrian.dart';
import 'package:adokter/app/modules/daftar_antrian/views/widgets/widget_title_antrian.dart';
import 'package:adokter/app/modules/daftar_antrian/views/widgets/widget_title_antrian4.dart';
import 'package:adokter/app/modules/daftar_antrian/views/widgets/widgets_select_calender.dart';
import 'package:adokter/app/modules/home/views/widgets/widget_no_antri.dart';
import '../../../data/componen/my_font_size.dart';
import '../../../data/componen/my_style.dart';

class DaftarAntrianView extends GetView<DaftarAntrianController> {
  const DaftarAntrianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDBF6FD),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 1,
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: Color(0xff00AFC1),
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Daftar Antrean",
              style: GoogleFonts.nunito(
                  fontSize: MyFontSize.large1, fontWeight: FontWeight.bold),
            ),
            bottom: AppBar(
              backgroundColor: const Color(0xffDBF6FD),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(0.0),
                ),
              ),
              toolbarHeight: 150,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Column(
                children: const [
                  HorizontalWeekCalendarPackage1(),
                  SizedBox(height: 5)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              WidgetTitleAntrian(
                msg: '',
              ),
              Container(
                height: 1000,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFe0e0e0).withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 0),
                      child: Text("Antrean Saat ini",
                          style: MyStyle.textTitleBlack),
                    ),
                    FutureBuilder(
                      future: API.getDataPx(
                          noKtp: controller.dataPasien.value.noKtp ?? ''),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final scan = snapshot.data!;
                          if (scan.code == 500) {
                            return Center(
                              child: listAntrian(scan),
                            );
                          } else {
                            return listAntrian(scan);
                          }
                        } else {
                          return Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  shimmerAntrian(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ));
                        }
                      },
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Obx listAntrian(DataPx scan) {
    return Obx(() {
      return FutureBuilder(
          future: API.getJadwalPx(
            noKtp: controller.dataPasien.value.noKtp!,
            tgl: controller.date.value,
          ),
          builder: (context, snapshot1) {
            if (snapshot1.hasData &&
                snapshot1.connectionState != ConnectionState.waiting &&
                snapshot1.data != null) {
              final data = snapshot1.data!;
              if (data.code != 200) {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: WidgetNoAntri(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: data.list!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final list = data.list!;
                    return Container(
                      child: CardListViewAntrian(
                        list: list[index],
                        scan: scan,
                      ),
                    );
                  },
                );
              }
            } else {
              return Container();
            }
          });
    });
  }
}
