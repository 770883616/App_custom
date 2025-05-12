import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/models/sections.dart';
import 'package:explore_pc/sections/category_gridItem.dart';
import 'package:explore_pc/sections/class_subcategoreis.dart';
import 'package:explore_pc/sections/sub_categories_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  // دالة لجلب الأقسام الفرعية مع تصنيف المنتجات
  Future<List<subcategoreis>> _getSubCategories(String mainCategory) async {
    try {
      // جلب جميع المنتجات من الفئة الرئيسية
      final products = await Sections.fetchProductsByCategory("الحواسيب");

      // تصنيف المنتجات إلى فئات فرعية
      List<Computer> personalComputers = products
          .where((product) => product.category == 'حواسيب شخصية')
          .toList();

      List<Computer> desktopComputers = products
          .where((product) => product.category == 'حواسيب مكتبية')
          .toList();

      List<Computer> gamingComputers = products
          .where((product) => product.category == 'حواسيب جيمنج')
          .toList();

      // إنشاء قائمة الأقسام الفرعية
      List<subcategoreis> subCategories = [];

      // إضافة الأقسام الفرعية فقط إذا كانت تحتوي على منتجات
      if (personalComputers.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'حواسيب شخصية',
            image: "images/computer.png",
            sections: personalComputers,
          ),
        );
      }

      if (desktopComputers.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'حواسيب مكتبية',
            image: "images/desktopcomputer.png",
            sections: desktopComputers,
          ),
        );
      }

      if (gamingComputers.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'حواسيب جيمنج',
            image: "images/gaming.png",
            sections: gamingComputers,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching subcategories: $e');
      return [];
    }
  }

  // دالة لجلب الأقسام الفرعية للسماعات
  Future<List<subcategoreis>> _getHeadphonesSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('السماعات');

      List<Computer> wiredHeadphones = products
          .where((product) => product.category == 'سماعات سلكية')
          .toList();

      List<Computer> wirelessHeadphones = products
          .where((product) => product.category == 'سماعات لاسلكية')
          .toList();

      List<subcategoreis> subCategories = [];

      if (wiredHeadphones.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'سماعات سلكية',
            image: "images/s.png",
            sections: wiredHeadphones,
          ),
        );
      }

      if (wirelessHeadphones.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'سماعات لاسلكية',
            image: "images/s.png",
            sections: wirelessHeadphones,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching headphones subcategories: $e');
      return [];
    }
  }

  // دالة لجلب الأقسام الفرعية للكيبوردات
  Future<List<subcategoreis>> _getKeyboardsSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('الكيبوردات');

      List<Computer> standardKeyboards = products
          .where((product) => product.category == 'كيبورد عادي')
          .toList();

      List<Computer> gamingKeyboards = products
          .where((product) => product.category == 'كيبورد جيمنج')
          .toList();

      List<subcategoreis> subCategories = [];

      if (standardKeyboards.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'كيبورد عادي',
            image: "images/k.png",
            sections: standardKeyboards,
          ),
        );
      }

      if (gamingKeyboards.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'كيبورد جيمنج',
            image: "images/k.png",
            sections: gamingKeyboards,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching keyboards subcategories: $e');
      return [];
    }
  }

// دالة لجلب الأقسام الفرعية للشاشات
  Future<List<subcategoreis>> _getMonitorsSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('الشاشات');

      List<Computer> lcdMonitors =
          products.where((product) => product.category == 'LCD شاشات').toList();

      List<Computer> ledMonitors =
          products.where((product) => product.category == 'LED شاشات').toList();

      List<Computer> oledMonitors = products
          .where((product) => product.category == 'OLED شاشات')
          .toList();

      List<subcategoreis> subCategories = [];

      if (lcdMonitors.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'LCD شاشات',
            image: "images/monitor_lcd.png", // تأكد من وجود الصورة
            sections: lcdMonitors,
          ),
        );
      }

      if (ledMonitors.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'LED شاشات',
            image: "images/monitor_led.png", // تأكد من وجود الصورة
            sections: ledMonitors,
          ),
        );
      }

      if (oledMonitors.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'OLED شاشات',
            image: "images/monitor_oled.png", // تأكد من وجود الصورة
            sections: oledMonitors,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching monitors subcategories: $e');
      return [];
    }
  }

  Future<List<subcategoreis>> _getAudioSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('الصوتيات');

      List<Computer> wiredMicrophones = products
          .where((product) => product.category == 'مكرفون سلكي')
          .toList();

      List<Computer> wirelessMicrophones = products
          .where((product) => product.category == 'مكرفون لا سلكي')
          .toList();

      List<subcategoreis> subCategories = [];

      if (wiredMicrophones.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'مكرفونات سلكية',
            image: "images/mic_wired.png", // تأكد من وجود الصورة
            sections: wiredMicrophones,
          ),
        );
      }

      if (wirelessMicrophones.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'مكرفونات لاسلكية',
            image: "images/mic_wireless.png", // تأكد من وجود الصورة
            sections: wirelessMicrophones,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching audio subcategories: $e');
      return [];
    }
  }

// دالة لجلب الأقسام الفرعية للتخزين
  Future<List<subcategoreis>> _getStorageSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('التخزين');

      List<Computer> hdd =
          products.where((product) => product.category == 'HDD').toList();

      List<Computer> ssd =
          products.where((product) => product.category == 'SSD').toList();

      List<Computer> nvme =
          products.where((product) => product.category == 'NVMe M.2').toList();

      List<Computer> nas =
          products.where((product) => product.category == 'NAS').toList();

      List<Computer> ssdHdd =
          products.where((product) => product.category == 'SSD HDD').toList();

      List<Computer> sshd =
          products.where((product) => product.category == 'SSHD').toList();

      List<subcategoreis> subCategories = [];

      if (hdd.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'HDD',
            image: "images/storage_hdd.png",
            sections: hdd,
          ),
        );
      }

      if (ssd.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'SSD',
            image: "images/storage_ssd.png",
            sections: ssd,
          ),
        );
      }

      if (nvme.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'NVMe M.2',
            image: "images/storage_nvme.png",
            sections: nvme,
          ),
        );
      }

      if (nas.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'NAS',
            image: "images/storage_nas.png",
            sections: nas,
          ),
        );
      }

      if (ssdHdd.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'SSD HDD',
            image: "images/storage_ssd_hdd.png",
            sections: ssdHdd,
          ),
        );
      }

      if (sshd.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'SSHD',
            image: "images/storage_sshd.png",
            sections: sshd,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching storage subcategories: $e');
      return [];
    }
  }

// دالة لجلب الأقسام الفرعية للطاقة
  Future<List<subcategoreis>> _getPowerSubCategories() async {
    try {
      final products = await Sections.fetchProductsByCategory('الطاقة');

      List<Computer> batteries =
          products.where((product) => product.category == 'البطاريات').toList();

      List<Computer> cables =
          products.where((product) => product.category == 'الكابلات').toList();

      List<Computer> adapters =
          products.where((product) => product.category == 'المحولات').toList();

      List<subcategoreis> subCategories = [];

      if (batteries.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'البطاريات',
            image: "images/power_battery.png",
            sections: batteries,
          ),
        );
      }

      if (cables.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'الكابلات',
            image: "images/power_cable.png",
            sections: cables,
          ),
        );
      }

      if (adapters.isNotEmpty) {
        subCategories.add(
          subcategoreis(
            name: 'المحولات',
            image: "images/power_adapter.png",
            sections: adapters,
          ),
        );
      }

      return subCategories;
    } catch (e) {
      print('Error fetching power subcategories: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Myscaffold(
      mywidget: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Mycolors().myColorbackgrondprodect,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            CategoryGridItem(
              image: "images/computer.png",
              title: 'الحواسيب',
              icon: Icons.computer,
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);

                // عرض مؤشر تحميل
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getSubCategories('الحواسيب');

                  // إغلاق مؤشر التحميل
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text('لا توجد منتجات متاحة حالياً')),
                    );
                    return;
                  }

                  // الانتقال إلى صفحة الأقسام الفرعية
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'الحواسيب',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(content: Text('حدث خطأ أثناء جلب البيانات: $e')),
                  );
                }
              },
            ),

            // قسم السماعات
            CategoryGridItem(
              image: "images/s.png",
              title: 'السماعات',
              icon: Icons.headphones,
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getHeadphonesSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text('لا توجد سماعات متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'السماعات',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text('حدث خطأ أثناء جلب بيانات السماعات: $e')),
                  );
                }
              },
            ),
            // قسم الكيبوردات
            CategoryGridItem(
              image: "images/k.png",
              title: 'الكيبوردات',
              icon: Icons.keyboard,
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getKeyboardsSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text('لا توجد كيبوردات متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'الكيبوردات',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content:
                            Text('حدث خطأ أثناء جلب بيانات الكيبوردات: $e')),
                  );
                }
              },
            ),

            CategoryGridItem(
              image: "images/Led-screen.png", // صورة رئيسية للشاشات
              title: 'الشاشات',
              icon: Icons.desktop_windows, // أيقونة مناسبة للشاشات
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getMonitorsSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text('لا توجد شاشات متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'الشاشات',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text('حدث خطأ أثناء جلب بيانات الشاشات: $e')),
                  );
                }
              },
            ),

            // قسم الصوتيات
            CategoryGridItem(
              image: "images/speker.png", // صورة رئيسية للصوتيات
              title: 'الصوتيات',
              icon: Icons.mic, // أيقونة مناسبة للميكروفونات
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getAudioSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                          content: Text('لا توجد منتجات صوتيات متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'الصوتيات',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text('حدث خطأ أثناء جلب بيانات الصوتيات: $e')),
                  );
                }
              },
            ),

            // قسم التخزين
            CategoryGridItem(
              image: "images/Hard.png",
              title: 'أجهزة التخزين',
              icon: Icons.storage,
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getStorageSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                          content: Text('لا توجد أجهزة تخزين متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'أجهزة التخزين',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text('حدث خطأ أثناء جلب بيانات التخزين: $e')),
                  );
                }
              },
            ),

            // قسم الطاقة
            CategoryGridItem(
              image: "images/power.png",
              title: 'الطاقة',
              icon: Icons.power,
              onTap: () async {
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );

                try {
                  final subCategories = await _getPowerSubCategories();
                  Navigator.of(context).pop();

                  if (subCategories.isEmpty) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                          content: Text('لا توجد منتجات طاقة متاحة حالياً')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubCategoriesPage(
                        title: 'الطاقة',
                        subCategories: subCategories,
                      ),
                    ),
                  );
                } catch (e) {
                  Navigator.of(context).pop();
                  scaffoldMessenger.showSnackBar(
                    SnackBar(
                        content: Text('حدث خطأ أثناء جلب بيانات الطاقة: $e')),
                  );
                }
              },
            ),
            // يمكن إضافة المزيد من الفئات الرئيسية هنا
          ],
        ),
      ),
    );
  }
}

// CategoryGridItem(
            //   image: "images/s.png",
            //   title: 'السماعات',
            //   icon: Icons.computer,
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => SubCategoriesPage(
            //           title: 'سماعات ',
            //           subCategories: [
            //             subcategoreis(
            //               name: 'سماعات سلكية',
            //               image: "images/s.png",
            //               sections: Sections.s, // استخدام قائمة prodectsPc
            //             ),
            //             subcategoreis(
            //               name: 'سماعات لاسلكية',
            //               image: "images/s.png",
            //               sections: Sections.s, // استخدام قائمة desktop
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),


            