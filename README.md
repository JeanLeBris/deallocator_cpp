# deallocator_cpp

The content of this repository was originally written directly in the argparse_cpp repository, however I thought it would be better to give it its own repository and to include it in the argparse_cpp repository as a submodule.

Its objective it to make the management of allocated memory easier.

```deallocator::Garbage()``` allow the user to initialize a new garbage can.

The way it works is rather straightforward:
- The ```throw_away()``` method allow the user to push the address of an allocated variable in the garbage can.
- The ```recycle()``` method allow the user to replace the address of a previously allocated variable with a new address in the garbage can.
- The ```order_66()``` method allow the user to free all the allocated variables' addresses put in the garbage can.