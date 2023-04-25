//! use changenotifier && provider.of(context)
//? it rebuild the entire widget

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestTwo extends StatefulWidget {
  const TestTwo({super.key});

  @override
  State<TestTwo> createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  @override
  Widget build(BuildContext context) {
    //! 2. add CNP, it take tree here from scaffold
    //* create == return model we make, child == widget we use our model on it

    return ChangeNotifierProvider(
      //* its scope here child
      //* only here child == under it tree, can use consumer,selector....
      create: (BuildContext context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider.of(context)"),
        ),
        //! 5. call widget that inherit provider.of(context)

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
    //! 4. add it here
    //* if you not determain <T>
    //? The following assertion was thrown building WidgetChild(dirty):
    var model = Provider.of<Model>(context);
    return Column(
      children: [
        Center(
          child: Text(model.name),
        ),
        const SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () {
            model.changeName();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: const Text("Do smt"),
        ),
      ],
    );
  }
}
/*
# you can put CNP on main root to reach all widget tree on runApp
# we can use multi CNP
# on CNP => listen: false == we reach data without ability to modify UI
*/

//! 1. we build model contain both variable && function to use them
class Model extends ChangeNotifier {
  String name = "Welcome";

  changeName() {
    name = "it rebuild all widget on all places ";
    if (kDebugMode) {
      print(name);
    }
    //! you need add notifyListeners();
    //* without it only update consle without Ui
    notifyListeners(); //! it rebuild consumer from type model only
  }
}
