import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/subjects_repository_service.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/model/exam_model.dart';
import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';

import 'package:quizzy_app/view/screens/exam/choose_subject.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/compare_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/long_answer_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/multiple_choice_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/short_answer_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/single_choice_exam.dart';
import 'package:quizzy_app/view/screens/exam/exam_type/true_false_exam.dart';
import 'package:quizzy_app/view/screens/exam/filter_questions_view.dart';
import 'package:quizzy_app/view/screens/exam/quiz_type_view.dart';

import '../../utils/constant.dart';

class ManageExamViewModel extends GetxController {
  bool _isLoadChoicePage = false;
  int _currentManageExamsPagesIndex = 0;
  int _currentQuetionIndex = 0;
  int _currentExamTypeIndex = 0;
  int? _subjectSelectedId;
  late List<DataSubjectModel> _subjectList;
  final List<Widget> _examTypeList = [
    const CompareExam(),
    const LongAnswerExam(),
    const ShortAnswerExam(),
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
  List<DataSubjectModel> get subjectList => _subjectList;
  int? get subjectSelected => _subjectSelectedId;
  int get subjectSelectedId => _subjectSelectedId!;
  ExamsModel get examData => _examData!;
  List<Widget> get examTypeList => _examTypeList;
  int get currentQuetionIndex => _currentQuetionIndex;
  int get currentManageExamsPagesIndex => _currentManageExamsPagesIndex;
  int get currentExamTypeIndex => _currentExamTypeIndex;
  QuestionsModel getCurrentQuestionModel({required int index}) {
    return _examData!.data!.questions![index];
  }

  void chooseSubject({required int subjectSelectedId}) {
    _subjectSelectedId = subjectSelectedId;
    _currentManageExamsPagesIndex = 1;
    update();
  }

  void createYourExamByFilter() {
    _currentManageExamsPagesIndex = 2;
    update();
    // call api Repositry for filter Question
  }

  void confirmFilter() {
    // _currentIndex = 3;
    // update();
    // call api to create Exam Based on Filter information

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

    _subjectSelectedId = null;
  }

///////////////////////// Helper Methods //////////////////////////////

  void updateTheCurrentExamType() {
    /*
 [
    const CompareExam(),
    const LongAnswerExam(),
    const ShortAnswerExam(),
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
        _currentExamTypeIndex = 2;
        break;
      case ExamConstatnt.multipleChoice:
        _currentExamTypeIndex = 3;
        break;
      case ExamConstatnt.trueFalse:
        _currentExamTypeIndex = 4;
        break;
      case ExamConstatnt.singleChoice:
        _currentExamTypeIndex = 5;
        break;
    }
    update(['examType']);
  }

/////////////////////////////////// Button Action///////////////////////

  void nextQuestion() {
    _currentQuetionIndex++; // increment the new Question
    if (_currentQuetionIndex < examData.data!.questions!.length) {
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
    print(
        "QutionId: ${getCurrentQuestionModel(index: _currentQuetionIndex).id} Send Note");
    print("-" * 50);
  }

  void wrongQuetion({required bool isWrongQuestion}) {
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

  void _getSubjects({int? limit, int? skip}) {
    try {
      SubjectsRepositoryService()
          .getSubjects(limit: limit, skip: skip)
          .then((value) {
        print(value.data);
        _subjectList = value.data!;
        _isLoadChoicePage = true;
        update(['loadingChoicePage']);
      });
    } catch (e) {
      SnackBarHelper.instance.showMessage(message: e.toString(), erro: true);
    }
  }

  void _randomExamService() {
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
                  photo:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
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
                      "true_false", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo:
                      "https://quizzy.makank.online/images/questions/avatar.png",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
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
            ]));
    updateTheCurrentExamType(); //update  the Question Type
  }

  void _aiExamService() {}

  void _choiceExamService() {}
  void _specialistExamService() {}
}
