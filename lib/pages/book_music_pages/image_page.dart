import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final File image;

  const ImagePage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.file(image)),
    );
  }
}
