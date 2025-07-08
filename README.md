# Greepp - The greens app

# TLDR;
## How to run
Assuming you have Flutter installed on your env.

* Via CLI:
  * run `flutter pub get`
  * run `flutter packages pub run build_runner build --delete-conflicting-outputs`
  * run `flutter run lib/presentation/main.dart`

# The context
One of the recurring question I receive is how to build a Flutter app with Clean Architecture.
This short example is a good starting point to understand the concepts and how to apply them in a real project.
Feel free to clone/copy/modify this project to fit your needs.

Please note this project should be taken as a possible implementation of Clean Architecture in Flutter, not as the only way to do it.
It also does not cover all the aspects of a real-world application, such as error handling, logging, testing, etc.

# Resources
    * [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).
    * [BLoC](https://pub.dev/packages/bloc) (state management in the Presentation layer).