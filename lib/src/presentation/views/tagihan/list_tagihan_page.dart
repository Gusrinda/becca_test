import 'package:becca_sales/src/presentation/views/tagihan/confirm_success_page.dart';
import 'package:becca_sales/src/presentation/views/tagihan/detail_tagihan_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class ListTagihanPage extends StatefulWidget {
  static const String routeName = '/list_tagihan_page';

  const ListTagihanPage({super.key});

  @override
  State<ListTagihanPage> createState() => _ListTagihanPageState();
}

class _ListTagihanPageState extends State<ListTagihanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Tagihan"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: SearchFieldGrayBar(
                hintText: "Search ...",
                fillColor: ThemeColors.grey6,
                onSubmitted: (value) {}),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 4,
                itemBuilder: (BuildContext c, int index) {
                  return CardListTagihan(
                    isSelected: index == 0,
                    onTapCard: () {
                      Navigator.pushNamed(context, DetailTagihanPage.routeName);
                    },
                  );
                }),
          ),
          SafeArea(
              minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () async {
                      final isOke = await handleFormSubmit(context);

                      if (isOke != null) {
                        if (isOke) {
                          Navigator.popAndPushNamed(
                              context, ConfirmSuccessPage.routeName);
                        }
                      }
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: themeBlueBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 8)),
                  )))
        ],
      ),
    );
  }

  Future<bool?> handleFormSubmit(BuildContext context) async {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(Assets.images.confirmation.path)),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Apakah anda yakin?",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: themeFontDefault),
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

class CardListTagihan extends StatelessWidget {
  const CardListTagihan({
    super.key,
    required this.isSelected,
    this.onTapCard,
  });

  final bool isSelected;
  final VoidCallback? onTapCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: null,
            activeColor: themeBlueBg,
            checkColor: Colors.white,
            fillColor: MaterialStateColor.resolveWith((states) => themeBlueBg),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTapCard,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: ThemeColors.greyCaption,
                          blurRadius: 1,
                          offset: Offset(0, 0.5))
                    ]),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            child: Text(
                          "PT MULIA JAYA",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                        Text(
                          "Rp 10.000.000",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "CP : Inneke 081122224545",
                          style: TextStyle(
                            fontSize: 11,
                            color: ThemeColors.greyCaption,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                        Text(
                          "30-04-2023",
                          style: TextStyle(
                            fontSize: 8,
                            color: ThemeColors.greyCaption,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
