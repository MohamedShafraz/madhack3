import 'package:flutter/material.dart';

class SearchPropertiesScreen extends StatelessWidget {
  const SearchPropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Properties'),
      ),
      body: Center(
        child: Text('Search Properties Screen'),
      ),
    );
  }
}
