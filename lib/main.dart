import 'package:flutter/material.dart';
import 'package:foodie/authentication_screen/screens/forget_password.dart';
import 'package:foodie/authentication_screen/screens/login.dart';
import 'package:foodie/authentication_screen/screens/phone_otp.dart';
import 'package:foodie/authentication_screen/screens/signup.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/onboarding_screen/SplashScreen.dart';
import 'package:foodie/onboarding_screen/firstscreen.dart';
import 'package:foodie/user_screen/screen/Resturants/screen/resturant_details.dart';
import 'package:foodie/user_screen/screen/cart_screen.dart';
import 'package:foodie/user_screen/screen/delivery_screen.dart';
import 'package:foodie/user_screen/screen/food_category_screen.dart';
import 'package:foodie/user_screen/screen/food_details_screen.dart';
import 'package:foodie/user_screen/screen/home_screen.dart';
import 'package:foodie/user_screen/screen/invite_friend.dart';
import 'package:foodie/user_screen/screen/latest_offers_screen.dart';
import 'package:foodie/user_screen/screen/nav_screen.dart';
import 'package:foodie/user_screen/screen/order_screen.dart';
import 'package:foodie/user_screen/screen/profile/profile_edit.dart';
import 'package:foodie/user_screen/screen/searchB_screen.dart';
import 'package:foodie/user_screen/screen/upComing_order.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Binding/auth_binding.dart';
import 'authentication_screen/screens/choose_auth.dart';
import 'user_screen/screen/profile/digital_payment.dart';
import 'user_screen/screen/profile/my_favourite.dart';
import 'user_screen/screen/profile/my_wallet.dart';
import 'user_screen/screen/profile/offers_promos.dart';
import 'user_screen/screen/profile/saved_address.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      print(constraints.maxWidth);
      final customTheme = CustomTheme(constraints);
      return GetMaterialApp(
        defaultTransition: Transition.rightToLeftWithFade,
        initialBinding: AppBinding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: UIData.kbrightColor,
          bottomAppBarColor: Colors.white,

          // is not restarted.
          textTheme: customTheme.nunito(),
          elevatedButtonTheme: customTheme.elevatedButtonTheme(),
          outlinedButtonTheme: customTheme.outlinedButtonTheme(),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          appBarTheme: AppBarTheme(
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home:SplashScreen(),
        routes: {
          PhoneOtp.routeName: (ctx) => PhoneOtp(),
          MyWallet.routeName: (ctx) => MyWallet(),
          CartScreen.routeName: (ctx) => CartScreen(),
          FirstScreen.routeName: (ctx) => FirstScreen(),
          FoodDetails.routeName: (ctx) => FoodDetails(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          MyFavourite.routeName: (ctx) => MyFavourite(),
          ProfileEdit.routeName: (ctx) => ProfileEdit(),
          SplashScreen.routeName: (ctx) => SplashScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          SavedAddress.routeName: (ctx) => SavedAddress(),
          InviteFriend.routeName: (ctx) => InviteFriend(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          UserNavScreen.routeName: (ctx) => UserNavScreen(),
          DeliveryScreen.routeName: (ctx) => DeliveryScreen(),
          DigitalPayment.routeName: (ctx) => DigitalPayment(),
          OffersAndPromos.routeName: (ctx) => OffersAndPromos(),
          ChooseAuthScreen.routeName: (ctx) => ChooseAuthScreen(),
          ResturantDetails.routeName: (ctx) => ResturantDetails(),
          LatestOfferScreen.routeName: (ctx) => LatestOfferScreen(),
          // VerifyPhoneScreen.routeName: (ctx) => VerifyPhoneScreen(),
          // CreateProfileScreen.routeName: (ctx) => CreateProfileScreen(),
          UpComingOrderScreen.routeName: (ctx) => UpComingOrderScreen(),
          ForgetPasswordScreen.routeName: (ctx) => ForgetPasswordScreen(),
          FoodCategoriesScreen.routeName: (ctx) => FoodCategoriesScreen(),
        },
      );
    });
  }
}

class CustomTheme {
  final BoxConstraints constraints;

  CustomTheme(this.constraints);

  final double designWidth = 375.0;
  final double designHeight = 812.0;

  double _getProportionateScreenWidth(inputWidth) {
    return (inputWidth / designWidth) * constraints.maxWidth;
  }

  double _getProportionateScreenHeight(inputHeight) {
    return (inputHeight / designHeight) * constraints.maxHeight;
  }

  nunito() => GoogleFonts.nunitoTextTheme(
        TextTheme(
          headline1: TextStyle(
            fontSize: _getProportionateScreenWidth(60),
            fontWeight: FontWeight.normal,
          ),
          headline2: TextStyle(
            fontSize: _getProportionateScreenWidth(36),
            fontWeight: FontWeight.normal,
          ),
          headline3: TextStyle(
            fontSize: _getProportionateScreenWidth(24),
            fontWeight: FontWeight.normal,
          ),
          headline4: TextStyle().copyWith(
            fontSize: _getProportionateScreenWidth(16),
            fontWeight: FontWeight.normal,
          ),
          bodyText1: TextStyle(
            fontSize: _getProportionateScreenWidth(14),
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            fontSize: _getProportionateScreenWidth(14),
          ),
        ),
      );

  elevatedButtonTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            UIData.kbrightColor,
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                _getProportionateScreenWidth(4),
              ),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: _getProportionateScreenWidth(16),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              _getProportionateScreenHeight(56),
            ),
          ),
        ),
      );

  outlinedButtonTheme() => OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(
            UIData.kbrightColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                _getProportionateScreenWidth(4),
              ),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(
            BorderSide(
              width: _getProportionateScreenWidth(1.5),
              color: UIData.kbrightColor,
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: _getProportionateScreenWidth(16),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            Size(double.infinity, _getProportionateScreenHeight(56)),
          ),
        ),
      );
}
