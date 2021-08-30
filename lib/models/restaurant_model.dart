// To parse this JSON data, do
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

import 'package:foodie/models/resturant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant(
      {this.restaurantName,
       this.email,
       this.phoneNumber,
       this.password,
       this.images,
     this.accountType,
       this.restaurantId,
     this.categoryId,
       this.deliveryOption,
       this.closeTime,
       this.openTime,
       this.addresss


      });

  String? restaurantName;
  String? email;
  String? password;
  String? phoneNumber;
  List<String>? images;
  String? accountType;
  String? restaurantId;
  List<String>? categoryId;
  LatLng? latLng; 
  bool? deliveryOption;
  String? openTime;
  String? closeTime;
  String? addresss;


  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurantName: json["restaurantName"],
        email: json["email"]==null?"":json['email'],
        phoneNumber: json["phoneNumber"]==null ?"":json['phoneNumber'],
     
        images: json['images']==null?[]:List.from(json['images']),
        accountType: json['accountType']==null?"":json['accountType'],
        restaurantId: json['restaurantId'],
        categoryId: json['categoryIds']==null?[]:List.from(json['categoryIds']),
        deliveryOption: json['deliveryOption']==null?false:json['deliveryOption']
        // latLng: LatLng.fromJson(json['location'][''])
        // images: json['images'] == "" ? null : List.from(json['images']),
        // categoryId:
        //     json['categoryIds'] == "" ? null : List.from(json['categoryIds']),
      );

factory Restaurant.nearbyResurantFromJson(Map<String,dynamic> json,Map<String,dynamic> e1)=>Restaurant(
images:json['images']==null?[]: List.from(json['images']),
restaurantName: json['restaurantName'],
phoneNumber: json['phoneNumber'],
restaurantId: json['restaurantId'],
closeTime: json['closeTime'],
openTime: json['openTime'],
addresss: e1['address']



);
  Map<String, dynamic> toJson() => {
        "restaurantName": this.restaurantName,
        "email": this.email,
        "phoneNumber": this.phoneNumber,
        'password': this.password,
        'images': (categoryId!.length > 0) ? jsonEncode(this.images) : "",
        'accountType': this.accountType,
        'restaurantId': this.restaurantId,
        'categoryIds':
            (categoryId!.length > 0) ? jsonEncode(this.categoryId) : "",
      };
}
