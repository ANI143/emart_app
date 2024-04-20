import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountryListScreen(),
    );
  }
}

class Country {
  final String name;
  final String capital;
  final String region;

  Country({
    required this.name,
    required this.capital,
    required this.region,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      capital: json['capital'],
      region: json['region'],
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {

//      late Future<List<Country>> countries;

//   @override
//   void initState() {
//     super.initState();
//     countries = fetchCountries();
//   }

//    Future<List<Country>> fetchCountries() async {
//     final response =
//         await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Country.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load countries');
//     }
//   }
//     return const Placeholder();
//   }
// }

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  late Future<List<Country>> countries;
  List<Country> countryList = [];
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    countries = fetchCountries();
    print(countries);
    // getCountries();
  }

  Future<List<Map<String, dynamic>>> getCountries() async {
    // print('hello dio');

    try {
      print('hello dio');
      final response = await _dio.get(
        'https://apisandbox.clubclass.io/server/development/UATCC2MobileAppV3/listing/country',
        options: Options(headers: {
          "Authorization":
              "Basic Qy1TOExTOHU6N2QxYTQ0ZTBkNmI5OGZhNWQ3ZjRhNjUzYmFhMGJkYjAxYTE3MTdlNg=="
        }),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print("fjsdfja");
        print(data);
        // Convert the data to a list of Map<String, dynamic>
        List<Map<String, dynamic>> countries =
            List<Map<String, dynamic>>.from(data);

        return countries;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        print("bhai kuch paresani he");
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      // Handle Dio errors or exceptions
      print('Error fetching countries: $e');
      throw Exception('Failed to load countries');
    }
  }

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(
        Uri.parse(
            'https://apisandbox.clubclass.io/server/development/UATCC2MobileAppV3/listing/country'),
        headers: {
          "Authorization":
              "Basic Qy1TOExTOHU6N2QxYTQ0ZTBkNmI5OGZhNWQ3ZjRhNjUzYmFhMGJkYjAxYTE3MTdlNg=="
        });

    // if (response != null) {
    //   for (Map<String, dynamic> i in response['data']['values']
    //       ['top_country']) {
    //     countryList.add(Country.fromJson(i));
    //   }
    //   for (Map<String, dynamic> i in response['data']['values']
    //       ['other_country']) {
    //     countryList.add(Country.fromJson(i));
    //   }

    // }
    // return countryList;
    // print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // print("entries ${response.body}");
      // print("entries yaha bhi he${data['data']['values']['top_country']}");

      // data.map((json) => Country.fromJson(json)).toList();
      for (Map<String, dynamic> i in data['data']['values']['top_country']) {
        countryList.add(Country.fromJson(i));
        print("dada mere pass list he${countryList}");
      }
      for (Map<String, dynamic> i in data['data']['values']['other_country']) {
        countryList.add(Country.fromJson(i));
        print("dada mere pass list he${countryList}");
      }
      print("dada mere pass list he${countryList}");

      return countryList;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: FutureBuilder<List<Country>>(
        future: countries,
        builder: (context, snapshot) {
          print(snapshot.data);
          print("name he ${countryList}");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final countryList = snapshot.data!;

            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                final country = countryList[index];

                return ListTile(
                  title: Text(country.name),
                  subtitle: Text(
                      'Capital: ${country.capital}, Region: ${country.region}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CountryApi {
  Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getCountries() async {
    try {
      final response = await _dio.get('https://restcountries.com/v2/all');

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        // Convert the data to a list of Map<String, dynamic>
        List<Map<String, dynamic>> countries =
            List<Map<String, dynamic>>.from(data);

        return countries;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      // Handle Dio errors or exceptions
      print('Error fetching countries: $e');
      throw Exception('Failed to load countries');
    }
  }
}

void main() async {
  CountryApi countryApi = CountryApi();

  try {
    List<Map<String, dynamic>> countries = await countryApi.getCountries();

    // Display the list of countries
    for (var country in countries) {
      print('${country['name']} - ${country['alpha2Code']}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
