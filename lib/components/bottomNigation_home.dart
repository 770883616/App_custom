import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:explore_pc/components/account_user.dart';
import 'package:explore_pc/components/my_drawer.dart';
import 'package:explore_pc/components/mycart.dart';
import 'package:explore_pc/components/notifications.dart';
import 'package:explore_pc/components/prodectnewpanl.dart';
import 'package:explore_pc/components/sections_pc.dart';
import 'package:explore_pc/constant/crud.dart';
import 'package:explore_pc/models/cart.dart';
import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/likeprodect.dart';
import 'package:explore_pc/models/my_custom_search.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/sections/categories_page.dart';
import 'package:explore_pc/widgets/continerprodect.dart';
import 'package:explore_pc/widgets/screenprodect.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.iscart})
      : super(
          key: key,
        );

  //final String title;
  // int butcart = 3;
  final int? iscart;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int? get iscart => widget.iscart;

  late int _tabIndex = widget.iscart == 2 ? 2 : 3;
  late PageController pageController;
  List<Computer> computers = [];
  bool isLoading = true;
  late Future<List<Computer>> futureProducts;
  final ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    // _tabIndex = widget.iscart == 2 ? 2 : 3;
    pageController = PageController(initialPage: _tabIndex);
    futureProducts = apiService.getProducts();
  }

  // Future<void> fetchProducts() async {
  //   try {
  //     final products = await .fetchProducts();
  //     setState(() {
  //       computers = products;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error loading products: $e')),
  //     );
  //   }
  // }

  Future<bool> onLikeButtonTapped(bool isLiked, Computer product) async {
    if (!isLiked) {
      setState(() {
        like.add(Likeprodect(
          id: product.productId,
          image: product.image,
          name: product.name,
          price: product.price,
          grie: product.description,
        ));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تمت إضافة ${product.name} إلى المفضلة'),
          backgroundColor: Mycolors().myColor,
        ),
      );
    } else {
      setState(() {
        like.removeWhere((item) => item.id == product.productId);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('تمت إزالة ${product.name} من المفضلة'),
            backgroundColor: Mycolors().myColor),
      );
    }
    return !isLiked; // إرجاع الحالة الجديدة للإعجاب
  }

  @override
  Widget build(BuildContext context) {
    final Computer computer;

    // final List<Likeprodect> like = [];

    return Scaffold(
      appBar: AppBar(
        leading: Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("images/Explore.jpg"),
        )),
        title: Center(
            child: Text(
          "Explore PC",
          style: TextStyle(fontSize: 15),
        )),
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Notifications(),
              ));
            },
            label: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 25,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              showSearch(context: context, delegate: MyCustomSearch());
            },
            label: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Mydrawer(),
              ));
            },
            label: Icon(
              FontAwesome.list_ul_solid,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
        toolbarHeight: 60,
      ),
      //drawer: Drawer(),
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.shopping_bag_sharp, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
          Icon(Icons.favorite, color: Colors.red),
        ],
        inactiveIcons: const [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: Colors.black),
              Text("حسابي", style: TextStyle(color: Colors.black)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_sharp, color: Colors.black),
              Text("الاقسام", style: TextStyle(color: Colors.black)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Colors.black),
              Text("الرئيسية", style: TextStyle(color: Colors.black)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.black),
              Text("تسوق", style: TextStyle(color: Colors.black)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, color: Colors.black),
              Text("المفضلة", style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
        color: Colors.white,
        circleColor: const Color.fromARGB(255, 0, 217, 255),
        height: 60,
        circleWidth: 60,
        activeIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
            pageController.jumpToPage(_tabIndex);
          });
        },
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Color.fromARGB(255, 0, 217, 255),
        elevation: 5,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          setState(() {
            _tabIndex = v;
          });
        },
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: MyAccountUser(),
            //color: Colors.red,
          ),
          Container(
            //width: double.infinity,
            //height: double.infinity,
            // color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الاقسام",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      color: Mycolors().myColor,
                      child: CategoriesPage()),
                ),
              ],
            ),
          ),

          Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(children: [
                Container(child: SpecialOfferBanner()),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "منتجات",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: FutureBuilder<List<Computer>>(
                    future: futureProducts,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('حدث خطأ: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('لا توجد منتجات متاحة'));
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Mycolors().myColorbackgrondprodect,
                          ),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            padding: EdgeInsets.all(10),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final computer = snapshot.data![index];
                              // final computer = computers[index];
                              final isLiked = like
                                  .any((item) => item.id == computer.productId);
                              return Continerprodect(
                                computerindex: index,
                                computer: computer,
                                pree: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Screenprodect(
                                        computerindex: index,
                                        computer: computer,
                                      ),
                                    ),
                                  );
                                },
                                isLiked: isLiked,
                                onLikePressed: (isLiked) async {
                                  return await onLikeButtonTapped(
                                      isLiked, computer);
                                },
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ])),

          //  Container(
          //   margin: EdgeInsets.only(bottom: 70),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(40),
          //     color: Mycolors().myColorbackgrondprodect,
          //   ),
          // child:
          // GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //   ),
          //   padding: EdgeInsets.all(10),
          //   itemCount: computers.length,
          //   itemBuilder: (context, index) {
          //     final computer = computers[index];
          //     final isLiked =
          //         like.any((item) => item.id == computer.productId);
          //     return Continerprodect(
          //       computerindex: index,
          //       computer: computer,
          //       pree: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => Screenprodect(
          //               computerindex: index,
          //               computer: computer,
          //             ),
          //           ),
          //         );
          //       },
          //       isLiked: isLiked,
          //       onLikePressed: (isLiked) async {
          //         return await onLikeButtonTapped(isLiked, computer);
          //       },
          //     );
          //   },
          // ),
          // ),
          // ),

          // Container(
          //   child: Expanded(child: Homeprodect()),
          // ),

          // const SizedBox(height: 10),
          // Homeprodect()
          //Expanded(child: ProductGrid()),
          // ],
          // ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<Cart>(
              builder: (context, cart, child) {
                return cart.count == 0
                    ? Center(
                        child: Text("لايوجد منتجات في السلة"),
                      )
                    : Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Mycart(),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Mycolors().myColor.withOpacity(0.8),
                            ),

                            // width: 100,
                            margin: EdgeInsets.only(bottom: 75),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Text(
                                  "${cart.totilprice}  :مجموع السعر",
                                  style: TextStyle(
                                      color: Mycolors().myColorbackgrond,
                                      fontSize: 20),
                                )),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        child: MaterialButton(
                                          onPressed: () {},

                                          child: Text(
                                            "طلب المنتجات",
                                            // style: TextStyle(fontSize: 30),
                                          ),
                                          elevation: 10,
                                          splashColor: Mycolors().myColor,
                                          color: Mycolors().myColorbackgrond,
                                          // height: 45,
                                          // minWidth: 300,
                                          textColor: Mycolors().myColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "${cart.count}   :عدد المنتجات",
                                      style: TextStyle(
                                        color: Mycolors().myColorbackgrond,
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            // padding: EdgeInsets.symmetric(vertical: 10),
                          ))
                        ],
                      );
              },
            ),
          ),
          // Container(
          //width: double.infinity,
          //height: double.infinity,
          // color: Mycolors().myColorbackgrondprodect,
          // child:

          // ),
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   // color: Colors.orange
          //   child:
          Container(
              margin: EdgeInsets.only(bottom: 75),
              decoration: BoxDecoration(
                color: Mycolors().myColorbackgrondprodect,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FavoriteScreen(
                like: like,
              )
              // ListView(children: [
              //   Container(
              //     padding: EdgeInsets.only(right: 20, bottom: 5, top: 5),
              //     child: Text(
              //       " المفضــلة",
              //       textAlign: TextAlign.right,
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ),
              //   FavoriteScreen(
              //     like: like,
              //   )
              // ]),
              // ),
              ),
        ],
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final List<Likeprodect> like;

  FavoriteScreen({required this.like});

  @override
  Widget build(BuildContext context) {
    return like.isEmpty
        ? Center(child: Text('لا توجد منتجات في المفضلة'))
        : ListView.builder(
            itemCount: like.length,
            itemBuilder: (context, index) {
              final product = like[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
                child: Card(
                  color: Mycolors().myColorbackgrond,
                  child: ListTile(
                    trailing: Image.asset(product.image!),
                    title: Text(
                      product.name!,
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Text(
                      'السعر: ${product.price!.toStringAsFixed(2)}',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
