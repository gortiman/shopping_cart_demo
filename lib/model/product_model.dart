class ProductModel{
  late final int? id;
  final String? productId;
  final String? productName;
  final String? productUnit;
  final int? productQuantity;
  final int? initialPrice;
  final int? productPrice;
  final String? productImage;

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
  ProductModel.fromMap(Map<dynamic,dynamic>res)
      : id = res['id'],
        productId = res["productId"],
        productName = res["productName"],
        initialPrice = res["initialPrice"],
        productPrice = res["productPrice"],
        productQuantity = res["productQuantity"],
        productUnit = res["productUnit"],
        productImage = res["productImage"];


  // Method to convert a Cart object to a Map
  // Map<String, Object?> toMap(){
  //   return{
  //     'id': id,   // Add 'id' field to the map with value from id variable
  //     'productId': productId,
  //     'productName':productName,
  //     'productUnit':productUnit,
  //     'productQuantity': productQuantity,
  //     'productPrice': productPrice,
  //     'productImage': productImage,
  //     'initialPrice': initialPrice,
  //   };
  // }


  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productId' : productId,
      'productName' :productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'productQuantity' : productQuantity,
      'productUnit' : productUnit,
      'productImage' : productImage,
    };
  }
}