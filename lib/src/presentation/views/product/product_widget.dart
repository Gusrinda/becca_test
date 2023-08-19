import 'package:becca_sales/src/presentation/views/product/product_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../../core/model/argument_detail_product.dart';

class CardListProduct extends StatelessWidget {
  const CardListProduct({
    super.key,
    required this.isFavorite,
    required this.isDiscount,
    required this.isOrder,
  });

  final bool isOrder;
  final bool isFavorite;
  final bool isDiscount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DetailProductArgument detailProductArgument = DetailProductArgument(
            isCart: false, isOrder: isOrder, isReadOnly: false);

        Navigator.pushNamed(
          context,
          DetailProductPage.routeName,
          arguments: detailProductArgument,
        );

      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(Assets.images.produk4.path),
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    isFavorite
                        ? Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              margin: EdgeInsets.only(right: 10, bottom: 10),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                            ),
                          )
                        : SizedBox(),
                    isDiscount
                        ? Positioned(
                            top: 0,
                            right: 18,
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                color: Color(0xFFFF3E3E),
                                child: RichText(
                                  text: TextSpan(
                                    text: '5%',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text: '\noff',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  "Pipa uPVC untuk Instalasi  Air Minum",
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Rp ',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDiscount ? Colors.red : Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: isDiscount ? '25.000' : '30.000',
                            style: TextStyle(
                              fontSize: 18,
                              color: isDiscount ? Colors.red : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    isDiscount
                        ? Text(
                            "Rp 30.000",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  "Tersedia 500",
                  style: TextStyle(
                    fontSize: 12,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w400,
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

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: MediaQuery.of(context).size.width / 7),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    print("grup value : ${groupValue}");
    final isSelected = value == groupValue;
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, 0.0),
                  transform: GradientRotation(3.14 / 4),
                  tileMode: TileMode.clamp,
                  colors: ThemeColors.linearGradientColors,
                )
              : null,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 14,
          ),
        ));
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(15.0, 0.0);

    var firstControlPoint = Offset(7.5, 2.0);
    var firstPoint = Offset(5.0, 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(2.0, 7.5);
    var secondPoint = Offset(0.0, 15.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height - 5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
