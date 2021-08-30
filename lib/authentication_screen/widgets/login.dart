import 'package:flutter/material.dart';

import 'package:foodie/authentication_screen/screens/forget_password.dart';
import 'package:foodie/authentication_screen/screens/signup.dart';

import 'package:foodie/logic/const.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/repository/food_categories_repository.dart';
import 'package:get/get.dart';

import 'package:foodie/widget/customTextfield.dart';
import 'package:foodie/widget/customWidgets.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

class LoginWidget extends GetView<AuthServices> {
  // final foodCategoryController = Get.find<FoodCategoriesRepository>();
  @override
  Widget build(BuildContext context) {
    var vis = true.obs;

    void change() {
      if (vis(true)) {
        vis(false);
      } else
        vis(true);
    }

    return Obx(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (controller.status == Status.Error) {
          UIData.showErrorSnackBar(controller.errorMessage);

          controller.updateStatus(Status.Empty);
        } else if (controller.status == Status.Unknown_Error) {
          UIData.showErrorSnackBar(controller.errorMessage);

          controller.updateStatus(Status.Empty);
        }
      });

      // if (controller.status == Status.Loading)
      //   return Center(
      //       child:
      //        CircularProgressIndicator()

      //       );
      // final category = controller.getCategoryData();
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTitleText(
              "Welcome!",
              textAlign: TextAlign.start,
              colors: Colors.black,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            customDescriptionText(
              "Sign in to",
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                "USERNAME",
                controller.loginusernameController,

                //usernameController,
                "assets/icons/person.png",
                controller.loginuserNameFocusNode,
                TextInputType.emailAddress,
                "username"),
            SizedBox(
              height: 30,
            ),
            CustomPasswordTextfield(
              focusNode: controller.loginpasswordFocusNode,
              label: "PASSWORD",
              controller: controller.loginpasswordController,
              //  controller: passwordController,
              image: "assets/icons/ic_key.png",
              keyboardType: TextInputType.visiblePassword,
              isShow: vis(false),
              suffixIcon: IconButton(
                  icon: Icon(
                      vis.isTrue ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => change,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (controller.status != Status.Loading) {
                  controller.login(controller.loginusernameController.text,
                      controller.loginpasswordController.text);
                }
              },
              child: (controller.status == Status.Loading)
                  ? Center(
                      child: CircularProgressIndicator(
                          color: UIData.kbrightColor.withOpacity(0.1)),
                    )
                  : Container(
                      height: getProportionateScreenHeight(55),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: UIData.klightColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Container(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: UIData.kbrightColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Center(
              child: Container(
                child: customDescriptionText(
                  "Forgot password ?",
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForgetPasswordScreen.routeName);
                    /* Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new ForgotPasswordScreen(),
                              ),
                            ); */
                  },
                  textAlign: TextAlign.center,
                  colors: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(SignUpScreen());
              },
              child: Container(
                  height: getProportionateScreenHeight(55),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: UIData.kbrightColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Container(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
          ],
        ),
      );
    });
    //  isLoading: controller.isLoading(),
    // );
  }
}
