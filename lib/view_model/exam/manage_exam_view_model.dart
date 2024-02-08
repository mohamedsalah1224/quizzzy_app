import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/exam_repository_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/questions_repository_service.dart';
import 'package:quizzy_app/Service/api/repository_implementaion_service/subjects_repository_service.dart';
import 'package:quizzy_app/model/answer_question_model.dart';
import 'package:quizzy_app/model/book_model.dart';
import 'package:quizzy_app/model/data_subject_model.dart';
import 'package:quizzy_app/model/answers_model.dart';
import 'package:quizzy_app/model/exam_model.dart';
import 'package:quizzy_app/model/exams_model.dart';
import 'package:quizzy_app/model/questions_model.dart';
import 'package:quizzy_app/model/send_note_or_wrong_to_question_mode.dart';
import 'package:quizzy_app/model/start_quiz_model.dart';
import 'package:quizzy_app/model/store_exam_model.dart';
import 'package:quizzy_app/utils/constant/exam_costant.dart';
import 'package:quizzy_app/utils/dialog_helper.dart';
import 'package:quizzy_app/utils/routes.dart';
import 'package:quizzy_app/utils/snack_bar_helper.dart';
import 'package:quizzy_app/view/screens/exam/choose_book.dart';

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
import 'package:quizzy_app/view_model/media/video_view_model.dart';

import '../../utils/constant.dart';

class ManageExamViewModel extends GetxController {
  TextEditingController noteController = TextEditingController();
  bool _isClickSendNote = false;
  bool _isClickWrongAnswer = false;
  bool _isLoadChoicePage = false;
  int _currentManageExamsPagesIndex = 0;
  int _currentQuetionIndex = 0;
  int _currentExamTypeIndex = 0;
  int _countOfQuestion = 1;
  int _totalOfQuestion = 0;
  bool _isAfterFinish = false;
  String _examTypeMessage = "الإختبار";

  DataSubjectModel? _subjectSelectedInformation;
  BookModel? _bookSelected;
  StartQuizModel? _startQuizModel;
  bool _isLoadExamViewPage = false;
  late List<DataSubjectModel> _subjectList;
  List<BookModel> _bookList = [];
  final List<Widget> _examTypeList = [
    const CompareExam(),
    const LongShortAnswerExam(),
    const MultipleChoiceExam(),
    const TrueFalseExam(),
    const SingleChoiceExam(),
  ];
  final List<Widget> _examViewList = const [
    ChooseSubjectView(),
    ChooseBookView(),
    QuizTypeView(),
    FilterQuestionsView(),
    // ExamView(),
  ];

  ExamsModel? _examData;

  Map<String, dynamic> _mapAnswersOfExam = {};

  List<Widget> get examViewList => _examViewList;

  void addAnswerQuestion({required MapEntry<String, dynamic> mapEntry}) {
    _mapAnswersOfExam.addEntries({mapEntry});
  }

  void printMapOfAnswerQuestion() {
    print(_mapAnswersOfExam);
  }

  bool get isLoadChoicePage => _isLoadChoicePage;
  bool get isLoadExamViewPage => _isLoadExamViewPage;
  String get examTypeMessage => _examTypeMessage;
  void setAfterFinish() => _isAfterFinish = true;
  bool get isAfterFinish => _isAfterFinish;
  Map<String, dynamic> get answerSelectedByUser => _mapAnswersOfExam;
  void resetValueOfLoadExamViewPage() => _isLoadExamViewPage = false;
  void resetMapAnswer() => _mapAnswersOfExam = {};
  void resetValueOfRepitionExam() {
    _isLoadExamViewPage = false;
    _mapAnswersOfExam.clear();
    resetVideoController(); // to Reset Video Controller
    resetAllController(); // this Solve the Problem of Nested Controller
  }

  List<DataSubjectModel> get subjectList => _subjectList;
  List<BookModel> get bookList => _bookList;

  DataSubjectModel get getSubjectSelectedInformation =>
      _subjectSelectedInformation!;
  BookModel get getBookSelected => _bookSelected!;
  StartQuizModel get startQuizModel => _startQuizModel!;
  ExamsModel get examData => _examData!;
  bool get isNoQuestionExist =>
      _examData!.data!.questions!.isEmpty ? true : false;
  List<Widget> get examTypeList => _examTypeList;
  int get currentQuetionIndex => _currentQuetionIndex;
  int get currentManageExamsPagesIndex => _currentManageExamsPagesIndex;
  void setCurrentManageExamsPagesIndex(int index) =>
      _currentManageExamsPagesIndex = index;
  int get currentExamTypeIndex => _currentExamTypeIndex;
  int get totalOfQuestion => _totalOfQuestion;
  int get countOfQuestion => _countOfQuestion;
  bool get isFirstQuestion => (_currentQuetionIndex == 0);
  bool get isLastQuestion =>
      (_currentQuetionIndex == examData.data!.questions!.length - 1);
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
    _bookList = _subjectSelectedInformation!.books ?? [];
    _currentManageExamsPagesIndex = 1;
    update(['updateCurrentManageExamsPagesIndex']);
  }

  void chooseBook({required BookModel bookModel}) {
    _bookSelected = bookModel;
    _currentManageExamsPagesIndex = 2; // update Book Index
    update(['updateCurrentManageExamsPagesIndex']);
  }

  void backFromChooseBookView() {
    _currentManageExamsPagesIndex = 0;
    update(['updateCurrentManageExamsPagesIndex']);
  }

  void backFromQuizViewType() {
    _currentManageExamsPagesIndex = 1;
    update(['updateCurrentManageExamsPagesIndex']);
  }

  void backFromFilter() {
    _currentManageExamsPagesIndex = 2;
    update(['updateCurrentManageExamsPagesIndex']);
  }

  void createYourExamByFilter() {
    _currentManageExamsPagesIndex = 3;
    update(['updateCurrentManageExamsPagesIndex']);
    // call api Repositry for filter Question
  }

  void getTheTypeOfExamMessage() {}

  void confirmFilter(
      {int? leasonId,
      String? level,
      String? semesterId,
      int? time,
      String? typeAssessment,
      List<String>? questionTypes,
      int? unitId}) {
    // _currentIndex = 3;
    // update();
    // call api to create Exam Based on Filter information
    // if it Choce the typeOfAssessment AfterFinish

    print("*" * 50);
    print(questionTypes);
    print("*" * 50);
    if (ExamConstatnt.typeAssessmentAfterFinish == typeAssessment) {
      _isAfterFinish = true;
    } else {
      _isAfterFinish = false;
    }
    _examTypeMessage = "الإختبار الإختياري";
    _choiceExamService(
        leasonId: leasonId,
        level: level,
        semesterId: semesterId,
        time: time,
        typeAssessment: typeAssessment,
        questionTypes: questionTypes,
        unitId: unitId);
    Get.toNamed(Routes.examView);
  }

  void createOtherExam(QuizType quizType) {
    // _currentIndex = 3;
    // update();
    // call api Service to create Exam for other Quetion (Q)
    // ( quizType== QuizType.ai ) // call Api for Ai Reposirty

    if (QuizType.ai == quizType) {
      _examTypeMessage = "الإختبار لمعالجة الضعف بالذكاء الاصطناعي";
      _aiExamService();
    } else if (QuizType.random == quizType) {
      _examTypeMessage = "الإختبار العشوائي";
      _randomExamService();
    } else {
      _examTypeMessage = "الإختبار من مختص";
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
    _mapAnswersOfExam.clear(); // clear the Map
    _countOfQuestion = 1;
    _totalOfQuestion = 0;
    _isAfterFinish = false;
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

  void resetVideoController() {
    print("-" * 80);
    print("Rest Video Controller");
    print("-" * 80);

    if (ExamConstatnt.isPageHasVideo) {
      Provider.of<VideoViewModel>(ExamConstatnt.currentContextVideo,
              listen: false)
          .deleteControllerManually();
      print("-" * 50);
      print("Delete it Manually");
      print("-" * 50);
    }
  }

  Future<void> resetAllController() async {
    print("/" * 60);
    print("Current Exam Type : $_currentExamTypeIndex");
    print("/" * 60);

    String typeOfQuestion =
        _examData!.data!.questions![_currentQuetionIndex].type!;

    switch (_currentExamTypeIndex) {
      // case 0:
      //   await Get.delete<CompareChoiceExamViewModel>(force: true);

      //   break;
      case 1:
        if (typeOfQuestion != ExamConstatnt.shortAnswer) return;
        Provider.of<ShortLongAnswerViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 2:
        if (typeOfQuestion != ExamConstatnt.multipleChoice) return;
        Provider.of<MultipleChoiceExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 3:
        if (typeOfQuestion != ExamConstatnt.trueFalse) return;
        Provider.of<TrueFalseExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
      case 4:
        if (typeOfQuestion != ExamConstatnt.singleChoice) return;
        Provider.of<SingleChoiceExamViewModel>(
                ExamConstatnt.currentContextQuestion,
                listen: false)
            .initObject();
        break;
    }
  }
/////////////////////////////////// Button Action///////////////////////
  ///

  void backFromExam() {
    Get.back();
    resetAllController();
  }

  void backQuestion() {
    noteController.clear(); // to clear the note Controller
    _isClickSendNote = false; // to Clear it
    _isClickWrongAnswer = false; // to Clear it

    resetVideoController(); // to Reset Video Controller

    if (_currentQuetionIndex > 0) {
      _currentQuetionIndex--; // decrement the index of the  Question
      _countOfQuestion--; // decrement the number of Question
      resetAllController(); // this Solve the Problem of Nested Controller
      update([
        "updateLinearProgres",
        "updateAboveSection",
        "updateBlewSection"
      ]); // update the Above Section

      updateTheCurrentExamType(); // update  the Question Type
    } else {
      debugPrint("-" * 50);
      debugPrint("This is the First Question");
      debugPrint("-" * 50);
    }
  }

  void nextQuestion() async {
    QuestionsModel currentQuestionModel =
        getCurrentQuestionModel(index: _currentQuetionIndex);
    debugPrint("-" * 50);
    debugPrint("Question Id ${currentQuestionModel.id}");
    debugPrint("-" * 50);

////////////////////////////////// Send Note or Wrong Answer Section /////////////////////////////////////////

// if the Question have a Wrong Answer  or Note Call this
    if (_isClickSendNote || _isClickWrongAnswer) {
      _sendNoteAndWrongQuestion(
              notes: noteController.text,
              idQuestion: currentQuestionModel.id!,
              needReview: _isClickWrongAnswer)
          .then((value) {
        debugPrint(": " * 50);
        debugPrint(
            "Value of Send Note : ${value.message}  ${currentQuestionModel.id}");
        debugPrint(": " * 50);
        if (!value.success!) {
          SnackBarHelper.instance.showMessage(
              message: value.message.toString(),
              erro: true); // if the Id of the Question not Found
        } else {
          debugPrint("/ " * 50);
          debugPrint("Send Note : ${value.message}");
          debugPrint("/ " * 50);
        }
      });
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////// Send Answers Section ////////////////////////////////////////////////////////
// printAll Questions Answer Map
    debugPrint("/ " * 50);
    debugPrint(" All Current Questions Answer $_mapAnswersOfExam");
    debugPrint(
        " The Answer of Current Question($_currentQuetionIndex), Questin Id(${currentQuestionModel.id})  Answer ${_mapAnswersOfExam['${currentQuestionModel.id}']}");
    debugPrint("/ " * 50);

    // send Anser if the TypeAssestment Direct

    if (!_isAfterFinish) {
      var resultOfTheCurrentQuestion =
          _mapAnswersOfExam['${currentQuestionModel.id}'];

      resultOfTheCurrentQuestion ??=
          ExamConstatnt.multipleChoice == currentQuestionModel.type ? [] : null;

      DialogHelper.showLoading(); // Show Diallog

      await answerQuestionService(
              questionId: currentQuestionModel.id!,
              givenAnswer: resultOfTheCurrentQuestion)
          .then((value) {
        DialogHelper.hideLoading(); // Hide Diallog
        if (!value!.success!) {
          SnackBarHelper.instance
              .showMessage(message: value.message!, erro: true);
        } else {
          debugPrint("/ " * 50);
          debugPrint(
              "Answer of Question Id ${currentQuestionModel.id}  Message : ${value.message}");
          debugPrint("/ " * 50);

          SnackBarHelper.instance.showMessage(
              // isCorrect is null in Short Answer Question
              message: value.data!.isCorrect == null
                  ? " لم يتم الانتهاء من تطوير التصحيح بالذكاء الاصطناعي ل الاسئلة المقالية"
                  : value.data!.isCorrect!
                      ? "إجابة صحيحة"
                      : "إجابة خاطئة ",
              erro: value.data!.isCorrect == null || !value.data!.isCorrect!);
        }
      }).catchError((e) {
        debugPrint(e.toString());
        DialogHelper.hideLoading(); // Hide Diallog if any Erro Occur
      });
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////Reset Value Section ////////////////////////////////////////////////////////////
    noteController.clear(); // to clear the note Controller
    _isClickSendNote = false; // to Clear it
    _isClickWrongAnswer = false; // to Clear it
    _currentQuetionIndex++; // increment the new Question
    _countOfQuestion++; // increment the number of Question
    resetVideoController(); // to Reset Video Controller
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////// Control Exam Page Section //////////////////////////////////////////////
    ///
    if (_currentQuetionIndex < examData.data!.questions!.length) {
      /*
      To Solve the Problem of this we need to call resetAllController()
      // to Reset All Provider Controler to delete the Data if we have  a nested of the Same Controller the Data is Shared betwen them 
      // the Controller not Removed if we have a Nested Controller of the Sampe Tyep
      */

      resetAllController(); // this Solve the Problem of Nested Controller
      update([
        "updateLinearProgres",
        "updateAboveSection",
        "updateBlewSection"
      ]); // update the Above Section

      updateTheCurrentExamType(); // update  the Question Type
    } else {
      debugPrint("-" * 50);
      debugPrint("Exam Finished");
      debugPrint("-" * 50);

      if (_isAfterFinish) {
        await senAnswerAfterFinish(); // if is After Finish Send Answer
      }
      // when End The Exam Finsish Reset the currentQuestionIndex , countOfQuestion
      _currentQuetionIndex =
          0; // we will use it When Repetion , reviseons Answer The Exam
      _countOfQuestion =
          1; // set we will use it When Repetion , reviseons Answer The Exam
      Get.toNamed(Routes.examStatisticsView);
    }

    // if the Exam Entire
  }

  Future<void> senAnswerAfterFinish() async {
    DialogHelper.showLoading(
        message: 'يتم الان إرسال الإجابات ....',
        textDirection: TextDirection.rtl); // Show Diallog

    for (int currentIndex = 0;
        currentIndex < examData.data!.questions!.length;
        currentIndex++) {
      QuestionsModel currentQuestionModel =
          getCurrentQuestionModel(index: currentIndex);
      var resultOfTheCurrentQuestion =
          _mapAnswersOfExam['${currentQuestionModel.id}'];

      resultOfTheCurrentQuestion ??=
          ExamConstatnt.multipleChoice == currentQuestionModel.type ? [] : null;
      await answerQuestionService(
              questionId: currentQuestionModel.id!,
              givenAnswer: resultOfTheCurrentQuestion)
          .then((value) {
        if (!value!.success!) {
          debugPrint("/ " * 50);
          debugPrint(
              "Answer of Question Id ${currentQuestionModel.id}  Message : ${value.message}");
          debugPrint("/ " * 50);
        } else {
          debugPrint("/ " * 50);
          debugPrint(
              "Answer of Question Id ${currentQuestionModel.id}  Message : ${value.message}");
          debugPrint("/ " * 50);
        }
      }).catchError((e) {
        debugPrint("/ " * 50);
        debugPrint(e.toString());
        debugPrint("/ " * 50);
      });
    }
    DialogHelper.hideLoading(); // Hide Diallog
  }

  void sendNote() {
    _isClickSendNote = true; // hint to know it Click SendNote Button
    debugPrint("-" * 50);
    debugPrint(
        "QutionId: ${getCurrentQuestionModel(index: _currentQuetionIndex).id} Send Note textOfNote ${noteController.text}");
    debugPrint("-" * 50);
  }

  void wrongQuetion({required bool isWrongQuestion}) {
    _isClickWrongAnswer =
        isWrongQuestion; // hint to know it Click wrongQuetion Button
    if (isWrongQuestion) {
      debugPrint("-" * 50);
      debugPrint(
          "QutionId: ${getCurrentQuestionModel(index: _currentQuetionIndex).id} Wrong Answer");
      debugPrint("-" * 50);
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

  Future<SendNoteOrWrongToQuestionModel> _sendNoteAndWrongQuestion(
      {required String notes,
      required bool needReview,
      required int idQuestion}) async {
    try {
      return await QuestionsRepositoryService().sendNoteOrWrongToQuestionById(
          id: idQuestion, needReview: needReview, notes: notes);
    } catch (e) {
      rethrow;
    }
  }

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

  Future<void> startQuizService({required int examId}) async {
    ExamRepositoryService().startQuiz(examId: examId).then((value) {
      _countOfQuestion = 1;
      _currentQuetionIndex = 0;
      _startQuizModel = value;
      _totalOfQuestion = _startQuizModel!
          .data!.totalQuestions!; // intialize the Value of total Question
      _isLoadExamViewPage = true; // to updateScreen
      if (!isNoQuestionExist) {
        updateTheCurrentExamType();
      }
      update([
        'LoadExamViewPage',
        'updateLinearProgres'
      ]); //update  the Question Type
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

  void repetitionExam() {
    _isLoadExamViewPage = false;
    startQuizService(examId: _examData!.data!.id!);
    updateTheCurrentExamType(); //update  the Question Type
  }

  void _randomExamService() {
    _isLoadExamViewPage = false;
    _isAfterFinish = false; // must be false

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
                  id: 5,
                  name: "معني كلمة سيارة",
                  type:
                      "multiple_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  // photo:
                  //     "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  fileType: "video",
                  file:
                      "https://quizzy.makank.online/images/questions/3pPXtCAfypiTcMRg24kNNtASz2cddUpXRUvjMh5t.mp4",
                  // file: "https://streamable.com/bj6lsx", // Stream Link
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
                        title:
                            "Marcidis Marcidis Marcidis  Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis ",
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
                        title: null,
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: false,
                        createdAt: "2023-10-31T18:28:53.000000Z",
                        updatedAt: "2023-10-31T18:28:53.000000Z"),
                  ],
                  createdAt: "2023-10-31T18:23:49.000000Z",
                  updatedAt: "2023-10-31T18:23:49.000000Z"),
              QuestionsModel(
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "single_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo: "",
                  fileType: "video",
                  file:
                      'https://quizzy.makank.online/images/questions/LwtqkyNwatPEDzH9iIBCuMubz3IhLB6KpNaad03U.mp4',
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  // reference: "ثانوية عامة , دليل  التقويم",
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 1,
                        title:
                            " اجابة اجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابة  اجابة اجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابة  سؤال اجابة سؤال",
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
                  id: 5,
                  name: "معني كلمة سيارة",
                  type:
                      "multiple_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  // photo:
                  //     "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  fileType: "video",
                  file:
                      "https://quizzy.makank.online/images/questions/3pPXtCAfypiTcMRg24kNNtASz2cddUpXRUvjMh5t.mp4",
                  // file: "https://streamable.com/bj6lsx", // Stream Link
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
                        title:
                            "Marcidis Marcidis Marcidis  Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis ",
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
                        title: null,
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: false,
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
                  photo: null,
                  fileType: "audio",
                  file:
                      "http://codeskulptor-demos.commondatastorage.googleapis.com/GalaxyInvaders/pause.wav",
                  semester: null,
                  points: "25.00",
                  time: "60",
                  isActive: true,
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 3,
                        title: "هذه الإجابة صحيحة",
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
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "short_answer", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo:
                      "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
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
                        title: "اكتب باختصار لايتجاوز السطرين",
                        questionType: "short_answer",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text_image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: null,
                        createdAt: "2023-10-31T18:26:47.000000Z",
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
                        title:
                            "Marcidis Marcidis Marcidis  Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis Marcidis ",
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
                        title: null,
                        questionType: "multiple_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "image",
                        answerOrder: null,
                        answerSettings: null,
                        photo:
                            "https://quizzy.makank.online/images/answers/V3qeTQmmZKgkxtLYXsuvU1HfCcuGw4YX93meyAKn.jpg",
                        isCorrect: false,
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
                  id: 1,
                  name: "ماهي عاصمة فلسطين ؟",
                  type:
                      "single_choice", //single_choice,multiple_choice,true_false,short_answer,long_answer,compare
                  description: null,
                  photo: "",
                  // fileType: "audio",
                  file:
                      "https://quizzy.makank.online/images/questions/diqxxvjwu3t4hqDCWRp9kt9jOGbIBnySIpzItM1N.mp3",
                  semester: null,
                  points: "15.00",
                  time: "50",
                  isActive: true,
                  // reference: "ثانوية عامة , دليل  التقويم",
                  answers: <AnswersModel>[
                    AnswersModel(
                        id: 1,
                        title:
                            " اجابة اجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابة  اجابة اجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابةاجابة  سؤال اجابة سؤال",
                        questionType: "single_choice",
                        answerTwoGapMatch: null,
                        answerViewFormat: "text",
                        answerOrder: 1,
                        answerSettings: null,
                        photo: "",
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
                  photo: null,
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
            ]));
    _isLoadExamViewPage = true;
    updateTheCurrentExamType();
    update(['LoadExamViewPage']);
  }

  void _aiExamService() {
    _isLoadExamViewPage = false;
    _isAfterFinish = true; // must be false
    ExamRepositoryService()
        .storeExam(
            storeExamModel: StoreExamModel(
      type: ExamConstatnt.aiExam,
      typeAssessment: ExamConstatnt.typeAssessmentAfterFinish,
      subjectId: _subjectSelectedInformation!.id,
      bookId: _bookSelected!.id!,
    ))
        .then((value) {
      _examData = value;
      // SnackBarHelper.instance
      //     .showMessage(message: _examData!.message!.toString());

      print("*" * 50);
      print(_examData!.data!.id!);
      print("*" * 50);
      startQuizService(examId: _examData!.data!.id!);
      // updateTheCurrentExamType(); //update  the Question Type
    }).catchError((e) => SnackBarHelper.instance.showMessage(
            message: e.toString(), milliseconds: 2000, erro: true));
  }

  void _choiceExamService(
      {String? semesterId,
      int? unitId,
      int? leasonId,
      int? time,
      String? level,
      List<String>? questionTypes,
      String? typeAssessment}) {
    _isLoadExamViewPage = false;
    ExamRepositoryService()
        .storeExam(
            storeExamModel: StoreExamModel(
                subjectId: _subjectSelectedInformation!.id,
                bookId: _bookSelected!.id!,
                type: ExamConstatnt.choiceExam,
                typeAssessment: typeAssessment,
                semester: semesterId,
                lessonId: leasonId,
                questionTypes: questionTypes,
                level: level,
                unitId: unitId,
                time: time.toString()))
        .then((value) {
      _examData = value;

      startQuizService(examId: _examData!.data!.id!);
    }).catchError((e, s) {
      debugPrint(s.toString());
      SnackBarHelper.instance
          .showMessage(message: e.toString(), milliseconds: 2000, erro: true);
    });
  }

  void _specialistExamService() {
    _isAfterFinish = false; // must be false
    _isLoadExamViewPage = false;
  }
}
