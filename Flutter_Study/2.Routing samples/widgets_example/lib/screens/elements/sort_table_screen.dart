import 'dart:math';

import 'package:flutter/material.dart';

class SortTablePage extends StatefulWidget {
static String routeName = '/_elementsDemos/04_sortTable';

  @override
  _SortTablePageState createState() => _SortTablePageState();
}

class _SortTablePageState extends State<SortTablePage> {
  // Generate a list of fiction prodcts
  final List<Map> _products = List.generate(30, (i) {
    return {"id": i, "name": "Product $i", "price": Random().nextInt(200) + 1};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( 
          centerTitle: true,
          title: Text('SortTable'),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: DataTable(
              sortColumnIndex: _currentSortColumn,
              sortAscending: _isAscending,
              headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
              columns: [
                DataColumn(label: Text('Id')),
                DataColumn(label: Text('Name')),
                DataColumn(
                    label: Text(
                      'Price',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onSort: (columnIndex, _) {
                      setState(() {
                       _currentSortColumn = columnIndex;
                        if (_isAscending == true) {
                          _isAscending = false;
                          // sort the product list in Ascending, order by Price
                          _products.sort((productA, productB) =>
                              productB['price'].compareTo(productA['price']));
                        } else {
                          _isAscending = true;
                          // sort the product list in Descending, order by Price
                          _products.sort((productA, productB) =>
                              productA['price'].compareTo(productB['price']));
                        }
                      });
                    }),
              ],
              rows: _products.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['id'].toString())),
                  DataCell(Text(item['name'])),
                  DataCell(Text(item['price'].toString()))
                ]);
              }).toList(), 
            ),
          ),
        ));
  }
}