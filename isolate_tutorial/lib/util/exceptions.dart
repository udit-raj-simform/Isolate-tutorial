/*
Exception: The execution of the program is terminated abnormally.

Types of exception:
1. DefferedLoadException: thrown when a deffered lib fails to load.
2. FormatException: thrown whena string or some other data does not have an exception format and cannot be processed.
3. IntegerDivisionByZero: thrown when a number is divided by zero.
==> 'IntegerDivisionByZeroException' is deprecated and shouldn't be used. Use UnsupportedError instead.
Try replacing the use of the deprecated member with the replacement.
4. IOException: Base class for all input-output-related exceptions.
5. IsolateSpawnException: thrown when an isolate cannot be created.
6. OSError: An exception holding information about an error from the operating system.
7. TimeoutException: thrown when a scheduled timeout happens while waiting for an async result.

try-catch : is best used when Exception is unknown.
try-on : is best used when exception is known.
try-catch/on-finally  : is best used when code may run abnormally or there may be dead-code.

in case there is some error code in catch block, the exception will still be returned.


throw & rethrow
rethrow preserves the original stack trace of the exception.
throw on the other hand resets the stack trace to the last thrown position.

If you decide to rethrow an exception, prefer using the rethrow statement
instead of throwing the same exception object using throw.
rethrow preserves the original stack trace of the exception.
throw on the other hand resets the stack trace to the last thrown position.
*/

class ExceptionHandling extends FormatException{

  void functionUsingTryCatch() {
    int a = 0;
    int b = 24;
    try {
      print(b ~/ a);
    }
    catch (e) /* or catch (e, s) : s for stacktrace */ {
      print(" Cannot divide by zero. ");
    }
  }
  // output (with try-catch): Cannot divide by zero.
  // output (without try-catch): Uncaught Error: Unsupported operation: Result of truncating division is Infinity: 24 ~/ 0

  void functionUsingTryOn() {
    int a = 0;
    int b = 24;
    try {
      print(b ~/ a);
    }
    on UnsupportedError /* refer notes above for use */ {
      print("$b is not divisible by zero.");
    }
  }
  // output (with try-catch): 24 is not divisible by zero.
  // output (without try-catch): Uncaught Error: Unsupported operation: Result of truncating division is Infinity: 24 ~/ 0

  void functionUsingTryCatchWithFinally() {
    int a = 0;
    int b = 24;
    try {
      print(b ~/ a);
    }
    catch (e) /* or catch (e, s) : s for stacktrace */ {
      // print(" Cannot divide by zero. ");
    }
    finally {
      print("Code completed normally.");
    }
  }
// output (with try-catch-finally): Code completed normally.
// output (without try-catch): Uncaught Error: Unsupported operation: Result of truncating division is Infinity: 24 ~/ 0


}
