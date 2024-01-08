import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_application/Bloc/dog_cubit.dart';
import 'package:dog_application/Bloc/dog_state.dart';
import 'package:dog_application/Models/dog.dart';
import 'package:dog_application/Repository/dog_repository.dart';
import 'package:dog_application/Widget/Dog_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              if (state.response != null) {
                return completed(state.response!);
              } else {
                return const Text("Gelen veri null");
              }
            } else if (state is DogLoading) {
              return const CircularProgressIndicator();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget buildError(DogError? state) {
    return Text(state?.message ?? "Bir hata oluştu");
  }

  Padding completed(List<Dog> dogList) {
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 150,
                    child: Dogwidget(
                      breedName: dogList[index].breedName ?? '',
                      onTap: () {},
                    ),
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
