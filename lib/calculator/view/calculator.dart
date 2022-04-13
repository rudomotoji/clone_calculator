import 'package:calculator/calculator/bloc/calculator_bloc.dart';
import 'package:calculator/calculator/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    return Text(
                      // text,
                      state.text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CalButton(
                btnText: 'AC',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '+/-',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '%',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              CalButton(
                btnText: '/',
                btnColor: Colors.amber[700]!,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CalButton(
                btnText: '7',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '8',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '9',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              CalButton(
                btnText: 'x',
                btnColor: Colors.amber[700]!,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CalButton(
                btnText: '4',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '5',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '6',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              CalButton(
                btnText: '-',
                btnColor: Colors.amber[700]!,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CalButton(
                btnText: '1',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '2',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              const CalButton(
                btnText: '3',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              CalButton(
                btnText: '+',
                btnColor: Colors.amber[700]!,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {},
                child: const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                shape: const StadiumBorder(),
                color: Colors.grey[850],
                padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
              ),
              const CalButton(
                btnText: '.',
                btnColor: Colors.grey,
                txtColor: Colors.black,
              ),
              CalButton(
                btnText: '=',
                btnColor: Colors.amber[700]!,
                txtColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }

  // //Calculator logic
  // dynamic text = '0';
  // double numOne = 0;
  // double numTwo = 0;

  // dynamic result = '';
  // dynamic finalResult = '';
  // dynamic opr = '';
  // dynamic preOpr = '';
  // void calculation(btnText) {
  //   if (btnText == 'AC') {
  //     text = '0';
  //     numOne = 0;
  //     numTwo = 0;
  //     result = '';
  //     finalResult = '0';
  //     opr = '';
  //     preOpr = '';
  //   } else if (opr == '=' && btnText == '=') {
  //     if (preOpr == '+') {
  //       finalResult = add();
  //     } else if (preOpr == '-') {
  //       finalResult = sub();
  //     } else if (preOpr == 'x') {
  //       finalResult = mul();
  //     } else if (preOpr == '/') {
  //       finalResult = div();
  //     }
  //   } else if (btnText == '+' ||
  //       btnText == '-' ||
  //       btnText == 'x' ||
  //       btnText == '/' ||
  //       btnText == '=') {
  //     if (numOne == 0) {
  //       numOne = double.parse(result);
  //     } else {
  //       numTwo = double.parse(result);
  //     }

  //     if (opr == '+') {
  //       finalResult = add();
  //     } else if (opr == '-') {
  //       finalResult = sub();
  //     } else if (opr == 'x') {
  //       finalResult = mul();
  //     } else if (opr == '/') {
  //       finalResult = div();
  //     }
  //     preOpr = opr;
  //     opr = btnText;
  //     result = '';
  //   } else if (btnText == '%') {
  //     result = numOne / 100;
  //     finalResult = doesContainDecimal(result);
  //   } else if (btnText == '.') {
  //     if (!result.toString().contains('.')) {
  //       result = result.toString() + '.';
  //     }
  //     finalResult = result;
  //   } else if (btnText == '+/-') {
  //     result.toString().startsWith('-')
  //         ? result = result.toString().substring(1)
  //         : result = '-' + result.toString();
  //     finalResult = result;
  //   } else {
  //     result = result + btnText;
  //     finalResult = result;
  //   }

  //   print("""
  //         funf:
  //         text: $finalResult,
  //                 result: $result,
  //                 numOne: $numOne,
  //                 numTwo: $numTwo,
  //                 opr: $opr,
  //                 preOpr: $preOpr,
  //                 finalResult: $finalResult,
  //         """);

  //   setState(() {
  //     text = finalResult;
  //   });
  // }

  // String add() {
  //   result = (numOne + numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }

  // String sub() {
  //   result = (numOne - numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }

  // String mul() {
  //   result = (numOne * numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }

  // String div() {
  //   result = (numOne / numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }

  // String doesContainDecimal(dynamic result) {
  //   if (result.toString().contains('.')) {
  //     List<String> splitDecimal = result.toString().split('.');
  //     if (!(int.parse(splitDecimal[1]) > 0)) {
  //       return result = splitDecimal[0].toString();
  //     }
  //   }
  //   return result;
  // }
}
