class FoodMenu{
List? images;
List? categoryIds;
String? menuName;
String? description;
int? normalPrice;
int? offerPrice;
int? minPreparationTime;
int? maxPreparationTime;
String? restaurantId;
String? restaurantMenuId;

FoodMenu({this.images,this.categoryIds,this.menuName,this.description,this.normalPrice,this.offerPrice,this.minPreparationTime
,this.maxPreparationTime,this.restaurantId,this.restaurantMenuId});

factory FoodMenu.fromJson(Map<String,dynamic> json)=>FoodMenu(
  images: List.from(json['images']),
  categoryIds: List.from(json['categoryIds']),
  menuName: json['menuName'],
  description: json['description'],
  normalPrice: json['normalPrice'],
  offerPrice: json['offerPrice'],
  minPreparationTime: json['minPreparationTime'],
  maxPreparationTime: json['maxPreparationTime'],
  restaurantId: json['restaurantId'],
  restaurantMenuId: json['restaurantMenuId']
);


}