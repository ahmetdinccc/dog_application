import 'package:dog_application/Repository/dog_repository.dart';
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
      child: FutureBuilder(
        future: SampleDogRepository().getBreedImage(breedName),

        builder: (context,snapshot) {
          if(snapshot.data==null || snapshot.hasData==false){
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          }
          return Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(snapshot.data!), 
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
          );
        }
      ),
    );
  }
}
