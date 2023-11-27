import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/kisiler.dart';
import 'package:todo_app/data/repo/kisiler_dao_repo.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>>{
  AnasayfaCubit():super(<Kisiler>[]);
  var krepo = KisilerDaoRepository();

  Future<void> kisileriYukle() async {
    var yuklenecekListe = await krepo.KisileriYukle();
    emit(yuklenecekListe);
  }

 Future<void> sil(int kisi_id) async {
    await krepo.Sil(kisi_id);
    kisileriYukle();
 }

 Future<void> ara(String arananKelime) async {
    var yuklenecekListe = await krepo.Ara(arananKelime);
    emit(yuklenecekListe);
 }
}