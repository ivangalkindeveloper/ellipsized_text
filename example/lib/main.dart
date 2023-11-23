import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ellipsized Text"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "EllipsisType: start",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              EllipsizedText(
                "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
                type: EllipsisType.start,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "EllipsisType: middle",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              EllipsizedText(
                "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
                type: EllipsisType.middle,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "EllipsisType: end",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              EllipsizedText(
                "Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text Ellipsized Text",
                type: EllipsisType.end,
                ellipsis: "...",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
