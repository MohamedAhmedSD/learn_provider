//? not common use, only one we use model depend on another one

import 'package:flutter/material.dart';
import 'package:learn_provider/models/proxy_models.dart';
import 'package:provider/provider.dart';

class Proxy extends StatelessWidget {
  const Proxy({super.key});

  @override
  Widget build(BuildContext context) {
    //* better use them under Multiproviders.........

    return MultiProvider(
      providers: [
        //* FirstModel use CNP
        ChangeNotifierProvider<FirstModel>(create: (context) => FirstModel()),
        //* SecondModel use PP
        //! {required dynamic Function(BuildContext, dynamic, dynamic) update}
        //? <basic model, another model>
        ProxyProvider<FirstModel, SecondModel>(
            update: (context, mymodel, anothermodel) {
          return SecondModel(mymodel);
        }),
      ],
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Consumer<FirstModel>(
                builder: (context, value, child) => Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(value.name),
                ),
              ),
              Consumer<FirstModel>(
                builder: (context, value, child) => TextButton(
                  onPressed: () {
                    value.changeName("ali");
                  },
                  child: const Text("Model"),
                ),
              ),
              // Consumer<SecondModel>(
              //   builder: (context, value, child) => Text(value.mymodel.name),
              // ),
              Consumer<SecondModel>(
                builder: (context, value, child) => TextButton(
                  onPressed: () {
                    // value.mymodel.changeName(
                    //     "this value from basic class access by second class");
                    //! also we can call second class function
                    value.changeNameElse();
                  },
                  child: const Text("AnotherModel"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
