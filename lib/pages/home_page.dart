import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_app/data/tarjetas.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagar'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: BouncingScrollPhysics(),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];
                    return CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        cvvCode: tarjeta.cvv,
                        showBackView: false);
                  }),
            ),
            Positioned(
              bottom: 0,
              child: TotalPayButton()
            )
          ],
        ));
  }
}
