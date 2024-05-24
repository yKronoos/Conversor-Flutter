import 'package:conversor/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {

  List<CurrencyModel> currencies = CurrencyModel.getCurrencies();

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrencie;
  late CurrencyModel fromCurrencie;

  HomeController({required this.toText, required this.fromText}){
    toCurrencie = currencies[0];
    fromCurrencie = currencies[1];
  }
  
  void convert(){

    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnedValue = 0;

    if(fromCurrencie!.name == 'Real'){
      returnedValue = value * toCurrencie!.real;
    }else if(fromCurrencie!.name == 'Dolar'){
      returnedValue = value * toCurrencie!.dolar;
    }else if(fromCurrencie!.name == 'Euro'){
      returnedValue = value * toCurrencie!.euro;
    }else if(fromCurrencie!.name == 'Bitcoin'){
      returnedValue = value * toCurrencie!.bitcoin;
    }

    fromText.text = returnedValue.toStringAsFixed(2);
  }
}