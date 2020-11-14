import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ListView.builder(
            itemBuilder: null,
          ),
        ),
      ),
    );
  }

  Widget productCard(){
    return Card() ;
  }
}
