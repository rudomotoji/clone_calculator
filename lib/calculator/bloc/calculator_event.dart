part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class Calculation extends CalculatorEvent {
  final String btnText;

  const Calculation(this.btnText);

  @override
  List<Object> get props => [btnText];
}
