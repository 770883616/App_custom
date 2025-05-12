import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/likeprodect.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/continerprodect.dart';
import 'package:explore_pc/widgets/mystar.dart';
import 'package:explore_pc/widgets/screenprodect.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyCustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.close,
            color: Mycolors().myColor,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Mycolors().myColor,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text("Search");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Computer computer;
    List<Computer> computerSearch;
    return Text(query);
    // TODO: implement buildSuggestions
    // if (query == "") {
    //   return GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //     ),
    //     padding: EdgeInsets.all(10),
    //     itemCount: Computers.length,
    //     itemBuilder: (context, index) {
    //       final computer = Computers[index];
    //       final isLiked = like.any((item) => item.id == computer.id);
    //       return ContinerprodectSearch(
    //         computerindex: index,
    //         computer: computer,
    //         pree: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => Screenprodect(
    //                 computerindex: index,
    //                 computer: computer,
    //               ),
    //             ),
    //           );
    //         },

    //       );
    //     },
    //   );
    // } else {
    //   computerSearch = Computers.where((element) {

    //     return element.name?.toLowerCase().contains(query.toLowerCase()) ??
    //         false;

    //   }).toList();
    //   return GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 10,
    //       mainAxisSpacing: 10,
    //     ),
    //     padding: EdgeInsets.all(10),
    //     itemCount: computerSearch.length,
    //     itemBuilder: (context, index) {
    //       final computer = computerSearch[index];
    //       final isLiked = like.any((item) => item.id == computer.id);
    //       return ContinerprodectSearch(
    //         computerindex: index,
    //         computer: computer,
    //         pree: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => Screenprodect(
    //                 computerindex: index,
    //                 computer: computer,
    //               ),
    //             ),
    //           );
    //         },

    //       );
    //     },
    //   );
    // }
  }
}

class ContinerprodectSearch extends StatelessWidget {
  ContinerprodectSearch({
    super.key,
    this.computerindex,
    required this.computer,
    this.pree,
  });

  final int? computerindex;
  final Computer computer;
  final VoidCallback? pree;
  // final bool isLiked;
  // final Future<bool> Function(bool isLiked) onLikePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pree,
      child: Container(
        decoration: BoxDecoration(
          color: Mycolors().myColorbackgrond,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Mycolors().myColor),
          boxShadow: [
            BoxShadow(
              color: Mycolors().myColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            Align(
              // alignment: Alignment.topRight,
              child: LikeButton(
                mainAxisAlignment: MainAxisAlignment.end,
                size: 25,
                padding: EdgeInsets.only(right: 10),
                // isLiked: isLiked,
                // onTap: onLikePressed,
              ),
            ),
            Expanded(
              child: Image.asset(computer.image!),
            ),
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Mystar(
                rating: 2.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "ر.ي" + computer.price.toString(),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
