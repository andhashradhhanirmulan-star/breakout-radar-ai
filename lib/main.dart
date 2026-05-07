import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      theme: ThemeData.dark(),
      home: const BreakoutScreen(),
    );
  }
}

class BreakoutScreen extends StatefulWidget {
  const BreakoutScreen({super.key});

  @override
  State<BreakoutScreen> createState() => _BreakoutScreenState();
}

class _BreakoutScreenState extends State<BreakoutScreen> {

  List stocks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchStocks();
  }

  Future fetchStocks() async {

    final url = Uri.parse(
      'https://query1.finance.yahoo.com/v7/finance/quote?symbols=HAL.NS,GRSE.NS,KFINTECH.NS,ASTRAMICRO.NS'
    );

    final response = await http.get(url);

    final data = jsonDecode(response.body);

    setState(() {
      stocks = data['quoteResponse']['result'];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Breakout Radar AI'),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(

              itemCount: stocks.length,

              itemBuilder: (context, index) {

                final stock = stocks[index];

                return Card(

                  margin: const EdgeInsets.all(12),

                  child: Padding(

                    padding: const EdgeInsets.all(16),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          stock['symbol'] ?? '',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Price: ${stock['regularMarketPrice']}',
                        ),

                        Text(
                          'Change: ${stock['regularMarketChangePercent'].toStringAsFixed(2)}%',
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}