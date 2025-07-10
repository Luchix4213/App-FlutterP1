import 'package:calculador/core/app_color.dart';
import 'package:calculador/core/text_styles.dart';
import 'package:flutter/material.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int wieght;
  const ImcResultScreen({super.key, required this.height, required this.wieght});

  @override
  Widget build(BuildContext context) {
    double fixedHeight = height/100;
    double imcResult = wieght/(fixedHeight*fixedHeight);

    return Scaffold(
      backgroundColor: AppColors.backgraund,
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Tu resultado", style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 32),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.backgraundComponent, 
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(getTextByImc(imcResult), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: getColorByImc(imcResult))),
                      Text(imcResult.toStringAsFixed(2), style: TextStyle(fontSize: 76, color: Colors.white, fontWeight: FontWeight.bold),),
                      Text("Descripcion",  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w200, color: Colors.white))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
 Color getColorByImc(double imcResult) {
  return switch(imcResult){
    < 18.5 => Colors.blue,
    < 24.8 => Colors.green,
    < 29.99 => Colors.orange,
    _ => Colors.red
  };
 }
 
  String getTextByImc(double imcResult) {
    return switch(imcResult){
      < 18.5 => "Imc bajo",
      < 24.8 => "Imnc Normal",
      < 29.99 => "Sobrepeso",
      _ => "Obesidad"
    };
  }
}