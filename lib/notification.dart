import 'package:flutter/material.dart';
import 'package:kharedi/app_main_screen.dart';
import 'package:kharedi/model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AppModel> notifications = [
      //1
      AppModel(
        name: "Saree",
        price: 1000,
        image: "assets/saree.jpeg",
        rating: 4.9,
        review: 100,
        category: "Women",
        isCheck: true,
        fcolor: [Color(0xFFFFD700), Colors.blue, Colors.red],
        size: ["M", "L", "XL"],
        description: "A beautiful saree for your special moments. ",
      ),
      //2
      AppModel(
        name: "One Piece",
        price: 5000,
        image: "assets/one.jpeg",
        rating: 4.7,
        review: 99,
        category: "Women",
        isCheck: true,
        fcolor: [Colors.black,Colors.blue,Colors.grey],
        size: ["M","L","XL"],
        description: "Live with fashion", 
      ),
      //3
      AppModel(
        name: "Formal",
        price: 999,
        image: "assets/teen.jpg",
        rating: 4.5,
        review: 95,
        category: "Men",
        isCheck: true,
        fcolor: [Colors.black, Colors.blue, Colors.green],
        size: ["M", "L", "XL"],
        description: "Smart and stylish formals for every occasion.",
      ),
      //4
      AppModel(
        name: "Saree",
        price: 2000,
        image: "assets/beauty.jpeg",
        rating: 4.9,
        review: 98,
        category: "Women",
        isCheck: true,
        fcolor: [Colors.pink,Colors.blue,Colors.yellow],
        size: ["M","L","XL"],
        description: "A beatiful saree for your specal moments."
      ),
      //5
      AppModel(
        name: "Kurti",
        price: 700,
        image: "assets/kur.jpeg",
        rating: 4.2,
        review: 90,
        category: "Women",
        isCheck: true,
        fcolor: [Colors.yellow, Colors.pink, Colors.blue],
        size: ["M", "L", "XL"],
        description: "Kurti that's made for comfort and style",
      ),
      //6
      AppModel(
        name: "Coat",
        price: 2000,
        image: "assets/yo.png",
        rating: 4.5,
        review: 85,
        category: "Men",
        isCheck: true,
        fcolor: [Colors.black, Colors.grey, Colors.blue],
        size: ["M", "L", "XL"],
        description: "Cozy comfort with classic style.",
      ),
      //7-tsi.jpg
      AppModel(
        name: "T-Shirt",
        price: 500,
        image: "assets/tsi.jpg",
        rating: 4.9,
        review: 90,
        category: "Men",
        isCheck: true,
        fcolor: [Colors.black,Colors.blue,Colors.green],
        size: ["M","L","XL"],
        description: "Full sleeves t-shirt",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,size: 24,color: Colors.white),
          onPressed: (){
            Navigator.pushReplacement(
              context,MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          }

        ),
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (Context, index) {
          final product = notifications[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      
                      borderRadius:
                           BorderRadius.circular(18),
                      child: Image.asset(
                        product.image,
                        height: 710,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: _buildTag("🔥 40% OFF", Colors.red.shade900),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: _buildTag("🎁 Bey 5 Get 1", Colors.green.shade900),
                    ),
                    Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.7),Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(18),
                      ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            "₹${product.price}.00",
                            style: const TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star,color: Colors.amber,size: 20),
                              Text(
                                "${product.rating}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "(${product.review} review)",
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                       ],
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0,2)
          ),
        ],
      ),
      child: Text(
        text,
         style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13
         ),
      ),
    );
  }
}
