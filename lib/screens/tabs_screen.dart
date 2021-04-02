import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget para criar tabbar
    return DefaultTabController(
      // Numero de abas que o tabbar vai ter
      length: 2,
      // Define a aba inicial
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar'),
          centerTitle: true,
          // Cria o tabbar
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        // Widget para ver as abas do tabbar
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
