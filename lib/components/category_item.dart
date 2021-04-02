import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    // Vai colocar a proxima tela sobre a pilha d telas
    // Navigator.of(context).push(
    //   // Não se pd colocar a tela diretamente dentro do push é necessário um MaterialPageRoute(ou CupertinoPageRoute no ios)
    //   MaterialPageRoute(
    //     // Nesse caso não vai ser necessário usar o contexto então é passado _ no builder
    //     builder: (_) {
    //       return CategoriesMealsScreen(category);
    //     },
    //   ),
    // );
    // chama a rota nomeada
    Navigator.of(context).pushNamed(
      // nome da rota
      AppRoutes.CATEGORIES_MEALS,
      // Argumentos que serão passados pela rota
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) => InkWell(
        // Função feita quando for clicado
        onTap: () => _selectCategory(context),
        // Cor quando ele é clicado
        splashColor: Theme.of(context).primaryColor,
        //  O inkwell tenha as mesmas bordas do container q está dentro dele
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // Faz com que o texto ñ fique no canto superior esquerdo do container
          padding: EdgeInsets.all(15),

          child: Text(
            category.title,
            style: Theme.of(context).textTheme.title,
          ),
          // Decora o container
          decoration: BoxDecoration(
            // Arredonda as bordas do container
            borderRadius: BorderRadius.circular(15),
            // Faz com q a cor do container fique com um efeito degrade
            gradient: LinearGradient(
              // Cores q vão ser usadas no degrade nas respectivas ordens
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
// Onde vai começar o degrade
              begin: Alignment.topLeft,
// Onde vai terminar o degrade
              end: Alignment.bottomRight,
            ),
          ),
        ),
      );
}
