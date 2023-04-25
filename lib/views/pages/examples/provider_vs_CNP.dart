
//! _Provider when no need update or UI, its use ordinary model,
//! no need to extends or use notifirelistener

// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestFour extends StatefulWidget {
  const TestFour({super.key});

  @override
  State<TestFour> createState() => _TestFourState();
}

class _TestFourState extends State<TestFour> {
  @override
  Widget build(BuildContext context) {
    //! 2. add Provider, it take tree here from scaffold
    //* create == return model we make, child == widget we use our model on it

    return Provider<Model>(
      //* if you not determain <T>
      //? The following assertion was thrown building WidgetChild(dirty):
      //* its scope here child
      create: (BuildContext context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider not update UI != as CNP )"),
        ),
        //! 5. call widget that inherit

        //* access data from your model
        body: const WidgetChild(),
      ),
    );
  }
}

//! 3. we need build widget to call context inside it, then call widgey under main one

class WidgetChild extends StatelessWidget {
  const WidgetChild({super.key});

  @override
  Widget build(BuildContext context) {
    //! 4. use Consumer

    return Consumer<Model>(
      builder: (BuildContext context, m, Widget? child) => Column(
        children: [
          Center(
            child: Text(m.name),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              m.changeName();
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text("Do smt"),
          ),
        ],
      ),
    );
  }
}

//! 1. we build ordinary model [not extends] without =>  notifyListeners();
//* not update Ui so no need to notifyListeners();
class Model {
  String name = "Welcome";

  changeName() {
    name = "it call data && not update UI";
    if (kDebugMode) {
      print(name);
    }
  }
}
