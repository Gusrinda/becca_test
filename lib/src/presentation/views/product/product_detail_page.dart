import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/core/config/theme_colors.dart';
import 'package:becca_sales/src/presentation/views/cart/cart_list_page.dart';
import 'package:becca_sales/src/presentation/widgets/chip_widget.dart';
import 'package:becca_sales/src/presentation/widgets/text_field_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';

class DetailProductPage extends StatefulWidget {
  static const String routeName = '/product_detail_page';

  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final CarouselController _controller = CarouselController();

    List<String> daftarImage = [
      Assets.images.produk1.path,
      Assets.images.produk2.path,
      Assets.images.produk3.path,
      Assets.images.produk4.path
    ];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.redAccent,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          print("CURRENT => ${_current}");
                        });
                      }),
                  items: daftarImage.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image(
                          image: AssetImage(i),
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: daftarImage.asMap().entries.map((entry) {
                      bool isSelected = entry.key == _current;
                      print("IS SELECTED ?? => ${isSelected}");

                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key
                                ? Colors.black54
                                : Colors.white54),
                      );
                    }).toList(),
                  ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back,
                        color: themeBlueBg,
                        size: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Tali Tampar Sea Gull 8 mm - Per Roll 200 m",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: themeFontDefault,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Icon(Icons.favorite_border_rounded)
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Product serupa",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text(
                  "Lihat semua",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w400),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 10,
                  color: Colors.redAccent,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                height: 22,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext c, int index) {
                      return GreyOutlineChip("${(index + 1) * 2} mm");
                    }),
              )),
          SizedBox(
            height: 16,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Rp 300.000",
                    style: TextStyle(
                      fontSize: 8,
                      color: ThemeColors.greyCaption,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Rp 290.000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.red,
                      ),
                    ),
                  ),
                  ColorChip("Tersedia : 30 roll", color: Color(0xFF01C817))
                ],
              )),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Kode Produk",
                            style: TextStyle(
                                fontSize: 9,
                                color: ThemeColors.greyCaption,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "AP5000A",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Group 1",
                            style: TextStyle(
                                fontSize: 9,
                                color: ThemeColors.greyCaption,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Tali",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.remove,
                                    color: themeBlueBg,
                                    size: 10,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Color(0xFFD9D9D9),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  child: Center(
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Color(0xFFD9D9D9),
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.add,
                                    color: themeBlueBg,
                                    size: 10,
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  child: Center(
                                    child: Text(
                                      'Pilih UoM',
                                      style: TextStyle(
                                          color: Color(0xFF858585),
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(3),
                                      bottomRight: Radius.circular(3)),
                                  color: Color(0xFFCCD2E3)),
                              child: Icon(
                                Icons.search_rounded,
                                size: 14,
                                color: Color(0xFF444444),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Deskripsi Produk"),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Text("""• Berat 500 g
• Tebal 8 mm
• Panjang 200 m
• Merk Sea Gull
• Pembelian minimal 3 roll"""),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final onHarga = await handleFormHarga(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Color(0xFF015AFF))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.history_edu_rounded,
                          color: Color(0xFF015AFF),
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "History Harga",
                          style:
                              TextStyle(color: Color(0xFF015AFF), fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // FloatingActionButton(
            //   onPressed: () {},
            //   elevation: 0,
            //   backgroundColor: Color(0xFFFFBE02),
            //   child: Icon(
            //     Icons.receipt_outlined,
            //     color: Colors.white,
            //   ),
            // ),
            // SizedBox(height: 32,),
            // FloatingActionButton(
            //   onPressed: () {},
            //   elevation: 0,
            //   backgroundColor: Color(0xFFEB321A),
            //   child: Icon(
            //     Icons.delete_forever_rounded,
            //     color: Colors.white,
            //   ),
            // ),
            SizedBox(
              height: 32,
            ),
            Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartListPage.routeName);
                  },
                  elevation: 0,
                  backgroundColor: Color(0xFFFFBE02),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> handleFormHarga(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
            constraints: const BoxConstraints(minWidth: 340),
            child: ListView(
              shrinkWrap: true,
              children: [
                LabelListHarga(
                  isEnabled: false,
                  judulLabel: "Price List",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Disc 1",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Disc 2",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Disc 3",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Disc 4",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Disc 5",
                ),
                LabelListHarga(
                  isEnabled: true,
                  judulLabel: "Diskon Amount",
                ),
                LabelListHarga(
                  isEnabled: false,
                  judulLabel: "Total Diskon",
                ),
                LabelListHarga(
                  isEnabled: false,
                  judulLabel: "Netto",
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
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
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
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
                          child: const Text('Yes',
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

class LabelListHarga extends StatelessWidget {
  const LabelListHarga({
    super.key, required this.judulLabel, required this.isEnabled,
  });

  final String judulLabel;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(judulLabel)),
          SizedBox(
            width: 20,
          ),
          Expanded(
              flex: 1,
              child: FormzTextField(
                enabled: isEnabled,
                keyboardType: TextInputType.number,
              ))
        ],
      ),
    );
  }
}
