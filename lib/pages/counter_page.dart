import 'package:create_different_bloc/bloc/counter/counter_bloc.dart';
import 'package:create_different_bloc/bloc/counter/counter_event.dart';
import 'package:create_different_bloc/bloc/theme/theme-bloc.dart';
import 'package:create_different_bloc/bloc/theme/theme-event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
        ),
        centerTitle: true,
        actions: [
          Text('Light'),
          Switch(value: context
              .read<ThemeBloc>()
              .state == ThemeMode.dark, onChanged: (value) {
            context.read<ThemeBloc>().add(ThemeChanged(value));
          }),
          Text('Dark')
        ],
      ),
      // here we use bloc builder to rebuild UI and bloc listener to show snack-bar when count reach 10,

      body: Center(
        child:BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.count == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Counter reaches 10')));
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return Text(
                        'Counter \n     ${state.count}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                          ,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrement());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
