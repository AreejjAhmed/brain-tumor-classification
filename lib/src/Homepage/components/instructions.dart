import 'package:braintumordetect/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

class InstructionsSection extends SliverFixedExtentList {
  InstructionsSection(Size size, {Key? key})
      : super(
    key: key,
    delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              (0.061 * size.height * 0.26),
              (0.071 * size.height * 0.26),
              (0.076 * size.height * 0.26),
              (0.061 * size.height * 0.26)),
          child: Container(
            height: size.height * 0.26,
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius:
              BorderRadius.circular((0.061 * size.height * 0.26)),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB((0.025 * size.height * 0.26),
                  0, 0, (0.025 * size.height * 0.26)),
              child: ListView(
                children: const [
                  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(
                        "Capture or select a photo of the brain's radiate area by tapping the camera button below.",
                        style: TextStyle(color:Colors.black,
                          fontWeight: FontWeight.w600,),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor:Colors.blueGrey,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    title: Text(
                        "Please allow a moment for the system to provide a disease suggestion based on the captured image.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,)),
                  ),
                  ListTile(
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      childCount: 1,
    ),
    itemExtent: size.height * 0.26,
  );
}