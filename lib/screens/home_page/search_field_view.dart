import 'package:flutter/material.dart';

import '../../constant/dimen_constant.dart';

class SearchFieldView extends StatelessWidget {
  const SearchFieldView({
    super.key, required this.onSearchSubmitted,
  });

  final Function onSearchSubmitted;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value){
        onSearchSubmitted(value);
      },
      style:const TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: marginXLarge,
        ),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.4),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(marginDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(marginDefault),
        ),
      ),
    );
  }
}
