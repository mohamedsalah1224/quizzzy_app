import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Color primayColor = const Color(0xff268C6D);

enum Source { camera, gallary }

enum SourceLoginType { email, phone }

enum QuizType { random, specialist, ai }

enum QuestionSourceType { none, image, video, sound }

enum SocialMediaType { google, facebook, apple }
