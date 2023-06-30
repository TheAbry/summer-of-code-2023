import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/products.dart';
import 'package:flutter_application_1/tiles.dart';
import 'package:flutter_application_1/cartitem.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<dynamic> cartitems;
  late List<String> ids;

  @override
  void initState() {
    super.initState();
    readCartData();
  }

  Future<void> readCartData() async {
    final listCart = await SharedPreferences.getInstance();

    setState(() {
      cartitems = [];
      ids = (listCart.getStringList('ids') ?? []);
      for (var c in ids) {
        List info = listCart.getStringList(c) ?? ['-1', '', '0', '0'];
        CartItem cartitem = CartItem(int.parse(info[0]), info[1],
            int.parse(info[2]), int.parse(info[3]));
        cartitems.add(cartitem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/title.png', fit: BoxFit.cover),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        /*bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "First Tab"),
              Tab(text: "Second Tab"),
            ],
          )*/
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/white-wall.png'),
              repeat: ImageRepeat.repeat,
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 87, 42, 42),
                  Color.fromARGB(255, 76, 11, 0),
                ])),
        padding: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: ids.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> item = MyList().products[0];
            for (Map<String, dynamic> c in MyList().products) {
              if (c['id'] == int.parse(ids[index])) {
                item = c;
              }
            }
            return ProductBar(index: item['id'], Ls: MyList().products);
          },
        ),
      ),
    );
  }
}
