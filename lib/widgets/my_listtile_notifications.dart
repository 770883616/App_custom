import 'package:explore_pc/models/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyListtileNotifications extends StatelessWidget {
  MyListtileNotifications({
    super.key,
    this.titel,
  });
  String? titel;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Card(
      color: Mycolors().myColorbackgrond,
      child: ListTile(
        title: Text(
          titel!,
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          formattedDate,
          textAlign: TextAlign.right,
        ),
        trailing: CircleAvatar(
          backgroundColor: Mycolors().myColor,
          child: Icon(
            Icons.image_search_outlined,
            color: Mycolors().myColorbackgrond,
          ),
        ),
      ),
    );
  }
}
