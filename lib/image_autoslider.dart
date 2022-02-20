import 'package:flutter/material.dart';
import 'package:image_auto_slider/image_auto_slider.dart';

class ImageSlider extends StatelessWidget {
  //  ImageSlider({ required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 420,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            ImageAutoSlider(
              assetImages: [
                AssetImage(
                  'asset/promo.png',
                ),
                AssetImage('asset/apple.jpeg'),
                AssetImage('asset/brand.jpeg'),
                AssetImage('asset/maya.jpeg'),
                AssetImage('asset/br.jpeg'),
                AssetImage('asset/mot.jpeg'),
                AssetImage('asset/dw.jpeg'),
              ],
              imageHeight: 160,
              boxFit: BoxFit.cover,
              slideMilliseconds: 700,
              durationSecond: 4,
            ),
          ],
        ));
  }
}
