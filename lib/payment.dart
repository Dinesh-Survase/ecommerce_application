import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  final List<Map<String, dynamic>> productList = const [
    //1
    {
      "image": "assets/one.jpeg",
      "name": "One Piece",
      "price": "₹10,000",
      "date": "28 June 2025",
      "orderId": "OI20001",
      "address": "Mumbai, Maharashtra",
      "paymentMode": "Online",
      "status": "✅ Paid",
      "statusColor": Colors.green,
    },
    //2
    {
      "image": "assets/yo.png",
      "name": "Suit",
      "price": "₹20,000",
      "date": "25 June 2025",
      "orderId": "OI20002",
      "address": "Delhi",
      "paymentMode": "Offline",
      "status": "⏳ Pending",
      "statusColor": Colors.orange,
    },
    //3
    {
      "image": "assets/saree.jpeg",
      "name": "Saree",
      "price": "₹19,999",
      "date": "20 June 2025",
      "orderId": "OI20003",
      "address": "Pune, Maharashtra",
      "paymentMode": "Online",
      "status": "✅ Paid",
      "statusColor": Colors.green,
    },
    //4
    {
      "image": "assets/man.webp",
      "name": "Suit",
      "price": "₹40,000",
      "date": "19 June 2025",
      "orderId": "OI20004",
      "address": "Ahmedabad",
      "paymentMode": "Offline",
      "status": "⏳ Pending",
      "statusColor": Colors.orange,
    },
    //5
    {
      "image": "assets/ps.webp",
      "name": "Formal",
      "price": "₹2,000",
      "date": "18 June 2025",
      "orderId": "OI20005",
      "address": "Chennai",
      "paymentMode": "Online",
      "status": "✅ Paid",
      "statusColor": Colors.green,
    },
    //6
    {
      "image": "assets/tsi.jpg",
      "name": "T-Shirt",
      "price": "₹1,000",
      "date": "17 June 2025",
      "orderId": "OI20006",
      "address": "Kolkata",
      "paymentMode": "Online",
      "status": "✅ Paid",
      "statusColor": Colors.green,
    },
    //7
    {
      "image": "assets/teen.jpg",
      "name": "Formal",
      "price": "₹3,000",
      "date": "15 June 2025",
      "orderId": "OI20007",
      "address": "Jaipur",
      "paymentMode": "Offline",
      "status": "⏳ Pending",
      "statusColor": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 24, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          product["image"],
                          height: 500,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildRow("Product Name", product["name"]),
                      _buildRow("Price", product["price"]),
                      _buildRow("Order Date", product["date"]),
                      _buildRow("Order Id", product["orderId"]),
                      _buildRow("Address", product["address"]),
                      _buildRow("Payment Mode", product["paymentMode"]),
                      _buildRow("Status", product["status"],
                          color: product["statusColor"]),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, {Color color = Colors.black87}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
