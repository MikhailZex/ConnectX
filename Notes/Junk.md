# A quick reference to Dart
- [Variables](#Variables)

## Variables
- In its simplest form, Variables are declared as

    ```
    [variable type] [variable name];
    [variable type] [variable name] = [value];
    ```

- To have Dart 'infer' the variable type, use `var`:

    ```dart
    var randomAssVariable = 'Text';   // Infered as 'String'
    var anotherRandomAssVariable = 0; // Infered as 'Int'
    var pointlessVariable;            // stored as null if no value is specified
    ```

- To specify the variable type, specify the variable type:

    ```dart
    String aStringVariable = 'Random Ass String';
    ```

- Note that, once a type has been specified and/or infered, the type of data stored can't be changed:

    ```dart
    var anInteger = 0;
    int anotherInteger = 7;

    anInteger = 'Text';         // Won't work, your assigning a 'String' to an 'int'
    anotherInteger = 'Text';    // Won't work, your assigning a 'String' to an 'int'
    ```

- If a variable has to take on multiple types of data, use `dynamic`:

    ```dart
    dynamic intButAlsoAnythingElse = 0;
    intButAlsoAnythingElse = 'a String Variable'; // This will work as the variable was declared 'dynamic'
    ```

- If you want a variable to be unchanged, use `final` or `const`. Wait, Why the bloody hell do
you have two things to do the same thing? Let me explain:

    ```dart
    // The value of a constant is 'hard-coded' into the code,
    // Do what you wish, you cant change this:
    const var devilsNumber = 69;

    // The value of something declared as 'final' can be changed at runtime but assigned only once,
    // So, in theory, you could do something like:
    if (isStormy()) {
        final var weather = 'Stormy';
    } else if (isWindy()) {
        final var weather = 'Windy';
    } else {
        final var weather = 'Calm';
    }

    devilsNumber = 999;                                 // fails, just the same value every time
    weather = 'Who cares what the weather is anyways?'; // fails, the value isn't necessarily same each time tho
    ```

- But hey! Did the guys at big G spare us? No. They had to build in some weird behaviours:
    
    ```dart
    const aConstantList = []; // Equivalent to 'const []'
    
    final aFinalList = const [];
    var thisWillIrritateYou = const [];

    // note that thisWillIrritateYou is a 'non-constant, non-final variable' and hence will work like:
    thisWillIrritateYou = [1, 2, 3];
    
    // Explanation: the abv code is equivalent to:
    // var thisWillIrritateYou = aConstantList;
    // var thisWillIrritateYou = [1, 2, 3];
    // All you did was switch out a list for another list, the 'thisWillIrritateYou' variable
    // was never declared 'const' or 'final'. *sigh*

    aFinalList = [1, 2, 3];     // Error as variable is 'final'
    aConstantList = [1, 2, 3];  // Error as vaiable is 'const'
    ```