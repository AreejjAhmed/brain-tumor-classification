import 'package:braintumordetect/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

class TitleSection extends SliverFixedExtentList {
  TitleSection(String title, double height, {Key? key})
      : super(
    key: key,
    delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB((0.32*height), 0, 0, 0),
              child: Text(
                title,
                style: TextStyle(fontSize: (0.6*height),
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
      childCount: 1,
    ),
    itemExtent: height,
  );
}