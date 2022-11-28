import 'package:flutter/material.dart';

class BigItemCard extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final String image;
  final VoidCallback onPressed;

  const BigItemCard(
      {Key? key,
      required this.backgroundColor,
      required this.label,
      required this.image,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: this.backgroundColor,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              color: this.backgroundColor, // Color(0xCC5da060),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        this.label,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                ),
                Stack(alignment: Alignment.bottomRight, children: [
                  Container(
                    child: Image.asset(
                      'assets/pokeball.png',
                      color: Color(0x55FFFFFF),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    child: Image.network(
                      this.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
