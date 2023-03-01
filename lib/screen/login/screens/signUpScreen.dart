import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

//by maneendra
class SignUpScreen extends StackedHookView<LoginViewModel> {
  @override
  Widget builder(BuildContext context, LoginViewModel model) {

    return model.isBusy
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : WillPopScope(
            onWillPop: () => model.navigateToLandingScreen(),
            child: Scaffold(
              body: SafeArea(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => model.navigateToLandingScreen(),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xff3282B8),
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
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
                                width: 3,
                                color: Color(0xffBBE1FA)), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
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
                                width: 3,
                                color: Color(0xffBBE1FA)), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
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
                                width: 3,
                                color: Color(0xffBBE1FA)), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        controller: model.passwordController,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Color(0xffBBE1FA)),
                        decoration: InputDecoration(

                          labelText: "Password",
                          labelStyle: TextStyle(color: Color(0xff3282B8)),
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Color(0xff3282B8)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xffBBE1FA)), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
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
                                width: 3,
                                color: Color(0xffBBE1FA)), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: GestureDetector(
                        onTap: () {
                          print("tapped on view");
                          model.SignUpUserWithLogin();
                        },
                        // onTap: ()=> model.registerUsingEmailPassword(email: model.eMailController.text, password: model.passwordController.text),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 65, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              color: Color(0xff0F4C75)),
                          child: const Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Color(0xffBBE1FA)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
