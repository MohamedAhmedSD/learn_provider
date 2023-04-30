import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorLearn extends StatelessWidget {
  const SelectorLearn({super.key});

//! when use selector from certain type we rebuild only
//! it , and not rebuild others
//? it update Ui on certain place
//* that good things

  @override
  Widget build(BuildContext context) {
    //! 2. CNP
    return ChangeNotifierProvider(
      //* its scope here child
      //* only here child == under it tree, can use consumer,selector....
      //* if we write wrong model name => generic error on CNP
      //? better make different names between your page and models
      create: (BuildContext context) => SelectorLearnModel(),
      child: Scaffold(
        body: ListView(
          //? ================ [ selector] ============
          //! 3. write Selector
          children: [
            //* Selector<model, dataType of its variables> ( selector & builder)
            Selector<SelectorLearnModel, String>(
                //? Function(BuildContext, SelectorLearnModel) selector}
                //? selectorLearnModel optional orders,
                //* through it we can reach to model content datatype
                //* use it to bring => s1
                selector: (context, myAccessToModel) => myAccessToModel.s1,
                //? myAccessToModel == model , no need to access as consumer
                //* valueOfmyAccessToModel == myAccessToModel.s1
                //! like you just choose only one value per a time

                builder: (context, valueOfmyAccessToModel, child) {
                  if (kDebugMode) {
                    print("String update");
                  }
                  return Text(valueOfmyAccessToModel);
                }),
            Selector<SelectorLearnModel, int>(
              selector: (p0, p1) => p1.s2,
              builder: (context, value, child) {
                if (kDebugMode) {
                  print("int updates : $value");
                }
                return Text('$value');
              },
            ),
            //? ================ [ consumer] ============
            Consumer<SelectorLearnModel>(
              builder: (context, value, child) => TextButton(
                  onPressed: () {
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show1}")),
            ),
            Consumer<SelectorLearnModel>(
              builder: (context, value, child) => TextButton(
                  onPressed: () {
                    value.doSomething2();
                  },
                  child: Text("Do somthing: ${value.show2}")),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorLearnModel extends ChangeNotifier {
  /// This is a class definition for `SelectorLearnModel` that `extends`
  /// the `ChangeNotifier` class.
  /// It contains two instance variables `show1` and `show2` that are
  /// initialized with the values `"show"` and `1`, respectively.
  var show1 = "show";
  var show2 = 1;

  //! 1. to use selectorwe need make getter, get newVar => classVar;
  //* To use selectors in this class, the author has created two getters
  //* `s1` and `s2` which simply return the values of `show1` and `show2`, respectively.

  get s1 => show1;
  get s2 => show2;

  /// `doSomething` updates the value of `show1` to the string `
  ///! "selector of String build only one time"

  doSomething() {
    show1 = "selector of String build only one time ";

    /// notifies any listeners that the data has changed by calling `notifyListeners()`.
    notifyListeners();
  }

  //* so show String => rebuild only one time
  //* show2 int when ++ => it rebuild every time, when call function

  //* which is an int will rebuild every time
  doSomething2() {
    show2++;
    notifyListeners();
  }
}
