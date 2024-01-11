import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dog_application/Bloc/dog_cubit.dart';
import 'package:dog_application/Bloc/dog_state.dart';
import 'package:dog_application/Models/dog.dart';
import 'package:dog_application/Repository/dog_repository.dart';
import 'package:dog_application/Widget/alert_dialog_widget.dart';
import 'package:dog_application/Widget/dogwidget.dart';
import 'package:dog_application/Widget/search_bar.dart';

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
              return completed(state.response, context);
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

  Widget completed(List<Dog> dogList, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Searchbar(
              searchController: _searchController,
              onTap: (value) {
                context.read<DogCubit>().searchDog(value);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
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
