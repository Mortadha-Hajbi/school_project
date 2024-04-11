import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:google_fonts/google_fonts.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late Future<List<Map<String, dynamic>>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = fetchEvents();
  }

  Future<List<Map<String, dynamic>>> fetchEvents() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('events').get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 41, 40, 40),
          title: Center(
              child: Text(
            'الفعاليات والنشاطات',
            style: GoogleFonts.poppins(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureEvents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<Map<String, dynamic>> events = snapshot.data!;
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> event = events[index];
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
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
                      title: Center(
                        child: Text(
                          event['eventName'],
                          style: GoogleFonts.lato(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (event['imageUrl'] != null)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60.0, vertical: 5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(35.0),
                                  bottomLeft: Radius.circular(35.0),
                                  bottomRight: Radius.circular(0.0),
                                ),
                                child: Image.network(
                                  event['imageUrl'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          'تاريخ البدء ',
                                          style: GoogleFonts.poppins(
                                            color: Color.fromARGB(255, 3, 3, 3),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      DateFormat('yyyy-MM-dd HH:mm')
                                          .format(event['startDate'].toDate()),
                                      style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          'تاريخ الانتهاء',
                                          style: GoogleFonts.poppins(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      DateFormat('yyyy-MM-dd HH:mm')
                                          .format(event['endDate'].toDate()),
                                      style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              'المكان: ${event['place']}',
                              style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Center(
                              child: Text(
                                'المشرف: ${event['supervisor']}',
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // You can add more details as needed
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
