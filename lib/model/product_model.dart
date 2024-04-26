class ProductModel{
  late final int? id;
  String? productId;
  String? productName;
  String? productUnit;
  String? productQuantity;
  String? initialPrice;
  String? productPrice;
  String? productImage;

  ProductModel({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productUnit,
    required this.productPrice,
    required this.productImage,
    required this.initialPrice,
    required this.productQuantity
});

  // It takes a Map<dynamic, dynamic> named res as input.
  // It initializes the fields of the Cart object using values retrieved from the res Map.
  // Each field of the Cart object (e.g., id, productId, etc.) is assigned a value retrieved from the corresponding key in the res Map.

  // Constructor to create a Cart object from a Map
  ProductModel.fromMap(Map<dynamic,dynamic>map){
    id = map['id'];  // Assign 'id' from the map to the id variable
    productId = map['productId'];
    productName = map['productName'];
    productUnit = map['productUnit'];
    productQuantity = map['productQuantity'];
    productPrice = map['productPrice'];
    productImage = map['productImage'];
    initialPrice = map['initialPrice'];
  }

  // Method to convert a Cart object to a Map
  Map<String, Object?> toMap(){
    return{
      'id': id,   // Add 'id' field to the map with value from id variable
      'productId': productId,
      'productName':productName,
      'productUnit':productUnit,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
      'productImage': productImage,
      'initialPrice': initialPrice,
    };
  }
}