# ngrx Notes

## Overview

* a set of Angular libraries that utilize RxJS
  * store - for state management that is very similar to Redux
  * effects - to model event sources as actions (asynchronous actions)
  * router-store - works with Angular Router
  * store-devtools - for time-travel debugging
  * entity - for managing record collections
  * schematics - scaffolding library

## @ngrx/store

* Overview
  * state is held in a single, immutable store
  * actions describe desired state changes
  * reducer functions take the current state and an action,
    and return a new state
  * the store is observable using RxJS

* See your ngrx-store-easy package in npm!

* Use in Angular components
  * two approaches to have a component re-render
    when the value at a state path changes
  * approach #1
    * add a component property that is an Observable
      * ex. speed$: Observable<number>;
    * set the property in the constructor
      * ex. constructor(private store: Store<AppState>) {
              this.speed$ = store.select('car', 'speed');
            }
    * use `async` pipe in HTML template
      ex. <div>Speed: {{speed$ | async}}</div>
  * approach #2
    * add a component property that is an Observable
      * ex. speed: number;
    * subscribe to the property in the constructor
      * ex. constructor(private store: Store<AppState>) {
              store.select('car', 'speed')).subscribe(
                speed => this.speed = speed;
              );
            }
    * do not use `async` pipe in HTML template
      ex. <div>Speed: {{speed}}</div>

  * What is the purpose of the store.pipe methods?
