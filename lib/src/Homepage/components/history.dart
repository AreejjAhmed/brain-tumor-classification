import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:braintumordetect/service/disease_provider.dart';
import 'package:braintumordetect/src/suggestions/suggestions.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

import '../../../service/hive_database.dart';

class HistorySection extends SliverFixedExtentList {
  HistorySection(Size size, BuildContext context, DiseaseService diseaseService,
      {Key? key})
      : super(
    key: key,
    delegate: SliverChildBuilderDelegate(
          (BuildContext context, index) {
        return ValueListenableBuilder<Box<Disease>>(
          valueListenable: Boxes.getDiseases().listenable(),
          builder: (context, box, _) {
            final diseases = box.values.toList().cast<Disease>();
            if (diseases.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    (0.053 * size.height * 0.3),
                    (0.053 * size.height * 0.3),
                    0,
                    0),
                child: SizedBox(
                  width: size.width,
                  child: ListView.builder(
                    itemCount: diseases.length,
                    padding: EdgeInsets.symmetric(
                        vertical: (0.035 * size.height * 0.3)),
                    itemExtent: size.width * 0.9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _returnHistoryContainer(
                          diseases[index],
                          context,
                          diseaseService,
                          size);
                    },
                  ),
                ),
              );
            } else {
              return _returnNothingToShow(size);
            }
          },
        );
      },
      childCount: 1,
    ),
    itemExtent: size.height * 0.3,
  );
}

Widget _returnHistoryContainer(Disease disease, BuildContext context,
    DiseaseService diseaseService, Size size) {
  final imageFile = File(disease.imagePath!);

  // Check if imagePath is null or empty
  if (!imageFile.existsSync()) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Text(
        'Image not found',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  // Determine possible causes and solutions based on disease name
  String possibleCauses;
  String possibleSolution;

  switch (disease.name) {
    case "Meningioma":
      possibleCauses =
      "Meningiomas may be caused by a genetic predisposition or occur sporadically without a clear genetic link.";
      possibleSolution =
      "Asymptomatic meningiomas might not require immediate treatment.";
      break;
  // Add cases for other diseases if needed
    default:
      possibleCauses = "Unknown cause";
      possibleSolution = "Unknown solution";
      break;
  }

  return Padding(
    padding: EdgeInsets.fromLTRB(
        (0.053 * size.height * 0.3), 0, (0.053 * size.height * 0.3), 0),
    child: GestureDetector(
      onTap: () {
        // Set disease for Disease Service
        diseaseService.setDiseaseValue(disease);

        Navigator.restorablePushNamed(
          context,
          Suggestions.routeName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ).image,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 0.5,
              blurRadius: (0.022 * size.height * 0.3),
            ),
          ],
          color: Colors.indigo[50],
          borderRadius: BorderRadius.circular((0.053 * size.height * 0.3)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Disease: ${disease.name}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (0.066 * size.height * 0.3),
                  fontFamily: 'SFBold',
                ),
              ),
              Text(
                'Possible causes: $possibleCauses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (0.066 * size.height * 0.3),
                  fontFamily: 'SFBold',
                ),
              ),
              Text(
                'Possible solution: $possibleSolution',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (0.066 * size.height * 0.3),
                  fontFamily: 'SFBold',
                ),
              ),
              Text(
                'Date: ${disease.dateTime.day}/${disease.dateTime.month}/${disease.dateTime.year}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (0.066 * size.height * 0.3),
                  fontFamily: 'SFBold',
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _returnNothingToShow(Size size) {
  return Padding(
    padding: EdgeInsets.fromLTRB((0.053 * size.height * 0.3),
        (0.053 * size.height * 0.3), (0.053 * size.height * 0.3), 0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.indigo[50],
          borderRadius: BorderRadius.circular((0.053 * size.height * 0.3))),
      child: Padding(
        padding:
        EdgeInsets.fromLTRB(0, 0, 0, (0.066 * size.height * 0.3)),
        child: const Center(
          child: Text(
            'Nothing to show',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}
