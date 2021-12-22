import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageNetworking extends StatelessWidget {
  final String url;
  const ImageNetworking({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FancyShimmerImage(
        width: 200,
        height: 200,
        boxFit: BoxFit.contain,
        imageUrl: url,
        errorWidget: Image.network(
            'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
      ),
    );
  }
}
