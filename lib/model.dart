import 'package:flutter/material.dart';

class AppModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  List<Color> fcolor;
  List<String> size;
  bool isCheck;

  AppModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.fcolor,
    required this.size,
    required this.description,
    required this.isCheck,
    required this.category,
  });
}

List<AppModel> fashionEcommereceApp = [
  AppModel(
    name: "T-Shirt",
    rating: 4.9,
    image: "assets/tshirt.png",
    price: 295,
    review: 136,
    isCheck: true,
    category: "Women",
    fcolor: [
      Colors.black,
      Colors.green,
      Colors.blue,
    ],
    size: [
      "M",
      "L",
      "XL",
    ],
    description: "",
  ),
  AppModel(
    name: "printed Sweatshirt",
    rating: 4.8,
    image: "assets/sw.png",
    price: 314,
    review: 178,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.green,
      Colors.black,
      Colors.blue[100]!,
    ],
    size: [
      "M",
      "L",
      "XL",
    ],
    description: "",
  ),
  AppModel(
    name: "Loose fit Sweatshirt",
    rating: 4.7,
    image: "assets/ls.webp",
    price: 187,
    review: 59,
    isCheck: false,
    category: "Men",
    fcolor: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
    size: ["M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "Loose Fit Hoodie",
    rating: 5.0,
    image: "assets/hoodie.webp",
    price: 400,
    review: 29,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.brown,
      Colors.blueGrey,
      Colors.orange,
    ],
    size: [
      "M",
      "L",
      "XL",
    ],
    description: "",
  ),
  AppModel(
    name: "Track Jacket",
    rating: 4.1,
    image: "assets/tjacket.jpg",
    price: 300,
    review: 30,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.black,
      Colors.orange,
      Colors.blueAccent,
    ],
    size: [
      "S",
      "M",
      "L",
      "XL",
    ],
    description: "",
  ),
  AppModel(
    name: "Fit T-Shirt",
    rating: 4.0,
    image: "assets/ftshirt.jpg",
    price: 200,
    review: 30,
    category: "Men",
    isCheck: true,
    fcolor: [
      Colors.black,
      Colors.grey,
      Colors.white,
    ],
    size: [
      "XL",
      "XXL",
    ],
    description: "",
  ),
  AppModel(
    name: "Baby Frock",
    rating: 3.0,
    image: "assets/frock.jpg",
    price: 200,
    review: 30,
    category: "Baby",
    isCheck: false,
    fcolor: [
      Colors.pink,
      Colors.white,
      Colors.red,
    ],
    size: [
      "B",
      "S",
    ],
    description: "",
  ),
  AppModel(
    name: "Coat",
    rating: 4.5,
    image: "assets/coat.jpeg",
    price: 1000,
    review: 40,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.black,
      Colors.white,
      Colors.grey,
    ],
    size: [
      "M",
      "L",
      "XL",
      "XL",
    ],
    description: "",
  ),
  AppModel(
    name: "Baby Dress Set",
    rating: 5.0,
    image: "assets/bdress.jpg",
    price: 500,
    review: 30,
    category: "Baby",
    isCheck: true,
    fcolor: [
      Colors.green,
      Colors.orange,
      Colors.white,
    ],
    size: [
      "S",
      "B",
    ],
    description: "",
  ),
  AppModel(
    name: "Hoodie for kids",
    rating: 5.0,
    image: "assets/bhoodie.webp",
    price: 200,
    review: 50,
    category: "Kids",
    isCheck: true,
    fcolor: [
      Colors.pink,
      Colors.blue,
      Colors.purple,
    ],
    size: ["S", "B", "X"],
    description: "",
  ),
  AppModel(
    name: "Hoodei for Teens",
    rating: 4.5,
    image: "assets/thoodie.jpg",
    price: 300,
    review: 40,
    category: "Teen",
    isCheck: true,
    fcolor: [
      Colors.white,
      Colors.black,
      Colors.blue,
    ],
    size: ["S", "B", "X"],
    description: "",
  ),
  AppModel(
    name: "Summer Jacket",
    rating: 4.0,
    image: "assets/sjack.webp",
    price: 500,
    review: 40,
    category: "Men",
    isCheck: true,
    fcolor: [
      Colors.green,
      Colors.blue,
      Colors.white,
    ],
    size: ["S", "M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "Winter Jacket",
    rating: 4.9,
    image: "assets/winterj.jpeg",
    price: 1000,
    review: 100,
    category: "Teens",
    isCheck: true,
    fcolor: [
      Colors.amber,
      Colors.black,
      Colors.amberAccent,
    ],
    size: ["S", "B", "X"],
    description: "",
  ),
  AppModel(
    name: "Pant and Shirt",
    rating: 4.5,
    image: "assets/ps.webp",
    price: 1500,
    review: 90,
    category: "Men",
    isCheck: true,
    fcolor: [
      Colors.black,
      Colors.white,
      Colors.black,
    ],
    size: ["S", "M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "Mix Double Set",
    rating: 5.0,
    image: "assets/mix.jpg",
    price: 200,
    review: 40,
    category: "Teens",
    isCheck: false,
    fcolor: [
      Colors.red,
      Colors.pink,
      Colors.white,
    ],
    size: ["S", "M", "L"],
    description: "",
  ),
  AppModel(
    name: "Coat For Women",
    rating: 4.0,
    image: "assets/co.jpg",
    price: 1000,
    review: 40,
    category: "Women",
    isCheck: false,
    fcolor: [
      Colors.blueGrey,
      Colors.green,
      Colors.grey,
    ],
    size: ["M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "Complter Dress",
    rating: 4.5,
    image: "assets/ct.jpg",
    price: 1000,
    review: 150,
    category: "Teens",
    isCheck: false,
    fcolor: [
      Colors.blue,
      Colors.purple,
      Colors.black,
    ],
    size: ["M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "kurti",
    rating: 4.9,
    image: "assets/kurti.jpg",
    price: 400,
    review: 60,
    category: "Women",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.orange,
      Colors.yellow,
    ],
    size: ["M", "L", "XL"],
    description: "",
  ),
  AppModel(
    name: "Loose Sweater",
    rating: 4.5,
    image: "assets/ls.jpg",
    price: 500,
    review: 50,
    category: "Teens",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.orange,
      Colors.black,
    ],
    size: ["S", "M", "L"],
    description: "",
  ),
  AppModel(
    name: "T-Shirt For Women",
    rating: 4.5,
    image: "assets/tw.webp",
    price: 200,
    review: 40,
    category: "Women",
    isCheck: false,
    fcolor: [
      Colors.black,
      Colors.white,
      Colors.brown,
    ],
    size: ["S", "M", "L"],
    description: "",
  ),
  AppModel(
    name: "Kids T-Shirt",
    rating: 4.5,
    image: "assets/kt.jpg",
    price: 200,
    review: 40,
    category: "kids",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.red,
      Colors.yellow,
    ],
    size: [
      "S",
      "M",
      "L",
    ],
    description: "",
  ),
];
const myDescription1 = "Elevate your casual wardobe with our";
const myDescription2 =
    ".Crafted from premium cotton for maximum comfort, this relaxed-fit tee feature";
