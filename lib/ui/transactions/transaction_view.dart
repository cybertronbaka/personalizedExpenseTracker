import 'package:Churpu/db/models/transactions.dart';
import 'package:Churpu/enums/transaction_types.dart';
import 'package:Churpu/ui/transactions/transaction_view_model.dart';
import 'package:Churpu/widgets/custom_button_bar.dart';
import 'package:Churpu/widgets/custom_loading_indicator.dart';
import 'package:Churpu/widgets/custom_scaffold.dart';
import 'package:Churpu/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TransactionView extends StatelessWidget {
  final Widget drawerButton;
  final TransactionType transactionType;
  const TransactionView({Key? key, required this.drawerButton, required this.transactionType}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionViewModel>.reactive(
        onModelReady: (model) {
          model.setTransactionType(transactionType);
          model.refreshCards();
        },

        viewModelBuilder: () => TransactionViewModel(),
        builder: (context, model, child) => CustomScaffold(
          title: transactionType.viewTitle(),
          appBarLeading: drawerButton,
          body: Container(
              child: Column(
                children: [
                  headerCard(context, model),
                  Divider(thickness: 1, height: 5),
                  buildSpacer(model),
                  model.loading ? CustomLoadingIndicator() : buildList(context, model),
                  buildSpacer(model),
                  CustomButtonBar(text: transactionType.buttonValue())
                ],
              )
          ),
        )
    );
  }

  Widget headerCard(BuildContext context, TransactionViewModel model) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Center(
          child: Text(
            "Nu. ${model.getHeaderAmount().toString()}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54
            ),
          ),
        )
    );
  }

  Widget buildList(BuildContext context, TransactionViewModel model) {
    List<Transaction> cards = model.getCards();
    return cards.isNotEmpty ? Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount:  model.getCardsCount(),
            itemBuilder: (context, i) {
              Transaction card = model.getCard(i);
              print("Card id(${card.id}) TagId(${card.tagId}. Actual Tag${card.tagName}");
              return CustomCard(
                id: card.id as int,
                tagId: card.tagId,
                tagName: card.tagName,
                dateTime: card.dateTime,
                amount: card.amount.toDouble(),
                image: Image(image: AssetImage('assets/food.jpg'))
              );
            }
        )
    ): Text('No Data');
  }

  Widget buildSpacer(TransactionViewModel model){
    return model.getLoading() || !model.dataExists ? Spacer() : Container(height: 0, width: 0);
  }
}