import 'package:flutter/material.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  final List<Map<String, dynamic>> cancelledOrders = const [
    {"name": "Samsung", "image": "assets/sam.jpeg", "price": "₹80,000"},
    {"name": "Digital Watch", "image": "assets/digi.jpeg", "price": "₹10,000"},
    {
      "name": "Sneaker",
      "image": "assets/sn.webp",
      "price": "₹80,000",
    },
    {
      "name": "Sunglass",
      "image": "assets/sun.webp",
      "price": "₹4,000",
    },
    {"name": "Formal Shirt", "image": "assets/for.webp", "price": "₹999"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 245, 245, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cancelled Orders",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cancelledOrders.length,
        itemBuilder: (context, index) {
          final order = cancelledOrders[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    order['image'],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        order['price'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.cancel,
                              color: Colors.redAccent, size: 22),
                          const SizedBox(width: 6),
                          const Text(
                            "Order Cancelled",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
