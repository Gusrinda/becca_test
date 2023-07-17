import 'package:becca_sales/src/presentation/views/setoran/setoran_tunai_page.dart';
import 'package:flutter/material.dart';

import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class ListSetoranPage extends StatefulWidget {
  static const String routeName = '/list_setoran_page';
  const ListSetoranPage({super.key});

  @override
  State<ListSetoranPage> createState() => _ListSetoranPageState();
}

class _ListSetoranPageState extends State<ListSetoranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Setoran Tunai"),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 4,
                itemBuilder: (BuildContext c, int index) {
                  return CardListSetoranTunai();
                }),
          ),

        ],
      ),
    );
  }
}

class CardListSetoranTunai extends StatelessWidget {
  const CardListSetoranTunai({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SetoranTunaiPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.greyCaption,
                  blurRadius: 1,
                  offset: Offset(0, 0.5))
            ]),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
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
    );
  }
}

