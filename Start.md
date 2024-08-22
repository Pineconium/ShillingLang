# Getting started with Shilling
## 1. Getting the Right Stuff.
To start using Shilling, you'll need either a compiler or an interputer for the language. (Note: This repo currently doesn't contain any compilers nor interputers for the language, you'll either need to create one yourself or look for any compiler/interputer). You'll also need any code editor of your choice.

## 2. Creating a 'Hello, World!' program
First create any file ending in `.shil`, and add this line:
```
start Main;
```
Upon startup, this will imminently call the `Main` function. Now you just need to make a function, known as a 'blueprint'. To make a blueprint, do it the same way as you would creating a typical function (make sure the blueprint name is the same as the one you called in the `start` line):

(NOTE: The `start` function can NOT start any blueprints with arguments in them. Doing so will give an "Invaild Start Function" error.)
```
blue Main(){
    /*...*/
}
```
Now its time to make it say 'Hello, World!' in two ways, via a direct string and a variable. To create a string variable, above your `start` line, add `vars [StringNameHere] = "Hello, World from a variable!";`. Now, lets make the Main blueprint print out your string, add `parrot("Hello, World!");` to your blueprint. All together it should look like this:
```
vars Hello = "Hello, World from a variable!";
start Main;

blue Main(){
    /* Print out the string from a direct input */
    parrot("Hello, World!");
}
```
While this will print out 'Hello, World!', this won't print out our string variable. To do this, for the argument of the `parrot` function, simpily make it `%[StringNameHere]`. So now it should look like this:
```
vars Hello = "Hello, World from a variable!";
start Main;

blue Main(){
    /* Print out the string from a direct input */
    parrot("Hello, World!");

    /* Print out the string from a variable */
    parrot(%Hello);     // <- NOTE: Only use variables defined as a 'string'
                        // See the 'Variables' chapter for more information.
    exit;
}
```

And thats how you make a 'Hello, World!' program in Shilling
## 3. Variables and Data
Shilling has five types of data classes: strings, floats, intergers, booleans, and lists.
```
/* Shilling Variable Types */
vars String = blank;     // <- String.
vari Interg = 1;         // <- Interger.
vflt FloatN = 1.0;       // <- Float.
varb Boolen = true;      // <- Boolean.

/* A list */
list List =[
    "Item 1", "Item 2"
];
```
There are also 'Global', and 'Local' variables in Shilling, Global variables are declared outside of any blueprint, and can be accessed and modified from any blueprint, and from any file if you 'imported' the file using `#~imp`. Local variables are declared inside of a blueprint, and can only be accessed from inside that blueprint. For example, if you have a variable called "Banana" inside of a blueprint called "Orange", Orange will be able to access Banana's data, but another blueprint, lets call it 'Cherry', will not.

You can also create temporary variables, by adding `@temp` to the variables declarition.
```
@temp vars TempVar = "This will only be appear until I retire it."
```

To retire a temporary variable, use `retire(%[TempVarsName])`, this makes it so that future calls of this variable will not work, causing a "Temp. Variable expired." error.

To sort a list, you can use `[ListName].sort` to sort it from A&#8594;Z. To print out your sorted list, you can use `parrot` to print it out to the output, like this:
```
parrot(%[ListName].sort);
```
There are other ways to print it:
```
Name.stand      // <- in order of how the list was init.
Name.rev        // <- in reverse order of how the list was init.
Name.sort       // <- by alphabetical order
Name.revsort    // <- by reverse alphabetical order (Z->A)
Name.rando      // <- random sort (changes every call).
```

## 4. Loops.
There are multiple ways to declare a loop. Such as a `while` loop, which will keep running as long as a certain condition is true and a `forever` loop, which will keep running until a `escape` is called.

Heres an example of a use of a `while` loop:
```
vari Count = 1;
start Main;

blue Main {
    while %Count < 20 {
        parrot("Hello, World!");
        Count++;    // <- add 1 to Count.
    }

    parrot("Done!");
    exit;
}
```
This code will deplay 'Hello, World!' 20 times, once Count reaches 20, the loop will exit and print "Done" to the output. Heres an example of a `forever` loop:
```
#~imp (clock) // <- for delay functions

start Loop;

blue Loop {
    forever {
        parrot("I'll show up every 1 seconds!");
        snooze(1000);   // <- 1000 ms or 1 sec.
    }
}
```
This loop will keep on running until the user force quits the program. You can also break out of forever loops with `escape`.
```
vari Count = 1;
start Main;

blue Main {
    forever {
        parrot("Hello, World!");
        Count++;    // <- add 1 to Count.

        if %Count >= 100 {escape;}   // <- quit the forever loop
    }

    parrot("Done!");
    exit;
}
```
## 5. Imports
You can import *Shilling Header Files* (`*.shh`) to use blueprints without heaving to redeclare them. A Shilling Header File's blueprint is known as an 'action', and can be used using `act`.

Heres what an action would look like:
```
act ActionName(args) {
    /*...*/
}
```

Heres a custom action that reverses a string using the `string` standard import (lets call this `MyImp.shh`):
```
#~imp (string)

act ReverseText(str x) {
    vari Count = 0;
    list Text = [null]; // <- empty list.

    while %Count < strleng(%x) {
        %List.additem(letter(strleng(%x) - %Count));
        Count++;
    }

    output(%List.merged);
}
```
Now make a .shil file to reverse the text 'Hello, World!':
```
#~imp "/path/to/MyImp.shh"
start Main;

blue Main(){
    ReverseText("Hello, World!");
    exit;
}
```
The output should be `!dlroW ,olleH`.
