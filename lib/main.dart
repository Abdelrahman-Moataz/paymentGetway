import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paymentapp/core/network/dio_helpre.dart';
import 'package:paymentapp/modules/screens/registerScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home:  RegisterScreen(),
    );
  }
}
