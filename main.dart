import 'package:wednesday_august_3/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: BlocProvider(
        create: (context) => CounterCubit(), child: const HomePage()),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CounterCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wednesday Practise'),
        centerTitle: true,
      ),
      body: BlocConsumer<CounterCubit, int>(
        bloc: cubit,
        listener: (context, state) {
          const snackBar = SnackBar(
            content: Text('State is reached'),
          );

          if (state == 10) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (BuildContext context, state) {
          return Container(
            alignment: Alignment.center,
            child: ListView(
                children: [
                  Text(
                    'Welcome to BeSquare 2022',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),



                  Text(
                    '$state',
                    style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            cubit.increment();
                          },
                          child: const Text('Increment')),

                      SizedBox(width: 50,),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            cubit.decrement();
                          },
                          child: const Text('Decrement')),

                      SizedBox(width: 50,),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            cubit.reset();
                          },
                          child: const Text('Reset'))
                    ],

                  ),
                  const Image(
                    image: NetworkImage('https://pbs.twimg.com/profile_images/1350740688728694785/fgL1qg2O_400x400.jpg'),
                  ),
                ],
              ),

          );
        },
      ),
    );
  }
}