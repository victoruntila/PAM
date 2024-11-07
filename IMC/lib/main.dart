import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  String _gender = '';
  int _weight = 70;
  int _age = 20;
  double _height = 0;
  String _bmi = '0.0';
  String _bmiStatus = 'N/A';

  void _calculateBMI() {
    if (_gender.isEmpty || _height == 0) {
      return;
    }

    double bmi = _weight / (_height * _height);
    String bmiStatus;

    if (bmi < 18.5) {
      bmiStatus = 'Underweight';
    } else if (bmi < 25) {
      bmiStatus = 'Normal';
    } else if (bmi < 30) {
      bmiStatus = 'Overweight';
    } else {
      bmiStatus = 'Obese';
    }

    setState(() {
      _bmi = bmi.toStringAsFixed(2);
      _bmiStatus = bmiStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFd1d9e6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 72),
              const Row(
                children: [
                  Text(
                    'BMI Calculator',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: _gender == 'Male'
                            ? const Color(0xFF246afe)
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _gender = 'Male';
                        });
                      },
                      child: Text(
                        'Male',
                        style: TextStyle(
                            color: _gender == 'Male'
                                ? Colors.white
                                : const Color(0xFF246afe)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: _gender == 'Female'
                            ? const Color(0xFF246afe)
                            : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _gender = 'Female';
                        });
                      },
                      child: Text(
                        'Female',
                        style: TextStyle(
                            color: _gender == 'Female'
                                ? Colors.white
                                : const Color(0xFF246afe)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _weight.toString(),
                            style: const TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: const Color(0xFF246afe)),
                                onPressed: _weight > 0
                                    ? () {
                                        setState(() {
                                          _weight--;
                                        });
                                      }
                                    : () {
                                        setState(() {
                                          _weight = 0;
                                        });
                                      },
                                child: const Text(
                                  '-',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: const Color(0xFF246afe)),
                                onPressed: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _age.toString(),
                            style: const TextStyle(fontSize: 48),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: const Color(0xFF246afe),
                                ),
                                onPressed: _age > 0
                                    ? () {
                                        setState(() {
                                          _age--;
                                        });
                                      }
                                    : () {
                                        setState(() {
                                          _age = 0;
                                        });
                                      },
                                child: const Text(
                                  '-',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: const Color(0xFF246afe),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Height', style: TextStyle(fontSize: 20)),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Height",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              try {
                                _height =
                                    double.parse(value.replaceFirst(',', '.'));
                              } catch (e) {
                                _height = 0;
                              }
                            });
                          },
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          _bmi,
                          style: const TextStyle(
                              fontSize: 48, color: Color(0xFF246afe)),
                        ),
                        Text(
                          _bmiStatus,
                          style: const TextStyle(
                              fontSize: 24, color: Color(0xFF246afe)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xFF246afe),
                        ),
                        onPressed: _calculateBMI,
                        child: const Text(
                          "Let's go",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
