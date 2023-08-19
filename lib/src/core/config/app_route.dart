import 'package:becca_sales/src/core/model/argument_detail_product.dart';
import 'package:becca_sales/src/presentation/views/absensi/checkout_page.dart';
import 'package:becca_sales/src/presentation/views/auth/forget_password_page.dart';
import 'package:becca_sales/src/presentation/views/auth/forget_password_page.dart';
import 'package:becca_sales/src/presentation/views/auth/otp_page.dart';
import 'package:becca_sales/src/presentation/views/auth/otp_page.dart';
import 'package:becca_sales/src/presentation/views/auth/register_page.dart';
import 'package:becca_sales/src/presentation/views/auth/register_page.dart';
import 'package:becca_sales/src/presentation/views/cart/cart_list_page.dart';
import 'package:becca_sales/src/presentation/views/home/dashboard.dart';
import 'package:becca_sales/src/presentation/views/home/dashboard.dart';
import 'package:becca_sales/src/presentation/views/order/add_order_page.dart';
import 'package:becca_sales/src/presentation/views/order/add_order_page.dart';
import 'package:becca_sales/src/presentation/views/order/list_so_copy.dart';
import 'package:becca_sales/src/presentation/views/order/order_detail_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_detail_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_page.dart';
import 'package:becca_sales/src/presentation/views/order/sales_order_list_page.dart';
import 'package:becca_sales/src/presentation/views/order/sales_order_list_page.dart';
import 'package:becca_sales/src/presentation/views/product/history_harga_page.dart';
import 'package:becca_sales/src/presentation/views/product/history_harga_page.dart';
import 'package:becca_sales/src/presentation/views/product/product_detail_page.dart';
import 'package:becca_sales/src/presentation/views/product/product_favorite_page.dart';
import 'package:becca_sales/src/presentation/views/product/product_favorite_page.dart';
import 'package:becca_sales/src/presentation/views/product/product_list_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/editing_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/editing_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/entry_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/entry_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/setoran/setoran_tunai_page.dart';
import 'package:becca_sales/src/presentation/views/setoran/setoran_tunai_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/bayar_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/bayar_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/confirm_success_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/confirm_success_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/detail_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_konfirmasi_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_konfirmasi_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_nota_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_nota_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/menu_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/menu_tagihan_page.dart';
import 'package:becca_sales/src/presentation/views/target/detail_target_page.dart';
import 'package:becca_sales/src/presentation/views/target/target_page.dart';
import 'package:becca_sales/src/presentation/views/target/target_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/detail_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/detail_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/realisasi_visiting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/blocs/login/login_bloc.dart';
import '../../presentation/views/absensi/checkin_page.dart';
import '../../presentation/views/auth/login_page.dart';
import '../../presentation/views/product/detail_history_harga_page.dart';
import '../../presentation/views/setoran/list_setoran_page.dart';
import '../../presentation/views/splashscreen.dart';

class AppRoute {
  const AppRoute._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late WidgetBuilder builder;
    bool fullScreenDialog = false;

    switch (settings.name) {
      case LoginPage.routeName:
        builder = (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LoginBloc(),
                ),
              ],
              child: const LoginPage(),
            );
        fullScreenDialog = true;
        break;
      case RegisterPage.routeName:
        builder = (context) => const RegisterPage();
        break;
      case OTPPage.routeName:
        builder = (context) => const OTPPage();
        break;
      case ForgetPasswordPage.routeName:
        builder = (context) => const ForgetPasswordPage();
        break;
      case DashboardPage.routeName:
        builder = (context) => const DashboardPage();
        break;
      case OrderPage.routeName:
        builder = (context) => const OrderPage();
        break;
      case ListSOCopy.routeName:
        builder = (context) => const ListSOCopy();
        break;
      case OrderDetailPage.routeName:
        builder = (context) => const OrderDetailPage();
        break;
      case AddOrderPage.routeName:
        builder = (context) => const AddOrderPage();
        break;
      case SalesOrderListPage.routeName:
        builder = (context) => const SalesOrderListPage();
        break;
      case TargetPage.routeName:
        builder = (context) => const TargetPage();
        break;
      case DetailTargetPage.routeName:
        builder = (context) => const DetailTargetPage();
        break;
      case ProductListPage.routeName:
        final fromOrder = settings.arguments as bool;

        builder = (context) => ProductListPage(
              fromOrder: fromOrder,
            );
        break;
      case ProductFavoritePage.routeName:
        builder = (context) => const ProductFavoritePage();
        break;
      case DetailProductPage.routeName:
        final dataArgumen = settings.arguments as DetailProductArgument;

        builder = (context) => DetailProductPage(
              isCart: dataArgumen.isCart,
              isOrder: dataArgumen.isOrder,
              isReadOnly: dataArgumen.isReadOnly,
            );
        break;
      case HistoryHargaPage.routeName:
        builder = (context) => const HistoryHargaPage();
        break;
      case DetailHistoryHargaPage.routeName:
        builder = (context) => const DetailHistoryHargaPage();
        break;
      case CartListPage.routeName:
        final fromSO = settings.arguments as bool;

        builder = (context) => CartListPage(
              fromSO: fromSO,
            );
        break;
      case MenuTagihanPage.routeName:
        builder = (context) => const MenuTagihanPage();
        break;
      case ListTagihanPage.routeName:
        builder = (context) => const ListTagihanPage();
        break;
      case DetailTagihanPage.routeName:
        builder = (context) => const DetailTagihanPage();
        break;
      case BayarTagihanPage.routeName:
        builder = (context) => const BayarTagihanPage();
        break;
      case ListNotaPenagihanPage.routeName:
        builder = (context) => const ListNotaPenagihanPage();
        break;
      case ListKonfirmasiPage.routeName:
        builder = (context) => const ListKonfirmasiPage();
        break;
      case ConfirmSuccessPage.routeName:
        String? textArgument = settings.arguments as String?;

        builder = (context) => ConfirmSuccessPage(
              textBerhasil: textArgument,
            );
        break;
      case ListSetoranPage.routeName:
        builder = (context) => const ListSetoranPage();
        break;
      case SetoranTunaiPage.routeName:
        builder = (context) => const SetoranTunaiPage();
        break;
      case EntryVisitingPage.routeName:
        bool isPlanned = settings.arguments as bool;

        builder = (context) => EntryVisitingPage(
              isPlannedVisiting: isPlanned,
            );
        break;
      case RealisasiVisitingPage.routeName:
        bool isPlanned = settings.arguments as bool;

        builder = (context) => RealisasiVisitingPage(
              isPlannedVisiting: isPlanned,
            );
        break;
      case DetailVisitingPage.routeName:
        builder = (context) => const DetailVisitingPage();
        break;
      case EditingVisitingPage.routeName:
        Map<String, dynamic> argumen =
            settings.arguments as Map<String, dynamic>;

        bool isPlannedVisiting = argumen['isPlannedVisiting'] == "Plan";
        bool isEditing = argumen['isEditing'];

        builder = (context) => EditingVisitingPage(
              isPlannedVisiting: isPlannedVisiting,
              isEditing: isEditing,
            );
        break;
      case CheckInPage.routeName:

        var stringJudul = settings.arguments as String;

        builder = (context) =>  CheckInPage(fromWhere: stringJudul,);
        break;
      case CheckOutPage.routeName:
        var stringJudul = settings.arguments as String;

        builder = (context) =>  CheckOutPage(fromWhere: stringJudul,);
        break;
      default:
        builder = (context) => const SplashScreen();
        break;
    }

    return MaterialPageRoute<void>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullScreenDialog,
        maintainState: true);
  }
}
