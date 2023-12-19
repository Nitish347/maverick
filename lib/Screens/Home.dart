import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _testEnd = false;
  bool _loading = false;
  bool expand = false;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff176B87),
        toolbarHeight: height * 0.1,
        title: Text(
          "MAVERICK2.0",
          style: TextStyle(color: Colors.white, fontFamily: 'cursive', fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(height * 0.05),
          bottomRight: Radius.circular(height * 0.05),
        )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: CircleAvatar(
              radius: height * 0.03,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/694px-Unknown_person.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "The Taste of Herbs",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.028,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      """The taste of an herb actually tells us quite a bit about the medicinal properties of the plant. Taste is the sense that can bring us so much information about the medicines we work with. Plant have developed unique flavors by producing a diverse rangeof phytochemicals. The flavor signals the presence of aconstituent of a plant that initiates a change in our bodies.For example, bitter plants increase saliva, salty ones directenergy to our kidneys, and pungent spices move circulation. However, it’s important to identify any unknown plant and its potential toxicity before you taste it.
                      """,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(fontSize: height * 0.018),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "Properties based on taste",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.028,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleImageText(
                      height, width, context, "Sweet\n(Madhura)", "assets/images/sweet.png"),
                  CircleImageText(height, width, context, "Sour\n(Amla)", "assets/images/sour.png"),
                  CircleImageText(
                      height, width, context, "Pungent\n(Katu)", "assets/images/pungent.png"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleImageText(
                      height, width, context, "Bitter\n(Tikta)", "assets/images/butter.png"),
                  CircleImageText(height, width, context, "Astringent\n(Kashaya)",
                      "assets/images/astrigent.png"),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Sample Testing",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.028,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.15,
                decoration: BoxDecoration(
                    color: Color(0xff176B87), borderRadius: BorderRadius.circular(10)),
                child: _testEnd
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleColorText(height, "Sweet", "75", Colors.red),
                          CircleColorText(height, "Sour", "54", Colors.green),
                          CircleColorText(height, "Pungent", "54", Colors.purpleAccent),
                          CircleColorText(height, "Bitter", "54", Colors.blueGrey),
                          CircleColorText(height, "Astringent", "54", Colors.cyanAccent),
                        ],
                      )
                    : _loading
                        ? LoadingAnimationWidget.fourRotatingDots(
                            color: Colors.white, size: height * 0.05)
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              await Future.delayed(Duration(seconds: 2));
                              setState(() {
                                _loading = false;
                              });
                              setState(() {
                                _testEnd = true;
                              });
                            },
                            style: ButtonStyle(
                                // backgroundColor:  Color(0xffA5E6E2),
                                ),
                            child: Text(
                              "Begin Test",
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Center(
                child: Text(
                  "Results",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.028,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Choose the type of result you want to access",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: height * 0.022,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: AnimatedContainer(
                  height: expand ? height * 0.2 : height * 0.07,
                  width: width,
                  duration: Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                      color: !expand ? Color(0xffADE7E3) : Color(0xff8FD7D3),
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended Result",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.02,
                          ),
                        ),
                        Icon(expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: AnimatedContainer(
                  height: expand && !check
                      ? height * 0.2
                      : check
                          ? height * 0.45
                          : height * 0.075,
                  width: width,
                  duration: Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                      color: !expand ? Color(0xffADE7E3) : Color(0xff8FD7D3),
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Test for Adulteration",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.02,
                              ),
                            ),
                            Icon(expand
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down_rounded),
                          ],
                        ),
                        Visibility(
                          visible: expand,
                          child: Expanded(
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  // phoneNumber = val;
                                });
                                print(val.toString());
                              },
                              // obscureText: showPass,

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              maxLength: 10,
                              style: GoogleFonts.poppins(fontSize: height * 0.017),
                              decoration: InputDecoration(
                                counterText: "",
                                filled: true,
                                hintText: "Enter the product you are testing for ",
                                contentPadding: EdgeInsets.all(15),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(9.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: expand,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                check = !check;
                              });
                            },
                            style: ButtonStyle(
                                // backgroundColor:  Color(0xffA5E6E2),
                                ),
                            child: Text(
                              "Check",
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: check,
                          child: Container(
                            width: width,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.15,
                                  height: height * 0.04,
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Milk",
                                    style: GoogleFonts.poppins(fontSize: height * 0.018),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Text(
                                  "46% chance is that the product id adultereted.",
                                  style: GoogleFonts.poppins(
                                      fontSize: height * 0.018, color: Colors.white),
                                ),
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Range of Actual Composition",
                                      style: GoogleFonts.poppins(
                                          fontSize: height * 0.018, color: Colors.black),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Sweetness - 12 to 20%",
                                  style: GoogleFonts.poppins(
                                      fontSize: height * 0.018, color: Colors.black),
                                ),
                                Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Range of Actual Composition",
                                      style: GoogleFonts.poppins(
                                          fontSize: height * 0.018, color: Colors.black),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Sweetness - 12 to 20%",
                                  style: GoogleFonts.poppins(
                                      fontSize: height * 0.018, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                child: AnimatedContainer(
                  height: expand ? height * 0.2 : height * 0.07,
                  width: width,
                  duration: Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                      color: !expand ? Color(0xffADE7E3) : Color(0xff8FD7D3),
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Test for Adulteration",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.02,
                          ),
                        ),
                        Icon(expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CircleImageText(double height, double width, BuildContext context, String text, String img) {
  return InkWell(
    onTap: () {
      ShowSetPin(height, width, context);
    },
    child: CircleAvatar(
      radius: height * 0.055,
      backgroundImage: AssetImage(img),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.merienda(color: Colors.white, fontSize: height * 0.015),
      ),
    ),
  );
}

Widget CircleColorText(double height, String text1, String text2, Color color) {
  return CircleAvatar(
    radius: height * 0.035,
    backgroundColor: color,
    child: Padding(
      padding: EdgeInsets.all(height * 0.007),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: GoogleFonts.merienda(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: GoogleFonts.merienda(color: Colors.white, fontSize: height * 0.015),
          ),
        ],
      ),
    ),
  );
}

Future ShowSetPin(double height, double width, BuildContext context) {
  bool sent = false;
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
              backgroundColor: Color(0xff419197).withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              content: Container(
                alignment: Alignment.center,
                height: height * 0.4,
                // width: width * 0.6,
                child: Column(
                  children: [
                    Text(
                      "Pungent",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: height * 0.026,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Energetics: Warming, Drying, Moving",
                      style: GoogleFonts.poppins(
                          color: Color(0xff04364A),
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Divider(
                      height: 5,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Stimulating, spicy plants increase circulation and wake up our senses. They help increase digestive action. Aromatics like rosemary and thyme are warming and drying, reflecting the Mediterranean ecosystem they come from. The energy of fire and air from pungent medicines is also specific for lungs, as these elements disperse energy in an outward direction. These herbs can be quite stimulating, so usually they are used in low doses.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Divider(
                      height: 5,
                    )
                  ],
                ),
              ));
        });
      });
}
