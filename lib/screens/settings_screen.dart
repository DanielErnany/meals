import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações !',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glúten',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState(
                    () => settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(
                    () => settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  settings.isVegan,
                  (value) => setState(
                    () => settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(
                    () => settings.isVegetarian = value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}