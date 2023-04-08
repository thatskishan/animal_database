import 'package:animal_database/helper/db_helper.dart';
import 'package:animal_database/modals/globals.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimalHome extends StatefulWidget {
  const AnimalHome({Key? key}) : super(key: key);

  @override
  State<AnimalHome> createState() => _AnimalHomeState();
}

class _AnimalHomeState extends State<AnimalHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jungle Safari",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
          future: DBHelper.dbHelper.fetchRecordImage(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              var data = snapShot.data;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 300),
                            autoPlayCurve: Curves.easeIn,
                            enlargeCenterPage: true,
                          ),
                          items: Global.slider
                              .map((e) => Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        child: Image.asset(
                                          e['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['title'],
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 5,
                                                  bottom: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.pinkAccent,
                                                ),
                                                child: Text(
                                                  e['button'],
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Categories",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.navigate_next,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              conShort(
                                imagePath: "assets/images/amphibians.jpeg",
                                name: "Amphibians",
                              ),
                              conShort(
                                imagePath: "assets/images/fish.jpg",
                                name: "Fish",
                              ),
                              conShort(
                                imagePath: "assets/images/birds.jpg",
                                name: "Birds",
                              ),
                              conShort(
                                imagePath: "assets/images/inspects.jpg",
                                name: "Insects",
                              ),
                              conShort(
                                imagePath: "assets/images/mammals.jpg",
                                name: "Mammals",
                              ),
                              conShort(
                                imagePath: "assets/images/reptiles.jpg",
                                name: "Reptiles",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fun Facts",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        cardFact(
                          title:
                              "The smallest amphibian is a frog known as the Paedophryne amauensis measuring 7.7 mm",
                        ),
                        cardFact(
                          title:
                              "Fishes can also use their good memories to navigate complex mazes!",
                        ),
                        cardFact(
                          title:
                              "There are around 10,000 different species of bird.",
                        ),
                        cardFact(
                          title:
                              "Approximately 2,000 silkworm cocoons are needed to produce one pound of silk.",
                        ),
                        cardFact(
                          title:
                              "here are thousands of different species of mammals.",
                        ),
                        cardFact(
                          title:
                              "eptiles are among the longest-lived species on the planet.",
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }

  Widget conShort({
    required String imagePath,
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: 240,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardFact({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
