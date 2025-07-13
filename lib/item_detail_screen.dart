import 'package:flutter/material.dart';
import 'package:kharedi/colors.dart';
import 'package:kharedi/favorite_repository.dart';
import 'package:kharedi/model.dart';

class ItemDetailScreen extends StatefulWidget {
  final AppModel eCommereceApp;
  const ItemDetailScreen({super.key, required this.eCommereceApp});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: fbackgroundColor2,
        title: Text("Detail Product"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_bag, size: 35),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Center(
                    child: Text("3",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: fbackgroundColor2,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Hero(
                      tag: widget.eCommereceApp.image,
                      child: Image.asset(
                        widget.eCommereceApp.image,
                        height: size.height * 0.4,
                        width: size.width * 0.85,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == currentIndex
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "H&M",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.amber, size: 17),
                    Text(widget.eCommereceApp.rating.toString()),
                    Text(" (${widget.eCommereceApp.review})",
                        style: TextStyle(color: Colors.black26)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          FavoriteRepository.toggleFavorite(widget.eCommereceApp);
                        });
                      },
                      child: Icon(
                        FavoriteRepository.isFavorite(widget.eCommereceApp)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: FavoriteRepository.isFavorite(widget.eCommereceApp)
                            ? Colors.red
                            : Colors.grey,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(widget.eCommereceApp.name,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.5,
                      )),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.eCommereceApp.price}.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.pink,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    if (widget.eCommereceApp.isCheck)
                      Text(
                        "\$${widget.eCommereceApp.price + 255}.00",
                        style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black26,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "$myDescription1 ${widget.eCommereceApp.name}$myDescription2",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                    letterSpacing: -.5,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Color",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommereceApp.fcolor
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                final color = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: color,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColorIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommereceApp.size
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                int index = entry.key;
                                final String size = entry.value;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedSizeIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      border: Border.all(
                                        color: selectedSizeIndex == index
                                            ? Colors.black
                                            : Colors.black12,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: selectedSizeIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        label: SizedBox(
          width: size.width * 0.9,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "ADD TO CART",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: -1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  color: Color(0xFFFF7043),
                  child: Center(
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
