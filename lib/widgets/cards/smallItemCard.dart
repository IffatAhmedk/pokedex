import 'package:flutter/material.dart';

class SmallItemCard extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final VoidCallback onPressed;

  const SmallItemCard(
      {Key? key,
      required this.backgroundColor,
      required this.label,
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
                Container(
                  child: Image.asset(
                    'assets/pokeball.png',
                    color: Color(0x55FFFFFF),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
