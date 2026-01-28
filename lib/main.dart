import 'package:flutter/material.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupofJay Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        fontFamily: 'Roboto',
      ),
      home: const PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}