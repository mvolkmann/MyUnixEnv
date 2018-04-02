# RxJS Notes

## Overview

* "a library for composing asynchronous and event-based programs
  using observable sequences"
* provides types Observable, Observer, Subscription, Scheduler, and Subject
* can transform values passed from Observables
  as they are passed through a method chain
* an `Observable` is like a Promise in that a value is delivered later,
  but it is unlike a Promise in that it can deliver multiple values
  * synchronously something like setTimeout or setInterval is used
    in which case values are delivered asynchronously
* it is a convention to include a $ at the end of
  variable names whose value is an `Observable`

## `Observable` Creation

* can create with `Rx.Observable.create(observer => { ... });`
* can also create with various operators
* can return any number of values
* just call `next` method on the observer
* example

```js
const observable = Rx.Observable.create(observer => {
  try { // it is recommended to handle errors this way
    observer.next('foo');
    observer.next('bar');
    setTimeout(() => {
      observer.next('baz');
      observer.complete();
    }, 1000);
  } catch (e) {
    observer.error(e);
  }
});

// Can't combine the next two lines because then
// subscription won't be defined inside the next method.
let subscription = null;
subscription = observable.subscribe({
  next(value) {
    console.log('got', value);
    // Can stop the `Observable` before all values are delivered.
    if (value === 'bar') subscription.unsubscribe();
  },
  error(err) {
    console.error(err);
  },
  complete() {
    console.log('finished');
  }
});
```

## Creating an `Observable` for DOM events

```js
const observable = Rx.Observable.fromEvent(domNode, eventName);
observable.subscribe(event => { ... });
```

## Creating an `Observable` for an array of values

```js
const observable = Rx.Observable.from(['foo', 'bar', 'baz']);
observable.subscribe(event => { ... });
```

## Creating an `Observable` for an ajax call

```js
const options = {
  method: 'some-method',
  url: 'some-url',
  body: 'some-body',
  headers: {
    name: value,
    ...
  },
  // and many more
};
const observable = Rx.Observable.ajax(options).map(e => e.response);
observable.subscribe(res => {
  // Do something with response.
});
```

## Subscribing to an `Observable`
* subscribe method
  * takes an object with three methods, `next`, `error`, and `complete`
    * `next` can be called any number of times
    * `error` and `complete` are only called once
      and cannot both be called
    * `error` is passed a JavaScript Error object
    * `complete` is passed nothing
    * after `error` or `complete` is called,
      no more calls to `next` will occur
  * can also take just a function that acts as the `next` method
  * the next method expresses what should be done with each value
  * the complete method is invoked when the observable
    calls the complete method on the observer
  * each call to subscribe on the same observable
    initiates a fresh sequence of values
    * starts an `Observable` execution
    * can't subscribe into the middle values
      in an already active observable
    * the sequence of values is not shared between multiple subscribers
    * observables do not maintain a list of their observers
  * synchronous, blocking call unless the observable
    uses something like setTimeout or setInterval

## Subject

* a kind of `Observable` that can send values to multiple observers
  * multicast instead of unicast
* also an Observer, so it can subscribe to other Observables
* example
```js
const subject = new Rx.Subject();
subject.subscribe({
  next(v) {
    // will get 1 and 2
    console.log('subscriber 1: v =', v);
  }
});
subject.next(1);
subject.subscribe({
  next(v) {
    // will only get 2
    console.log('subscriber 2: v =', v);
  }
});
subject.next(2);
```

## BehaviorSubject

* a `Subject` that retains the last value it emitted and
  automatically sends that as the first value to new subscribers
* example
```js
const subject = new Rx.BehaviorSubject(); // retains last value
```

## ReplaySubject

* a `Subject` that retains the last n values it emitted and
  automatically sends each of those as the initial values
  to new subscribers
* can optionally specify a number of milliseconds
  where no values emitted farther back in the past
  from the subscription time are emitted to new subscribers
* example
```js
const subject = new Rx.ReplaySubject(5); // retains last 5 values
```

## AsyncSubject

* like a `BehaviorSubject`, but the single value is
  not emitted to observers until its execution completes

## Operators

* static methods on `Observable` or methods on an instance
  that return a new Observable
* doesn't find the typical definition of an "operator"
* do not change the `Observable` on which they are called
* two categories, instance and static
* instance operators are methods on `Observable` instances
* static operators are functions attached to the `Rx.Observable` class

## Creation Operators
* all are static and start with `Rx.Observable.`
* create(fn)
  * creates an `Observable` where fn is passed an observer
    and can emit whatever it wants to that observer
* from(arr)
  * creates an `Observable` that emits all the values in the given array
* of(value1, value2, ...)
  * creates an `Observable` that works the same as `from`,
    but gets the values from separate arguments
* range(start, count)
  * creates an `Observable` that emits incrementing integers
    starting from `start` and `count` of them
  * ex. range(3, 4) emits 3, 4, 5, 6
* empty()
  * creates an `Observable` that doesn't emit any values
    and immediately completes
* interval(n)
  * creates an `Observable` that emits incrementing integers
    starting with zero every n milliseconds
* timer(initialDelay, subsequentDelay)
  * creates an `Observable` that emits zero after `initialDelay`
    and incrementing integers after every `subsequentDelay`
* merge(observable1, observable2, ...)
  * creates an `Observable` that combines the values
    from multiple Observables in the order they are output
* concat(observable1, observable2, ...)
  * creates an `Observable` that combines the values
    from multiple Observables in the order the observables are listed
  * all values from the first are emitted before
    the first value from the second, and so on
* fromEvent(domNode, eventName)
  * creates an `Observable` that emits events from a given DOM node
* fromPromise(promise)
  * creates an `Observable` that
    emits the resolved value and completes if the promise resolves
    or emits an error if the promise rejects
* throw(err)
  * creates an `Observable` that doesn't emit any values
    and immediately emits the given error
* others include bindCallback, bindNodeCallback, combineLatest,
  defer, forkJoin, fromEventPattern, never, timer, webSocket, zip

## Transformation Operators
* all are instance and called on an existing `Observable` object
* map(fn)
  * creates and returns a new `Observable` that passes
    each value emitted from its source `Observable` and
    emits the result of passing that value to the given function
  * the most commonly used operator
* pipe(operations)
  * creates and returns a new `Observable` that applies a series of operators
    to each value emitted by the target `Observable`
  * only works with "pipeable" (a.k.a. lettable) operators
    * these are pure functions available in the rxjs.operators package
      * ex.
        const (filter, map, reduce} = require('rxjs/operators');
        const removeEvens = filter(x => x % 2);
        // A function that returns an operator.
        const doubleBy = x => map(value => value * 2);
        const sum = reduce((acc, value) => acc + value, 0);
    * can also build custom lettable operators
  * provides an alternative to explicitly chaining operators
    that can decrease the bundle size
  * to use operators, these are equivalent
    * source$.let(op1).let(op2).let(op3).subscribe(result => ...);
    * source$.pipe(op1, op2, op3).subscribe(result => ...);
  * see http://reactivex.io/rxjs/class/es6/Observable.js~Observable.html#instance-method-pipe
* pluck(key1, key2, ...)
  * takes a path to a property in objects to be emitted
    and creates an `Observable` that emits only that property
  * the path is specified by an number of string arguments
  * ex. to extract "address.zip" from person objects,
    `pluck('address', 'zip')`
* scan((acc, value) => newValue, initialValue)
  * takes a function and an optional initial value like `Array map`
  * if an initial value is supplied, that is the first value emitted
  * then for each value emitted by the target Observable,
    the value returned by the function is emitted
  * commonly used to count the values that are emitted
* others include buffer, bufferCount, bufferTime, bufferToggle,
  bufferWhen, concatMap, concatMapTo, exhaustMap, expand,
  groupBy, mapTo, mergeMap, mergeMapTo, mergeScan, pairwise,
  partition, switchMap, switchMapTo, window, windowCount,
  windowTime, windowToggle, windowWhen

## Filtering Operators
* all are instance and called on an existing `Observable` object
* filter(predicate)
  * takes a function that is passed each emitted value and its index
  * the function should return true to emit the value
    and false to skip it
* others include audit, auditTime, debounce, debounceTime,
  distinct, distinctKey, distinctUntilChanged, distinctUntilKeyChanged,
  elementAt, first, ignoreElements, last, sample, sampleTime, single,
  skip, skipLast, skipUntil, skipWhile,
  take, takeLast, takeUntil, takeWhile,
  throttle, throttleTime

## Combination Operators
* concat(otherObservable)
  * creates and returns a new `Observable` the emits
    all the values from the target Observable
    followed by all the values from `otherObservable`
* startWith(value)
  * creates a stream where the first value is the specified one
    and the remaining values come from the target `Observable`
* others include combineAll, combineLatest, concatAll, exhaust, forkJoin,
  merge, mergeAll, race, switch, withLatestFrom, zip, zipAll

## Multicasting Operators
* includes cache, multicast, publish publishBehavior,
  publishLast, publishReplay, share

## Error Operators
* includes catch, retry, retryWhen

## Utility Operators
* do(nextFn, errorFn, completeFn)
  * creates an `Observable` that intercepts all calls to
    `next`, `error`, and `complete` and calls the given functions
    which can have side effects
  * emits the same values as the target Observable
  * useful for debugging
* toArray()
  * creates an `Observable` that collects all values emitted
    by the target `Observable` and emits them in a single array
    when the target `Observable` completes
* includes do, delay, delayWhen, dematerialize, finally,
  let, materialize, observeOn, subscribeOn, timeInterval,
  timestamp, timeout, timeoutWith, toPromise

## Conditional and Boolean Operators
* every(predicateFn)
  * creates an `Observable` that emits true
    if every value emitted by the target satisfies predicateFn
    and emits false otherwise
* find(predicateFn)
  * creates an `Observable` that emits the first value
    emitted by the target `Observable` that satisfies `predicateFn`
* others include defaultIfEmpty, find, findIndex, isEmpty

## Mathematical and Aggregate Operators
* count()
  * creates an `Observable` that emits the number of values
    emitted by the target `Observable` after it completes
* max()
  * creates an `Observable` that emits the largest value
    emitted by the target `Observable` after it completes
* min()
  * creates an `Observable` that emits the smallest value
    emitted by the target `Observable` after it completes
* reduce((acc, value) => newValue, initialValue)
  * takes a function and an optional initial value like `Array map`
  * emits the result of reducing all the values
    emitted by the target `Observable` after it completes

What about select and pipe?
Are those specific to ngrx?

## Schedulers
* control when a subscription begins
  and when notifications are delivered
