
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/Data/data.dart';
import 'package:quizapp/Model/model.dart';
import 'package:quizapp/quiz.dart';
import 'package:quizapp/sizes.dart';


class SkillScreen extends StatelessWidget {
  const SkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.indigo, Colors.purple])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                leading: SizedBox(),
                title: const Text(
                  'Test Your Skills',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prepare yourself for any test',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: Data.categories.length,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: MediaQuery.sizeOf(context).height*0.28,
                              mainAxisSpacing: ESizes.girdViewSpacing,
                              crossAxisSpacing: ESizes.girdViewSpacing,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        
                        final category = Data.categories[index];
                        Random random = Random();
                        int value=random.nextInt(category.quizSets.length);
                        print(value);
                        final quizset=category.quizSets[value];
                        return RoundCard(
                          title: category.name,
                          img: category.image,
                          quizSet: quizset,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundCard extends StatelessWidget {
  const RoundCard({super.key, required this.title, required this.img, required this.quizSet});

  final String title;
  final String img;
  final QuizSet  quizSet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(quizSet: quizSet,),));
      },
      child: Container(
        padding:const EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image(image: AssetImage(img),width: MediaQuery.sizeOf(context).width*0.28,height:MediaQuery.sizeOf(context).width*0.28 ,),
            const SizedBox(
              height: ESizes.sm,
            ),
            Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
