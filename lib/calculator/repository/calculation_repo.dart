class CalculationRepo {
  String add(result, numOne, numTwo) {
    result = (numOne + numTwo).toString();
    return doesContainDecimal(result);
  }

  String sub(result, numOne, numTwo) {
    result = (numOne - numTwo).toString();
    return doesContainDecimal(result);
  }

  String mul(result, numOne, numTwo) {
    result = (numOne * numTwo).toString();
    return doesContainDecimal(result);
  }

  String div(result, numOne, numTwo) {
    result = (numOne / numTwo).toString();
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
