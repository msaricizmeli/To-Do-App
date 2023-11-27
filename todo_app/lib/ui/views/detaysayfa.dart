import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/kisiler.dart';
import 'package:todo_app/ui/cubit/detaysayfacubit.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;

  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfKisiName = TextEditingController();
  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiName.text = kisi.name;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kişi Detay")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfKisiName,decoration: const InputDecoration(hintText: "Kişi Ad"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.kisi.id,tfKisiName.text);
                //print("güncellendi.");
              },
                  child: Text("Güncelle")),
            ],
          ),
        ),
      ),
    );
  }
}
