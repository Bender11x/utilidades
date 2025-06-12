import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/convertercontroller.dart';
import 'package:utilidades/src/models/converter_model.dart';

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  final controller = Convertercontroller();
  final inputController = TextEditingController();
  Unit selecFrom = Unit.meter;
  Unit selecTo = Unit.centimeter;
  String result = '';

  @override
  void initState(){
    super.initState();
    controller.InitializeModel();
  }

  void converter(){
    setState(() {
      controller.setInputValue(inputController.text);
      controller.setUnits(selecFrom, selecTo);
      result = controller.result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            controller: inputController,
            decoration: InputDecoration(labelText: 'Valor'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: unitDropdown(
                  selecFrom,
                  (u) => setState(() => selecFrom = u)
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward),
              SizedBox(width: 10),
              Expanded(
                child: unitDropdown(
                  selecTo,
                  (u) => setState(() => selecTo = u)
                  ),
                )
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){}, child: Text('CONVERTER')),
          SizedBox(height: 20),
          Text('Resultado: $result', style: TextStyle(fontSize: 18),)
        ],
      ),
      );
  }
  DropdownButton<Unit> unitDropdown(
    Unit currentValue,
    ValueChanged<Unit> onCharged,
  ){
    return DropdownButton<Unit>(
      value: currentValue,
      onChanged: (Unit? newValue){
        if(newValue != null) onCharged(newValue);
      },
      isExpanded: true,
      items: Unit.values.map((unit){
        return DropdownMenuItem<Unit>(
          value: unit,
          child: Text(ConverterModel.getUnitName(unit)),
        );
      }).toList()
    );
  }
    
}