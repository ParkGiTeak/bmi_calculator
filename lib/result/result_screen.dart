import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  String _calcBmi(double bmi) {
    String result = '저체중';

    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    Icon icon = Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.green,
      size: 100,
    );
    if (bmi >= 23) {
      icon = Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.green,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      icon = Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100.0) * (height / 100.0));
    return Scaffold(
      appBar: AppBar(
        title: Text('결과'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _calcBmi(bmi),
              style: TextStyle(fontSize: 36),
            ),
            _buildIcon(bmi)
          ],
        ),
      ),
    );
  }
}
