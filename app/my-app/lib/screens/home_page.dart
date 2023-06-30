import 'package:flutter/material.dart';
import 'package:flutter_application_1/tiles.dart';
import 'package:flutter_application_1/products.dart';
import 'package:flutter_application_1/screens/cart.dart';
import 'package:flutter_application_1/cartitem.dart';
import 'package:intl/intl.dart' as intl;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

var L = MyList().products;
final formatter = intl.NumberFormat.decimalPattern();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.inp});
  final int inp;

  @override
  Widget build(BuildContext context) {
    return /*DefaultTabController(
        length: 2,
        child:*/
        Scaffold(
      //appBar
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
            image: AssetImage('images/rocky-wall.png'),
            repeat: ImageRepeat.repeat,
          ),
          color: Color.fromARGB(50, 41, 41, 41),
          /*
                      borderRadius: bord,*/
        ),
        child: ListView(
          children: [
            // Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(L[inp]['image']), fit: BoxFit.cover)),
            ),
            //Space
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          L[inp]['name'],
                          style: GoogleFonts.medievalSharp(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          L[inp]['type'],
                          style: GoogleFonts.medievalSharp(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 18,
                  ),
                  Text(
                    formatter.format(L[inp]['ratings']),
                    style: GoogleFonts.notoSerifEthiopic(
                        color: Colors.black, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(children: [
                const Text("₹ ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  formatter.format(L[inp]['price']),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Ancient-Greek",
                    fontSize: 30,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //first
                  Column(
                    children: [
                      Icon(
                        Icons.call,
                        color: Color.fromARGB(255, 49, 54, 58),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "CALL",
                        style: GoogleFonts.notoSerifEthiopic(
                            color: Color.fromARGB(255, 49, 54, 58)),
                      ),
                    ],
                  ),
                  //second
                  Column(
                    children: [
                      Icon(
                        Icons.bookmark_add,
                        color: const Color.fromARGB(255, 49, 54, 58),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "SAVE",
                        style: GoogleFonts.notoSerifEthiopic(
                            color: Color.fromARGB(255, 49, 54, 58)),
                      ),
                    ],
                  ),
                  //third
                  Column(
                    children: [
                      Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 49, 54, 58),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "SHARE",
                        style: GoogleFonts.notoSerifEthiopic(
                            color: Color.fromARGB(255, 49, 54, 58)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //SPACE
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ExpandedText(
                    text: L[inp]['description'],
                  ), //Text(L[inp]['description']),
                  CartButton(
                    id: inp,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartPage()));
        },
        child: const Icon(
          Icons.trolley,
          color: Colors.white,
        ),
      ),
    ) /*,
        )*/
        ;
  }
}

class CartButton extends StatefulWidget {
  final int id;
  const CartButton({super.key, required this.id});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  late List<dynamic> cartitems;
  late List<String> ids;
  late Map<String, dynamic> obj;

  @override
  void initState() {
    super.initState();
    for (final p in L) {
      if (p['id'] == widget.id) {
        obj = p;
        break;
      }
    }
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

  CartItem getCartItem(int id) {
    CartItem oldCartItem = CartItem(-1, "", 0, 0);
    if (ids.contains(id.toString())) {
      for (var c in cartitems) {
        if (c.id == id) {
          oldCartItem = c;
        }
      }
    }

    return oldCartItem;
  }

  Future<void> addCartItem(int id, String name, int price, int qty) async {
    final listCart = await SharedPreferences.getInstance();
    List<String> x = (listCart.getStringList('ids') ?? []);

    CartItem newCartItem = CartItem(
      //add a new item to data list
      id,
      name,
      price,
      qty,
    );
    x.add(id.toString());

    setState(() {
      ids = x;
      cartitems.add(newCartItem);
      listCart.setStringList(id.toString(), newCartItem.toList());
      listCart.setStringList('ids', ids);
    });
  }

  Future<void> updateCartItem(int id, int qty) async {
    final listCart = await SharedPreferences.getInstance();
    List<String> x = (listCart.getStringList('ids') ?? []);

    if (x.contains(id.toString())) {
      List<String> result = [];
      int newq = 1;
      for (var c in x) {
        List<String> info = listCart.getStringList(c) ?? ['-1', '', '0', '0'];
        if (info[0] == id.toString()) {
          newq = int.parse(info[3]) + qty;
          if (newq > -1) {
            info[3] = newq.toString();
          } else {
            newq = int.parse(info[3]);
          }
          result = info;
        }
      }

      if (newq != 0) {
        listCart.setStringList(id.toString(), result);
      } else {
        x.remove(id.toString());
        listCart.setStringList('ids', x);

        await listCart.remove(id.toString());
      }
      ;

      readCartData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ids.contains(widget.id.toString())
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 25,
                  height: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.horizontal(left: Radius.circular(5)),
                        ))),
                    onPressed: () {
                      updateCartItem(obj['id'], 1);
                    },
                    child: const Icon(Icons.add, size: 14),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: 19,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: my2Grey),
                  child: Text(getCartItem(obj['id']).qty.toString()),
                ),
                SizedBox(
                  width: 25,
                  height: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(5)),
                        ))),
                    onPressed: () {
                      updateCartItem(obj['id'], -1);
                    },
                    child: const Icon(Icons.remove, size: 14),
                  ),
                ),
              ],
            )
          : ElevatedButton(
              child: const Text('Add to Cart'),
              onPressed: () {
                addCartItem(obj['id'], obj['name'], obj['price'], 1);
              })
    ]);
  }
}
