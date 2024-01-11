import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar(
      {super.key, required this.searchController, required this.onTap});
  final Function(String) onTap;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: TextFormField(
            controller: searchController,
            onChanged: (value) {
              onTap(value);
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
