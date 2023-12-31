import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:trendline/models/ProductModel.dart';
import 'package:trendline/modules/components/ProductImage.dart';
import '../shared/components/constants.dart';
import 'Components/SizeOfProduct.dart';
import 'Components/description.dart';
import 'components/AvailableColors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(IconlyBroken.heart), onPressed: () {

        }),
        centerTitle: true,
        title:const Text( "تريندلاين" , style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Cairo"
        ),),
        actions: [
          IconButton(
            icon: const Icon(IconlyBroken.arrowLeft2),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 20 / 2)
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductImage(product: widget.product),
              const SizedBox(height: 10,),
              Container(
                  padding: const EdgeInsets.all(20),
                  width: width,
                  // height: 500,
                  decoration:  BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius:  BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(


                        children: [
                          Text("السعر : " , style: defaultTextStyle(),) ,
                          Text("${widget.product.price}", style: TextStyle(fontFamily: "Cairo" ,
                              fontSize: 17),)

                        ],
                      ),
                      const SizedBox(height: 5,),
                      SizeOfProduct(product: widget.product,),
                      const SizedBox(height: 8,),
                      AvailableColors(product: widget.product,),
                      const SizedBox(height: 8,),
                    Row(
                      children: [
                        Description(product: widget.product,),

                      ],
                    ),
                    const SizedBox(height: 20,)],

                  )),
            ],
          ),
        ),
      ),
    );
  }
}
