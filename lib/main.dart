import 'package:country_list/countries.dart';
import 'package:flutter/material.dart';

void main() {
  //loadCountries();
  runApp(ChooseCountryApp());
}

class ChooseCountryApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Hide the debug banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a country'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseCountryPage()),
            ).then((country) {
              final snackBar = SnackBar(
                content: Text('Has elegido "$country"'),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          },
          child: const Text('Elige un país'),
        ),
      ),
    );
  }
}

class ChooseCountryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadCountries();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: countries.length,
          itemBuilder: (context, int index) {
            return InkWell(
              child: ListTile(
                title: Text(countries[index]),
              ),
              onTap: () {
                Navigator.pop(context, countries[index]);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[300],
            height: 1,
            thickness: 1,
          ),
        ),
      ),
    );
  }
}
