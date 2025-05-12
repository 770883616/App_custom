import 'package:explore_pc/models/mycolors.dart';
import 'package:flutter/material.dart';

//عنصر شبكة الفئة
class CategoryGridItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;
  final String? image;

  CategoryGridItem({
    required this.title,
    this.icon,
    required this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Mycolors().myColor),
          borderRadius: BorderRadius.circular(15)),
      color: Mycolors().myColorbackgrond,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 10, right: 0, left: 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image.asset(image!)),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Mycolors().myColor)),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
