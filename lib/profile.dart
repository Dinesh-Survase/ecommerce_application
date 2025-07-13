import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:kharedi/cancelled_screen.dart';
import 'package:kharedi/customer_care.dart';
import 'package:kharedi/delivered_screen.dart';
import 'package:kharedi/edit_profile.dart';
import 'package:kharedi/favorite_screen.dart';
import 'package:kharedi/payment.dart';
import 'package:kharedi/processing_screen.dart';
import 'package:kharedi/shipping_address.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 24, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 290,
                    height: 290,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/prof.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Baek Hyunwoo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 89, 86, 86),
                ),
              ),
              const SizedBox(height: 10),
              DottedLine(
                dashLength: 150,
                dashGapLength: 0,
                lineThickness: 1,
                dashColor: Colors.redAccent,
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(right: 300),
                child: Text(
                  "My Orders",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PaymentScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/pend.png", "Payment"),
                      ),
                      const SizedBox(width: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DeliveredScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/dil.png", "Delivered"),
                      ),
                      const SizedBox(width: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProcessingScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/pro.png", "Processing"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CancelledScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/co.webp", "Cancelled"),
                      ),
                      const SizedBox(width: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FavoriteScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/whi.png", "Wishlist"),
                      ),
                      const SizedBox(width: 60),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CustomerScreen()),
                          );
                        },
                        child: _buildOrderIcon("assets/cust.png", "Customer"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// ✅ Working clickable options
              _buildProfileOption(
                icon: Icons.person,
                text: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _buildProfileOption(
                icon: Icons.location_on,
                text: "Shipping Address",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShippingScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Order icons (Payment, Delivered, etc.)
  Widget _buildOrderIcon(String image, String label) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  /// 🔹 Profile option tiles (Edit Profile, Shipping)
  Widget _buildProfileOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.pink),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
