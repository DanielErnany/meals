import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/category.dart';
import '../datas/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Pega os argumentos(dados) da rota nomeada que chamou essa tela
    final category = ModalRoute.of(context).settings.arguments as Category;
    // o metodo where filtra as comidas pela categoria
    // e metodo tolist transforma o resultado em uma lista
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          }),
    );
  }
}
