import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ring_size_view/list_rings_sizer_country.dart';
import 'package:ring_size_view/model_gold_size.dart';
import 'package:ring_size_view/ring_size_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RingSizeView',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PuzzleTak RingSizeView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   double ringSize = 6.5;
   double diameter = 0.0;
   double circumference = 0.0;
   ModelGoldSize modelGoldSize = ModelGoldSize();


   @override
  void initState() {
     init();
    super.initState();
  }


  init(){
     modelGoldSize = ListRingsSizerCountry.getListSings();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(

        children: [

          Container(
            padding: const EdgeInsets.only(left: 10,right: 10),
            width: double.maxFinite,height: 180,
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                RingSizeView(
                    ringSize: ringSize,
                    calculateDiameter: calculateDiameter,
                    calculateRadius: calculateRadius,
                    calculateCircumference: calculateCircumference,
                    height: 190, width: 190),
                Expanded(child: Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                  child: Column(
                    children: [
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          const Text(
                            'radius',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 3,),
                          Expanded(child: Container(height: 1,color: Colors.deepPurple.withAlpha(150),)),
                          const SizedBox(width: 3,),
                          Text(
                            '${ringSize.toStringAsFixed(2)} mm',
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          const Text(
                            'diameter',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 3,),
                          Expanded(child: Container(height: 1,color: Colors.deepPurple.withAlpha(150),)),
                          const SizedBox(width: 3,),
                          Text(
                            '${diameter.toStringAsFixed(2)} mm',
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          const Text(
                            'circumf..',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 3,),
                          Expanded(child: Container(height: 1,color: Colors.deepPurple.withAlpha(150),)),
                          const SizedBox(width: 3,),
                          Text(
                            '${circumference.toStringAsFixed(2)} mm',
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        width: double.maxFinite,
                        height: 35,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.deepPurple.withAlpha(40)
                            ),
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(text: ""
                                  " circumference : ${circumference.toStringAsFixed(2)} mm"
                                  "\n"
                                  " diameter : ${diameter.toStringAsFixed(2)} mm"
                                  "\n"
                                  " radius : ${ringSize.toStringAsFixed(2)} mm"
                                  ""));
                            }, child: Text("Copy",
                        textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12).copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold

                          ),
                        )),
                      ),

                    ],
                  ),
                ))
              ],
            ),
          ),
          Slider(
            value: ringSize,
            min: 3.5,
            max: 13.0,
            onChanged: (double value) {
              setState(() {
                ringSize = value;
              });
            },
          ),
          Container(width: double.maxFinite,
          height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(40)
            ),
            child: Row(
              children: [
                Flexible(flex: 1,child: Container(
                  alignment: Alignment.center,
                  child: const Text("diameter",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 12),
                  ),
                ),),
                Flexible(flex: 1,child: Container(
                  alignment: Alignment.center,
                  child: const Text("America",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 12),
                  ),
                ),),
                Flexible(flex: 1,child: Container(
                  alignment: Alignment.center,
                  child: const Text("Japan",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 12),
                  ),
                ),),
                Flexible(flex: 1,child: Container(
                  alignment: Alignment.center,
                  child: const Text("Europe",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 12),
                  ),
                ),),
              ],
            ),
          ),

          Expanded(child: ListView.builder(
            itemCount: modelGoldSize.data!.sizes!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 1,bottom: 1),
              child: Container(width: double.maxFinite,
                height: 40,

                decoration: BoxDecoration(
                    color: (ringSize == double.parse(modelGoldSize.data!.sizes![index].diameter!) / 2) ? Colors.deepPurple.withAlpha(40) : Colors.grey.withAlpha(20)
                ),
                child: TextButton(
                  onPressed: (){
                    setState(() {
                      ringSize = double.parse(modelGoldSize.data!.sizes![index].diameter!) / 2;
                    });
                  },
                  child: Row(
                    children: [
                      Flexible(flex: 1,child: Container(
                        alignment: Alignment.center,
                        child: Text(modelGoldSize.data!.sizes![index].diameter!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12).copyWith(

                          ),
                        ),
                      ),),
                      Flexible(flex: 1,child: Container(
                        alignment: Alignment.center,
                        child: Text(modelGoldSize.data!.sizes![index].usa!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12).copyWith(

                          ),
                        ),
                      ),),
                      Flexible(flex: 1,child: Container(
                        alignment: Alignment.center,
                        child: Text(modelGoldSize.data!.sizes![index].japan!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12).copyWith(

                          ),
                        ),
                      ),),
                      Flexible(flex: 1,child: Container(
                        alignment: Alignment.center,
                        child: Text(modelGoldSize.data!.sizes![index].europe!,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(fontSize: 12).copyWith(

                          ),
                        ),
                      ),),
                    ],
                  ),
                ),
              ),
            );
          },
          ))
        ],
      ),
    );
  }


  calculateCircumference(value){
    circumference = value;
    print("Info calculateCircumference : $value");
  }
  calculateRadius(value){
    // ignore: avoid_print
    print("Info calculateRadius : $value");
  }
  calculateDiameter(value){
    diameter = value;
    print("Info calculateDiameter : $value");
  }

}
