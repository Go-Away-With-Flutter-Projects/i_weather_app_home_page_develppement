import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WeatherProjectDeveloping());
  }
}

/// * When the size of the widgets inside the row override the maximum width,
/// the system will throw an error, so we can solve this problem by the wrap
/// widget that has the ability to contain an extra surface,
/// * But one of the disadvantages of the wrap that it hides (without throwing
/// an error) the widgets when they override the maximum size.
/// To solve this problem we use the SingleChildScrollView widget to scroll
/// vertically to the hidden part, but if we want to scroll horizontally we
/// do this change:
/// scrollDirection: Axis.horizontal
/// But one of the disadvantages of SingleChildScrollView is: it contains
/// child not children
/// because of that we use ListView in instead
/// * Note: when you enable the scrollDirection: Axis.horizontal
///   you should give the containers widths to appear.
/// features:
/// * ListView.builder()
/// you can use it to create multiple widgets (like the containers using
/// an internal loop)
/// to stop the scrolling of the list view we use
/// physics:const NeverScrollableScrollPhysics(),
/// * ListView.separator()
/// you can use it to create separators widgets between the other widgets

/// *

class WeatherProjectDeveloping extends StatelessWidget {
  const WeatherProjectDeveloping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(),
        body: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/weather.jpg',
                  height: 725.09,
                  // width: double.maxFinite,
                  fit: BoxFit.fill,
                  //color:Color.fromARGB(62, 66, 93, 106),
                  //colorBlendMode: BlendMode.multiply,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 300,
                    margin: const EdgeInsets.only(top: 55),
                    decoration: BoxDecoration(
                      //backgroundBlendMode: BlendMode.modulate,
                      color: const Color.fromARGB(215, 94, 123, 136),
                      border: Border.all(
                        color: const Color.fromARGB(255, 190, 165, 165),
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(200),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(190, 165, 165, 1),
                          blurRadius: 5,
                          spreadRadius: 0.5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Text(
                      'Weather',
                      style: GoogleFonts.badScript(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 18, 23, 84),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        height: 80,
                        width: 350,
                        margin: const EdgeInsets.only(top: 500),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(182, 115, 164, 224),
                          border: Border.all(
                            color: const Color.fromARGB(182, 81, 144, 221),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 139, 240, 67),
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: ListView.separated(
                          //physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Container(color: Colors.black, width: 2);
                          },
                          scrollDirection: Axis.horizontal,
                          // shrinkWrap: false,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 25, 51, 73),
                                    shape: BoxShape.circle,
                                    // borderRadius:
                                    //     BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 0.5,
                                        blurStyle: BlurStyle.outer,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
