import 'package:flutter/material.dart';

class TripInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 36),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.1))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('11:24',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w300)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 4),
                      Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          )),
                      SizedBox(height: 4),
                      Expanded(
                        child: Container(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text('1, Thrale Street, London, SE19HW, UK',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      SizedBox(height: 48),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('11:38',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
              ),
              // Container(
              //   width: 10,
              //   height: 10,
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //     shape: BoxShape.circle,
              //   )
              // ),
              Expanded(
                child: Text('Ealing Broadway Shopping Centre, London, W55JY',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
