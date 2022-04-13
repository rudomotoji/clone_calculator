part of 'calculator_bloc.dart';

class CalculatorState extends Equatable {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic finalResult = '';
  dynamic result = '';
  dynamic opr = '';
  dynamic preOpr = '';

  CalculatorState({
    this.text,
    this.numOne = 0,
    this.numTwo = 0,
    this.result,
    this.opr,
    this.preOpr,
    this.finalResult,
  });

  @override
  List<Object> get props => [
        text,
        numOne,
        numTwo,
        result,
        opr,
        preOpr,
        finalResult,
      ];

  CalculatorState copyWith(
      {dynamic text,
      double numOne = 0,
      double numTwo = 0,
      dynamic result,
      dynamic opr,
      dynamic preOpr,
      dynamic finalResult}) {
    var newState = CalculatorState();
    if (text != null) {
      newState.text = text;
    }
    if (finalResult != null) {
      newState.finalResult = finalResult;
    }
    newState.numOne = numOne;
    newState.numTwo = numTwo;
    if (result != null) {
      newState.result = result;
    }
    if (opr != null) {
      newState.opr = opr;
    }
    if (preOpr != null) {
      newState.preOpr = preOpr;
    }
    return newState;
  }
}
