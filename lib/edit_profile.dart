import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: "Baek Hyunwoo");
  final emailController = TextEditingController(text: "hyunwoo@example.com");
  final phoneController = TextEditingController(text: "+91 9876543210");
  final dobController = TextEditingController(text: "12/12/1999");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 24, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 140,
                    backgroundImage: const AssetImage("assets/prof.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle,
                      ),
                      child:
                          const Icon(Icons.edit, color: Colors.white, size: 26),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Name Field
            _buildInputField("Full Name", nameController, Icons.person),

            // Email Field
            _buildInputField("Email", emailController, Icons.email),

            // Phone Field
            _buildInputField("Phone", phoneController, Icons.phone),

            // DOB Field
            _buildInputField("Date of Birth", dobController, Icons.cake),

            const SizedBox(height: 30),

            // Save Button
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("✅ Profile updated successfully")),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                    "Save Changes",
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
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) =>
            value == null || value.isEmpty ? "Please enter $label" : null,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.pink),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

