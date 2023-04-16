import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.autoplay,required this.width});

  final bool autoplay;
  final double width;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imageList = [
    'https://mykit.in/crm/public/uploads/website_section_image/LyOFHmLMIYWEgG8tsBXweUQN7sTCsu.jpg',
    'https://mykit.in/crm/public/uploads/website_section_image/uZ4cJcyKU1PMyIihywU9qyaWzjojB0.jpg',
    'https://mykit.in/crm/public/uploads/website_section_image/BPCbXgEuhKDSpPTsAVXNKZKc26GDQo.jpg',
    'https://mykit.in/crm/public/uploads/website_slider_images/lHXqadJX5rvVfDY14xpuhC35hnioqO.jpg'
  ];
  int caroIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((url) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            url,
            fit: BoxFit.fill,
            width: widget.width,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: widget.autoplay,
        aspectRatio: 2,
        viewportFraction: 1,
          enlargeCenterPage: true
      ),
    );
  }
}
