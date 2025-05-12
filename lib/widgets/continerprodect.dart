import 'package:explore_pc/models/computer.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Continerprodect extends StatelessWidget {
  Continerprodect({
    super.key,
    this.computerindex,
    required this.computer,
    this.pree,
    required this.isLiked,
    required this.onLikePressed,
  });

  final int? computerindex;
  final Computer computer;
  final VoidCallback? pree;
  final bool isLiked;
  final Future<bool> Function(bool isLiked) onLikePressed;

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'http://192.168.0.29:8000/storage/${computer.image!}';
    print('Loading image: $imageUrl'); // للتأكد من المسار
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
              child: LikeButton(
                mainAxisAlignment: MainAxisAlignment.end,
                size: 25,
                padding: EdgeInsets.only(right: 10),
                isLiked: isLiked,
                onTap: onLikePressed,
              ),
            ),
            // الصورة المعدلة مع أيقونة عند عدم وجود صورة
            if (computer.image != null && computer.image!.isNotEmpty)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://192.168.0.29:8000/storage/${computer.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_not_supported,
                        size: 40, color: Colors.grey[500]),
                    SizedBox(height: 8),
                    Text('لا توجد صورة',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        )),
                  ],
                ),
              ),

            //      Image.network(
            //   'http://192.168.0.29:8000/storage/${computer.image!}',
            // )
            // : Icon(Icons.image_not_supported),

            Container(
              padding: EdgeInsets.only(left: 40),
              // child: Mystar(rating: computer.ratings?.toDouble() ?? 0),
            ),
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "ر.ي ${computer.price?.toStringAsFixed(2) ?? '0.00'}",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Computer product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            if (product.image != null)
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        'http://192.168.0.29:8000/storage/${product.image}',
                      ),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            else
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image, color: Colors.grey),
              ),

            SizedBox(width: 12),

            // تفاصيل المنتج
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${product.price} د.ع',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      if (product.ratings != null)
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text('${product.ratings}'),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'الكمية المتاحة: ${product.stockQuantity}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
