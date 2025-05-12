import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/my_listtile_notifications.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      mywidget: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        color: Mycolors().myColorbackgrondprodect,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel_presentation_sharp,
                    color: Mycolors().myColor,
                  ),
                ),
                Text("الإشعــارات"),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            MyListtileNotifications(
              titel: "الاشعارات الجديدة",
            ),
          ],
        ),
      ),
    );
  }
}
