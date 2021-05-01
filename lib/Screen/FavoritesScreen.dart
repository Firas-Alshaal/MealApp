import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Widget/MealItem.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text("You Don`t Have Any Favorites Meals"),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageUrl: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability,
            );
          },
          itemCount: favoriteMeal.length);
    }
  }
}
