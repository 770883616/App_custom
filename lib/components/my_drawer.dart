import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/widgets/mylist_drawer.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors().myColorbackgrondprodect,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            IconButton(
                alignment: Alignment.centerLeft,
                //padding: EdgeInsets.only(right: 150),
                color: Mycolors().myColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.cancel_presentation_sharp)),
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 20),
              child: Text(
                " عــام",
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Mycolors().myColorbackgrond),
              child: Column(
                children: [
                  MyListDrawer(
                    title: "الملف الشخصي",
                    trailing: Icon(
                      Icons.person_rounded,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " العنــوان",
                    trailing: Icon(
                      AntDesign.environment_twotone,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " الفئــات",
                    trailing: Icon(
                      Icons.category_rounded,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " الاشعــارات",
                    trailing: Icon(
                      Icons.notifications_rounded,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " الاعدادات",
                    trailing: Icon(
                      Icons.settings,
                      color: Mycolors().myColor,
                    ),
                    // pree: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Settings(),
                    //   ));
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10, right: 20),
              child: Text(
                "المســاعدة والدعــم",
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Mycolors().myColorbackgrond),
              child: Column(
                children: [
                  MyListDrawer(
                    title: " صندوق الوارد",
                    trailing: Icon(
                      Icons.message,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " اتصل بنا",
                    trailing: Icon(
                      Icons.phone,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " تذاكر الدعم",
                    trailing: Icon(
                      Icons.support_agent_sharp,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " الشروط والاحكام",
                    trailing: Icon(
                      Icons.document_scanner_rounded,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " سياسة الخصوصية",
                    trailing: Icon(
                      Icons.privacy_tip,
                      color: Mycolors().myColor,
                    ),
                  ),
                  MyListDrawer(
                    title: " معلومات عنا",
                    trailing: Icon(
                      Icons.person_2_rounded,
                      color: Mycolors().myColor,
                    ),
                  ),
                ],
              ),
            ),
            MyListDrawer(
              title: "  تسجيل الخروج",
              trailing: Icon(
                Icons.logout_outlined,
                color: Mycolors().myColor,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "الاصدار 1.1",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
