import 'package:braintumordetect/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

class GreetingSection extends SliverFixedExtentList {
  GreetingSection(double height, {Key? key})
      : super(
    key: key,
    delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB((0.079*height), 0, (0.079*height), (0.079*height)),
          child: Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular((0.079*height)),
                  bottomRight: Radius.circular((0.079*height))),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB((0.092*height), 0, 0, (0.099*height)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'brain Disease Detector',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: (0.2*height),
                        color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      childCount: 1,
    ),
    itemExtent: height,
  );
}