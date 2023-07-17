import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'notification_settings.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  void initState() {
    // Notifications.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<String> daftarNotifikasi = [
      "Target",
      "Tagihan",
      "Notifikasi",
      "Visiting",
      "Tagihan",

    ];


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifikasi"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          ListView.builder(
              shrinkWrap: true, //MUST TO ADDED
              //MUST TO ADDED
              itemCount: daftarNotifikasi.length,
              itemBuilder: (BuildContext c, int index) {
                return  CardListNotification(
                  tipeNotifikasi: daftarNotifikasi[index],
                );
              }),

        ],
      ),
    );
  }
}

class CardListNotification extends StatelessWidget {
  const CardListNotification({
    super.key, required this.tipeNotifikasi,
  });

  final String tipeNotifikasi;


  @override
  Widget build(BuildContext context) {

    FaIcon iconNotifikasi;

    if (tipeNotifikasi == "Target") {
      iconNotifikasi = FaIcon(
        FontAwesomeIcons.bullseye,
        color: Colors.green,
        size: 20,
      );
    }   else if (tipeNotifikasi == "Visiting") {
      iconNotifikasi = FaIcon(
        FontAwesomeIcons.locationDot,
        color: Colors.orange,
        size: 20,
      );
    }   else if (tipeNotifikasi == "Tagihan") {
      iconNotifikasi = FaIcon(
        FontAwesomeIcons.clipboard,
        color: Colors.blue,
        size: 20,
      );
    }   else {
      iconNotifikasi = FaIcon(
        FontAwesomeIcons.bell,
        color: Colors.yellow,
        size: 20,
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0x33DDDDDD)),
                child:iconNotifikasi
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat! Anda berhasil mencapai target ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ), SizedBox(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Judul",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Keterangan",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(width: 8,)
              ,Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 16,)
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
