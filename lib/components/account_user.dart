import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/widgets/mylisttileuser.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MyAccountUser extends StatelessWidget {
  const MyAccountUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      mywidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/AYMAN.jpg"),
                //child: Image.asset("images/Explore.jpg"),
              ),
              Text("أيمــن توفيــق"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    //width: 150,
                    height: 40,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "تعديل الصورة",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.update_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "تعديل",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.mode_edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 2,
                height: 1,
                alignment: Alignment.center,
                color: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Mylisttile(
                      title: "الاعدادات",
                      leading: Icon(Icons.edit_note_rounded),
                      trailing: Icon(
                        Icons.settings,
                      ),
                    ),
                    Mylisttile(
                      title: "العنوان",
                      leading: Icon(Icons.edit_note_rounded),
                      trailing: Icon(
                        AntDesign.environment_twotone,
                      ),
                    ),
                    Mylisttile(
                      title: "تتبع الطلب",
                      leading: Icon(Icons.navigate_next_outlined),
                      trailing: Icon(
                        Icons.car_crash_rounded,
                      ),
                    ),
                    Mylisttile(
                      title: "تسجيل الخروج",
                      //leading: Icon(Icons.exit_to_app),
                      trailing: Icon(Icons.logout_outlined),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
