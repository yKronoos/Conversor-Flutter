import 'package:conversor/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox(
      {super.key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          height: 56,
          child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              hint: Text('Selecione'),
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
                  .map((item) =>
                      DropdownMenuItem(value: item, child: Text(item.name)))
                  .toList(),
              onChanged: onChanged),
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }
}
