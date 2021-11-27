# mspaint_bloc

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Flutter version

[✓] Flutter (Channel stable, 2.5.3, on macOS 11.2.3 20D91 darwin-x64, locale pt-PT)


## Libraries

- flutter_colorpicker      //choose a color in a variety of styles
- flutter_bloc             //state management solution of the app
- bloc                     //state management pattern of the app
- auto_route               //routing tool 
- equatable                //implement based equality without boilerplate code and override == 
- auto_route_generator     //code generator library for the routes of the app
- mockito                  //mocking dependencies in testing
- bloc_test                //helper for bloc testing
- flutter_lints            //helper to linting problems

## Architecture

This flutter app is created using the BLoC Pattern for his state management and the mutating state is composed by:

    - Paint() class: This class is responsable for updating the UI painting properties like "draw color", "stroke width" and "erase mode"
    - PathHistory() class: This class is responsable for updating the paths properties that the user draws with his fingers, like "backgroud color", undo and redo actions
    - PictureDetails() class: This class is responsable for updating the current picture from the renderobject in which the user is drawing

The mutating states and events from the BLoC Pattern are being listened using a BlocObserver (only in debug mode) which could result in losing some performance of the app in this mode, in order to archieve full performance please run the app in profile (flutter run --profile) or release (flutter run --release) modes.

The auto_route generates the route for this app using the generator command (flutter packages pub run build_runner build --delete-conflicting-outputs) and, in order to wrap the BlocProvider in the initial Widget, i create the SupportScreen widget.

NOTES: The organization of the code could/could not be improved, regarding the developer opinion in the architecture, the bloc could be easily splitted in several blocs by his state, in order to get a better abstraction of dependencies, this is just an example approach that i took.

## Analyzing

For the current developer environment running the analyze command (flutter analyze) no issues were found.

## Testing

In order to show the BLoC capabilities the "bloc_test" plugin was used and a couple of tests were created to check the PainterBloc. 
Just a Proof of Concept to show the testing skills in Flutter.