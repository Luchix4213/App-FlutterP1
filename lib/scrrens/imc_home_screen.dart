import 'package:calculador/components/gender_selector.dart';
import 'package:calculador/components/height_selector.dart';
import 'package:calculador/components/number_selector.dart';
import 'package:calculador/core/app_color.dart';
import 'package:calculador/core/text_styles.dart';
import 'package:calculador/scrrens/imc_result_screen.dart';
import 'package:flutter/material.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWieght = 80;
  double selectedHeight = 170;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(selectedHeight: selectedHeight, onHeightChange: (newHeight){
          setState(() {
            selectedHeight = newHeight;
          });
        },),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(child: NumberSelector(title: "PESO",value: selectedWieght, onIncrement: (){
                setState(() {
                  selectedWieght++;
                });
              }, onDecrement: (){
                setState(() {
                  selectedWieght--;
                });
              },)),
              SizedBox(width: 16),
              Expanded(child: NumberSelector(title: "EDAD", value: selectedAge, onIncrement: (){
                setState(() {
                  selectedAge++;
                });
              },onDecrement: (){
                setState(() {
                  selectedAge--;
                });
              },))
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ImcResultScreen(height: selectedHeight, wieght: selectedWieght,)));
            }, style: ButtonStyle(shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8)
            )), backgroundColor: WidgetStateProperty.all(AppColors.primary)), child: Text("Calcular", style: TextStyles.bodyText,),)),
        )
      ],
    );
  }
}