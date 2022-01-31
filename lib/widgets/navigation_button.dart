//@dart=2.8
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zmusic/constants.dart';

class SymbolButton extends StatelessWidget {
  const SymbolButton({this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 25, 20, 20),
      height: 80.0,
      width: 80.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(button),
        ),
      ),
      child: SvgPicture.asset(symbol),
    );
  }
}
