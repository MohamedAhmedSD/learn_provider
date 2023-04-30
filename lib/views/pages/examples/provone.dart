import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProvOne extends StatelessWidget {
  const ProvOne({super.key});

//! when use consumer from certain Model we rebuild all other consumers with same model
//! even there are a change on them our not
//? it update Ui on certain places with rebuild all places
//? also it rebuild String more than one time -----------
//* that bad things ================================================

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //* its scope here child
      //* only here child == under it tree, can use consumer,selector....
      //* if we write wrong model name => generic error on CNP
      //? better make different names between your page and models
      create: (BuildContext context) => ProvOneModel(),
      child: Scaffold(
        body: ListView(
          children: [
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 1");
              }
              return Text(value.show1);
            }),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 2");
              }
              return Text(value.show2);
            }),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 1");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show1}"));
            }),
            // Consumer<ProvOneModel>(
            //   builder: (context, value, child) => TextButton(
            //       onPressed: () {
            //         value.doSomething2();
            //       },
            //       child: Text("Do somthing: ${value.show2}")),
            // ),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 2");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show2}"));
            }),
          ],
        ),
      ),
    );
  }
}

//* any change change 4 places =.> strings + btns
class ProvOneModel extends ChangeNotifier {
  var show1 = "show";
  var show2 = "show2";

  doSomething() {
    show1 = "yes its a provider";
    notifyListeners();
  }

  doSomething2() {
    show2 = "yes its a provider";
    notifyListeners();
  }
}
