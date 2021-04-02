import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../datas/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // faz com que os elementos nao fiquem nos cantos da tela
      padding: const EdgeInsets.all(25),
      // SliverGridDelegateWithMaxCrossAxisExtent é uma area de rolagem com um valor maximo na horizontal
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // Cada elemento vai ter uma extensão de no máximo 200 pixels
        maxCrossAxisExtent: 200,
        // Qual a proporção do tamanho de cada elemento no gridview
        childAspectRatio: 3 / 2,
        // define o espaçamento na horizontal
        crossAxisSpacing: 20,
        // define o espaçamento na vertical
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map(
        (cat) {
          return CategoryItem(cat);
        },
      ).toList(),
    );
  }
}
