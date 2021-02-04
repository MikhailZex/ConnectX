# A quick example based reference to Dart's quirks
- [Variables](#Variables)
    - [Syntax](#Syntax)
    - [Dynamic](#Dynamic)
    - [Const & Final](#Const%20&%20Final)

- [Numbers](#Numbers)
    - [Types](#Types)
    - [Binary Operators](#Binary%20Operators)
    - [Arithmetic Operators](#Arithmetic%20Operators)
    - [Note on Constants](#Note%20on%20Constants)

- [Strings](#Strings)
    - [Declaration Styles](#String%20Declaration%20Styles)
    - [Putting non-string data in strings](#Putting%20non-string%20data%20in%20strings)
    - [Note on Constant Strings](#Note%20on%20Constant%20Strings)

- [Booleans](#Booleans)

- [Lists](#Lists)
    - [Declaration Styles](#List%20Declaration%20Styles)
    - [Data access and length](#Data%20access%20and%20length)
    - [Collection "true power" operators](#Collection%20operators)

## Variables
### Syntax
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

### Dynamic
- If a variable has to take on multiple types of data, use `dynamic`:

    ```dart
    dynamic intButAlsoAnythingElse = 0;
    intButAlsoAnythingElse = 'a String Variable'; // This will work as the variable was declared 'dynamic'
    ```

### Const & Final
- If you want a variable to be unchanged, use `final` or `const`. Wait, Why the bloody hell do
you have two things to do the same thing? Let me explain:

    ```dart
    // The value of a constant is 'hard-coded' into the code,
    // Do what you wish, you cant change this:
    const var devilsNumber = 69;

    // The value of something declared as 'final' can be changed at runtime but assigned only once,
    // So, you could do something like:
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
## Numbers
### Types
- Numbers are of two types `int` and `double`, 'no decimal' and 'decimal':
    ```dart
    int baseTen1 = 17;
    int baseSixteen1 = 0x11;            // Dart doesn't have native binary support

    double baseTen2 = 12.314;
    double baseTen3 = 12;               // 12.00
    
    double baseTen4 = 2e+3;             // 2000.00
    double baseSixteen2 = 1.2314e+1;    // you can't use this notation for 'int'
    ```

- Converting numbers to strings:
    ```dart
    int baseTen1 = 17;
    int baseSixteen1 = 0x11;

    var baseTen1String = baseTen.toString();            // 17
    var baseSixteen1String = baseSixteen1.toString();   // 17 (not 0x11)

    double number = 3.1428;

    var twoPointString = number.toStringAssFixed(2);    // 3.14
    var threePointString = number.toStringAsFixed(3);   // 3.143 (its rounded off)
    var pointString = number.toString();                // 3.1428
    ```

### Binary Operators
- Binary operations on numbers:
    ```dart
    int a = 3;
    int b = 7;

    double c = 3.14;

    // AND
    var xSuccess = a & b;
    var xFail = a & c;      // error: binary AND not defined for type 'double'
                            // none of the binary operators will work.

    // OR
    var y = a | b;

    // SHIFT
    var z = a << b;         // left shift
    var w = a >> b;         // Right Shift
    ```

### Arithmetic Operators
- Arithmetic Operations on numbers:
    | Operator | Meaning                                                                  |
    | -------- | ------------------------------------------------------------------------ |
    | +	       | Add                                                                      |
    | –	       | Subtract                                                                 |
    | -expr	   | Unary minus, also known as negation (reverse the sign of the expression) |
    | *	       | Multiply                                                                 |
    | /	       | Divide                                                                   |
    | ~/	   | Divide, returning an integer result                                      |
    | %	       | Get the remainder of an integer division (modulo)                        |
    | ++var    | var = var + 1 (expression value is var + 1)                              |
    | var++    | var = var + 1 (expression value is var)                                  |
    | --var    | var = var – 1 (expression value is var – 1)                              |
    | var--    | var = var – 1 (expression value is var)                                  |

### Note on Constants
- Operations on Constants:
    ```dart
    const int a = 11;
    const int b = 12;
    final int c = 12;
    int d = 12;

    const product = a * b;  // will work as involved variables are constants

    // These won't work as c, d are not compile time constants, i.e. they haven't been created yet
    // and product has to be assigned and created during compilation itself.
    const product = a * c;
    const product = a * d;
    ```
## Strings
###  String Declaration Styles
- You declare a string using single or double quotes:
    ```dart
    var s1 = 'Single quotes work well for string literals.';
    var s2 = "Double quotes work just as well.";
    var s3 = 'It\'s easy to escape the string delimiter.';
    var s4 = "It's even easier to use the other delimiter.";

    var multiLineString = '''
    blah blah blah
    bleh bleh bleh
    just move on already
    ''';

    var multiLineString2 = """
    God, your still reading aren't ya?
    Shoo! Flutter isn't the best language out here,
    Go learn python on something
    """;

    var specialTreatment = r'in a "raw" string, not even \n gets special treatment';
    // in a "raw" string, not even \n gets special treatment.
    ```

### Putting non-string data in strings
- String Interpolation - putting various objects into strings:
    ```dart
    var x = 1.23e-2;
    var y = 'test dummy';

    var interpolatedString = 'this is a $y string and its value is: $x';
    // this is a test dummy string and its value is: 0.0123

    var interpolatedStringCaps = 'this is a ${y.toUpperCase()} string and its value is: ${x}';
    // this is a TEST DUMMY string and its value is: 0.0123
    // note: $expr and ${expr} are equivalent

    var interpolatedStingFixed = ' this is a $y sting and its value is:' + x.toStringAsFixed(2);
    // this is a test dummy string and its value is: 0.01
    ```

### Note on Constant Strings
- Constant Strings:
    - Can only involve constant variables for the same reasons outlined [here (Note on Constants example)](#Note%20on%20Constants)
    - interpolation doesn't work:
        ```dart
        const validConstString = '$aConstNum $aConstBool $aConstString';
        // $aNum $aBool $aString $aConstList
        ```
## Booleans
- are of two type: `true` and `false`; conditionals work only on booleans:
    ```python
    # Python example of conditionals on non-boolean
    if None:
        print('this code will run')
    
    # Python interprets 'None' as 'False'
    ```
    ----------------------------------------------------------------------
    ```dart
    // Dart won't accept such crap
    if(null) {
        print('this will not run and cause an error');
    }

    // Dart likes its booleans, only booleans work for conditionals
    if(someVariable == null){
        print('this code will run);
    }
    ```
## Lists
### List Declaration Styles
- The same as Python Lists or JavaScript Arrays:
    ```dart
    var intList = [1, 2, 3];
    intList.add('random Text');         // error: intList is 'interpreted' as List<int>, ie.e only int values

    List<dynamic> dynamicList = [1, 2, 3];
    dynamicList.add('random text');     // will work

    var dynamicList2 = <dynamic>[1, 2, 3];
    dynamicList2.add('random text');    // will work

    // note: List<dynamic> abc = [1, 2, 3, 'Hello There'] is the same as
    // List abc = <dynamic> [1, 2, 3, 'general Kenobiiahhh!']

    ```

- The __spread__ (`...`) and __null-aware spread__ (`...?`) operators:
    ```dart
    var list1 = [4, 5, null, 6];
    var list2 = [1, 2, 3];
    var list3 = null;

    // The spread operator adds each individual element of a list to another list:
    var numbersA = [10, 12, 32, ...list1];  // [10, 12, 32, 4, 5, null, 6]

    var numbersB = [...list1, ...list2];    // [1, 2, 3], can just be used as is to build a list ground up
    var numbersC = list1 + list2;           // [4, 5, 6, null, 1, 2, 3], order is preserved
    var numbersD = [list2, list1]           // [[1, 2, 3], [4, 5, null, 6]]
    
    // Will rise an exception, the spread operator can only be used on list objects
    var numbersD = [1, 5, 9, ...list3];

    // null-aware spread ignores the passed variable if it is `null`
    var numbersE = [1, 5, 9, ...?list3];    // [1, 2, 9]

    // null-aware spread operator doesn't ignore `null` within lists
    var numbersF = [1, 2, 3, ...?list1];    // [1, 2, 3, 4, 5, null, 6], list1 is not of type `null`
    ```
### Data access and length
- The length of a list & data access:
    ```dart
    var list = [4, 3, 2, 1];

    print('length: ${list.length}');    // 4 (List.length property)
    print('third obj: ${list[2]}');     // Note that the 3rd obj is index 2, Zero base accounting
    ```
### Collection operators
- The collection-for:
    ```dart
    var codes = ['A2I', 'JE00', 'M3T', 'V11'];

    var code_list1 = [
        'CC:#Q1RZ',
        for (code in codes) 'CC:#$code'
    ]   // ['CC:#Q1RZ', 'CC:#A2I', 'CC:#JE00', 'CC:#M3T', 'CC:#V11']

    // Dart assumes that what ever is passed after the for loop is a list item, so
    // the {} is interpreted as a Set object declaration and you end up with a list of sets
    var code_list2 = [
        'CC:#Q1RZ',
        for (code in codes) {'CC:#$code'}
    ]   // [{'CC:#Q1RZ'}, {'CC:#A2I'}, {'CC:#JE00'}, {'CC:#M3T'}, {'CC:#V11'}]

    // You can also use this version of a collection-for
    var code_list1 = [
        'CC:#Q1RZ',
        for (var i = 0, i < 10, i++) 'CC:#$i'
    ]   // [CC:#Q1RZ, CC:#0, CC:#1, CC:#2, CC:#3, CC:#4, CC:#5, CC:#6, CC:#7, CC:#8, CC:#9]

    // You can nest collection-for, it is unlimited power I say... (but this is still not all)
    var code_list4 = [
        'CC:#Q1RZ',
        for (code in codes)
            for (var i = 0; i < 10; i++) 'CC:#$code$i'
    ]   // [CC:#Q1RZ, CC:#A2I0, CC:#A2I1, CC:#A2I2, CC:#A2I3, CC:#A2I4, ..., CC:#V118, CC:#V119]

    // Note how 'CC:#Q1RZ' is the first element of each list - defined elements remain, additional
    // elements are generated on the fly
    ```

- The conditional-if
    ```dart
    var controlFlag1 = false;
    var list1 = [
        'HELLO_THERE',
        if (controlFlag1) 'GENERAL_GRIEVOUS'
    ] // ['HELLO_THERE']

    var controlFlag2 = true;
    var list2 = [
        'HELLO_THERE',
        if (controlFlag2) 'GENERAL_GRIEVOUS'
    ] // ['HELLO_THERE', 'GENERAL_GRIEVOUS']

    // the real flexibility of conditional-if and conditional-for, using them together:
    var code_list = [
        'CC:#Q1RZ',
        for (var i = 0; i < 10; i++)
            if (i%2 == 0)
                'CC:#$i'
        ];  // [CC:#Q1RZ, CC:#0, CC:#2, CC:#4, CC:#6, CC:#8]

    var cFlag = false;
    var code_list = [
        'CC:#Q1RZ',
        if (cFor)
            for (var i = 0; i < 10; i++)    // this part doesn't execute due
                'CC:#$i'                    // to the conditional-if statement
        ]; // [CC:#Q1RZ]
    ```