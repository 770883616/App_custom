import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/models/sections.dart';
import 'package:explore_pc/sections/product_details_page.dart';
import 'package:explore_pc/widgets/mystar.dart';
import 'package:flutter/material.dart';

//عنصر شبكة المنتج
class ProductGridItem extends StatelessWidget {
  final Computer pc;

  ProductGridItem({required this.pc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Mycolors().myColor)),
      color: Mycolors().myColorbackgrond,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(pc: pc),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Image.network(
                  'http://192.168.0.29:8000/storage/${pc.image}',

                  //fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Mystar(
                    //   rating: 2,
                    // ),
                    // Text(
                    //   pc.name!,
                    //   style:
                    //       TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(height: 4.0),
                    Text(
                      'السعر: \$${pc.price!.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
