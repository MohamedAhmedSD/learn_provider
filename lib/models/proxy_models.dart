import 'package:flutter/material.dart';

//? first class Model inherited from CN
//* first one use => with not extends .....

class FirstModel with ChangeNotifier {
  String name = "wael";
  void changeName(String val) {
    name = val;
    notifyListeners();
  }
}

//? second class, use First class as part from its constructor
//* not need inherited from CN
class SecondModel {
  FirstModel mymodel;
  SecondModel(this.mymodel);

  //? we can use any thing on first midel here as
  
  //* we make new function that use function from first model

  void changeNameElse() {
    //* we give it value
    mymodel.changeName("Btoo");
    //! no need to => notifyListeners();
  }
}
