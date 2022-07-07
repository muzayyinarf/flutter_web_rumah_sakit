import 'package:flutter/material.dart';
import 'package:rumah_sakit/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  //* Inisialisasi Supabase
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: urlKey,
    anonKey: anonKey,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
