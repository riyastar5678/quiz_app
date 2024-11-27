import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/model/model.dart';
import 'package:quiz_app/screen/quizscreen.dart';
// import 'package:quiz_app/model/model.dart';

class Categoryscreen extends StatelessWidget {
  final Category category;

  const Categoryscreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
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
                Text("Test Your Skills",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),),
              ],
            ),
          ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: category.quizSets.length,
              itemBuilder: (context, index) {
                final quizSet = category.quizSets[index];
                return Padding(padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context) => Quizscreen(quizSet: quizSet),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          category.image,
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(width: 20,),
                        Text(
                          quizSet.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                );

            },)
          ],
        ),
      ),
    ));
  }
}
