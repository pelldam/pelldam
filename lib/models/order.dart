import 'package:foodie/models/foodMenu.dart';
import 'package:foodie/models/restaurant_model.dart';

class Order{
String? status;
List<String>? menuIds;
String? restaurantId;
String? userId;
String? promoCode;
String? orderNote;
String? orderId;
DateTime? createdAt;
int? promoAmount;
int? totalAmount;
List<FoodMenu>? foodMenu;
Restaurant? restaurant; 

Order({this.status,this.menuIds,this.restaurantId,this.userId,this.promoCode,this.orderNote,this.orderId,this.createdAt,this.promoAmount,this.totalAmount,this.restaurant,this.foodMenu});

factory Order.fromJson(Map<String,dynamic>json)=>Order(
status: json['status'],
// menuIds: List.from(json['menuIds']),
// restaurantId: json['restaurantId'],
userId: json['userId'],
promoCode: json['promoCode'],
orderNote: json['orderNote'],
promoAmount: json['promoAmount'],
totalAmount: json['totalAmount'],
orderId: json['orderId'],
createdAt: DateTime.parse(json['createdAt']),

foodMenu: json['menuIds']==null?[]:List.from(json['menuIds']).map((e) => FoodMenu.fromJson(e)).toList(),
restaurant: json['restaurantId']==null?null:Restaurant.fromJson(json['restaurantId'])

);


factory Order.createFromJson(Map<String,dynamic> json)=>Order(
status: json['status'],
menuIds: List.from(json['menuIds']),
restaurantId: json['restaurantId'],
userId: json['userId'],
promoCode: json['promoCode'],
orderNote: json['orderNote'],
promoAmount: json['promoAmount'],
totalAmount: json['totalAmount'],
orderId: json['orderId'],
createdAt: DateTime.parse(json['createdAt']),

);



}