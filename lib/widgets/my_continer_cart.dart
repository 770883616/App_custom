import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/countbutton.dart';
import 'package:flutter/material.dart';

class MycontinerCart extends StatelessWidget {
  MycontinerCart(
      {super.key, this.image, this.title, this.price, this.preeremove});
  String? image, title;
  double? price;
  VoidCallback? preeremove;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors().myColorbackgrond,
      ),
      child: Row(
        children: [
          // Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: [

          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: preeremove,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          // Expanded(flex: 2, child: Buttoncount())
          // ],
          // ),
          // Expanded(
          //   child: SizedBox(
          //     width: 40,
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(title!),
                Text("${price} :السعر"),
              ],
            ),
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Expanded(
              child: Container(
            // width: 100,
            // height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  'http://192.168.0.29:8000/storage/${image}',
                ),
                // fit: BoxFit.cover,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
