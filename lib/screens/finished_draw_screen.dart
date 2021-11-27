import 'dart:typed_data';

import 'package:mspaint_bloc/utils/picture_details.dart';
import 'package:flutter/material.dart';

class FinishedDrawScreen extends StatelessWidget {
  final PictureDetails picture;

  const FinishedDrawScreen({required this.picture, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View your image'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: FutureBuilder<Uint8List>(
            future: picture.toPNG(),
            builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Image.memory(snapshot.data!);
                  }
                default:
                  return const FractionallySizedBox(
                    widthFactor: 0.1,
                    child: AspectRatio(
                        aspectRatio: 1.0, child: CircularProgressIndicator()),
                    alignment: Alignment.center,
                  );
              }
            },
          )),
    );
  }
}
