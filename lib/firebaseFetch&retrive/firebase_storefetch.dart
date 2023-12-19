import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../database/event.dart';
import '../database/tournament_event.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addEvent(Event event) async {
    await _firestore.collection('events').add({
      'imagePath': event.imagePath,
      'title': event.title,
      'time': event.time,
      'topRightText': event.topRightText,
      'topRightTextColor': event.topRightTextColor.value,
      'borderRadius': event.borderRadius,
    });
  }

  Future<List<Event>> getEvents() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('events').get();
    return querySnapshot.docs.map((doc) {
      return Event(
        doc['imagePath'],
        doc['title'],
        doc['time'],
        doc['topRightText'],
        Color(doc['topRightTextColor']),
        doc['borderRadius'],
      );
    }).toList();
  }

  // Similar methods for TournamentEvent
  // ...

  Future<void> addTournamentEvent(Tournamentsevent tournamentEvent) async {
    await _firestore.collection('tournamentEvents').add({
      'imagePath': tournamentEvent.imagePath,
      'title': tournamentEvent.title,
      'time': tournamentEvent.time,
      'catagory': tournamentEvent.catagory,
      'price': tournamentEvent.price,
    });
  }

  Future<List<Tournamentsevent>> getTournamentEvents() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('tournamentEvents').get();
    return querySnapshot.docs.map((doc) {
      return Tournamentsevent(
        doc['imagePath'],
        doc['title'],
        doc['time'],
        doc['catagory'],
        doc['price'],
      );
    }).toList();
  }
}
