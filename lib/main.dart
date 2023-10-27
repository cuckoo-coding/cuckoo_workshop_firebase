import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:randomapiapp/screens/create_beer/create_beer_screen.dart';
import 'package:randomapiapp/screens/detail_beer/detail_beer_screen.dart';
import 'package:randomapiapp/screens/home/home_screen.dart';
import 'package:randomapiapp/theme/my_color.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: MyColor.middleblue,
          onPrimary: MyColor.white,
          secondary: MyColor.darkyellow,
          onSecondary: MyColor.darkblue,
          error: MyColor.red,
          onError: MyColor.white,
          background: MyColor.white,
          onBackground: MyColor.darkblue,
          surface: MyColor.lightyellow,
          onSurface: MyColor.middleblue,
        ),
        fontFamily: 'Manrope',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: MyColor.darkblue,
          ),
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: MyColor.darkblue,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyColor.darkblue,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/create': (context) => const CreateBeerScreen(),
        '/detail': (context) => const DetailBeerScreen(),
      },
    );
  }
}
