import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
    // methodCount: 3, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 1200, // width of the output
    colors: false, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false,
  ),
);
