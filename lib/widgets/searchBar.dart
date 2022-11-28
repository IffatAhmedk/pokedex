import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final Icon icon;
  const SearchBar({Key? key, required this.placeholder, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            decoration: new InputDecoration(
              prefixIcon: this.icon,
              hintText: placeholder,
              filled: true,
              fillColor: Theme.of(context).focusColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Theme.of(context).focusColor,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Theme.of(context).focusColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
