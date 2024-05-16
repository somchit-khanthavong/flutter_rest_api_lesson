import 'package:rest_api_project/model/user_dob.dart';
import 'package:rest_api_project/model/user_location.dart';
import 'package:rest_api_project/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
  });

  String get fullName {
    return '${name.title}. ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);

    final date = e['dob']['date'];
    final dob = UserDob(
      date: DateTime.parse(date),
      age: e['dob']['age'],
    );
    final street = LocationStreet(
      number: e['location']['street']['number'],
      name: e['location']['street']['name'],
    );
    final coordinates = LocationCoordinate(
      latitude: e['location']['coordinates']['latitude'],
      longitude: e['location']['coordinates']['longitude'],
    );
    final timezone = LocationTimezone(
      offset: e['location']['timezone']['offset'],
      description: e['location']['timezone']['description'],
    );
    final location = UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      country: e['location']['country'],
      postcode: e['location']['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );

    return User(
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      name: name,
      dob: dob,
      location: location,
    );
  }
}
