import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/kisiler_dao_repo.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit():super(0);

  var krepo = KisilerDaoRepository();

  Future<void> guncelle(int kisi_id,String kisi_name) async {
    await krepo.Guncelle(kisi_id, kisi_name);
  }
}