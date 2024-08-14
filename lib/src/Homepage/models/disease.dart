import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'disease.g.dart';

/// Represents a disease with information about its causes, solutions, image, and creation date.
@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String possibleCauses;

  @HiveField(2)
  final String possibleSolution;

  @HiveField(3)
  final String? imagePath; // Make imagePath nullable

  @HiveField(4)
  final DateTime dateTime;

  // Map of known diseases to their possible causes and solutions
  static final Map<String, DiseaseInfo> _diseaseInfoMap = {
    "Meningioma": DiseaseInfo(
      possibleCauses: "Meningiomas may be caused by a genetic predisposition or occur sporadically without a clear genetic link.",
      possibleSolution: "Asymptomatic meningiomas might not require immediate treatment.",
    ),
    "NO TUMOR": DiseaseInfo(
      possibleCauses: "No tumor detected.",
      possibleSolution: "No treatment required.",
    ),
    // Add more diseases here if needed
  };

  Disease({required this.name, required this.imagePath})
      : dateTime = DateTime.now(),
        possibleCauses = _diseaseInfoMap[name]?.possibleCauses ?? "Unknown cause",
        possibleSolution = _diseaseInfoMap[name]?.possibleSolution ?? "Unknown solution";
}

/// Data class to hold possible causes and solution for a disease
class DiseaseInfo {
  final String possibleCauses;
  final String possibleSolution;

  DiseaseInfo({required this.possibleCauses, required this.possibleSolution});
}
