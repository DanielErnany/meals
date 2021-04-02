import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreem extends StatefulWidget {
  @override
  _TabsScreemState createState() => _TabsScreemState();
}

class _TabsScreemState extends State<TabsScreem> {
  int _selectedIndexScreen = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus favoritos', 'screen': FavoriteScreen()},
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
        title: Text(
          _screens[_selectedIndexScreen]['title'],
        ),
        centerTitle: true,
      ),
      body: _screens[_selectedIndexScreen]['screen'],
      // Cria uma tabbar na parte inferior
      bottomNavigationBar: BottomNavigationBar(
        // cor quando o item ñ está selecionado
        unselectedItemColor: Colors.white,
        // cor quando o item está selecionado
        selectedItemColor: Theme.of(context).accentColor,
        // Mostra qual dos itens está selecionado
        currentIndex: _selectedIndexScreen,

        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
