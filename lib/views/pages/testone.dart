// import 'package:flutter/material.dart';

// class TestOne extends StatefulWidget {
//   const TestOne({super.key});

//   @override
//   State<TestOne> createState() => _TestOneState();
// }

// class _TestOneState extends State<TestOne> {
//   String name = "Welcome";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Providers"),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           MaterialButton(
//             onPressed: () {
//               //* when press on btn console change put not Ui
//               name = "btoo";
//               print(name);
//               //* hot reload == refresh method build == change old Ui bt new one

//               //* then we used setState to refresh all build method
//               setState(() {
//                 name = "btoo";
//                 print(name);
//               });
//             },
//             color: Colors.blue,
//             textColor: Colors.white,
//             child: const Text("Do smt"),
//           ),
//         ],
//       ),
//     );
//   }
// }

//! use changenotifier && consumer
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  @override
  Widget build(BuildContext context) {
    //! 2. add CNP, it take tree here from scaffold
    //* create == return model we make, child == widget we use our model on it

    return ChangeNotifierProvider(
      //* its scope here child
      //* only here child == under it tree, can use consumer,selector....
      //? CREATE it take function, and function need return, it return our Model
      create: (BuildContext context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider Course"),
        ),
        //! 3. consumer <listen to who or not work>:
        //* it need builder with three => ctx, our model, child
        //* access data from your model
        body: Consumer<Model>(
          builder: (context, model, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ),
      ),
    );
  }
}

//?===============    [ Model ] ===================
//! 1. we build model contain both variable && function to use them
//* we can reach both of them through model, and we can change variable value by
//* function use it inside it

//* seprate your logic from view
//? what difference between with && extends here?
/*
Regarding the syntax difference between "class Test extends ChangeNotifier{}"
 and "class Test with ChangeNotifier{}", 
 the former is used to create a class that inherits from ("extends")
 the ChangeNotifier class, 
 while the latter is used to add the behavior of ("with") 
 the ChangeNotifier class to the Test class.
 In other words, the first one creates a new class that is 
 a subtype of ChangeNotifier,
 while the second one adds ChangeNotifier as a mixin to the Test class.
 */

class Model extends ChangeNotifier {
  String name = "Welcome";

  changeName() {
    name = "btoo";
    if (kDebugMode) {
      print(name);
    }
    //! you need add notifyListeners();
    //* without it only update consle without Ui
    notifyListeners();
    //! so when called by consumer or others it rebuild
    //* that used same model name
  }
}
