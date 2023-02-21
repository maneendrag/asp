import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
//by maneendra
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(viewModelBuilder: ()=> LoginViewModel(),
        builder: (context, model, child){
      return model.isBusy ? Center(child: CircularProgressIndicator(color: Colors.red,),) :
        Scaffold(body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text("Sign Up",
              style: TextStyle(color: Color(0xff3282B8), fontWeight: FontWeight.bold, fontSize: 28),),
            ),
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: model.nameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Color(0xffBBE1FA)),
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Color(0xff3282B8)),
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: Color(0xff3282B8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color(0xffBBE1FA)), //<-- SEE HERE
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: model.eMailController,
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Color(0xffBBE1FA)),
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xff3282B8)),
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(color: Color(0xff3282B8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color(0xffBBE1FA)), //<-- SEE HERE
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: model.phoneNumberController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Color(0xffBBE1FA)),
                decoration: const InputDecoration(
                  labelText: "Phone No",
                  labelStyle: TextStyle(color: Color(0xff3282B8)),
                  hintText: 'Enter Your Phone No',
                  hintStyle: TextStyle(color: Color(0xff3282B8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color(0xffBBE1FA)), //<-- SEE HERE
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: model.passwordController,
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Color(0xffBBE1FA)),
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Color(0xff3282B8)),
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(color: Color(0xff3282B8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color(0xffBBE1FA)), //<-- SEE HERE
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: model.confirmPasswordController,
                keyboardType: TextInputType.name,
                style: const TextStyle(color: Color(0xffBBE1FA)),
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Color(0xff3282B8)),
                  hintText: 'Confirm Your Password',
                  hintStyle: TextStyle(color: Color(0xff3282B8)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color(0xffBBE1FA)), //<-- SEE HERE
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GestureDetector(
                onTap: ()=> model.registerUsingEmailPassword(),
                // onTap: ()=> model.registerUsingEmailPassword(email: model.eMailController.text, password: model.passwordController.text),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28), color: Color(0xff0F4C75)),
                  child: const Center(child: Text("Create Accountss", style: TextStyle(color: Color(0xffBBE1FA)),),),
                ),
              ),
            ),
            const SizedBox(height: 65,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GestureDetector(
                onTap: ()=> model.loginWithFirebase(),
                // onTap: ()=> model.registerUsingEmailPassword(email: model.eMailController.text, password: model.passwordController.text),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28), color: Color(0xff0F4C75)),
                  child: const Center(child: Text("Login", style: TextStyle(color: Color(0xffBBE1FA)),),),
                ),
              ),
            ),
          ],
        ),
      ),);
        });
  }
}
