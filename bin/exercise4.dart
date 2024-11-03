
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var url = 'https://random-data-api.com/api/v2/users?size=7';

  try {
    // Gets data from the website and waits for the response
    final res = await http.get(Uri.parse(url));

    // Checks if the status code is successful then prints out the users, else prints out the error
    if (res.statusCode == 200) {
      // Decode the JSON response into a list of users
      List<dynamic> users = jsonDecode(res.body);

      // goes through each user and prints their results
      for (var user in users) {
        print('---------------------------------------------------');
        print('ID: ${user['id']}  |  First Name: ${user['first_name']}  |  Last Name: ${user['last_name']}');
        print('---------------------------------------------------');

      }
    } else {
      print('User data load failed. Status: ${res.statusCode}');

    }
  } catch (error) {
    print('An error occurred while fetching data: $error');
  }
}
