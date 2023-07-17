import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/presentation/views/home/home_page.dart';
import 'package:becca_sales/src/presentation/views/notification/notification_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_page.dart';
import 'package:becca_sales/src/presentation/views/order/sales_order_list_page.dart';
import 'package:becca_sales/src/presentation/views/profile/profile_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/visiting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/bottom_app_bar.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<PushNotificationRepository>().requestPermission();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const _Fab(),
    );
  }

  Widget _body() {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        VisitingPage(),
        NotificationPage(),
        ProfilePage(),
      ],
    );
  }

  CustomBottomAppBar _bottomNavigationBar() {
    return CustomBottomAppBar(
      notchedShape: const CircularNotchedRectangle(),
      onTap: (page) {
        pageController.jumpToPage(page);
      },
      height: kToolbarHeight,
      backgroundColor: Colors.white,
      selectedItemColor: themeBlue,
      unselectedItemColor: ThemeColors.grey4,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      items: [
        CustomBottomAppBarItem(
          icon: CupertinoIcons.house,
          text: "Home",
        ),
        CustomBottomAppBarItem(
          icon: CupertinoIcons.location_solid,
          text: "Visit Plan",
        ),
        CustomBottomAppBarItem(
          icon: CupertinoIcons.bell_fill,
          text: "Notif",
        ),
        CustomBottomAppBarItem(
          icon: CupertinoIcons.person_fill,
          text: "Profile",
        ),
      ],
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigator.pushNamed(context, OrderPage.routeName);
        Navigator.pushNamed(context, SalesOrderListPage.routeName);

      },
      backgroundColor: ThemeColors.yellow,
      foregroundColor: Colors.white,
      child: Icon(
        CupertinoIcons.cart_fill,
        size: 28,
        color: Colors.white,
      ),
    );
  }
}
