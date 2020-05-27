import 'package:flutter/material.dart';
import 'package:fluttermealsapp/models/meal.dart';
import 'package:fluttermealsapp/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favMeals;
  FavoritesScreen(this.favMeals);

  @override
  Widget build(BuildContext context) {
    return favMeals.length > 0 ? ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
            favMeals[index].id,
            favMeals[index].title,
            favMeals[index].imageUrl,
            favMeals[index].duration,
            favMeals[index].complexity,
            favMeals[index].affordability);
      },
      itemCount: favMeals.length,
    ) : Center(
      child: Text('You have no favourite yet. Start adding some.'),
    );
  }
}
