import 'package:calculador/core/app_color.dart';
import 'package:calculador/core/text_styles.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //hombre
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "Hombre";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left:16, bottom: 16, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Hombre" 
                  ?AppColors.backgraundComponentSelected
                  :AppColors.backgraundComponent
                  ,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100,),
                      SizedBox(height: 8),
                      Text("HOMBRE", style: TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //mujer
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left:8, bottom: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Mujer" 
                  ?AppColors.backgraundComponentSelected
                  :AppColors.backgraundComponent
                  ,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100,),
                      SizedBox(height: 8),
                      Text("MUJER", style: TextStyles.bodyText)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}