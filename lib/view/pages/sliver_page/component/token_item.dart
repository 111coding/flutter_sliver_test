import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliver_test/domain/model/token.dart';

class TokenItem extends StatelessWidget {
  const TokenItem({Key? key, required this.token}) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blueGrey[100]!;
              }
              return Colors.blueGrey[50]!;
            },
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(token.imgSrc),
            ),
            const SizedBox(width: 10),
            Text(
              "${token.amount} ${token.name}",
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "${NumberFormat("#,###.##").format(token.price)} ${token.unit}",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
