import 'package:flutter/material.dart';

void main() {
  runApp(const BreakoutRadarApp());
}

class BreakoutRadarApp extends StatelessWidget {
  const BreakoutRadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breakout Radar AI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.greenAccent,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Breakout Radar AI'),
      ),

      body: ListView(

        padding: const EdgeInsets.all(12),

        children: const [

          BreakoutCard(
            stock: 'HAL',
            breakout: 'Weekly Breakout',
            score: 91,
          ),

          BreakoutCard(
            stock: 'GRSE',
            breakout: 'Volume Breakout',
            score: 88,
          ),

          BreakoutCard(
            stock: 'KFINTECH',
            breakout: 'Consolidation Breakout',
            score: 85,
          ),

        ],
      ),
    );
  }
}

class BreakoutCard extends StatelessWidget {

  final String stock;
  final String breakout;
  final int score;

  const BreakoutCard({
    super.key,
    required this.stock,
    required this.breakout,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      color: Colors.grey.shade900,

      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              stock,

              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              breakout,
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 8),

            Text(
              'Breakout Score: $score/100',

              style: const TextStyle(
                color: Colors.orangeAccent,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
