import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/colors.dart';
import 'screens/display_screen.dart';
import 'screens/write_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
   
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: yellow),
        colorScheme: ColorScheme.fromSeed(seedColor:yellow),
        useMaterial3: true,
      ),
      // home: DisplayScreen(title: 'Display',)
      home: WriteScreen(titleApp: 'input '),
    );
  }
}
