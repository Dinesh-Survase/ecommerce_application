import 'package:flutter/material.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> addresses = [
      {
        "type": "Home",
        "name": "Baek Hyunwoo",
        "address": "123 Main Street,\nBandra, Mumbai - 400050",
        "tag": "Default"
      },
      {
        "type": "Office",
        "name": "Hyunwoo Baek",
        "address": "Tech Street,\nKoregaon Park, Pune - 411001",
        "tag": ""
      }
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shipping Address",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final addr = addresses[index];
                return _buildGlassCard(context, addr);
              },
            ),
          ),
          _buildAddAddressButton(),
        ],
      ),
    );
  }

  Widget _buildGlassCard(BuildContext context, Map<String, String> address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.95),
            Colors.white.withOpacity(0.90)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pink.shade100, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink.shade300, Colors.pinkAccent],
                    ),
                  ),
                  child: const Icon(Icons.location_on, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address['type'] ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      const SizedBox(height: 4),
                      Text(address['name'] ?? '',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black87)),
                      const SizedBox(height: 4),
                      Text(address['address'] ?? '',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("Edit",
                                style: TextStyle(color: Colors.deepPurple)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Remove",
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (address["tag"] != null && address["tag"]!.isNotEmpty)
            Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.deepPurpleAccent],
                  ),
                ),
                child: Text(
                  address['tag']!,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAddAddressButton() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: () {
          // Add logic here
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6DA7), Color(0xFFFFB88C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "Add New Address",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
