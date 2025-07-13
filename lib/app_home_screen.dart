import 'package:flutter/material.dart';
import 'package:kharedi/banner.dart';
import 'package:kharedi/category.dart';
import 'package:kharedi/category_items.dart';
import 'package:kharedi/colors.dart';
import 'package:kharedi/curated_items.dart';
import 'package:kharedi/item_detail_screen.dart';
import 'package:kharedi/model.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
        elevation: 0,
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              "assets/rm.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
                  "Kharedi",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.90),
                        blurRadius: 6,
                        offset: Offset(2,2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(clipBehavior: Clip.none, children: [
              const Icon(
                Icons.shopping_bag,
                size: 35,
                color: Colors.white,
              ),
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 0),
            MyBanner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("See All",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black45,
                      ))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => InkWell(
                    onTap: () {
                      final filterItems = fashionEcommereceApp
                          .where((item) =>
                              item.category.toLowerCase() ==
                              category[index].name.toLowerCase())
                          .toList();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoryItems(
                                    category: category[index].name,
                                    categoryItems: filterItems,
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: fbackgroundColor1,
                            backgroundImage: AssetImage(
                              category[index].image,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(category[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated for you",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 0, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  fashionEcommereceApp.length,
                  (index) {
                    final eCommereceItems = fashionEcommereceApp[index];
                    return Padding(
                        padding: index == 0
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.only(right: 20),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ItemDetailScreen(
                                          eCommereceApp: eCommereceItems)));
                            },
                            child: CuratedItems(
                                eCommereceItems: eCommereceItems, size: size)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
