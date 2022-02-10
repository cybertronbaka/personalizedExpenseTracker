import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/utils/digit_input_formatter.dart';
import 'package:Churpu/widgets/custom_button_bar.dart';
import 'package:Churpu/widgets/custom_dropdown.dart';
import 'package:Churpu/widgets/custom_loading_indicator.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:Churpu/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'add_transaction_view_model.dart';
import 'package:date_field/date_field.dart';

class AddTransactionView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTransactionViewModel>.reactive(
      onModelReady: (model){
        model.init();
      },
      viewModelBuilder: () => AddTransactionViewModel(),
      builder: (context, model, child) => CustomScaffold(
        title: 'Add ${model.getCategory().toShortString()}',
        body: model.isBusy ? CustomLoadingIndicator()
            : Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                CustomTextField(
                  controller: model.amountController,
                  hintText: 'Amount',
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[ DigitInputFormatter() ],
                ),
                SizedBox(height: 30),
                DateTimeField(
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    ),
                    labelText: 'Transaction DateTime',
                  ),
                  selectedDate: model.getDateTime(),
                  onDateSelected: (DateTime value) {
                    model.setDateTime(value);
                    model.notifyListeners();
                  },
                  initialDate: DateTime.now(),
                ),
                SizedBox(height: 30),
                CustomDropdown(
                  controller: model.dropdownController,
                  labelText: 'Tag',
                  onSelection: () {
                    model.notifyListeners();
                  },
                  values: model.getTagNames(),
                ),
                Spacer(),
                CustomButtonBar(text: 'Save', onTap: () => model.save())
              ],
            )
        )
      )
    );
  }
}