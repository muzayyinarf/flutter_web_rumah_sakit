import 'package:get/get.dart';

import '../modules/add_dokter/bindings/add_dokter_binding.dart';
import '../modules/add_dokter/views/add_dokter_view.dart';
import '../modules/add_pasien/bindings/add_pasien_binding.dart';
import '../modules/add_pasien/views/add_pasien_view.dart';
import '../modules/add_pembayaran/bindings/add_pembayaran_binding.dart';
import '../modules/add_pembayaran/views/add_pembayaran_view.dart';
import '../modules/add_ruangan/bindings/add_ruangan_binding.dart';
import '../modules/add_ruangan/views/add_ruangan_view.dart';
import '../modules/dokter/bindings/dokter_binding.dart';
import '../modules/dokter/views/dokter_view.dart';
import '../modules/edit_dokter/bindings/edit_dokter_binding.dart';
import '../modules/edit_dokter/views/edit_dokter_view.dart';
import '../modules/edit_pasien/bindings/edit_pasien_binding.dart';
import '../modules/edit_pasien/views/edit_pasien_view.dart';
import '../modules/edit_pembayaran/bindings/edit_pembayaran_binding.dart';
import '../modules/edit_pembayaran/views/edit_pembayaran_view.dart';
import '../modules/edit_ruangan/bindings/edit_ruangan_binding.dart';
import '../modules/edit_ruangan/views/edit_ruangan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/pembayaran/bindings/pembayaran_binding.dart';
import '../modules/pembayaran/views/pembayaran_view.dart';
import '../modules/ruangan/bindings/ruangan_binding.dart';
import '../modules/ruangan/views/ruangan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOKTER,
      page: () => const DokterView(),
      binding: DokterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DOKTER,
      page: () => const AddDokterView(),
      binding: AddDokterBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => const PasienView(),
      binding: PasienBinding(),
    ),
    GetPage(
      name: _Paths.RUANGAN,
      page: () => const RuanganView(),
      binding: RuanganBinding(),
    ),
    GetPage(
      name: _Paths.PEMBAYARAN,
      page: () => const PembayaranView(),
      binding: PembayaranBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DOKTER,
      page: () => const EditDokterView(),
      binding: EditDokterBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PASIEN,
      page: () => const EditPasienView(),
      binding: EditPasienBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PASIEN,
      page: () => const AddPasienView(),
      binding: AddPasienBinding(),
    ),
    GetPage(
      name: _Paths.ADD_RUANGAN,
      page: () => const AddRuanganView(),
      binding: AddRuanganBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PEMBAYARAN,
      page: () => const AddPembayaranView(),
      binding: AddPembayaranBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_RUANGAN,
      page: () => const EditRuanganView(),
      binding: EditRuanganBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PEMBAYARAN,
      page: () => const EditPembayaranView(),
      binding: EditPembayaranBinding(),
    ),
  ];
}
