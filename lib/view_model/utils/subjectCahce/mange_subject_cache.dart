import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/subjects_repository_service.dart';
import 'package:quizzy_app/Service/local/cache_subject_service.dart';
import 'package:quizzy_app/Service/local/cache_user_service.dart';

import 'package:quizzy_app/model/subjects_model.dart';
import 'package:quizzy_app/utils/check_connection_helper.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

class ManageSubjectCacheViewModel extends GetxController {
  bool _isLoadSubjectFromServer = false;
  @override
  void onInit() {
    // TODO: implement onInit
    _getSubjects();
    super.onInit();
  }

  Future<bool> isLoadSubjectFromServer() async {
    while (!_isLoadSubjectFromServer) {
      // run Unitl the Data loaded from Internet
    }
    return await Future.value(true);
  }

  Future<void> _getSubjects({int? limit, int? skip}) async {
    bool isConnectionExist = await CheckConnectionHelper.checkConnection();
    if (isConnectionExist) {
      _isLoadSubjectFromServer = false;

      SubjectsRepositoryService()
          .getSubjects(
              academicYearId:
                  CacheUserService.instance.getUser()!.academicYearId)
          .then((value) async {
        await CacheSubjectService.instance.updateSubjects(subjectsModel: value);
        debugPrint("*" * 50);
        debugPrint("Load Value From Internt");
        debugPrint("*" * 50);
        _isLoadSubjectFromServer = true;
      }).catchError((e, s) {
        debugPrint(s.toString());
        SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
      }).whenComplete(() => _isLoadSubjectFromServer = true);
    } else {
      // if no Internet
      if (!CacheSubjectService.instance.isExist()) {
        await CacheSubjectService.instance.updateSubjects(
            subjectsModel: SubjectsModel(
                data: [],
                success: true,
                message:
                    "No Internet")); // if not Exist maje the Empty of the Subjet
      }
      _isLoadSubjectFromServer = true;
    }
  }
}
