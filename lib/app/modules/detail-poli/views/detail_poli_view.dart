import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:pluitcare/app/data/componen/images.dart';
import 'package:pluitcare/app/data/model/regist_rs/all_dokter_klinik.dart';
import 'package:pluitcare/app/modules/detail-poli/views/widgets/card_form_poli.dart';
import 'package:pluitcare/app/modules/detail-poli/views/widgets/widget_listview_poli_view.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/model/regist_rs/daftar_px.dart';
import '../../custom_dialog/dialog_registrasi_gagal_regis.dart';
import '../../custom_dialog/dialog_registrasi_poli.dart';
import '../../custom_dialog/dialog_registrasi_sukses.dart';
import '../controllers/detail_poli_controller.dart';

class DetailPoliView extends GetView<DetailPoliController> {
  DetailPoliView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff6f9fe),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 1,
              backgroundColor: const Color(0xfff6f9fe),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  controller.items.foto ?? Avatar.lakiLaki,
                  fit: BoxFit.contain,
                ),
              ),
              floating: true,
              pinned: true,
              snap: true,
              stretch: true,
              centerTitle: true,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_circle_left_rounded),
                  color: Color(0xff00AFC1),
                  iconSize: 40,
                  onPressed: () {
                    Get.back();
                  }),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 675),
                    childAnimationBuilder: (widget) => ScaleAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      CardListViewPoliDetail(),
                      const CardFromPoli(),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFe0e0e0).withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(2, 1),
              ),
            ],
          ),
          height: 75,
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Pilih tanggal & Waktu Kunjungan",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (controller.noAntrianController.value.text.isNotEmpty) {
                      final namaKlinik = await API.getDetailKlinik();
                      final daftarAntrian = await API.getJadwalPx(
                        noKtp: controller.dataRegist.value.noKtp!,
                        tgl: controller.jadwalController.value.text,
                      );

                      if (daftarAntrian.code == 200) {
                        final daftarPx = await API.postDaftarPx(
                          namaPasien: controller.namaController.text,
                          jadwal: controller.listAntrianDokter.value.jam ?? '',
                          noAntrian: controller.noAntrianController.value.text,
                          noKtp: controller.dataRegist.value.noKtp ?? '',
                          kodeDokter: controller.items.kodeDokter ?? '',
                          kodeBagian: controller.items.kodeBagian ?? '',
                          namaBagian: controller.items.namaBagian ?? '',
                          namaKlinik:
                              namaKlinik.res!.first.namaPerusahaan ?? '',
                          namaDokter: controller.items.namaPegawai ?? '',
                          durasi:
                              controller.listAntrianDokter.value.durasi ?? '',
                          ketKlinik: 'Baru',
                          tglDaftar: controller.jadwalController.text,
                        );
                        Get.dialog(DialogGagalRegis(
                            daftarPx: DaftarPx.fromJson(daftarPx.toJson())));
                      } else {
                        final getDataPx = await API.getDataPx(
                            noKtp: controller.dataRegist.value.noKtp ?? '');
                        if (getDataPx.code == 200) {
                          final daftarPx = await API.postDaftarPx(
                            namaPasien: controller.namaController.text,
                            jadwal:
                                controller.listAntrianDokter.value.jam ?? '',
                            noAntrian:
                                controller.noAntrianController.value.text,
                            noKtp: controller.dataRegist.value.noKtp ?? '',
                            kodeDokter: controller.items.kodeDokter ?? '',
                            kodeBagian: controller.items.kodeBagian ?? '',
                            namaBagian: controller.items.namaBagian ?? '',
                            namaKlinik:
                                namaKlinik.res!.first.namaPerusahaan ?? '',
                            namaDokter: controller.items.namaPegawai ?? '',
                            durasi:
                                controller.listAntrianDokter.value.durasi ?? '',
                            ketKlinik: 'Baru',
                            tglDaftar: controller.jadwalController.text,
                          );
                          Get.back();
                          if (daftarPx.code == 500) {
                            Get.dialog(DialogGagalRegis(
                                daftarPx:
                                    DaftarPx.fromJson(daftarPx.toJson())));
                          } else if (daftarPx.code == 200) {
                            Get.dialog(const DialogSuksesRegis());
                          }
                        } else {
                          Get.dialog(
                            const DialogRegisPoli(),
                          );
                        }
                      }
                    } else {
                      Get.dialog(
                        DialogGagalRegis(
                          daftarPx: DaftarPx(
                            msg:
                                'Mohon Cari Dokter Lain atau Pilih tanggal yang berbeda',
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        right: 15, left: 15, top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white12,
                          offset: Offset(2, 1),
                          blurRadius: 1,
                          spreadRadius: 2,
                        )
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff34C471), Color(0xff34C471)],
                      ),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
