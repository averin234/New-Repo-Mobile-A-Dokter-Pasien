import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pluitcare/app/data/componen/fetch_data.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_Resep_view.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_detail_view.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_icd10_view.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_tindakan_view.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_title_resep.dart';
import 'package:pluitcare/app/modules/detail-riwayat/views/widgets/widget_vitalsign_view.dart';

import '../../../data/componen/my_font_size.dart';
import '../controllers/detail_riwayat_controller.dart';

class DetailRiwayatView extends GetView<DetailRiwayatController> {
  const DetailRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecf8ff),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            stretch: true,
            leading: IconButton(
                icon: const Icon(Icons.arrow_circle_left_rounded),
                color: Colors.blue,
                iconSize: 40,
                onPressed: () {
                  Get.back();
                }),
            title: Text(
              "Riwayat Pasien",
              style: GoogleFonts.nunito(
                  color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
            ),
            bottom: AppBar(
              toolbarHeight: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                  future: API.getDetailRiwayat(id: controller.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          CardDetailViewRiwayat(
                              px: data.px![0],
                              dataRegist: controller.dataRegist.value),
                          const SizedBox(
                            height: 5,
                          ),
                          data.vitalSign == null
                              ? Container()
                              : CardVitalSign(vitalSign: data.vitalSign![0]),
                          const SizedBox(
                            height: 5,
                          ),
                          data.tindakan == null
                              ? Container()
                              : CardTindakan(tindakan: data.tindakan!),
                          // data.icd10 == null
                          //     ? Container()
                          //     : CardICD10(icd10: data.icd10!),
                          const WidgetTitleResep(),
                          data.resep == null
                              ? Container()
                              : CardResep(resep: data.resep!),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ]),
          ),
        ],
      ),
    );
  }
}
