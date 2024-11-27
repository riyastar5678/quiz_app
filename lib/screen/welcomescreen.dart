import 'package:flutter/material.dart';
import 'package:quiz_app/screen/homescreen.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 66, 7, 3),
                            const Color.fromARGB(255, 5, 66, 8),
                          ]),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                      ),
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/image/quiz1.png",
                      scale: 1.8,
                    )),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.666,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(255, 5, 66, 8),
                            const Color.fromARGB(255, 66, 7, 3),
                          ]),
                    )),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.666,
                    padding: EdgeInsets.only(top: 40, bottom: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        )),
                    child: Column(
                      children: [
                        Text(
                          "Enjoy Learning !!!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 3,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color.fromARGB(255, 66, 7, 3),
                                    const Color.fromARGB(255, 5, 66, 8),
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homescreen(),
                                  ));
                            },
                            child: Text(
                              "Start",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
