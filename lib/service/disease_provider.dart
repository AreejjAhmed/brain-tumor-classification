import 'package:flutter/material.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

class DiseaseService with ChangeNotifier {
  late Disease _disease;

  Disease get disease => _disease;

  void setDiseaseValue(Disease disease) {
    _disease = disease;
    notifyListeners();
  }
}