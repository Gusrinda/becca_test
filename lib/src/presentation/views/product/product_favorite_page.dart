import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/presentation/views/product/product_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class ProductFavoritePage extends StatefulWidget {
  static const String routeName = '/product_favorite_page';

  const ProductFavoritePage({super.key});

  @override
  State<ProductFavoritePage> createState() => _ProductFavoritePageState();
}

class _ProductFavoritePageState extends State<ProductFavoritePage> {
  @override
  Widget build(BuildContext context) {
    double widhtGrid = (MediaQuery.of(context).size.width / 2);

    double heightGrid = (MediaQuery.of(context).size.height / 2.75);

    print("WIDHT => ${widhtGrid}");
    print("HEIGHT => ${heightGrid}");

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "List Favorite",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16.sp),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.star,
                  color: Color(0xFFFFBE02),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 30, 32, 0),
            child: SearchFieldGrayBar(
                hintText: "Search ...",
                fillColor: ThemeColors.grey6,
                onSubmitted: (value) {}),
          ),
          const SizedBox(
            height: 20,
          ),

          // CardListProduct()
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DynamicHeightGridView(
                  itemCount: 12,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  builder: (ctx, index) {
                    return CardListProduct(isFavorite: true, isDiscount: index.isOdd,);
                  }
              ),
              // child: GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         childAspectRatio: MediaQuery.of(context).size.width /
              //             (MediaQuery.of(context).size.height / 1.2),
              //         // childAspectRatio: widhtGrid / heightGrid,
              //         crossAxisSpacing: 20,
              //         mainAxisSpacing: 16),
              //     itemCount: 12,
              //     itemBuilder: (BuildContext ctx, index) {
              //       return CardListProduct();
              //     }),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> handleFormSort(BuildContext context) async {
    final rxPickup = ValueNotifier('A-Z');

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose Sort By",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...['A-Z', 'Stock Terbanyak', 'Terbaru'].map((pickup) {
                          return ValueListenableBuilder<String>(
                            valueListenable: rxPickup,
                            builder: (context, groupValue, child) {
                              return RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                value: pickup,
                                activeColor: themeBlueBg,
                                groupValue: groupValue,
                                onChanged: (value) => rxPickup.value = value!,
                                title: Text(
                                  pickup,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: themeBlack),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, "false"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: themeFontDefault),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "true");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeBlueBg,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('OK',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String?> handleFormFilter(BuildContext context) async {
    final rxPickup = ValueNotifier('Favorite');

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose Filter",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10,),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 8,
                        children: [
                          ...[
                            'Favorite',
                            'Milliard',
                            'Plastik',
                            'Nagasakti',
                            'Rucika',
                            ' Seagull Tali',
                            'Onda',
                            'Paku',
                            'Maspion',
                            'Galvalum'
                          ].map((pickup) {
                            return ValueListenableBuilder<String>(
                              valueListenable: rxPickup,
                              builder: (context, groupValue, child) {
                                return RadioListTile(

                                  contentPadding: EdgeInsets.all(0),
                                  value: pickup,
                                  activeColor: themeBlueBg,
                                  groupValue: groupValue,
                                  onChanged: (value) => rxPickup.value = value!,
                                  title: Text(
                                    pickup,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: themeBlack),
                                  ),
                                );
                              },
                            );
                          }),
                        ],
                      )),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, "false"),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: themeFontDefault),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "true");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeBlueBg,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('OK',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
