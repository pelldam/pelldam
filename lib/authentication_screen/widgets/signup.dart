import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/repository/auth.dart';
import 'package:foodie/logic/size_config.dart';
import 'package:foodie/widget/customWidgets.dart';
import 'package:foodie/widget/customTextfield.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:foodie/authentication_screen/screens/login.dart';
import 'package:foodie/authentication_screen/screens/verify_phone.dart';

class SignUpWidget extends GetView<AuthServices> {
  const SignUpWidget({Key? key}) : super(key: key);
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode userNameFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    RxBool vis = true.obs;
    changevis() {
      vis.value = !vis.value;
    }

    return Obx(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (controller.status == Status.Error) {
          UIData.showErrorSnackBar(controller.errorMessage);

          controller.updateStatus(Status.Empty);
        } else if (controller.status == Status.Unknown_Error) {
          UIData.showErrorSnackBar(controller.errorMessage);

          controller.updateStatus(Status.Empty);
        } else if(controller.status==Status.EMAIL_EXISTED){

  UIData.showErrorSnackBar("Email already existed");

          controller.updateStatus(Status.Empty);
        }else if(controller.status==Status.PHONE_EXISTED){
 
   UIData.showErrorSnackBar("Phone Number is existed");

          controller.updateStatus(Status.Empty);

        }else if(controller.status==Status.USERNAME_EXISTED){

  UIData.showErrorSnackBar("Username is existed");

          controller.updateStatus(Status.Empty);


        }
      });
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTitleText(
                "Create an account",
                textAlign: TextAlign.start,
                colors: Colors.black,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  "USERNAME",
                  controller.signupusernameController,
                  "assets/icons/person.png",
                  userNameFocusNode,
                  TextInputType.name,
                  "Username"),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                "EMAIL",
                controller.signupemailController,
                "assets/icons/ic_message.png",
                emailFocusNode,
                TextInputType.emailAddress,
                "email",
              ),
              SizedBox(
                height: 30,
              ),
                CustomTextField(
                "Phone Number",
                controller.signupPhonenumberController,
                "assets/icons/ic_message.png",
                emailFocusNode,
                TextInputType.emailAddress,
                "email",
              ),
              SizedBox(
                height: 30,
              ),
              CustomPasswordTextfield(
                focusNode: passwordFocusNode,
                label: "PASSWORD",
                controller: controller.signupPasswordController,
                image: "assets/icons/ic_key.png",
                keyboardType: TextInputType.visiblePassword,
                isShow: vis(false),
                suffixIcon: IconButton(
                  icon:
                      Icon(vis(true) ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => changevis(),
                  color: Colors.grey,
                ),
                // validate: (String value) {
                //   if (value.isEmpty) {
                //     return 'Enter Your Password'
                //   }
                //   return null;
                // },
              ),
              SizedBox(
                height: 70,
              ),
             GestureDetector(
                    onTap: () {
                  
                  controller.checkPhoneAndEmailAndUsername(email:controller.signupemailController.text,phone:controller.signupPhonenumberController.text,username: controller.signupusernameController.text);
                    },
                    //  },
                    child: Container(
                        height: getProportionateScreenHeight(55),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: UIData.kbrightColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Container(
                            child:(controller.status==Status.Loading)?
                            Container(
                              width: 20,
                              height: 20,
                              child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                              ),
                            )
                            : Text(
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
                height: getProportionateScreenHeight(30),
              ),
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customDescriptionText(
                        "Already a member?",
                        onTap: () {},
                        textAlign: TextAlign.center,
                        colors: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      customDescriptionText(
                        "Sign in",
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        textAlign: TextAlign.center,
                        colors: UIData.kbrightColor,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
