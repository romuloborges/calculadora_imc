import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15),
                child: Text(
                  'Resultado',
                  style: kTitleTextStyle,
                ),
              )
          ),
          Expanded(
            flex: 5,
            child:
              ReusableCard(
                colour: kActiveCardColor,
                onTapFunction: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult,
                      style: kResultTextStyle,
                    ),
                    Text(
                      resultText,
                      style: kBMITextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              buttonTitle: 'Recalcular',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
