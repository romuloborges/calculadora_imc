import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';

enum Gender {
  MALE,
  FEMALE
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          colour: selectedGender == Gender.MALE ? kActiveCardColor : kInactiveCardColor,
                          cardChild: const IconContent(
                            label: 'Homem',
                            icon: FontAwesomeIcons.mars,
                          ),
                          onTapFunction: () {
                            setState(() {
                              selectedGender = Gender.MALE;
                            });
                          },
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                          colour: selectedGender == Gender.FEMALE ? kActiveCardColor : kInactiveCardColor,
                          cardChild: const IconContent(
                              label: 'Mulher',
                              icon: FontAwesomeIcons.venus
                          ),
                          onTapFunction: () {
                            setState(() {
                              selectedGender = Gender.FEMALE;
                            });
                          },
                      ),
                  ),
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        onTapFunction: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Altura',
                                style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumberTextStyle
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                              ),
                              child:
                                Slider(
                                    value: height.toDouble(),
                                    min: 120.0,
                                    max: 220.0,
                                    activeColor: Color(0xFFEB1555),
                                    inactiveColor: Color(0xFF8D8E98),
                                    onChanged: (double value) {
                                      setState(() {
                                        height = value.round();
                                      }
                                      );
                                }
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        onTapFunction: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Peso',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  function: () {
                                      setState(() {
                                        weight--;
                                        if (weight < 0) {
                                          weight = 0;
                                        }
                                      });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(() {
                                      weight++;
                                      if (weight > 300) {
                                        weight = 300;
                                      }
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                  Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        onTapFunction: () {},
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Idade',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    function: () {
                                      setState(() {
                                        age--;
                                        if (age < 0) {
                                          age = 0;
                                        }
                                      });
                                    }
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(() {
                                      age++;
                                      if (age > 150) {
                                        age = 150;
                                      }
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              )
          ),
          BottomButton(buttonTitle: 'Calcular', onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(
                context, 
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )
                )
            );
          },),
        ],
      ),
    );
  }
}