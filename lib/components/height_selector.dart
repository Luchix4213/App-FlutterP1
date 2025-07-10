import 'package:calculador/core/app_color.dart';
import 'package:calculador/core/text_styles.dart';
import 'package:flutter/material.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;
  const HeightSelector({super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgraundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("ALTURA", style: TextStyles.bodyText,),
            ),
            Text("${widget.selectedHeight.toStringAsFixed(0)} cm", style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),),
            Slider(
              value: widget.selectedHeight, 
              onChanged: (newHeigth){
                widget.onHeightChange(newHeigth);
              }, 
              min: 140,
              max: 230,
              divisions: 90,
              activeColor: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}