

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_application/Bloc/dog_cubit.dart';
import 'package:dog_application/Bloc/dog_state.dart';
import 'package:dog_application/Models/dog.dart';
import 'package:dog_application/Repository/dog_repository.dart';
import 'package:dog_application/Widget/alertdialogwidget.dart';
import 'package:dog_application/Widget/dogwidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog App"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => DogCubit(SampleDogRepository()),
        child: BlocBuilder<DogCubit, DogState>(
          builder: (context, state) {
          
            if (state is DogInitial) {
              context.read<DogCubit>().getDog();
              return const SizedBox();
            } else if (state is DogCompleted) {
              return completed(state.response,context);
            } else if (state is DogLoading) {
              return const CircularProgressIndicator();
            } else if (state is DogError) {
              return buildError(state);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget buildError(DogError? state) {
    return Text(state?.message ?? "Error");
  }

  Widget completed(List<Dog> dogList,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Center(
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (value) {
                      context.read<DogCubit>().searchDog(value);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  child: Dogwidget(
                    breedName: dogList[index].breedName,
                    onTap: () {
                      showAlertDialog(context, dogList[index].breedName);
                    },
                  ),
                );
              },
              itemCount: dogList.length,
            ),
          ),
        ],
      ),
    );
  }
}
