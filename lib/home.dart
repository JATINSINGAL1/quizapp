import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/curved_edges.dart';
import 'package:quizapp/sizes.dart';
import 'package:quizapp/skill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ECustomCurvedEdges(),
              child: Container(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.indigo, Colors.purple])),
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: const Center(
                    child: Image(
                  image: AssetImage('assets/books.png'),
                )),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: ESizes.defautSpace),
              child: Column(
                children: [
                  const Text("Learning is Everything!", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22),),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Learning with pleasure with noob programmer, Wherever you are!',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient:const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.purple, Colors.indigo])),
                    height: 40,
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:const MaterialStatePropertyAll(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SkillScreen(),));
                      },
                      child: const Text(
                        'Get Start',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
