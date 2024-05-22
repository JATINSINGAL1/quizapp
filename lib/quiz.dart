import 'package:flutter/material.dart';
import 'package:quizapp/Model/model.dart';
import 'package:quizapp/result.dart';
import 'package:quizapp/sizes.dart';
import 'package:quizapp/skill.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.quizSet});
  final QuizSet quizSet;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizSet.questions.length, null);
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < widget.quizSet.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0)
      setState(() {
        currentQuestionIndex--;
      });
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quizSet.questions[currentQuestionIndex];

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
                    builder: (context) => SkillScreen(),
                  ));
            },
          ),
          title: const Text(
            'Quiz Set 1',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${currentQuestionIndex + 1}/${widget.quizSet.questions.length} ${currentQuestion.question}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    ListView.builder(
                      itemCount: currentQuestion.options.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAnswers[currentQuestionIndex] = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color:
                                        selectedAnswers[currentQuestionIndex] ==
                                                index
                                            ? Colors.blue
                                            : Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        currentQuestion.options[index],
                                        style: TextStyle(
                                            color: selectedAnswers[currentQuestionIndex] ==
                                                index
                                            ? Colors.white
                                            : Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    // SizedBox(height: ESizes.spaceBtwItems,)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: ESizes.spaceBtwItems,
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        goToPreviousQuestion();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        if(currentQuestionIndex< widget.quizSet.questions.length-1)
                        goToNextQuestion();
                        else {
                          int totalCorrect=0;
                          for(int i=0;i<widget.quizSet.questions.length;i++){
                            if(selectedAnswers[i]==widget.quizSet.questions[i].selectedIndex){
                              totalCorrect++;}
                          }
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(markObtained: totalCorrect*100~/(widget.quizSet.questions.length),),));
                        }

                      
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child:  Center(
                          child: Text(
                            currentQuestionIndex==widget.quizSet.questions.length-1?
                            "Submit"
                            : "Next",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
}
