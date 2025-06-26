import 'dart:math';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  // Create
  Future<void> create({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.set(data);
  }

  // Randomly generate restaurant for gobbler
  Future<Map<String, dynamic>?> getRandomRestaurant() async {
    final DatabaseReference ref = _firebaseDatabase.ref('Gobbled');
    final DataSnapshot snapshot = await ref.get();
    
    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      final keys = data.keys.toList();
      final randomKey = keys[Random().nextInt(keys.length)];
      final restaurantData = Map<String, dynamic>.from(data[randomKey]);
      return restaurantData;
    }
    return null;
  }

  // Obtain current restaurant data
  Future<Map<String, dynamic>?> getRestaurant({required String uid}) async {
    final DatabaseReference ref = _firebaseDatabase.ref('Gobbled/$uid');
    final DataSnapshot snapshot = await ref.get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      final restaurantData = Map<String, dynamic>.from(data);
      return restaurantData;
    }
    return null;
  }

  // Read
  Future<DataSnapshot?> read({required String path}) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    final DataSnapshot snapshot = await ref.get();
    return snapshot.exists ? snapshot : null;
  }

  // Update
  Future<void> update({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.update(data);
  }

  // Delete
  Future<void> delete({required String path}) async {
    final DatabaseReference ref = _firebaseDatabase.ref().child(path);
    await ref.remove();
  }
}