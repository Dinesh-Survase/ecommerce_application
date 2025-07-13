import 'package:flutter/material.dart';
import 'package:kharedi/app_main_screen.dart';
import 'package:kharedi/model.dart';
import 'package:kharedi/item_detail_screen.dart';
import 'package:kharedi/favorite_repository.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AppModel> favorites = FavoriteRepository.getFavorites();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 24,color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AppMainScreen()),
            );
          },
        ),
        title: const Text(
          "Your Favorites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 141, 165),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final product = favorites[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ItemDetailScreen(eCommereceApp: product),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Full background image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Hero(
                            tag: product.image,
                            child: Image.asset(
                              product.image,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Overlay gradient
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Text at bottom
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${product.price}.00",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: List.generate(5, (i) {
                                  return Icon(
                                    i < product.rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    size: 18,
                                    color: Colors.amber,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
