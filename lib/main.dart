import 'package:flutter/material.dart';
import 'package:home_service/views/onboarding/onboarding_screen.dart';


void main() => runApp(
    const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Onboarding',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnboardingView(),
    );
  }
}