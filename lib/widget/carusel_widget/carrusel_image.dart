import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarruselImage extends StatefulWidget {
  const CarruselImage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarruselImageState();
  }
}



class _CarruselImageState extends State<CarruselImage> {
  final List<String> images = [
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
    'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187.jpg?w=718&h=479',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: imageUrl);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      autoPlayInterval: const Duration(seconds: 2)
        ),
        itemBuilder: (context, index, realIdx) {
      return Center(
          child: Image.network(images[index],
              fit: BoxFit.cover, width: 1000));
        },
      ),
    );
  }
}