import 'package:flutter/material.dart';

class DeliveredScreen extends StatelessWidget {
  const DeliveredScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "name": "T-Shirt",
      "image": "assets/ts.png",
      "price": "₹499",
      "status": "Delivered"
    },
    {
      "name": "Headphone",
      "image": "assets/jbl.png",
      "price": "₹1299",
      "status": "Pending"
    },
    {
      "name": "Track Pant",
      "image": "assets/tr.png",
      "price": "₹1999",
      "status": "Delivered"
    },
    {
      "name": "iPhone 16 Pro Max",
      "image": "assets/ip.jpg",
      "price": "₹899",
      "status": "Pending"
    },
    {
      "name": "Airbuds",
      "image": "assets/ea.jpg",
      "price": "₹899",
      "status": "Pending"
    },
  ];

  Color _statusColor(String status) {
    return status == "Delivered" ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Delivery Details",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 5,
              child: Stack(
                children: [
                  // 📸 Background Image
                  Image.asset(
                    product['image'],
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // 🌈 Gradient overlay for text readability
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // 📝 Text on image
                  Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['price'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 8),
                        Chip(
                          label: Text(
                            product['status'],
                            style: const TextStyle(color: Colors.white,fontSize: 15),
                          ),
                          backgroundColor: _statusColor(product['status']),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
