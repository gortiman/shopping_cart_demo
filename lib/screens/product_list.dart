import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:badges/badges.dart' as badges;
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<String> productName = ['Mango' , 'Orange' , 'Grapes' , 'Banana' , 'Kiwi' , 'Pomogranate','Apple','Peach'] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG','KG'] ;
  List<int> productPrice = [10, 20 , 30 , 40 , 50, 60 , 70 ,80] ;

  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg' ,
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg' ,
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg' ,
    // 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmFuYW5hfGVufDB8fDB8fHww' ,
    'https://media.istockphoto.com/id/162487071/photo/banana-bunch.jpg?s=612x612&w=0&k=20&c=2qvrsexfY-5qCqYvSly-V-Cm8eQ4hveXrunIpBdrIEE=',
    'https://media.istockphoto.com/id/834807852/photo/whole-kiwi-fruit-and-half-kiwi-fruit-on-white.jpg?s=612x612&w=0&k=20&c=zliUVnZlYPcOxEDYef7PMmOEEODFr8FUkTYqqFVaRG8=' ,
    'https://media.istockphoto.com/id/1092242800/photo/pomegranate-with-leaves-isolated-on-white-background-with-clipping-path.jpg?s=612x612&w=0&k=20&c=0HgWnzYSWqax8zr_KsFSe0zvg1HJEeOIJTHVns9WJ-k=' ,
    'https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=' ,
    'https://media.istockphoto.com/id/528065586/photo/peach-fruit-with-slice-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=DJq4AkMSfH-5DHrRn661y2ue-cuy44GaY4n5ayNn3pU='
  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Product List",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions:  [
          InkWell(
            onTap: (){
              // Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: const Center(
              child: badges.Badge(
                child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                showBadge: true,
                // badgeContent: Consumer<CartProvider>(
                //   builder: (context, value , child){
                //     return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                //   },
                // ),

                badgeContent: Text("3",style: TextStyle(color: Colors.white),),
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
              ),
            ),
          ),


          SizedBox(width: 20.0)
        ],
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productImage.length,
              itemBuilder: ( context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              height:100,
                                width: 100,
                                image: NetworkImage(productImage[index].toString())
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productName[index]),
                                  Text(productUnit[index]+" "+r"$"+productPrice[index].toString())
                                ],
                              ),
                            ),

                          ],
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: const Center(
                              child: Text("Add to cart",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },

            ),
          )
        ],
      ),

    );
  }
}
