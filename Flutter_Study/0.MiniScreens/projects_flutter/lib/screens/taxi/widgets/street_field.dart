import 'package:flutter/material.dart';
import 'package:untitled1/screens/taxi/widgets/widgets.dart';

class StreetField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 94),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: Offset(0, 8),
                    blurRadius: 14)
              ]),
          child: Row(
            children: [
              SizedBox(width: 21),
              GoingLine(),
              SizedBox(width: 19),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, //! всегда задавать так как имеет максимальный сразу размер
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                        decoration: InputDecoration(border: InputBorder.none)),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "I'm going to..."))
                  ],
                ),
              ),
            ],
          )

          // ListView.builder(
          //   padding: const EdgeInsets.all(42),
          //   itemCount: 2,
          //   itemBuilder: (context, index) {
          //     if (index == 1) {
          //       return TextField(
          //         decoration: InputDecoration(
          //             border: InputBorder.none, prefixText: "I'm going to..."),
          //       );
          //     }
          //     return TextField();
          //   },

          //   //     decoration: BoxDecoration(
          //   //   borderRadius: BorderRadius.circular(16),
          //   //   //color: Colors.blue,
          //   // )
          // ),
          ),
    );
  }
}
