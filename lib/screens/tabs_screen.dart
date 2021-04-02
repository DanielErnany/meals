import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreem extends StatefulWidget {
  @override
  _TabsScreemState createState() => _TabsScreemState();
}

class _TabsScreemState extends State<TabsScreem> {
  int _selectedIndexScreen = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoriteScreen(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedIndexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget para criar tabbar
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos Cozinhar'),
        centerTitle: true,
      ),
      body: _screens[_selectedIndexScreen],
      // Cria uma tabbar na parte inferior
      bottomNavigationBar: BottomNavigationBar(
        // cor quando o item ñ está selecionado
        unselectedItemColor: Colors.white,
        // cor quando o item está selecionado
        selectedItemColor: Theme.of(context).accentColor,
        // Mostra qual dos itens está selecionado
        currentIndex: _selectedIndexScreen,
        // Cria uma animação na tabBar
        type: BottomNavigationBarType.shifting,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
