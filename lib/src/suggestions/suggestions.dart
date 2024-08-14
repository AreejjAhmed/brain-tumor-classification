import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:braintumordetect/service/disease_provider.dart';
import 'package:braintumordetect/src/suggestions/components/brain_images.dart';
import 'package:braintumordetect/src/suggestions/components/text_property.dart';

import '../Homepage/models/disease.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  static const routeName = '/suggestions';

  @override
  Widget build(BuildContext context) {
    final _diseaseService = Provider.of<DiseaseService>(context);
    Disease _disease = _diseaseService.disease;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Suggestions'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all((0.02 * size.height)),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: _disease.imagePath != null
                      ? brainImage(
                    size: size,
                    imageFile: File(_disease.imagePath!),
                  )
                      : Container(), // Add a container if imagePath is null
                ),
              ),
              Divider(
                thickness:  (0.0066 * size.height),
                height: (0.013 * size.height),
              ),
              SizedBox(
                height: size.height * 0.5,
                child: ListView(
                  children: [
                    TextProperty(
                      title: 'Disease name',
                      value: _disease.name,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible causes',
                      value: _disease.possibleCauses,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible solution',
                      value: _disease.possibleSolution,
                      height: size.height,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
