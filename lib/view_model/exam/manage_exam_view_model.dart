import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/exam_repository_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/subjects_repository_service.dart';
import 'package:quizzy_app/model/answer_question_model.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/exam_model.dart';
import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/model/start_quiz_model.dart';
import 'package:quizzy_app/model/store_exam_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

import 'package:quizzy_app/view/screens/exam/choose_subject.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/compare_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/long_short_answer_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/multiple_choice_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/single_choice_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/true_false_exam.dart';
import 'package:quizzy_app/view/screens/exam/filter_questions_view.dart';
import 'package:quizzy_app/view/screens/exam/quiz_type_view.dart';
import 'package:quizzy_app/view_model/exam/exam_type/multiple_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/short_long_answer_choice_exam_provider_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/single_choice_exam_view_model.dart';
import 'package:quizzy_app/view_model/exam/exam_type/true_false_exam_view_model.dart';

import '../../utils/constant.dart';

class ManageExamViewModel extends GetxController {
  TextEditingController noteController = TextEditingController();
  bool _isClickSendNote = false;
  bool _isClickWrongAnswer = false;
  bool _isLoadChoicePage = false;
  int _currentManageExamsPagesIndex = 0;
  int _currentQuetionIndex = 0;
  int _currentExamTypeIndex = 0;

  DataSubjectModel? _subjectSelectedInformation;
  StartQuizModel? _startQuizModel;
  bool _isLoadExamViewPage = false;
  late List<DataSubjectModel> _subjectList;
  final List<Widget> _examTypeList = [
    const CompareExam(),
    const LongShortAnswerExam(),
    const MultipleChoiceExam(),
    const TrueFalseExam(),
    const SingleChoiceExam(),
  ];
  final List<Widget> _examViewList = const [
    ChooseSubject(),
    QuizTypeView(),
    FilterQuestionsView(),
    // ExamView(),
  ];

  ExamsModel? _examData;

  List<Widget> get examViewList => _examViewList;

  bool get isLoadChoicePage => _isLoadChoicePage;
  bool get isLoadExamViewPage => _isLoadExamViewPage;
  List<DataSubjectModel> get subjectList => _subjectList;

  DataSubjectModel get getSubjectSelectedInformation =>
      _subjectSelectedInformation!;

  StartQuizModel get startQuizModel => _startQuizModel!;
  ExamsModel get examData => _examData!;
  List<Widget> get examTypeList => _examTypeList;
  int get currentQuetionIndex => _currentQuetionIndex;
  int get currentManageExamsPagesIndex => _currentManageExamsPagesIndex;
  int get currentExamTypeIndex => _currentExamTypeIndex;
  QuestionsModel getCurrentQuestionModel({required int index}) {
    return _examData!.data!.questions![index];
  }

  bool isNoSourceInputForThisQuestion() {
    QuestionsModel questionsModel =
        _examData!.data!.questions![_currentQuetionIndex];
    return questionsModel.fileType == null && questionsModel.photo == null
        ? true
        : false;
  }

  void chooseSubject({required DataSubjectModel subjectSelectedInformation}) {
    _subjectSelectedInformation = subjectSelectedInformation;
    _currentManageExamsPagesIndex = 1;
    update();
  }

  void createYourExamByFilter() {
    _currentManageExamsPagesIndex = 2;
    update();
    // call api Repositry for filter Question
  }

  void confirmFilter(
      {int? leasonId,
      String? level,
      String? semesterId,
      int? time,
      String? typeAssessment,
      int? unitId}) {
    // _currentIndex = 3;
    // update();
    // call api to create Exam Based on Filter information

    _choiceExamService(
        leasonId: leasonId,
        level: level,
        semesterId: semesterId,
        time: time,
        typeAssessment: typeAssessment,
        unitId: unitId);
    Get.toNamed(Routes.examView);
  }

  void createOtherExam(QuizType quizType) {
    // _currentIndex = 3;
    // update();
    // call api Service to create Exam for other Quetion (Q)
    // ( quizType== QuizType.ai ) // call Api for Ai Reposirty

    if (QuizType.ai == quizType) {
      _aiExamService();
    } else if (QuizType.random == quizType) {
      _randomExamService();
    } else {
      _specialistExamService();
    }
    Get.toNamed(Routes.examView);
  }

  void resetController() {
    _currentManageExamsPagesIndex = 0;
    _currentExamTypeIndex = 0;
    _currentQuetionIndex = 0;

    _subjectSelectedInformation = null;
    _startQuizModel = null;
    noteController.clear(); // to clear the note Controller
    _isClickSendNote = false; // to Clear it
    _isClickWrongAnswer = false; // to Clear it
  }

///////////////////////// Helper Methods //////////////////////////////

  void updateTheCurrentExamType() {
    /*
 [
    const CompareExam(),
    const LongAnswerExam(),
    const MultipleChoiceExam(),
    const TrueFalseExam(),
    const SingleChoiceExam()
  ];
    */
    String typeOfQuestion =
        _examData!.data!.questions![_currentQuetionIndex].type!;
    print("-" * 50);
    print(typeOfQuestion);
    print("-" * 50);
    switch (typeOfQuestion) {
      case ExamConstatnt.compare:
        _currentExamTypeIndex = 0;
        break;
      case ExamConstatnt.longAnswer:
        _currentExamTypeIndex = 1;
        break;
      case ExamConstatnt.shortAnswer:
        _currentExamTypeIndex = 1;
        break;
      case ExamConstatnt.multipleChoice:
        _currentExamTypeIndex = 2;
        break;
      case ExamConstatnt.trueFalse:
        _currentExamTypeIndex = 3;
        break;
      case ExamConstatnt.singleChoice:
        _currentExamTypeIndex = 4;
        break;
    }
    update(['examType']);
  }

  Future<void> resetAllController() async {
    switch (_currentExamTypeIndex) {
      // case 0:
      //   await Get.delete<CompareChoiceExamViewModel>(force: true);

      //   break;
      case 1:
        Provider.of<ShortLongAnswerViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 2:
        Provider.of<MultipleChoiceExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 3:
        Provider.of<TrueFalseExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 4:
        Provider.of<SingleChoiceExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
    }
  }
/////////////////////////////////// Button Action///////////////////////

  void nextQuestion() async {
    print("-" * 50);
    print(_startQuizModel!.data!.id!);
    print("-" * 50);

    if (_isClickSendNote || _isClickWrongAnswer) {
      String noteText = noteController.text;
      // call Api SendNote and Answer
      _sendNoteAndWrongQuestion(noteText, _isClickWrongAnswer);
      print(_isClickWrongAnswer ? 1 : 0);
      print("Text is $noteText");
    }

    noteController.clear(); // to clear the note Controller
    _isClickSendNote = false; // to Clear it
    _isClickWrongAnswer = false; // to Clear it
    _currentQuetionIndex++; // increment the new Question

    if (_currentQuetionIndex < examData.data!.questions!.length) {
      resetAllController(); // to Reset All Provider Controler
      update([
        "updateAboveSection",
        "updateBlewSection"
      ]); // update the Above Section

      updateTheCurrentExamType(); // update  the Question Type
    } else {
      print("-" * 50);
      print("Exam Finished");
      print("-" * 50);
    }

    // if the Exam Entire
  }

  void sendNote() {
    // use currentIndex of Quetion
    print("-" * 50);
    print(noteController.text);
    _isClickSendNote = true; // hint to know it Click SendNote Button
    // Call Api
    print(
        "QutionId: ${getCurrentQuestionModel(index: _currentQuetionIndex).id} Send Note");
    print("-" * 50);
  }

  void wrongQuetion({required bool isWrongQuestion}) {
    _isClickWrongAnswer =
        isWrongQuestion; // hint to know it Click wrongQuetion Button
    // use currentIndex of Quetion
    if (isWrongQuestion) {
      print("-" * 50);
      print(
          "QutionId: ${getCurrentQuestionModel(index: _currentQuetionIndex).id} Wrong Answer");
      print("-" * 50);
    }
  }

  ///////////////////////////////Life cylce/////////////////////////////////////

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getSubjects();
    print("Load Page");
  }

  //////////////////////////////////// Service ///////////////////////////////////
  ///

  void _sendNoteAndWrongQuestion(String text, bool isWrong) {}

  void _getSubjects({int? limit, int? skip}) {
    _isLoadChoicePage = false;
    SubjectsRepositoryService().getSubjects(limit: limit, skip: skip).then(
        (value) {
      _subjectList = value.data!;
      _isLoadChoicePage = true;
      update(['loadingChoicePage']);
    }).catchError((e) =>
        SnackBarHelper.instance.showMessage(message: e.toString(), erro: true));
  }

  void _startQuizService({required int examId}) {
    ExamRepositoryService().startQuiz(examId: examId).then((value) {
      _startQuizModel = value;
      update(['LoadExamViewPage']); //update  the Question Type
    }).catchError((e) => SnackBarHelper.instance
        .showMessage(message: e.toString(), milliseconds: 2000, erro: true));
  }

  Future<AnswerQuestionModel?> answerQuestionService(
      {required int questionId, required var givenAnswer}) async {
    AnswerQuestionModel? answerQuestionModel;
    try {
      answerQuestionModel = await ExamRepositoryService().answerQuestion(
          questionId: questionId,
          examAttemptId: _startQuizModel!.data!.id!, // from Start Exam Service
          givenAnswer: givenAnswer);
    } catch (e) {
      rethrow;
    }
    return answerQuestionModel;
  }

  void _randomExamService() {
    _isLoadExamViewPage = false;

    // ExamRepositoryService()
    //     .storeExam(
    //         storeExamModel: StoreExamModel(
    //             type: ExamConstatnt.randomlyExam,
    //             typeAssessment: ExamConstatnt.typeAssessmentAfterFinish,
    //             subjectId: _subjectSelectedInformation!.id,
    //             semester: _subjectSelectedInformation!.semester))
    //     .then((value) {
    //   _examData = value;
    //   _isLoadExamViewPage = true;
    //   _startQuizService(examId: _examData!.data!.id!);
    //   updateTheCurrentExamType();
    // }).catchError((e) => SnackBarHelper.instance.showMessage(
    //         message: e.toString(), milliseconds: 2000, erro: true));

    _examData = ExamsModel(
        success: true,
        message: "Sucess",
        data: ExamModel(
            id: 18,
            name: "TEst",
            type: "choice",
            questionTypes: null,
            level: null,
            typeAssessment: "after_finish",
            description: null,
            photo: "https://quizzy.makank.online/images/exams/avatar.png",
            file: null,
            semester: "1",
            points: null,
            time: null,
            isActive: true,
            questions: <QuestionsModel>[
              QuestionsModel(
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "single_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo: null,
                  fileType: null,
                  file:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  // reference: "ثانوية عامة , دليل  التقويم",
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 1,
                        title: "القدس",
                        questionType: "single_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: 1,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: false,
                        createdAt: "2023-10-31T18:26:47.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 3,
                        title: "القاهرة",
                        questionType: "single_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text_image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: false,
                        createdAt: "2023-10-31T18:27:33.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 4,
                        title: "دبي",
                        questionType: "single_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: true,
                        createdAt: "2023-10-31T18:28:53.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                  ],
                  createdAt: "2023-10-31T18:23:49.000000Z",
                  updatedAt: "2023-10-31T18:23:49.000000Z"),
              QuestionsModel(
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "short_answer", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  lessonId: 1,
                  file: null,
                  fileType: null,
                  level: "متوسط",
                  points: "200.00",
                  time: "20",
                  isActive: true,
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 13,
                        title: "اكتب بما لايتجاوز السطرين",
                        questionType: "short_answer",
                        answerTwoGapMatch: "القدس",
                        answerViewFormat: "text",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: null,
                        createdAt: "2023-10-31T18:26:47.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                  ],
                  createdAt: "2023-10-31T18:23:49.000000Z",
                  updatedAt: "2023-10-31T18:23:49.000000Z"),
              QuestionsModel(
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "true_false", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  points: "25.00",
                  time: "60",
                  isActive: true,
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 3,
                        title: "صح",
                        questionType: "true_false",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: 1,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: true,
                        createdAt: "2023-10-31T18:26:47.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 6,
                        title: "خطأ",
                        questionType: "true_false",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text_image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: false,
                        createdAt: "2023-10-31T18:27:33.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                  ],
                  createdAt: "2023-10-31T18:23:49.000000Z",
                  updatedAt: "2023-10-31T18:23:49.000000Z"),
              QuestionsModel(
                  id: 5,
                  name: "معني كلمة سيارة",
                  type:
                      "multiple_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 6,
                        title: "Car",
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: 1,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: true,
                        createdAt: "2023-10-31T18:26:47.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 3,
                        title: "Bmw",
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text_image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: true,
                        createdAt: "2023-10-31T18:27:33.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 4,
                        title: "Marcidis",
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: true,
                        createdAt: "2023-10-31T18:28:53.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                    AnswersModel(
                        id: 9,
                        title: "عجلة",
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/avatar.png",
                        isCorrect: false,
                        createdAt: "2023-10-31T18:28:53.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                  ],
                  createdAt: "2023-10-31T18:23:49.000000Z",
                  updatedAt: "2023-10-31T18:23:49.000000Z"),
            ]));
    _isLoadExamViewPage = true;
    updateTheCurrentExamType();
    update(['LoadExamViewPage']);
  }

  void _aiExamService() {
    _isLoadExamViewPage = false;

    ExamRepositoryService()
        .storeExam(
            storeExamModel: StoreExamModel(
                type: ExamConstatnt.aiExam,
                typeAssessment: ExamConstatnt.typeAssessmentAfterFinish,
                subjectId: _subjectSelectedInformation!.id,
                semester: _subjectSelectedInformation!.semester))
        .then((value) {
      _examData = value;
      // SnackBarHelper.instance
      //     .showMessage(message: _examData!.message!.toString());
      _isLoadExamViewPage = true;
      updateTheCurrentExamType(); //update  the Question Type
      update(['LoadExamViewPage']);
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(), milliseconds: 2000, erro: true));
  }

  void _choiceExamService(
      {String? semesterId,
      int? unitId,
      int? leasonId,
      int? time,
      String? level,
      String? typeAssessment}) {
    _isLoadExamViewPage = false;
    ExamRepositoryService()
        .storeExam(
            storeExamModel: StoreExamModel(
                type: ExamConstatnt.randomlyExam,
                typeAssessment: typeAssessment,
                subjectId: _subjectSelectedInformation!.id,
                semester: semesterId,
                lessonId: leasonId,
                level: level,
                unitId: unitId,
                time: time.toString()))
        .then((value) {
      _examData = value;
      _isLoadExamViewPage = true;
      _startQuizService(examId: _examData!.data!.id!);
      updateTheCurrentExamType();
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(), milliseconds: 2000, erro: true));
  }

  void _specialistExamService() {
    _isLoadExamViewPage = false;
  }
}
