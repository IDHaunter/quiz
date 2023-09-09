//Возможные операторы в Dart
//Арифметические ***************************************************************
void tryMath()
{
  int a = 2;
  int b = 3;

  // Adding a and b
  var c = a + b;
  print("Sum of a and b is $c");
  //Sum of a and b is 5

  // Subtracting a and b
  var d = a - b;
  print("The difference between a and b is $d");
  //The difference between a and b is -1

  // Using unary minus
  var e = -d;
  print("The negation of difference between a and b is $e");
  //The negation of difference between a and b is 1

  // Multiplication of a and b
  var f = a * b;
  print("The product of a and b is $f");
  //Product of a and b is 6

  // Division of a and b
  var g = b / a;
  print("The quotient of a and b is $g");
  //The quotient of a and b is 1.5

  // Using ~/ to divide a and b
  var h = b ~/ a;
  print("Целое от деления b на a = $h");
  //Целое от деления b на a = 1

  // Remainder of a and b
  var i = b % a;
  print("Остаток от деления b на a = $i");
  //Остаток от деления b на a = 1*/
}

//Логические *******************************************************************
void tryLogycs()
{
  int a = 2;
  int b = 3;

  // Greater between a and b
  var c = a > b;
  print("a is greater than b is $c");
  //a is greater than b is false

  // Smaller between a and b
  var d = a < b;
  print("a is smaller than b is $d");
  //a is smaller than b is true

  // Greater than or equal to between a and b
  var e = a >= b;
  print("a is greater than b is $e");
  //a is greater than b is false

  // Less than or equal to between a and b
  var f = a <= b;
  print("a is smaller than b is $f");
  //a is smaller than b is true

  // Equality between a and b
  var g = b == a;
  print("a and b are equal is $g");
  // a and b are equal is false

  // Unequality between a and b
  var h = b != a;
  print("a and b are not equal is $h");
  //a and b are not equal is true

  // Using And Operator
  bool cc = a > 10 && b < 10;
  print(cc); //false

  // Using Or Operator
  bool dd = a > 10 || b < 10;
  print(dd); //true

  // Using Not Operator
  bool ee = !(a > 10);
  print(ee); //true

  String as = 'GFG';
  double bs = 3.3;

  // Using is to compare
  print(as is String); // =true

  // Using is! to compare
  print(bs is !int); // = true

}
//Битовые операторы ************************************************************
void testBit()
{
  int a = 5;
  int b = 7;

  // Performing Bitwise AND on a and b
  var c = a & b;
  print(c); //5

  // Performing Bitwise OR on a and b
  var d = a | b;
  print(d); //7

  // Performing Bitwise XOR on a and b
  var e = a ^ b;
  print(e); //2

  // Performing Bitwise NOT on a
  var f = ~a;
  print(f); //4294967290

  // Performing left shift on a
  var g = a << b;
  print(g); //640

  // Performing right shift on a
  var h = a >> b;
  print(h); //0
}

//Операторы присвоения и проверки на null **************************************
void testAssign()
{
  int a = 5;
  int b = 7;

  // Assigning value to variable c
  var c = a * b;
  print(c);

  // null-aware operators
  // ?? - null operator
  // возвращает левое выражение если оно не Null
  print(0 ?? 1);  // 0
  print(1);  // 1
  print(null); // null
  print(2); // 2

  // Assigning value to variable d
  int? d;
  //d=77
  d??= a + b; // Value is assign if d is null
  print(d); //12
  // Again trying to assign value to d
  d??= a - b; // Value is assign if d is null
  print(d); //12

  // …? null-aware spread operator
  List<int> list = [1, 2, 3];
  List<String>? list2; // <- list2 is null
  print(['chocolate', ...?list2]); // <- [chocolate]
  print([0, ...?list2, ...list]); // <- [0, 1, 2, 3]
  //print(['cake!', ...list2]);  // <- will crash
}
//Операторы условия ************************************************************
void testConditions()
{
  int a = 5;
  int b = 7;

  // Conditional Statement
  // 1 version
  var c = (a < 10) ? "Statement is Correct, Geek" : "Statement is Wrong, Geek";
  // 2 version
  if (a < 10) {
    c="Statement is Correct, Geek";
  } else {
    c="Statement is Wrong, Geek";
  }

  print(c); //Statement is Correct, Geek

  // Conditional statement
  int? n;
  var d = n ?? "n has Null value";
  print(d); //n has Null value

// After assigning value to n
n = 10;
d = n ?? "n has Null value";
  print(d); //10


//case
  switch(d) {
    case 10: {  print("Excellent"); }
    break;

    case 7: {  print("Good"); }
    break;

    case 55: {  print("Fair"); }
    break;

    case 1: {  print("Poor"); }
    break;

    default: { print("Invalid choice"); }
    break;
  }

// assert
// Main purpose of assert is testing conditions during debugging/development.
assert (a < 0); //Uncaught Error: Assertion failed

}

//Защищённые блоки try - except - finally **************************************
void testTry() {
  try {
    int.parse(';');
  } catch (error) {
    print(error);
  }

  try {
    int.parse(';');
  } on FormatException catch (e) {
    print(e);
  }
}

void testTryFinally() {
  var list = [10, 50, 16, 30, 15, 45];
  try {
    for (int i = 0; i < 10; i++) {
      print(list[i] ~/ list[i + 1]);
    }
  } on RangeError {
    print("Error: Out of range for list.");
  } on UnimplementedError {
    print("Error: Integer Division by Zero");
  } catch (exception) {
    print("Something Wrong happened");
    print(exception);
  } finally {
    print("We reach the finally block");
  }
}



