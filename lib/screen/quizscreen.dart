
import 'package:flutter/material.dart';
import 'package:quiz_app/model/model.dart';

class Quizscreen extends StatefulWidget {
  final QuizSet quizSet;

  const Quizscreen({super.key, required this.quizSet});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  int currentQuiestionIndex = 0;
  List<int?> selectedAnswers= [];

  @override 
   void initState(){
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizSet.questions.length,null);
   }

   void goToNextQuestion(){
    if(currentQuiestionIndex < widget.quizSet.questions.length-1)
    {
      setState(() {
        currentQuiestionIndex++;
      });
    }
   }

    void goToPreviousQuestion(){
    if(currentQuiestionIndex > 0)
    {
      setState(() {
        currentQuiestionIndex--;
      });
    }
   }


  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = widget.quizSet.questions[currentQuiestionIndex];
    return Scaffold(
       body: Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            const Color.fromARGB(255, 66, 7, 3),
            const Color.fromARGB(255, 5, 66, 8),
          ])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,),
                ),
                Text(
                  widget.quizSet.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentQuestion.question,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 20,

                ),
                currentQuestion.options.asMap().entries.map((entry){
                  final index = entry.key;
                  final option = entry.value;
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedAnswers[currentQuiestionIndex] = index;
                      });
                    },child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedAnswers[currentQuiestionIndex] == 
                        index ? Colors.indigo : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: selectedAnswers[currentQuiestionIndex] == index
                          ? Colors.indigo:
                          Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(25),

                      ),
                      child: Center(
                        child: Text(
                          option,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedAnswers[currentQuiestionIndex] == index ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,

                          ),
                        ),
                      ),
                    ),
                  )
                })
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentQuiestionIndex > 0 ? 
              ElevatedButton(onPressed: goToPreviousQuestion,
               child: Text("Back",style: TextStyle(
                fontSize: 16,
                color: Colors.black,
               ),)) : SizedBox(),

               ElevatedButton(
                onPressed: () {
                  if(currentQuiestionIndex < widget.quizSet.questions.length -1){
                    goToNextQuestion();

                  }else{
                    int totalCorrect = 0;
                    for(int i = 0;
                    i < widget.quizSet.questions.length;
                    i++){
                      if (selectedAnswers[i] == 
                      widget.quizSet.questions[i].selectedIndex){
                        totalCorrect++;
                      }
                    }
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(),));
                    
                  }
                },
               child: Text("Back",style: TextStyle(
                fontSize: 16,
                color: Colors.black,
               ),))
            ],
          ),)

          ],
        ),
      ),
    )
    );
  }
}