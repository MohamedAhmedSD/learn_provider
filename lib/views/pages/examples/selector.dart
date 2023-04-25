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
          //! 3. write Selector
          children: [
            //* Selector<model, dataType of its variables> ( selector & builder)
            Selector<SelectorLearnModel, String>(
                //? Function(BuildContext, SelectorLearnModel) selector}
                //? selectorLearnModel optional orders,
                //* through it we can reach to model content
                //* use it to bring => s1
                selector: (contect, myAccessToModel) => myAccessToModel.s1,
                //? myAccessToModel == model , no need to access as consumer
                //* valueOfmyAccessToModel == myAccessToModel.s1
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
  var show1 = "show";
  var show2 = 1;

  //! 1. to use selectorwe need make getter, get newVar => classVar;
  get s1 => show1;
  get s2 => show2;

  doSomething() {
    show1 = "selector of String build only one time ";
    notifyListeners();
  }
  //! selector rebild one time only if now data change not rebild
  //* so show String => rebuild only one time
  //* show2 int when ++ => it rebuild every time, when call function

  doSomething2() {
    show2++;
    notifyListeners();
  }
}
