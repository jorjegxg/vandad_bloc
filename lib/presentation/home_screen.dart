import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vandad_bloc/bloc/events.dart';
import 'package:vandad_bloc/bloc/persons_bloc.dart';
import 'package:vandad_bloc/bloc/states.dart';
import 'package:vandad_bloc/enums.dart';
import 'package:vandad_bloc/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(const LoadPersonsAction(
                        url: PersonUrl.persons1,
                      ));
                },
                child: const Text('Load json #1'),
              ),
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(const LoadPersonsAction(
                        url: PersonUrl.persons2,
                      ));
                },
                child: const Text('Load json #2'),
              ),
            ],
          ),
          BlocBuilder<PersonsBloc, FetchResult?>(
            // buildWhen: (previous, current) {
            //   return previous?.persons != current?.persons;
            // },
            builder: ((context, fetchResult) {
              fetchResult?.log();
              final persons = fetchResult?.persons;

              if (persons == null) {
                return const SizedBox();
              }

              return Expanded(
                child: ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = persons[index];
                      return ListTile(
                        title: Text('${person?.name}'),
                      );
                    }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
