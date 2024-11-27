import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/model/model.dart';
import 'package:quiz_app/screen/categoryscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
          children: [
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Test Your Skills",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Prepare yourself  for any test",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white38),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Data.categories.length,
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final category = Data.categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    => Categoryscreen(category: category)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(category.image,
                          height: 100,
                          width: 100,),
                        ),
                        SizedBox(height: 10,),
                        Text(category.name,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
