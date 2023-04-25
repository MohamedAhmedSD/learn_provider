import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testfive extends StatelessWidget {
  const Testfive({super.key});

//! we use Multiproviders to deal with multi models
//? and they may use CNP or Providers ...

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProvOneModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProvTwoModel(),
        ),
        Provider(
          create: (context) => ProvThree(),
        ),
      ],
      child: Scaffold(
        body: ListView(
          children: [
            //? Model 1
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 1 => m1");
              }
              return Text(value.show1);
            }),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 2 => m1");
              }
              return Text(value.show2);
            }),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 1 => m1");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show1}"));
            }),
            Consumer<ProvOneModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 2 => m1");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething2();
                  },
                  child: Text("Do somthing: ${value.show2}"));
            }),

            //? Model 2
            Consumer<ProvTwoModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 1 => m2");
              }
              return Text(value.show1);
            }),
            Consumer<ProvTwoModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 2 => m2");
              }
              return Text(value.show2);
            }),
            Consumer<ProvTwoModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 1 => m2");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show1}"));
            }),
            Consumer<ProvTwoModel>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 2 => m2");
              }
              return TextButton(
                  onPressed: () {
                    value.doSomething2();
                  },
                  child: Text("Do somthing: ${value.show2}"));
            }),

            //? Model 3
            Consumer<ProvThree>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 1 => m3");
              }
              return Text(value.show1);
            }),
            Consumer<ProvThree>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer text 2 => m3");
              }
              return Text(value.show2);
            }),
            Consumer<ProvThree>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 1 => m3");
              }
              return TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("Ui not affected when use Provider");
                    }
                    value.doSomething();
                  },
                  child: Text("Do somthing: ${value.show1}"));
            }),
            Consumer<ProvThree>(builder: (context, value, child) {
              if (kDebugMode) {
                print("consumer btn 2 => m3");
              }
              return TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("Ui not affected when use Provider 2");
                    }
                    value.doSomething2();
                  },
                  child: Text("Do somthing: ${value.show2}"));
            }),
          ],
        ),
      ),
    );
  }
}

class ProvOneModel extends ChangeNotifier {
  var show1 = "show";
  var show2 = "show2";

  doSomething() {
    show1 = "yes its a CNP M1, show 1";
    notifyListeners();
  }

  doSomething2() {
    show2 = "yes its a CNP M1, show 2";
    notifyListeners();
  }
}

class ProvTwoModel extends ChangeNotifier {
  var show1 = "show";
  var show2 = "show2";

  doSomething() {
    show1 = "yes its a CNP M2, show 1";
    notifyListeners();
  }

  doSomething2() {
    show2 = "yes its a CNP M2, show 2";
    notifyListeners();
  }
}

class ProvThree {
  var show1 = "show";
  var show2 = "show2";

  doSomething() {
    show1 = "yes its a provider not rebuild UI, show 1";
  }

  doSomething2() {
    show2 = "yes its a provider not rebuild UI, show 2";
  }
}
