// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.fullName,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
    this.address,
    this.images,
    this.userType,
    this.userId
  });

  String? fullName;
  String? username;
  String? email;
  String? password;
  String? phoneNumber;
  String? userType;
  String? userId;
  List? images;
  List? address;


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        username: json["username"],
        email: json["email"],
     
        phoneNumber: json["phoneNumber"],
        userType: json['userType'],
        images: List.from(json['images']),
        address: List.from(json['addressIds']),
        userId: json['id']

      );

  Map<String, dynamic> toJson() => {
        "fullName": this.fullName,
        "username": this.username,
        "email": this.email,
        "password": this.password,
        "phoneNumber": this.phoneNumber,
        
      };
      Map<String,dynamic> toUserJson()=>{
      "fullName":this.fullName,
      "username":this.username,
      "email":this.email,
      "phoneNumber":this.phoneNumber,
      "userType":this.userType,
      "images": this.images,
      "addressIds": this.address,
      "id":this.userId





      };
}
