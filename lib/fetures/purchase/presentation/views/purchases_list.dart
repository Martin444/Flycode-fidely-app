import 'package:flutter/material.dart';
import 'package:flycode/fetures/purchase/models/purchase_model.dart';
import 'package:flycode/fetures/user/presentation/page/user_page.dart';
import 'package:flycode/utils/formaters/Strings/currency_converter.dart';

class PurchaseList extends StatefulWidget {
  final List<PurchaseModel> pruchases;
  const PurchaseList({
    super.key,
    required this.pruchases,
  });

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: widget.pruchases.length,
      itemBuilder: (context, index) {
        final purchase = widget.pruchases[index];
        return PurchaseTile(
          title: purchase.description,
          amount: purchase.amount.toString().convertToCorrency(),
          created: purchase.createAt!,
        );
      },
    ));
  }
}
