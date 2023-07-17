import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_konfirmasi_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_tagihan_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';

class MenuTagihanPage extends StatefulWidget {
  static const String routeName = '/menu_tagihan_page';

  const MenuTagihanPage({super.key});

  @override
  State<MenuTagihanPage> createState() => _MenuTagihanPageState();
}

class _MenuTagihanPageState extends State<MenuTagihanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Menu Tagihan"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFCFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, //New
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Color(0xFFB9D7FF),
                  onTap: () {
                    print("tapped");
                    Navigator.pushNamed(context, ListTagihanPage.routeName);
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(Assets.images.penagihan.path),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Penagihan",
                          style: TextStyle(
                            color: themeBlueBg,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFAFCFF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, //New
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Color(0xFFB9D7FF),
                  onTap: () {
                    print("tapped");
                    Navigator.pushNamed(context, ListKonfirmasiPage.routeName);
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(Assets.images.konfirmasi.path),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Konfirmasi",
                          style: TextStyle(
                            color: themeBlueBg,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
