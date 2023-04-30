import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    // var myCart = Provider.of<Cart>(context);
    //? =========== it use the final list that on our model to display here
    //* so firstclass to add items , and checkout to diaplay them ========

    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOur"),
      ),
      //? use
      //* 1. consumer
      body: Consumer<Cart>(
        builder: (BuildContext context, cart, Widget? child) =>
            ListView.builder(
                itemCount: cart.basketitem.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cart.basketitem[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        //* remove function
                        //* item == cart.basketitem[index]
                        cart.remove(cart.basketitem[index]);
                      },
                    ),
                  );
                }),
      ),
      //* 2. use provider.of(context)
      // body: ListView.builder(
      //     itemCount: myCart.basketitem.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text("${myCart.basketitem[index].name}"),
      //         trailing: IconButton(
      //           icon: Icon(Icons.remove),
      //           onPressed: () {},
      //         ),
      //       );
      //     }),
    );
  }
}
