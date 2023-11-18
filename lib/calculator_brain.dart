import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Acima do peso';
    } else if (_bmi > 18.5) {
      return 'Peso normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Você está acima do peso normal. Tente se exercitar mais';
    } else if (_bmi >= 18.5) {
      return 'Você está no peso normal. Bom trabalho!';
    } else {
      return 'Você está abaixo do peso normal. Tente comer um pouco mais';
    }
  }
}