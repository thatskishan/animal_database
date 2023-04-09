import 'package:animal_database/views/screens/details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/db_helper.dart';

class AnimalCategories extends StatefulWidget {
  const AnimalCategories({Key? key}) : super(key: key);

  @override
  State<AnimalCategories> createState() => _AnimalCategoriesState();
}

class _AnimalCategoriesState extends State<AnimalCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animal's World",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
          future: DBHelpers.dbHelpers.fetchRecord(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return Text(
                "${snapShot.hasError}",
              );
            } else if (snapShot.hasData) {
              var data = snapShot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: data[index]['image'],
                              name: data[index]['name'],
                              description: data[index]['des'],
                            ),
                          ),
                        );
                      },
                      child: conShort(
                          imagePath: data[index]['image'],
                          name: data[index]['name']),
                    );
                  });
            }
            return const CircularProgressIndicator();
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
}
