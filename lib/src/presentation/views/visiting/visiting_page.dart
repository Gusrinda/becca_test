import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:becca_sales/src/presentation/views/visiting/detail_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/entry_visiting_page.dart';
import 'package:becca_sales/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';

class VisitingPage extends StatefulWidget {
  const VisitingPage({super.key});

  @override
  State<VisitingPage> createState() => _VisitingPageState();
}

class _VisitingPageState extends State<VisitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Visiting List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: FormzTextField(
                            textAlign: TextAlign.center,
                            textEditingController: TextEditingController(
                                text: kShortDateFormat.format(
                                    DateTime.now().add(Duration(days: -7)))),
                            readOnly: true,
                            trailing: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Text("To",style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: FormzTextField(
                            textAlign: TextAlign.center,
                            textEditingController: TextEditingController(
                                text: kShortDateFormat.format(DateTime.now())),
                            readOnly: true,
                            trailing: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 4,
                itemBuilder: (BuildContext c, int index) {
                  return CardListVisiting();
                }),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EntryVisitingPage.routeName, arguments: false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeRed,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Unplanned',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EntryVisitingPage.routeName, arguments: true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeGreen,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Planned',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardListVisiting extends StatelessWidget {
  const CardListVisiting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailVisitingPage.routeName);
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "PT MULIA JAYA",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    "Promosi (On Site)",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Planned : 23-03-2023",
                  style: TextStyle(
                    fontSize: 11,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  "Realisasi : 30-04-2023",
                  style: TextStyle(
                    fontSize: 11,
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


