import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart.dart';
import '../../../models/item.dart';
import 'checkout.dart';

class FirstClass extends StatelessWidget {
  FirstClass({super.key});

  //! create a list of Items >>>>>>>>>>>
  final List<MyItem> myItems = [
    MyItem(name: "s20", price: 200),
    MyItem(name: "s30", price: 300),
    MyItem(name: "s40", price: 400),
  ];

  @override
  Widget build(BuildContext context) {
    //! on root use CNP
    return ChangeNotifierProvider<Cart>(
      create: (BuildContext context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            //? ==== consumer at appBar =============
            //* to make basket nav to checkout page as ordinary we nav
            //* and make consumer inside text that we need update it
            //* when add products
            //* we can update it according items number or there total price

            actions: [
              //! Can I delete this consumer and use only that on text ===
              Consumer(
                builder: (BuildContext context, value, Widget? child) => Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //? nav into checkout page
                        //* [A]
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CheckOut()));

                        //* [B]
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const CheckOut();
                        }));
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      //! how we change it dynamically
                      // child: Text("2"),
                      child: Consumer<Cart>(
                          builder: //? don't forget we access through model
                              (BuildContext context, cart, Widget? child) =>
                                  Text("${cart.count}")),
                      //? we can back total prices
                      // Text("${cart.totalPrice}")),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //? ================ show items on a list =====================
          body: ListView.builder(
            itemCount: myItems.length,
            itemBuilder: (context, i) {
              return Card(
                child: Consumer<Cart>(
                  builder: (context, cart, child) => ListTile(
                    //* certain name field
                    title: Text(myItems[i].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // cart.totalPrice;
                        cart.add(myItems[i]); //* add only certain item====
                        //* we see what we add on another page => checkout
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
