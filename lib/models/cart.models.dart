class Cart {
  List<CartItem>? items;

  Cart();

  Cart.fromJson(Map<String, dynamic> jsondata) {
    items = jsondata['items'] != null
        ? List.from(jsondata['items'].map((e) => CartItem.fromJson(e)))
        : null;
  }

  Map<String, dynamic> toJson() => {
        "items": items?.map((e) => e.toJson()),
      };
}

class CartItem {
  String? itemId;
  Map<String, dynamic>? selectedVarints;
  String? productId;
  int? quantity;

  CartItem();

  CartItem.fromJson(Map<String, dynamic> jsondata) {
    itemId = jsondata['itemId'];
    productId = jsondata['productId'];
    quantity = jsondata['quantity'];
    selectedVarints = jsondata['selectedVarints'] != null
        ? Map<String, dynamic>.from(jsondata['selectedVarints'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "selectedVarints": selectedVarints,
        "productId": productId,
        "quantity": quantity,
      };
}
