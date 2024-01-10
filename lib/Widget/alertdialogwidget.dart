import 'package:dog_application/Repository/dog_repository.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.breedImageUrl,
    required this.onTap,
  }) : super(key: key);

  final String breedImageUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context, breedImageUrl);
  }
}

showAlertDialog(BuildContext context, String breedName) {
  AlertDialog alert = AlertDialog(
      insetPadding: const EdgeInsets.only(left: 20, right: 20,top:20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.only(left: 0, top: 0, right: 0),
      content: SizedBox(
        width: double.infinity,
        height: 450,
        child: FutureBuilder(
          future: SampleDogRepository().getBreedImage(breedName),
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.hasData == false) {
              return const SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 222, 221, 221),
                ),
              );
            } else {
              return Column(
                children: [
                  Image.network(
                    
                    snapshot.data!,
                    width:double.maxFinite,
                    height:300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Breed",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 140, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    width: 270,
                    color: const Color.fromARGB(255, 206, 206, 206),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    breedName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 310,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 140, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Generate",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ));
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
