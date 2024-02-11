import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoint {
  EndPoint._();

  static final String baseUrl = dotenv.get("BASE_URL");
  static final String login = dotenv.get("LOGIN");
  static final String logout = dotenv.get("LOGOUT");
  static final String register = dotenv.get("REGISTER");
  static final String checkUser = dotenv.get("CHECK_USER");
  static final String socialLogin = dotenv.get("SOCIAL_LOGIN");
  // /api/academic-years
  static final String academiYears = dotenv.get("ACADEMIC_YEARS");

  static final String subjects = dotenv.get("SUBJECTS");

  static final String messgeApiResponse =
      dotenv.get("MESSAGE_API"); // to get Message Erro when occur Execption

  static final String verifyCode = dotenv.get("VERIFY_CODE");
  static final String forgetPassword = dotenv.get("FORGET_PASSWORD");
  static final String resetPassword = dotenv.get("RESET_PASSWORD");
  static final String veifyEmailCode = dotenv.get("VERIFY_EMAIL_CODE");
  static final String reSendVeifyEmail = dotenv.get("RESEND_VERIFY_EMAIL");

  // Exams
  static final String exams = dotenv.get("EXAMS");
  static final String storeExams = dotenv.get("EXAMS");
  static final String startQuiz = dotenv.get("START_QUIZ");
  static final String answerQuestion = dotenv.get("ANSWER_QUESTION");
  static final String units = dotenv.get('UNITS');
  static final String questions = dotenv.get('QUESTIONS');
  static final String attemptAnswers = dotenv.get('ATTEMPT_ANSWERS');
  static final String achievements = dotenv.get('ACHIEVEMENTS');
  static final String ads = dotenv.get('ADS');
  static final String topStudent = dotenv.get('TOP_STUDENTS');
  static final String examAttempts = dotenv.get('EXAM_ATTEMPTS');
/*
TOP_STUDENTS="/api/exams/students/top"
EXAM_ATTEMPTS="/api/exams/exam_attempts/attempts"
*/

  static String showExamById({required int examId}) => "$exams/$examId";
  static String showExamAttempt({required int id}) => "$examAttempts/$id";
  static String getAttemptAnswers({required int examAttemptId}) =>
      "$attemptAnswers/$examAttemptId";

  /*
  EXAMS="/api/exams"
START_QUIZ="/api/exams/start"
ANSWER_QUESTION="/api/exams/answer_question"

  */

  static String getAcademiYearById({required int id}) => "$academiYears/$id";
  static String getSubjectById({required int id}) => "$subjects/$id";
  static String getUnitById({required int id}) => "$units/$id";
  static String getAchievementsBySubjectId({required int subjectId}) =>
      "$exams/$subjectId$achievements";
  static String getSendNoteOrWrongToQuestion({required int idQuestion}) =>
      "$questions/$idQuestion";
}
