class FoodCategory {
  final String image;
  final String name;

  const FoodCategory({
    required this.image,
    required this.name,
  });
}

class FoodCategory1 {
  final String imageUrl;
  final double rating;
  final String resturant;

  final String name;
  final double time;
  final double amount;

  const FoodCategory1(
      {required this.imageUrl,
      required this.rating,
      required this.resturant,
      required this.name,
      required this.time,
      required this.amount});
}
