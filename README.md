# TaskBuilder

TaskBuilder is an experimental DSL for performing async tasks (using OperationQueue), powered
by the new function builders feature in Swift 5.1.

## Example

```swift
Do {
  Action { print("Starting...") }

  LoadBigImageTask()
  Action { print("Load big image task finished!") }

  Passthrough(task: VeryBigImageTask()) { task in
    Action { completion(task.imageData) }
  }

  Action { print("All done!") }
}
```

## Basics

TaskBuilder allows you to define tasks sequentially, rather than executing them at any order. This simply means that order in which you define the tasks is the order in which they are executed.

TaskBuilder comes with a very simple protocol, called `Task`. A `Task` has two requirements - a `perform()` method and `completionBlock` property (which is simply `() -> Void`).

TaskBuilder also provides a default implementation of `Task` on `Operation` so you can easily start using your existing operation classes.

### Built-in tasks

### **Do**

A `Do` task is a top level task that encapsulates child tasks. Your task must always start with a `Do` at the top level.

### **Action**

An `Action` task is used to perform any kind of simple action (that does not return). For example - calling `print(...)`, calling a completion handler, etc.

### **Passthrough**

A `Passthrough` is a special kind of task, that takes a `Task` as input and then provides that same task in a completion block once that task has finished executing. This allows you to access the properties and methods on that task once its completed. 

For example - this can be useful when you want to pass the downloaded data to a completion handler.

## Limitations

This is an experimental package and is very basic in terms of functionality. For example - you cannot just create any kind of ordering you want, like putting another `Do` inside a `Passthrough` or an `Action` inside another. 

This is simply a way for me to experiment with this new feature. I made this in a few hours, so don't be harsh 😄 I will be improving this with time, so stay tuned.

PRs are welcome if you want to contribute something!
