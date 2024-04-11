import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/school1.dart';

class schoolListPage extends StatefulWidget {
  @override
  _schoolListPageState createState() => _schoolListPageState();
}

class _schoolListPageState extends State<schoolListPage> {
  late Stream<QuerySnapshot> _schoolsStream;
  List<DocumentSnapshot> _schoolsList = [];

  @override
  void initState() {
    super.initState();
    _schoolsStream =
        FirebaseFirestore.instance.collection('schools').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 255, 254, 254), // set the background color here
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
        title: Center(
            child: Text(
          'قائمة المدارس',
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('schools')
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error retrieving schools');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final schools =
                _schoolsList.isNotEmpty ? _schoolsList : snapshot.data!.docs;
            return Column(
              children: [
                // Add another Container above the ListView.builder
                Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green, // Change the color as needed
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    ' بئر الحفي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Change the color as needed
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: schools.length,
                        itemBuilder: (BuildContext context, int index) {
                          final school = schools[index];

                          return GestureDetector(
                            onTap: () {
                              // Check if the school name is 'schoolcat1' before navigating
                              if (school['name'] ==
                                  ' 2 المدرسة الإبتدائية بئر الحفي') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => school1()),
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors
                                    .lightBlueAccent, // Change the color as needed
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey[300],
                                      backgroundImage:
                                          NetworkImage(school['imageUrl']),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  '${school['name']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
