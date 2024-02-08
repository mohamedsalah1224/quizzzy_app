import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/ads_repository_service.dart';
import 'package:quizzy_app/model/ads_model.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

class HomeViewModel extends GetxController {
  bool _isLoadHomeViewPage = false;
  late AdsModel _adsModel;
  late List<AdsData> _adsList;
  bool get isLoadHomeViewPage => _isLoadHomeViewPage;
  List<AdsData> get adsList => _adsList;

  String? text;
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    getAds();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close Home Controller");
  }

  void updateData() {
    text = "Mohamed";
    update();
  }

////////////////////////////////////////////////////// Service ////////////////////////////////////////////////////////////////////
  void getAds() {
    _isLoadHomeViewPage = false;

    AdsRepositoryService().getAds().then((value) {
      _adsModel = value;
      _adsList = _adsModel.data ?? [];
      _isLoadHomeViewPage = true;
      update(['updateAds']);

      update();
    }).catchError((e) => SnackBarHelper.instance
        .showMessage(message: e.toString(), milliseconds: 2000, erro: true));
  }
}
