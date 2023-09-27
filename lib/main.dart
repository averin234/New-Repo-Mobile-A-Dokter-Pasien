import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/data/componen/fetch_data.dart';
import 'app/data/componen/publics.dart';
import 'app/data/model/profile_pasien/data_px.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init('token_adokter');
  await GetStorage.init('dataRegist_adokter');
  DataPx cekData = await API.cekDataPx(
      noKtp: Publics.controller.getDataRegist.value.noKtp ?? '');
  runApp(MyApp(code: cekData.code ?? 500));
}

class MyApp extends StatelessWidget {
  final int? code;
  const MyApp({super.key, this.code});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'A-Dokter Pasien',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: code == 500 ? Routes.NO_HOME : Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
