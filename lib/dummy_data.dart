import 'package:foodie/models/food.dart';
import 'package:foodie/models/resturant.dart';
import 'package:foodie/models/searchResturant.dart';

import 'models/dishes.dart';

const DummyResturants = const [
  Resturant(
      ratings: 4,
      image:
          "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80",
      name: "Hungry Resturant",
      description: "Dishes.Drinks.swallow.###",
      numberRating: 14),
  Resturant(
      ratings: 4.9,
      image:
          "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80",
      name: "BestGrade Resturant",
      description: "Dishes.Drinks.swallow.###",
      numberRating: 2),
  Resturant(
      ratings: 4,
      image:
          "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80",
      name: "Forks and Fingers",
      description: "Dishes.Drinks.swallow.###",
      numberRating: 2),
  Resturant(
      ratings: 4,
      image:
          "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80",
      name: "Banwill and Son's",
      description: "Dishes.Drinks.swallow.###",
      numberRating: 9),
  Resturant(
      ratings: 2,
      image:
          "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80",
      name: "Grand de Royal",
      description: "Dishes.Drinks.swallow.###",
      numberRating: 30)
];

const DummyFood = const [
  FoodCategory(image: "assets/images/dough.png", name: "Burger"),
  FoodCategory(image: "assets/images/dishes.png", name: "Dishes"),
  FoodCategory(image: "assets/images/drinks.png", name: "Drinks"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
  FoodCategory(image: "assets/images/pizza.png", name: "Pizza"),
];

const DummySearch = const [
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
  SearchResturantModel(
      imageUrl: "assets/images/dough.png",
      rating: 4.7,
      name: "The Dough Factory",
      distance: 2.0),
];

const DummyFood1 = const [
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
  FoodCategory1(
      imageUrl: "assets/images/Burger.png",
      rating: 4.0,
      resturant: "In Mad Grill",
      name: "Veggie Burder",
      time: 56,
      amount: 1855.00),
];

List<Dishes> dummyDishes = [
  Dishes(
      image: "assets/images/pickup.png",
      name: "Pepperoni Pie",
      details: "Pepperoni, mozzarella cheese fresh basil and olive oil",
      price: "N1500"),
  Dishes(
      image: "assets/images/pickup.png",
      name: "Pepperoni Pie",
      details: "Pepperoni, mozzarella cheese fresh basil and olive oil",
      price: "N1500"),
  Dishes(
      image: "assets/images/pickup.png",
      name: "Pepperoni Pie",
      details: "Pepperoni, mozzarella cheese fresh basil and olive oil",
      price: "N1500"),
  Dishes(
      image: "assets/images/pickup.png",
      name: "Pepperoni Pie",
      details: "Pepperoni, mozzarella cheese fresh basil and olive oil",
      price: "N1500"),
  Dishes(
      image: "assets/images/pickup.png",
      name: "Pepperoni Pie",
      details: "Pepperoni, mozzarella cheese fresh basil and olive oil",
      price: "N1500"),
];
