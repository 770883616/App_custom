import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/models/cart.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/my_continer_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    bool ischeck = false;
    return Myscaffold(
      mywidget: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Mycolors().myColorbackgrondprodect,
          borderRadius: BorderRadius.circular(20),
        ),
        // color: Mycolors().myColorbackgrondprodect,
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
              itemCount: cart.backetitem.length +
                  cart.backetitemsection.length, // عدد العناصر الكلي
              itemBuilder: (context, i) {
                // التحقق من الفهرس لمعرفة القائمة التي ينتمي إليها العنصر
                if (i < cart.backetitem.length) {
                  // العنصر من القائمة الأولى (backetitem)
                  return MycontinerCart(
                    title: cart.backetitem[i].name,
                    image: cart.backetitem[i].image,
                    price: cart.backetitem[i].price,
                    preeremove: () {
                      cart.remove(cart.backetitem[i]); // إزالة العنصر من السلة
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'تمت حذف ${cart.backetitem[i].name} من السلة'),
                          backgroundColor: Mycolors().myColor,
                        ),
                      );
                    },
                  );
                } else {
                  // العنصر من القائمة الثانية (backetitemsection)
                  int sectionIndex =
                      i - cart.backetitem.length; // حساب الفهرس الصحيح
                  return MycontinerCart(
                    title: cart.backetitem[sectionIndex].name,
                    image: cart.backetitem[sectionIndex].image,
                    price: cart.backetitem[sectionIndex].price,
                    preeremove: () {
                      cart.remove(cart
                          .backetitem[sectionIndex]); // إزالة العنصر من السلة
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'تمت حذف ${cart.backetitem[sectionIndex].name} من السلة'),
                          backgroundColor: Mycolors().myColor,
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        ),
        //  Consumer<Cart>(
        //   builder: (context, cart, child) {
        //     return ListView.builder(
        //       itemCount:
        //           cart.backetitem.length + cart.backetitemsection.length,
        //       itemBuilder: (context, i) {
        //         if (cart.backetitem.length > 0) {
        //           return MycontinerCart(
        //             title: cart.backetitem[i].name,
        //             image: cart.backetitem[i].image,
        //             price: cart.backetitem[i].price,
        //             preeremove: () {
        //               cart.remove(cart.backetitem[i]);
        //               ScaffoldMessenger.of(context).showSnackBar(
        //                 SnackBar(
        //                   content: Text(
        //                       'تمت حذف ${cart.backetitem[i].name} من السلة'),
        //                   backgroundColor: Mycolors().myColor,
        //                 ),
        //               );
        //             },
        //           );
        //         } else if (cart.backetitemsection.length > 0) {
        //           return MycontinerCart(
        //             title: cart.backetitemsection[i].name,
        //             image: cart.backetitemsection[i].image,
        //             price: cart.backetitemsection[i].price,
        //             preeremove: () {
        //               cart.removeSections(cart.backetitemsection[i]);
        //               ScaffoldMessenger.of(context).showSnackBar(
        //                 SnackBar(
        //                   content: Text(
        //                       'تمت حذف ${cart.backetitemsection[i].name} من السلة'),
        //                   backgroundColor: Mycolors().myColor,
        //                 ),
        //               );
        //             },
        //           );
        //         }
        //       },

        //     );
        //   },
        // )
      ),
    );
  }
}
