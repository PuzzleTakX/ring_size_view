library ring_size_view;

import 'dart:math';

import 'package:flutter/material.dart';



class RingSizeView extends StatefulWidget {
  final Color? backgroundColor;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final Function(double) calculateDiameter;
  final Function(double) calculateRadius;
  final Function(double) calculateCircumference;
  final double ringSize;
  final double width;
  final double height;
  const RingSizeView({Key? key, 
     this.backgroundColor,
     this.textDirection,
    required this.ringSize,
     this.textStyle,
    required this.calculateDiameter,
    required this.calculateRadius,
    required this.calculateCircumference,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<RingSizeView> createState() => _RingSizeViewState();
}


class _RingSizeViewState extends State<RingSizeView> {
  ScrollController controller = ScrollController();

  Color backgroundColor = Colors.grey;
  TextDirection textDirection = TextDirection.ltr;
  TextStyle textStyle = const TextStyle(color:  Colors.black,fontSize: 12);


  init(){
    if(widget.backgroundColor != null) backgroundColor = widget.backgroundColor!;
    if(widget.textDirection != null) textDirection = widget.textDirection!;
    if(widget.textStyle != null) textStyle = widget.textStyle!;

  }

  @override
  void initState() {
    init();
    super.initState();
  }

  double calculateDiameter(double size) {
    // Calculate the diameter based on ring size (in millimeters)
    widget.calculateDiameter.call(size * 2.0);
    widget.calculateRadius.call(size);
    widget.calculateCircumference.call(size * pi);
    return size * 2.0;

  }

  double calculateRadius(double size) {
    // Calculate the radius based on ring size (in millimeters)

    return size;
  }

  double calculateCircumference(double size) {
    // Calculate the circumference based on ring size (in millimeters)

    return size * pi;
  }



  @override
  Widget build(BuildContext context) {
    double diameter = calculateDiameter(widget.ringSize);

    return Container(width: widget.width,height: widget.height,
      color:  Colors.blueGrey.withAlpha(10),
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: GridView.builder(
                itemCount: 1000,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: ScrollController(initialScrollOffset: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 15,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withAlpha(20),width: 0.3),
                    ),

                  );
                },
              ),
            ),

            Column(
              children: [

                const Spacer(),
                Container(width: double.maxFinite,height: 0.9,color: backgroundColor,),
                SizedBox(
                  width:  (diameter * (6.100)),
                  height:  (diameter * (6.100)),
                ),
                Container(width: double.maxFinite,height: 0.9,color: backgroundColor,),
                const Spacer(),
              ],
            ),
            Row(
              children: [

                const Spacer(),
                Container(width: 0.9,height: double.maxFinite,color: backgroundColor,),
                SizedBox(
                  width:  (diameter * (6.100)),
                  height:  (diameter * (6.100)),
                ),
                Container(width: 0.9,height: double.maxFinite,color: backgroundColor,),
                const Spacer(),
              ],
            ),
            Center(child: Container(
              width:  (diameter * (6.100)),
              height:  (diameter * (6.100)),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withAlpha(40),
                  border: Border.all(color: Colors.blueGrey.withAlpha(180),width: 2.5)
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_rounded,size: 15,color: backgroundColor,),
                  Flexible(child: Container(width: double.maxFinite,color: backgroundColor,height: 1)),
                  Container(decoration: BoxDecoration(
                    color: backgroundColor.withAlpha(150),
                    borderRadius: BorderRadius.circular(2),
                  ),
                    padding: const EdgeInsets.only(top: 2,bottom: 2,left: 5,right: 5),
                    child: Text('${diameter.toStringAsFixed(2)} mm',
                      textDirection: textDirection,
                      style: textStyle.copyWith(
                        fontSize: (diameter / 2.4)
                      ),
                    ),
                  ),

                  Flexible(child: Container(width: double.maxFinite,color: backgroundColor,height: 1)),
                  Icon(Icons.arrow_forward_rounded,size: 15,color: backgroundColor,),

                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
