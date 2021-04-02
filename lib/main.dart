import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        // cor de fundo da aplicação
        canvasColor: Color.fromRGBO(255, 255, 170, 1),
// Cor primaria do tema
        primarySwatch: Colors.pink,
        // Cor de destaque
        accentColor: Colors.amber,
        // Fonte principal da aplicação
        fontFamily: 'Raleway',
        // Muda a fonte de titulo
        textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),

      // home: CategoriesScreen(),
      // recebe um map da rota
      routes: {
        // Rota da tela d home
        AppRoutes.HOME: (ctx) => TabsScreem(),
        // Rota de quando é selecionado um tipo de comida
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        // Rota que mostra mais detalhes da refeição
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute serve para criar rotas dinamicamente
      //  caso alguma rotes seja chamada e ñ esteja cadastrada
      //  no routes acima é chamado onGenerateRoute
      // Para testar isso comente a linha q possui a rota :
      //  AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      // onGenerateRoute: (settings) {
      //   // condicional q olha se o nome da rota chamada é igual '/alguma-coisa'
      //   if (settings.name == '/alguma-coisa') {
      //     return null;
      //   }
      //   if (settings.name == '/outra-coisa') {
      //     return null;
      //   }
      //   // Se nenhuma dos nomes for o chamado chama a rota da tela inicial
      //   else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       },
      //     );
      //   }
      // },

      // define o q deve ser feito se a rota não for encontrada em routes e onGenerateRoute respectivamente
      // Para testar isso comente a linha q possui a rota :
      //  AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return CategoriesScreen();
      //     },
      //   );
      // },
    );
  }
}