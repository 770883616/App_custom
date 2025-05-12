import 'package:flutter/material.dart';

class SpecialOfferBanner extends StatefulWidget {
  const SpecialOfferBanner({super.key});

  @override
  _SpecialOfferBannerState createState() => _SpecialOfferBannerState();
}

class _SpecialOfferBannerState extends State<SpecialOfferBanner> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentIndex = 0;

  final List<Map<String, String>> offers = [
    {"image": "images/d.png", "title": "عرض خاص على اللابتوبات"},
    {"image": "images/computer.png", "title": "تخفيضات على أجهزة الكمبيوتر"},
    {"image": "images/computer.png", "title": "أفضل السماعات بأفضل الأسعار"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Image.asset(
                        offers[index]["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          offers[index]["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            offers.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: _currentIndex == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
