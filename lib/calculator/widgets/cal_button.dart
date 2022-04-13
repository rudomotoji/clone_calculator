import 'package:calculator/calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color txtColor;

  const CalButton({
    Key? key,
    required this.btnText,
    required this.btnColor,
    required this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {
        context.read<CalculatorBloc>().add(Calculation(btnText));
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 35,
          color: txtColor,
        ),
      ),
      shape: const CircleBorder(),
      color: btnColor,
      padding: const EdgeInsets.all(20),
    );
  }
}
