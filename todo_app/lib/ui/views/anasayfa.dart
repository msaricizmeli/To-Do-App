import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/kisiler.dart';
import 'package:todo_app/ui/cubit/anasayfacubit.dart';
import 'package:todo_app/ui/views/detaysayfa.dart';
import 'package:todo_app/ui/views/kayitsayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaVarMi = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaVarMi ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ):
            const Text("Kişiler"),
        actions: [
          aramaVarMi ?
              IconButton(onPressed: (){
                setState(() {
                  aramaVarMi = false;
                });
                context.read<AnasayfaCubit>().kisileriYukle();
              },icon:const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaVarMi = true;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          },icon:const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
          builder: (context, kisiListem) {
            if(kisiListem.isNotEmpty){
              return ListView.builder(
                itemCount: kisiListem.length,
                  itemBuilder: (context, index) {
                    var kisi = kisiListem[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi),),).then((value){
                          context.read<AnasayfaCubit>().kisileriYukle();
                        });
                      },
                      child: Card(
                        child: SizedBox(height: 100,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(kisi.name),
                                      ],
                                ),
                              ),Spacer(),
                              IconButton(onPressed: (){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${kisi.name} Silinsim Mi?"),
                                  action: SnackBarAction(label: "Evet",onPressed: (){
                                    context.read<AnasayfaCubit>().sil(kisi.id);
                                  },
                                  ),
                                  )
                                );
                              },
                                  icon: const Icon(Icons.clear))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
              );
            }
            else{
              return const Center();
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa(),),).then((value){
            context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
