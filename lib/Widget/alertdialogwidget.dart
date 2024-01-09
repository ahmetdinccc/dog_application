import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.breedName,
    required this.onTap,
  }) : super(key: key);

  final String breedName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context, breedName);
  }
}

showAlertDialog(BuildContext context, String breedName) {
  AlertDialog alert = AlertDialog(
    insetPadding: const EdgeInsets.only(left:20,right: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentPadding: const EdgeInsets.only(left: 0,top: 0,right: 0),
   
    content: SizedBox(
      
      width: double.infinity,
      height: 450,
      child: Column(
        children: [
        ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://images.dog.ceo/breeds/terrier-westhighland/n02098286_4445.jpg",
                fit: BoxFit.fill,
                height: 300,
                width: 500,
              ),
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
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
