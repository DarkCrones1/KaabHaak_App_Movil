import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kaabhaak/providers/search_providers/search_provider.dart';

class CarruselImage extends StatefulWidget {
  const CarruselImage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarruselImageState();
  }
}



class _CarruselImageState extends State<CarruselImage> {
  final List<String> images = [
    'https://webapikaabhaak00.blob.core.windows.net/productimage/0941fc01-b488-40b8-b96d-b9c9579c6714.png',
    'https://webapikaabhaak00.blob.core.windows.net/productimage/1c46111b-9e5e-4787-b05f-3fa2e5ec812f.png',
    'https://webapikaabhaak00.blob.core.windows.net/productimage/2737a6a3-6516-4a60-9a72-1c6885c8b631.png',
    'https://webapikaabhaak00.blob.core.windows.net/productimage/31ab680c-ca9d-491d-ac78-94ed43b34d35.png',
    'https://webapikaabhaak00.blob.core.windows.net/productimage/6bcedcf5-34dd-4f91-9c3c-7cf7859922ad.png',
    'https://webapikaabhaak00.blob.core.windows.net/productimage/74c191ed-591f-4b04-8d52-1df1a770f0db.png'
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