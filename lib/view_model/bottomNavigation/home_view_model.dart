import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/ads_repository_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/exam_repository_service.dart';
import 'package:quizzy_app/model/ads_model.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/model/exam_attempts_model.dart';
import 'package:quizzy_app/model/top_student_dataModel.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

class HomeViewModel extends GetxController {
  bool _isLoadHomeViewPage = false;
  late AdsModel _adsModel;

  final List<ExamAttemptsDataModel> _listExamAttempts = [];
  final List<ExamAttemptsDataModel> _searchExamAttemptsList = [];
  final List<TopStudentDataModel> _listTopStudent = [];

  final ScrollController _examAttemptScrollController = ScrollController();
  final ScrollController _topStudentScrollController = ScrollController();
  late List<AdsData> _adsList;

  bool get isLoadHomeViewPage => _isLoadHomeViewPage;
  bool get hasMoreDataExam => _hasMoreDataExam;
  bool get hasNextPageExam => _hasNextPageExam;
  bool get hasMoreDataTopStudent => _hasMoreDataTopStudent;
  bool get hasNextPageTopStudent => _hasNextPageTopStudent;
  List<AdsData> get adsList => _adsList;
  List<String> get subjectListDropDownValues => _subjectListDropDownValues;

  List<ExamAttemptsDataModel> get listExamAttempts => _listExamAttempts;
  List<ExamAttemptsDataModel> get searchExamAttemptsList =>
      _searchExamAttemptsList;
  List<TopStudentDataModel> get listTopStudent => _listTopStudent;
  ScrollController get examAttemptScrollController =>
      _examAttemptScrollController;
  ScrollController get topStudentScrollController =>
      _topStudentScrollController;

  String? _subjectValue; // the Value of the Subject in DropDown
  late List<DataSubjectModel> subjectListData;
  List<String> _subjectListDropDownValues =
      []; //  Data of SubjectName to the DropDownValue

  String? get subjectValue => _subjectValue;
  String? text;

  int _examPage = 1;
  final int _examLimit = 1;
  bool _hasMoreDataExam = false;
  bool _hasNextPageExam = true;

  int _topStudentPage = 1;
  final int _topStudentLimit = 5;
  bool _hasMoreDataTopStudent = false;
  bool _hasNextPageTopStudent = true;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    handelTheLogic();
    examAttemptScrollController.addListener(() => examAttemptsPagination());
    _topStudentScrollController.addListener(() => topStudentPagination());
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

///////////////////////////////////////////////////////Helper///////////////////////////////////////////////////////////////////
  int? get getSubjectId => subjectListData
      .firstWhere((element) => (element.name == subjectValue),
          orElse: () => DataSubjectModel())
      .id;

  void searchExamAttempts({required String value}) {
    if (value.isEmpty) {
      // if clear All and The Search become Empty
      _searchExamAttemptsList.clear();
      _searchExamAttemptsList.addAll(_listExamAttempts);
    } else {
      _searchExamAttemptsList.clear();
      _searchExamAttemptsList.addAll(_listExamAttempts
          .where((element) => element.subject!.name!.contains(value))
          .toList());
    }

    update(['updateExamAttempts']);
  }
///////////////////////////////////////////////////////Actions///////////////////////////////////////////////////////////////////

  void updateSubject(String value) async {
    if (value == _subjectValue) {
      return; // if Selected Value Equal the Value  before   return from Method
    }
    _subjectValue = value;

    update(['updateSubject']);

    DialogHelper.showLoading();
    int? subjectId =
        getSubjectId; // subject Can Be Null this mean it must Select "All"
    print("*" * 50);
    print(subjectId);
    print("*" * 50);
    // reset the Data of the End Point Top Student
    _hasMoreDataTopStudent = false;
    _hasNextPageTopStudent = true;
    _topStudentPage = 1;
    _listTopStudent.clear(); // to Clear All the List Data
    getTopStudentService(
        page: _topStudentPage,
        limit: _topStudentLimit,
        selectedSubjectId: subjectId); // call the Api Again
  }

  void onTapExamAttempt({int? index}) {
    if (_listExamAttempts.isEmpty) {
      print("Load the Default Page");
      // if no Element Suggest you to create a new Exam
      // go to the Exam
    } else {
      int examId = _listExamAttempts[index!].id!;
      print(examId);
      // Call the Api and Load the Exam
    }
  }
///////////////////////////////////////////////////////Pagination/////////////////////////////////////////////////////////////////
  ///

  void topStudentPagination() {
    if (_topStudentScrollController.position.pixels ==
        _topStudentScrollController.position.maxScrollExtent) {
      print("Call TopStudent");
      if (!_hasMoreDataTopStudent && _hasNextPageTopStudent) {
        _topStudentPage++;
        _hasMoreDataTopStudent = true;
        update(['updateTopStudent']);
        int? subjectId =
            getSubjectId; // subject Can Be Null this mean it must Select "All"
        getTopStudentService(
            page: _topStudentPage,
            limit: _topStudentLimit,
            selectedSubjectId: subjectId);
      }
    }
  }

  void examAttemptsPagination() {
    if (_examAttemptScrollController.position.pixels ==
        _examAttemptScrollController.position.maxScrollExtent) {
      print("Call examAttemptsPagination");

      if (!_hasMoreDataExam && _hasNextPageExam) {
        _examPage++;
        _hasMoreDataExam = true;

        update(['updateExamAttempts']);
        getExamAttempts(page: _examPage, limit: _examLimit);
      }
    }
  }

////////////////////////////////////////////////////// Service ////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
  Future<List<DataSubjectModel>> getSubjectFromCahce() {
    List<DataSubjectModel> subjetct = [
      DataSubjectModel(id: 16, name: "عربي"),
      DataSubjectModel(id: 11, name: "اللغة الإنجليزية"),
      DataSubjectModel(id: 15, name: "كمبيوتر"),
      DataSubjectModel(id: 44444, name: "الكمياء"),
      // DataSubjectModel(id: 85, name: "الدرسات"),
      // DataSubjectModel(id: 14, name: "العلوم"),
    ];

    return Future.value(subjetct);
  }

  void handelTheLogic() {
    // get Subject From the Cache
    getSubjectFromCahce().then((value) {
      subjectListData = value; // to Save the Object of the Subject

      if (subjectListData.isNotEmpty) {
        _subjectValue = "الكل"; // to make the Deualt value
        subjectListDropDownValues.add("الكل"); // Add this in the First Subject
        subjectListDropDownValues.addAll(subjectListData
            .map((e) => e.name!)
            .toList()); // convert SubjectObject to String Values
      }

      // Load GetAds , TopStudent Service

      getAds();

      getExamAttempts(page: _examPage, limit: _examLimit);

      getTopStudentService(
          page: _topStudentPage,
          limit: _topStudentLimit,
          selectedSubjectId: getSubjectId);
    });
  }

  void getAds() {
    _isLoadHomeViewPage = false;

    AdsRepositoryService().getAds().then((value) {
      _adsModel = value;

      _adsList = _adsModel.data ?? [];
      _isLoadHomeViewPage = true;
      update(['updateAds']);

      // update();
    }).catchError((e) => SnackBarHelper.instance
        .showMessage(message: e.toString(), milliseconds: 2000, erro: true));
  }

  void getTopStudentService({int? page, int? limit, int? selectedSubjectId}) {
    // _isLoadHomeViewPage = false;

    ExamRepositoryService()
        .getTopStudentPoints(
            limit: limit, page: page, selectedSubjectId: selectedSubjectId)
        .then((value) {
      _hasMoreDataTopStudent = false;
      DialogHelper.hideLoading(); // to Close the Dailog when update the Subject
      List<TopStudentDataModel> result = value.data!.data ?? [];
      if (result.isEmpty) {
        _hasNextPageTopStudent = false;
      } else {
        _listTopStudent.addAll(result); // add The Item in the List
      }
      _isLoadHomeViewPage = true;
      debugPrint("/" * 50);

      debugPrint(_listTopStudent.length.toString());
      debugPrint(
          "Current Page: ${value.data!.meta!.currentPage} , LastPage:${value.data!.meta!.lastPage}");
      debugPrint("/" * 50);
      update(['updateTopStudent']);
      update();
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(), milliseconds: 2000, erro: true));
  }

  void getExamAttempts({int? page, int? limit}) {
    // _isLoadHomeViewPage = false;

    ExamRepositoryService().getExamAttempts(limit: limit, page: page).then(
        (value) {
      _hasMoreDataExam = false;

      List<ExamAttemptsDataModel> result = value.data!.data ?? [];
      if (result.isEmpty) {
        _hasNextPageExam = false;
      } else {
        _listExamAttempts.addAll(result); // add The Item in the List
        _searchExamAttemptsList.addAll(result);
      }

      _isLoadHomeViewPage = true;
      debugPrint("/" * 50);

      debugPrint(_listExamAttempts.length.toString());
      debugPrint(
          "Current Page: ${value.data!.meta!.currentPage} , LastPage:${value.data!.meta!.lastPage}");
      debugPrint("/" * 50);

      update(['updateExamAttempts']);
      update();
    }).catchError((e) => SnackBarHelper.instance
        .showMessage(message: e.toString(), milliseconds: 2000, erro: true));
  }

  /////////////////////////////////////////////
}
