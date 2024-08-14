import 'package:braintumordetect/service/brainclassify.dart';
import 'package:braintumordetect/src/Homepage/Home.dart';
import 'package:braintumordetect/src/Homepage/models/disease.dart';
import 'package:braintumordetect/src/suggestions/components/brain_images.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:braintumordetect/service/disease_provider.dart';
import 'package:braintumordetect/src/suggestions/suggestions.dart';
import 'package:provider/provider.dart';
import 'WelcomeScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiseaseAdapter());
 var box = await Hive.openBox<Disease>('brain_diseases');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiseaseService>(
      create: (context) => DiseaseService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Detect diseases',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SFRegular'),
        routes: {
          "/Home" : (context)=> const Home(),
        },
        home: WelcomeHome(),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Suggestions.routeName:
                    return const Suggestions();
                  case Home.routeName:
                  default:
                    return const Home();
                }
              });
        },
      ),
    );
  }
}