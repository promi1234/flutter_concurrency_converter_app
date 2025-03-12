import 'package:flutter/material.dart';
import 'converted_amount_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController usdController = TextEditingController();

  void convertCurrency(BuildContext context) {
    double usdAmount = double.tryParse(usdController.text) ?? 1;
    if (usdAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid amount greater than 0")),
      );
      return;
    }

    double convertedAmount = usdAmount * 120;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConvertedAmountScreen(usdAmount, convertedAmount),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Amount in USD",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                child: TextField(
                  controller: usdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter USD",
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => convertCurrency(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: Text(
                  "Convert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
