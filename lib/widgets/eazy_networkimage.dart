import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EazyNetworkImage extends StatelessWidget {
  const EazyNetworkImage({super.key, required this.url, this.fit});

  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      errorWidget: (context, url, error) => const Placeholder(),
    );
  }
}
