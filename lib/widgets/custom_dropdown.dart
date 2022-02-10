import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> values;
  final String labelText;
  final void Function() onSelection;
  final CustomDropdownController controller;

  const CustomDropdown({
    required this.controller,
    required this.values,
    required this.labelText,
    required this.onSelection,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}


class _CustomDropdownState extends State<CustomDropdown>{
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => _showModal(),
      child: Container(
        padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
        child: TextFormField(
          enabled: false,
          controller: _textEditingController,
          decoration: InputDecoration(
            focusColor: Theme.of(context).primaryColor,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
            ),
            labelText: widget.labelText,
          ),
        ),
      )
    );
  }

  void _showModal(){
    showModalBottomSheet(context: context, builder: (context) {


      return Column(
          mainAxisSize: MainAxisSize.min,
          children: Iterable<int>.generate(widget.values.length).toList().map((i){
            var value = widget.values[i];
            return ListTile(
              title: Text(value),
              onTap: (){
                widget.onSelection();
                Navigator.pop(context);
                setState(() {
                  _textEditingController.text = value;
                  widget.controller.setSelected(value);
                  widget.controller.setSelectedIndex(i);
                });
              },
            );
          }).toList()
      );
    });
  }
}

class CustomDropdownController {
  String? selected;
  int? selectedIndex;

  CustomDropdownController({
    this.selected,
    this.selectedIndex
  });

  void setSelected(String selected){
    this.selected = selected;
  }

  void setSelectedIndex(int index){
    this.selectedIndex = index;
  }

  String? getSelected()=> selected;
}