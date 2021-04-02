import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final meal;

  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      // rota da tela q vai ser chamada
      AppRoutes.MEAL_DETAIL,
      // passa a comida como argumento para a tela que mostra os detalhes
      arguments: meal,
      // then faz com que quando a tela chamada seja fechada e
      // retorne pra ela pegue o dado que foi passado no pop da tela chamada
    )
        .then((result) {
      if (result == null) {
        print('Sem resultado passado de volta');
      } else {
        print('O nome da refeição é $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        // define as margens do card
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Faz com q um widget fique sobre o outro como uma pilha
            Stack(
              children: [
                // foi necesssario envolver a imagem pelo ClipRRect para definir as bordas da imagem para que ele fique com as mesmas bordas do card
                ClipRRect(
// defini a borda da imagem
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  // Imagem q vai ser mostrada
                  child: Image.network(
                    // caminho da internet de onde a imagem deve ser puxada
                    meal.imageUrl,
                    // altura da imagem
                    height: 250,
                    // largura da imagem
                    // double.infinity faz com q a altura pegue o maior espaço disponivel (Não vai pegar toda largura da tela pq foi definida uma margem no card e essa margem ocupa espaço )
                    width: double.infinity,
                    // faz com q as imagem ocupe o espaço das dimensões definidas acima
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned é um widget q só pd ser usado dentro do widget stack
                // e serve pra definir como ficara posicionado no stack
                Positioned(
                  // Ele vai ficar a 20 pixels da parte inferio do stack
                  bottom: 20,
                  // fica a 10 pixels da borda direita
                  right: 10,
                  // Containner que envolve o texto para estilizalo
                  child: Container(
// largura do texto
                    width: 300,
                    // Cor do containner (Vai ficar como se fosse o plano de fundo do texto)
                    //  Colors.black54 é cor preta com 54% de opacidade
                    color: Colors.black54,
                    // padding para alinhar onde o texto vai ficar no containner
                    padding: EdgeInsets.symmetric(
                      // Onde ele vai ficar na vertical
                      vertical: 5,
                      // Onde ele vai ficar na horizontal
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      // Habilita a quebra de linha caso o texto ocupe o espaço disponivel
                      softWrap: true,
                      // Caso o texto seja muito grande e ultrapasse o espaço disponivel a parte do texto q ficou cobrando vai ficando transparente
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                // Coloca os elementos espalhados pela linha
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Linha com o tempo
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  // Linha com a complexidade
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  // Linha com o preço
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
