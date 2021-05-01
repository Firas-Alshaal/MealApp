import 'package:flutter/material.dart';
import 'package:meal_app/Models/meal.dart';
import 'package:meal_app/Widget/MealItem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "CategoryMeals";

  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreen createState() => _CategoryMealsScreen();
}

class _CategoryMealsScreen extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg["id"];
    categoryTitle = routeArg["title"];
    displayMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

/*  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
            );
          },
          itemCount: displayMeals.length),
    );
  }
}
