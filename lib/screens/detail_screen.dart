import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/gif_model.dart';

class DetailScreen extends StatelessWidget {
  final GifModel gif;

  DetailScreen({required this.gif});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gif.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.network(gif.url),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Uploaded by: ${gif.user}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
