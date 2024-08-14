import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:braintumordetect/service/brainclassify.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';

class Classifier {
  late File imageFile;
  late List outputs;
  bool _loadBool = true;
  final imagePath = ImagePicker();

  Future<List?> getDisease(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    imageFile = File(image!.path);

    // Preprocess the image before classification
    var preprocessedImage = await preprocessImage(imageFile);

    await loadModel();
    var result = await classifyImage(preprocessedImage);
    Tflite.close();
    return result;
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  Future<List?> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 255.0,
        imageStd: 255.0,
        numResults: 4,
        threshold: 0.5,
        asynch: true
    );
    return output;
  }

  // Preprocess the image
  Future<File> preprocessImage(File imageFile) async {
    // Implement your preprocessing techniques here
    // For example, you can resize the image, apply filters, or adjust brightness/contrast

    // In this example, we'll just return the original image file
    return imageFile;
  }
}