import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';
import 'package:quizapp/sizes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.markObtained});
 
 final int markObtained;

  @override
  Widget build(BuildContext context) {
    String feedback=markObtained<30?"You Failed!":markObtained<60? "Good!":markObtained<80? "Great":"Awesome!";
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo, Colors.purple])),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
          ),
          title: Text(
            'Quiz Result',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment(0.0, -0.6),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text(
                  feedback,
                  style:const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                const Text("You Have Scored",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                const SizedBox(
                  height: ESizes.spaceBtwItems,
                ),
                 Text(" $markObtained / 100",
                    style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: ESizes.spaceBtwSections,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('Repeat')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        },
                        child: Text('Home')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
