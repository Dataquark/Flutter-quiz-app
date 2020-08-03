# SECTION 2 - FLUTTER BASICS: QUIZZ APP

1. All dart files (flutter app) **MUST** have `void main() {}` function at the beginning, as flutter will run it first
    1.1 `void` means it will not return anything

2. _import 'package:flutter/material.dart'_ is the way to import packages

3. `Widgets` are classes. They **must** `extend/inherit` from `StatefullWidget` or `StatelessWidget`
    3.1 Each class will build `Widget` which **must** have `build(Buildcontext context)` method implemented
    3.2 This build method (provided by StatelessWidget) is what is called by Flutter during the run
    3.3 `BuildContext context` is a class provided by _material.dart_ and `context` will be filled by Flutter and contains
        meta information about the Widget - its position in the Widget tree and so on

4. `@override` should be added above `Widget`. It is a common practice.
    4.1 This decorator will override build method from StatelessWidget with **our own implementation** inside the class
    4.2 In the code, our implementation is `return MaterialApp(home: Text(...))`

5. `Scaffold()` - implements a very basic Material design UI with appropriate coloring rather than black/red view we first see
    5.1 It takes multiple arguments. We have `appBar` which has named arguments.
    5.2 `title` is one the named arguments and it takes `Widget` as its own argument, which in this case is `Text("My First App")`

6. `Text, Card, Button` - visible widgets. `Row, Column, ListView` - invisible ones. `Container` - both, depends on us

7. `Column` will have `children` argument
    7.1 children will have a _list_
    7.2 The list will contain different Widgets - Text, RaisedButton
    7.3 `RaisedButton()` will have `child` argument, which has Text() in our case
    7.4 Also, it has `onPressed: null` which means nothing happens when pressed
    7.5 In reality, this argument will have **some function** instead of `null`, so each press will invoke that function

8. **onPressed** will take **the function name** _NOT_ its results. Hence it has no `()` at the end of `buttonPressed`
    8.1 `onPressed` should take a function with no returning value (void) and no arguments
    8.2 this is what `buttonPressed` function does at the beginning of the class
    8.3 NEVER CREATE FUNCTIONS OUTSIDE OF CLASS - everything related to class (widget) should be inside

9. It is also possible to use _anonymous functions_ with `onPressed`
    9.1 in Dart they have the following form `() => do something`(one liner) or `() {do something}` (for more elaborate functionality)
    9.2 second and third `onPressed` demonstrate them

10. _State_ is Data/Info user by the app
    10.1 in current case it might be such things as:
        10.1.1 if the users are authenticated
        10.1.2 if the list of items are loaded
        10.1.3 current user input
        10.1.4 which question is selected

11. _StatlessWidget_ can not have states
    11.1 their purpose is mostly outputting data, such as `Text()` widget
    11.2 **Important!!** - Widget's internal state never changes.
    11.3 Only the change in _external data input_ will make the Widget to be re-rendered by Flutter

12. _StatefulWidget_ are different
    12.1 They also have external input, render UI, however...
    12.2 **Important!!** - StatefulWidgets have _internal state_ that can change
    12.3 Widgets are re-rendered either when external data input changes or _internal state_ changes

13. `That is the main difference between Stateless and Stateful widgets`

14. `StatefulWidget` should contain `createState()` function, that will return instance from state class as a _StatefulWidget_
    14.1 In our example, instance is *MyAppState()*
    14.2 _State_ class should have a pointer to statefulWidget, which is `...<MyApp>` in our example

15. `setState()` function is used to force Flutter to re-render the page, when state changes
    15.1 state changes means button pressed and _questionIndex_ is incremented by 1
    15.2 to reflect this increment, we should wrap it with `setState()` function, which return nothing _setState () {...}_
    15.3 when `setState()` is executed, Flutter reruns the build method - _build(BuildContext context...)_, hence updating the page

16. In dart you can use *_someName* (underscore) to make a class/function/variable **private**
    16.1 It will allow you to close the access to that class/function/variable from other/external files

17. Good convention rule is *To have one Widget per file*
    17.1 Other widgets should do to separate files
    17.2 In our example it is `question.dart` file
    17.3 to be continued

18. _EdgeInsets_ is a class for setting the margin
    18.1 it has multiple constructors such as _.top(), .all(), .only()_

19. Classes in Dart can have multiple constructors
    19.1 To achieve that, you add "." to the class name and choose any name for that constructor
    19.2 ```Class Person {
            String name;
            int age;
            Person(this.name, this.age) <- main constructor
            Person.old(this.name) <- second constructor
        }```

20. Mapping lists to Widgets
    20.1 Before this lesson, code involved three Answers widgets inside the Columns as a children
        **Answer(_buttonPressed),** // an instance of Answer class
        **Answer(_buttonPressed),** // it has a pointer to our func above
        **Answer(_buttonPressed),**
    20.2 Now we will rewrite it so we can change the answers dynamically
    20.3 Also take the answers from our Map (dictionary)

21. Its logic is as follows:
    21.1 You take the "answers" from a map for an appropriate index: _questions[_questionIndex]["answers"]_
    21.2 This will give you a list of answers from the dictionary (map)
    21.3 We use the `.map` function from dart to map each of the values to our Answer widget
        21.3.1 We use anonymous function for that: **(answer) {return Answer(_buttonPressed, answer)}**
        21.3.2 Inside the *answer.dart*, we should add another argument to our class
        21.3.3 Beside a pointer (_buttonPressed) to a function, it should receive a string (answer) as well
        21.3.4 We forward the string argument to a Text widget then
    21.4 `.map` function does not  accept generic class
        21.4.1 so, we transform it by embracing it with `()` and casting them `as List<String>`
    21.5 After that, we should transform the map object back to list, with `.toList()` function

22. `children` in the _Column_ is a list
    22.1 After `.toList()` in 21.5 it turns into a list with the first element a _Question_ widget
         the second element is another list of _Answer_ widgets (transformed from the map)
    22.2 However, we need to extract those widgets back to `children` as separate elements
    22.3 We add `...` to the beginning of our map->list transformation to achieve that
    22.4 It is called _spread-collections experiment_ from Flutter
        22.4.1 It extracts the elements inside a list out and adds them to a parent list as separate elements

23. `final` vs `const`
    23.1 `final` can be set during coding, but once it is set it never changes in compilation
    23.2 `const` once set inside the code, never changes, neither in runtime nor in compilation

24. We take the `questions` list of maps out from Widget to parent class, as a class property
    24.1 We write if statements inside the `_buttonPressed()` function

25. **Ternary expressions** are used as an alternative to if statements
    25.1 They follow the following format: `condition ? code if condition is true : code if condition is false`
    25.2 In our case, if the current _questionIndex_ is smaller than length of our list, them keep the columns showing
         otherwise show the _Center()_ widget

26. We will split the functionality into separate widgets
    26.1 `quiz.dart` file will have *Quiz* class which will handle our Column with ternary expressions
        26.1.1 Quiz class should accept three named variables, because our column
               needs _function pointer, list of quesionts and quesion index_
        26.1.2 _@required_ means class will not work without those variables
    26.2 `result.dart` file will have *Result* class which will handle our final results
        26.2.1 It simply returns a centered text so far

27. `getters` are combination of class properties and methods
    27.1 They have the following format `return type get some_name {}`, they are used without `()`
    27.2 We have `resultText` getter in _result.dart_ as an example
