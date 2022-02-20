import 'package:flutter/material.dart';
import 'package:image_auto_slider/image_auto_slider.dart';

class Auto extends StatelessWidget {
  //  ImageSlider({ required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 420,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: <Widget>[
            Container(
              width: 390,
              height: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: ImageAutoSlider(
                assetImages: [
                  AssetImage(
                    'asset/promo.png',
                  ),
                  AssetImage('asset/apple.jpeg'),
                  AssetImage('asset/brand.jpeg'),
                  AssetImage('asset/flsh.jpeg'),
                  AssetImage('asset/key.jpeg'),
                ],

                imageHeight: 100,

                // boxFit: BoxFit.cover,
                slideMilliseconds: 300,
                durationSecond: 4,
              ),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ));
  }
}
