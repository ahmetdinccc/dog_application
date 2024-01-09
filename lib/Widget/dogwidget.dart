import 'package:flutter/material.dart';

class Dogwidget extends StatelessWidget {
  const Dogwidget({
    Key? key,
    required this.breedName,
    required this.onTap,
  }) : super(key: key);

  final String breedName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                "https://images.dog.ceo/breeds/terrier-westhighland/n02098286_4445.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              breedName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
