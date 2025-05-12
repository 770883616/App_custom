import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/models/cart.dart';
import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/models/sections.dart';
import 'package:explore_pc/widgets/countbutton.dart';
import 'package:explore_pc/widgets/mystar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//صفحة تفاصيل المنتج
class ProductDetailsPage extends StatelessWidget {
  final Computer pc;

  ProductDetailsPage({required this.pc});

  @override
  Widget build(BuildContext context) {
    double rating = (pc.ratings ?? 0).toDouble();
    return Scaffold(
        backgroundColor: Mycolors().myColor,
        // appBar: AppBar(
        //   title: Text(Sections.name!),
        //   actions: [Icon(Icons.shopping_cart)],
        // ),
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Mycolors().myColor,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.keyboard_backspace_rounded),
                            color: Mycolors().myColorbackgrond,
                          ),
                          Consumer<Cart>(
                            builder: (context, cart, child) {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                          iscart: 3,
                                        ),
                                      ));
                                    },
                                    icon: Icon(Icons.shopping_cart),
                                    color: Mycolors().myColorbackgrond,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "${cart.count}",
                                        style: TextStyle(
                                            color: Mycolors().myColorbackgrond),
                                      )),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  'http://192.168.0.29:8000/storage/${pc.image}',
                                ),
                              ),
                              // SizedBox(
                              //   width: 30,
                              // ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      pc.name!,
                                      style: TextStyle(
                                          color: Mycolors().myColorbackgrond,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "السعر",
                                          style: TextStyle(
                                              color:
                                                  Mycolors().myColorbackgrond,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${pc.price!}",
                                          style: TextStyle(
                                              color:
                                                  Mycolors().myColorbackgrond,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Mycolors().myColorbackgrond,
                ),
                child: Column(
                  children: [
                    Text(pc.description!),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Mystar(rating: rating)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Buttoncount(),
                        Text("${pc.stockQuantity.toString()}  الكمية المتوفرة"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              color: Mycolors().myColorbackgrond,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Mycolors().myColor)),
                        child: Icon(Icons.shopping_cart,
                            color: Mycolors().myColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Container(
                        //alignment: Alignment.center,
                        // width: 300,
                        height: 45,
                        child: Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              cart.addSections(pc);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('تمت إضافة ${pc.name} إلى السلة'),
                                  backgroundColor: Mycolors().myColor,
                                ),
                              );
                            },
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Mycolors().myColor,
                                    border:
                                        Border.all(color: Mycolors().myColor)),
                                child: Text(
                                  "إضافة الي السلة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Mycolors().myColorbackgrond,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      );
                    },
                  )),
                ],
              ),
            )),
          ],
        )
        //  InkWell(
        //   onTap: pree,
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 100,
        //         width: 100,
        //         child: Image.asset(
        //           Sections.image!,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       Center(
        //         child: Text(Sections.name!),
        //       ),
        //       Center(
        //         child: Text(Sections.price.toString()),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
