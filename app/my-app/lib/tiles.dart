import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

const myRed = Color.fromARGB(255, 233, 27, 27);
const g1 = Color.fromARGB(255, 111, 57, 57);
const g2 = Color.fromARGB(255, 76, 11, 0);
const myLightGrey = Color.fromARGB(255, 133, 131, 139);
const myDarkGrey = Color.fromARGB(230, 29, 28, 28);
const my2Grey = Color.fromARGB(109, 59, 60, 62);

final formatter = intl.NumberFormat.decimalPattern();
final bord = BorderRadius.circular(4);

class ProductBar extends StatelessWidget {
  final int index;
  final List<dynamic> Ls;
  const ProductBar({super.key, required this.index, required this.Ls});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(alignment: Alignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.97 + 15,
          height: MediaQuery.of(context).size.height * 0.13 + 15,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/rocky-wall.png'),
              repeat: ImageRepeat.repeat,
            ),
            color: Color.fromARGB(255, 41, 41, 41),
            border: Border.all(width: 3, color: myLightGrey),
            boxShadow: const [
              BoxShadow(color: Color.fromARGB(255, 48, 45, 58), blurRadius: 4)
            ], /*
                      borderRadius: bord,*/
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.97 + 15,
          height: MediaQuery.of(context).size.height * 0.13 + 15,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/rocky-wall.png'),
              repeat: ImageRepeat.repeat,
            ),
            color: my2Grey, // overarching colour
            /*
                      border: Border.all(
                          width: 10, color: Color.fromARGB(255, 139, 136, 147)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(0, 35, 0, 141), blurRadius: 5)
                      ],
                      borderRadius: bord,*/
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.97,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/natural-paper.png'),
              repeat: ImageRepeat.repeat,
            ),
            /*
                      border: Border.all(
                          width: 10, color: Color.fromARGB(255, 139, 136, 147)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(0, 35, 0, 141), blurRadius: 5)
                      ],*/
            borderRadius: bord,
            color: my2Grey, // inner shading
          ),
          child: Material(
            borderRadius: bord,
            color: Color.fromARGB(0, 255, 0, 0),
            elevation: 7,
            child: InkWell(
              //InkWell allows cool tapping
              borderRadius: bord,
              splashColor: Color.fromARGB(255, 1, 75, 75),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyHomePage(inp: index)));
              }, //navigation template code. MyHomePage takes an index as input which affects its contents
              child: Row(children: [
                Container(
                  //just deciding how much space our container and hence img take up
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.height * 0.13,
                  //then inserting the image with rounded edges to look nice
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Ls[index]['image'],
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                    ),
                    borderRadius: bord,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.024),
                Container(
                  width: MediaQuery.of(context).size.width * 0.61,
                  height: MediaQuery.of(context).size.height * 0.11,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          Ls[index]['name'],
                          style: GoogleFonts.medievalSharp(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(children: [
                        Flexible(
                          child: Text(
                            "₹${formatter.format(Ls[index]['price'])}",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.medievalSharp(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        const Icon(Icons.star,
                            color: Color.fromARGB(203, 31, 27, 26), size: 14),
                        const SizedBox(width: 3),
                        Text(
                          Ls[index]['avg'].toString(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.notoSerifEthiopic(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ]),
      const SizedBox(height: 1),
    ]);
  }
}

class ProductTile extends StatelessWidget {
  final int index;
  final List<dynamic> Ls;
  const ProductTile({super.key, required this.index, required this.Ls});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.305,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(color: Colors.black),
        /*boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 3),
        ],*/
        image: DecorationImage(
          image: AssetImage('images/natural-paper.png'),
          repeat: ImageRepeat.repeat,
        ),
        color: Color.fromARGB(255, 98, 89, 86),
      ),
      child: Stack(children: [
        Material(
          color: Color.fromARGB(0, 168, 76, 0),
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyHomePage(inp: index)));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.4 - 10,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Ls[index]['image'],
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4), BlendMode.darken),
                        ),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TruncatedText(text: Ls[index]['name'], len: 50),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "₹${formatter.format(Ls[index]['price'])}",
                    style: GoogleFonts.medievalSharp(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      StarImg(rating: 4.4),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005),
                      Text(
                        formatter.format(Ls[index]['ratings']).toString(),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.notoSerifEthiopic(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.28),
          IconButton(
              icon: Icon(Icons.favorite_border_outlined), onPressed: () {})
        ])
      ]),
    );
  }
}

class StarImg extends StatelessWidget {
  final double rating;
  const StarImg({super.key, required this.rating});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(Icons.star_border, color: Colors.grey, size: 12);
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(Icons.star_half, color: myDarkGrey, size: 12);
    } else {
      icon = new Icon(Icons.star, color: myDarkGrey, size: 12);
    }
    return Tooltip(message: rating.toString(), child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children: new List.generate(5, (index) => buildStar(context, index)));
  }
}

class TruncatedText extends StatefulWidget {
  final String text;
  final int len;
  const TruncatedText({super.key, required this.text, required this.len});

  @override
  State<TruncatedText> createState() => _TruncatedTextState();
}

class _TruncatedTextState extends State<TruncatedText> {
  late String pT;
  @override
  void initState() {
    super.initState;
    if (widget.text.length > widget.len) {
      pT = widget.text.substring(0, widget.len);
    } else {
      pT = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        (widget.text.length > widget.len) ? "$pT..." : pT,
        style: GoogleFonts.medievalSharp(
            fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText(
      {super.key, required this.text}); //basic template, let it add text

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String preText;
  late String postText; //will initialize in initState method
  bool shrunk = true;

  @override
  void initState() {
    super.initState;
    if (widget.text.length > 135) {
      preText = widget.text.substring(0, 135);
      postText = widget.text.substring(135, widget.text.length);
    } else {
      preText = widget.text;
      postText = '';
    } //initialize your preText and postText variables
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: postText == ""
          ? Text(
              widget.text,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shrunk ? "$preText..." : "$preText$postText",
                  style: GoogleFonts.notoSerifEthiopic(),
                ),
                const SizedBox(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      shrunk = !shrunk;
                    });
                  },
                  splashColor: Colors.blueGrey,
                  child: Row(
                    children: [
                      Text(
                        shrunk ? "Show more" : "Show less",
                        style: GoogleFonts.notoSerifEthiopic(
                            color: Colors.red, fontSize: 13),
                      ),
                      Icon(
                        shrunk
                            ? Icons.keyboard_arrow_down_sharp
                            : Icons.keyboard_arrow_up_sharp,
                        color: Colors.red,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
