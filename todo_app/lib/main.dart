import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/cubit/anasayfacubit.dart';
import 'package:todo_app/ui/cubit/detaysayfacubit.dart';
import 'package:todo_app/ui/cubit/kayitsayfacubit.dart';
import 'package:todo_app/ui/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AnasayfaCubit(),),
            BlocProvider(create: (context) => DetaySayfaCubit(),),
            BlocProvider(create: (context) => KayitSayfaCubit(),),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Anasayfa(),
      ),
    );
  }
}
