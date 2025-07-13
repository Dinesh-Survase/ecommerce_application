import 'package:flutter/material.dart';
import 'package:kharedi/colors.dart';
import 'package:kharedi/model.dart';

class CuratedItems extends StatelessWidget {
  final AppModel eCommereceItems;
  final Size size;
  const CuratedItems(
      {super.key, required this.eCommereceItems, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: eCommereceItems.image,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: fbackgroundColor2,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(eCommereceItems.image),
                ),
              ),
              height: size.height * 0.25,
              width: size.width * 0.5,
              child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.black26,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ))))),
        ),
        SizedBox(height: 7),
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
            Text(eCommereceItems.rating.toString()),
            Text("(${eCommereceItems.review})",
                style: TextStyle(
                  color: Colors.black26,
                )),
          ],
        ),
        SizedBox(
            width: size.width * 0.5,
            child: Text(eCommereceItems.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.5,
                ))),
        Row(
          children: [
            Text(
              "\$${eCommereceItems.price.toString()}.00",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 5),
            if (eCommereceItems.isCheck == true)
              Text(
                "\$${eCommereceItems.price + 255}.00",
                style: const TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black26,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
