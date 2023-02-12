import 'package:flutter/material.dart';
import 'package:pechincha/components/product_description_components/product_description_contact_form_widget.dart';

import 'package:pechincha/models/product.dart';

class ProductDescriptionDetailsWidget extends StatefulWidget {
  final Product product;
  const ProductDescriptionDetailsWidget({super.key, required this.product});

  @override
  State<ProductDescriptionDetailsWidget> createState() => _ProductDescriptionDetailsWidgetState();
}

class _ProductDescriptionDetailsWidgetState extends State<ProductDescriptionDetailsWidget> {

  bool isContainerContact = false;
  
  void errorDialogProductDescriptionDetails() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Erro no envio do formulário'),
        content: const Text('Verifique suas conexão!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          )
        ],
      ),
    );
  
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 350,
              width: deviceInfo.size.width,
              child: Image.network(widget.product.imagen),
            ),
            SizedBox(
             
              width: deviceInfo.size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Text(
                    widget.product.nameProduct,
                    style: const TextStyle(fontFamily: 'PTSans-Italic', fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: deviceInfo.size.width * 0.93,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'De R\$ ${widget.product.oldValue}',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'R\$ ${widget.product.currentValue}',
                      style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ),
            isContainerContact ?  ProductDescriptionContactFormWidget(product: widget.product, ontap: errorDialogProductDescriptionDetails,) : Container(),
            SizedBox(
              height: 35,
              width: deviceInfo.size.width * 0.93,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 241, 204, 91),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      // Change your radius here
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                child:  Text(
                  isContainerContact ? 'Retrair Formulário' : 'Mostrar Interesse',
                  
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    if (isContainerContact == true) {
                      isContainerContact = false;
                      //Navigator.pop(context, MaterialPageRoute(builder: (context) => ProductDescriptionContactFormWidget(product: widget.product,)));
                    } else {
                      isContainerContact = true;
                    }
                    
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: ((context) => SignupPage())));
                },
              ),
            ),
            SizedBox(
              width: deviceInfo.size.width,
              height: 50,
              child: const Center(
                  child: Text(
                'Descrição',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            SizedBox(
              width: deviceInfo.size.width * 0.80,
              child: const Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.product.description,
                style: const TextStyle(fontFamily: 'Montserrat', fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
