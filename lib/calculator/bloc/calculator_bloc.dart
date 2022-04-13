import 'package:bloc/bloc.dart';
import 'package:calculator/calculator/repository/calculation_repo.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc()
      : super(CalculatorState(
          text: '0',
          result: '',
          numOne: 0,
          numTwo: 0,
          opr: '',
          preOpr: '',
        )) {
    on<Calculation>((event, emit) {
      CalculationRepo _calculationRepo = CalculationRepo();

      dynamic finalResult = state.finalResult;
      dynamic result = state.result;
      double numOne = state.numOne;
      double numTwo = state.numTwo;
      dynamic opr = state.opr;
      dynamic preOpr = state.preOpr;

      if (event.btnText == 'AC') {
        finalResult = '0';
        numOne = 0;
        numTwo = 0;
        result = '';
        opr = '';
        preOpr = '';
      } else if (opr == '=' && event.btnText == '=') {
        if (preOpr == '+') {
          finalResult = _calculationRepo.add(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (preOpr == '-') {
          finalResult = _calculationRepo.sub(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (preOpr == 'x') {
          finalResult = _calculationRepo.mul(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (preOpr == '/') {
          finalResult = _calculationRepo.div(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        }
      } else if (event.btnText == '+' ||
          event.btnText == '-' ||
          event.btnText == 'x' ||
          event.btnText == '/' ||
          event.btnText == '=') {
        if (numOne == 0) {
          numOne = double.parse(result == '' ? '0' : result);
        } else {
          numTwo = double.parse(result == '' ? '0' : result);
        }

        if (opr == '+') {
          finalResult = _calculationRepo.add(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (opr == '-') {
          finalResult = _calculationRepo.sub(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (opr == 'x') {
          finalResult = _calculationRepo.mul(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        } else if (opr == '/') {
          finalResult = _calculationRepo.div(result, numOne, numTwo);
          numOne = double.parse(finalResult);
        }
        preOpr = opr;
        opr = event.btnText;
        result = '';
      } else if (event.btnText == '%') {
        result = numOne / 100;
        finalResult = _calculationRepo.doesContainDecimal(result);
      } else if (event.btnText == '.') {
        if (!result.toString().contains('.')) {
          result = result.toString() + '.';
        }
        finalResult = result;
      } else if (event.btnText == '+/-') {
        result.toString().startsWith('-')
            ? result = result.toString().substring(1)
            : result = '-' + result.toString();
        finalResult = result;
      } else {
        result = result + event.btnText;
        finalResult = result;
      }

      emit(state.copyWith(
        text: finalResult,
        result: result,
        numOne: numOne,
        numTwo: numTwo,
        opr: opr,
        preOpr: preOpr,
        finalResult: finalResult,
      ));
    });
  }
}
