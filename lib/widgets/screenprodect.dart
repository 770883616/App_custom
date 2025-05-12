import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/countbutton.dart';
import 'package:explore_pc/widgets/mystar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class Screenprodect extends StatelessWidget {
  Screenprodect(
      {super.key, this.computerindex, required this.computer, this.pree});
  final int? computerindex;
  final Computer computer;

  VoidCallback? pree;
  @override
  Widget build(BuildContext context) {
    double rating = (computer.ratings ?? 0).toDouble();
    return Myscaffold(
        mywidget: Scaffold(
            backgroundColor: Mycolors().myColor,
            // appBar: AppBar(
            //   title: Text(prodectPc.name!),
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
                                                color: Mycolors()
                                                    .myColorbackgrond),
                                          )),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        // width: 100,
                                        // height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'http://192.168.0.29:8000/storage/${computer.image}',
                                            ),
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      )),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          computer.name!,
                                          style: TextStyle(
                                              color:
                                                  Mycolors().myColorbackgrond,
                                              fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "السعر",
                                              style: TextStyle(
                                                  color: Mycolors()
                                                      .myColorbackgrond,
                                                  fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "${computer.price!}",
                                              style: TextStyle(
                                                  color: Mycolors()
                                                      .myColorbackgrond,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(computer.description),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Mystar(rating: rating)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Buttoncount(),
                            Text(
                                "${computer.stockQuantity.toString()}  الكمية المتوفرة"),
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
                            child: Icon(Icons.add_shopping_cart,
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
                                  cart.add(computer);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'تمت إضافة ${computer.name} إلى السلة'),
                                      backgroundColor: Mycolors().myColor,
                                    ),
                                  );
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Mycolors().myColor,
                                        border: Border.all(
                                            color: Mycolors().myColor)),
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
            //           prodectPc.image!,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Center(
            //         child: Text(prodectPc.name!),
            //       ),
            //       Center(
            //         child: Text(prodectPc.price.toString()),
            //       ),
            //     ],
            //   ),
            // ),
            ));
  }
}
