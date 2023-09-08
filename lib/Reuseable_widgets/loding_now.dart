import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



bool showspinner = false;
final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
        color: index.isEven ? Colors.blue : Colors.white,
      ),
    );
  },
);


Widget loading_Start() {
  return loading_mine(
    spinkit: spinkit,
  );
}


class loading_mine extends StatelessWidget {
  const loading_mine({
    super.key,
    required this.spinkit,
  });

  final SpinKitFadingCircle spinkit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 0, top: 0), child: spinkit),
            ],
          ),
        ],
      ),
    );
  }
}
