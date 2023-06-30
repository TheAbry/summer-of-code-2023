class CartItem {
  late int id;
  late String name;
  late int price;
  late int qty;

  CartItem(this.id, this.name, this.price, this.qty);

  List<String> toList() {
    return [id.toString(), name, price.toString(), qty.toString()];
  }
}
