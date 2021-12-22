import 'package:flutter/material.dart';
import 'package:todo_application/BaseUtility/component/base_text.dart';
import 'package:todo_application/BaseUtility/component/image_networking.dart';
import 'package:todo_application/model/food_menu.dart';

class CookingPage extends StatefulWidget {
  String headerName;
  CookingPage({Key? key, required this.headerName}) : super(key: key);

  @override
  _CookingPageState createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  List<FoodMenu> menu = [
    FoodMenu(
        name: "1",
        price: "122",
        img:
            "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2021/09/Pokemon-GO-Players-Are-Encountering-Shadow-and-Rainbow-Pikachu.jpg"),
    FoodMenu(
        name: "2",
        price: "123",
        img:
            "https://static2.srcdn.com/wordpress/wp-content/uploads/2021/10/pokemon-why-pikachu-never-evolved.jpg?q=50&fit=crop&w=480&h=300&dpr=1.5"),
    FoodMenu(name: "3", price: "124"),
    FoodMenu(name: "4", price: "125"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.headerName),
      ),
      body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext buildContext, int index) {
            return Row(
              children: [
                ImageNetworking(url: menu[index].img ?? ""),
                BaseText(title: menu[index].name ?? "name"),
                Text(menu[index].price ?? "price")
              ],
            );
          }),
    );
  }
}
