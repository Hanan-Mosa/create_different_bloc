import 'package:create_different_bloc/bloc/counter/counter_bloc.dart';
import 'package:create_different_bloc/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// this for  requirement
// #3:Combine BlocListener and BlocBuilder in a single widget using BlocConsumer to display the counter and show a SnackBar for specific counter values.
class CountWidget extends StatelessWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        if(state.count >10){
          SnackBar snackBar = SnackBar(content: Text('Counter reaches 10'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Text(
            'Counter \n     ${state.count}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
              ,)
        );
      },
    );
  }
}
