import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: ()=> HomeScreenViewModel(),
        onViewModelReady: (model)=> model.getECommerceResponse(),
        builder: (context, model, child){
          return model.isBusy == true ? Center(child: CircularProgressIndicator(color: Colors.yellow,))
              : Scaffold(
            body: Container(
                color: Colors.teal,
                child: Center(
                  child: Text("Home Screen",
                      style: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold)),
                )),
          );
        });

  }
}
