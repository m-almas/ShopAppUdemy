import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$ ' + cart.totalAmount.toString(),
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                    id: cart.items.values.toList()[i].id,
                    productId: cart.items.keys.toList()[i],
                    price: cart.items.values.toList()[i].price,
                    quantity: cart.items.values.toList()[i].quantity,
                    title: cart.items.values.toList()[i].title,
                  ),
              itemCount: cart.itemCount,
            ),
          )
        ],
      ),
    );
  }
}
