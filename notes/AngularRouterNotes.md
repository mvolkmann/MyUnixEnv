# Angular Router Notes

## Basic Configuration
* modify app.module.ts to follow this pattern
```js
...
import {RouterModule, Routes} from '@angular/router'; 
const appRoutes: Routes = [
  {path: 'foo/:number', component: FooComponent},
  {path: 'bar', component: BarComponent},
  {path: '**', component: FooComponent} // default
];

@NgModule({
  ...
  imports: [
    ...,
    RouterModule.forRoot(appRoutes, {enableTracing: true})
  ],
  ...
})
...
```
Tracing outputs routing information in the devtools console.

## Passing Data To Route Components

* three ways
  * data specified in the route configuration
  * path parameters
  * query parameters
* to specify data in a route configuration,
  add a "data" property to the route object
  * value can be anything, but is typically
    an object containing many properties
* to access the data inside the component
```js
import {ActivatedRoute} from '@angular/router';
...
constructor(private route: ActivatedRoute) {
  route.data.subscribe(data => {
    // data is whatever was specified in the data property of the route.
    // Typically this is an object containing any number of properties.
  });
  route.paramMap.subscribe(map => {
    // map.params is a map of the path parameters
  });
  route.queryParamMap.subscribe(map => {
    // map.params is a map of the query parameters
  });
  // In all three cases it is often desirable to set
  // component properties that are used in the template.
}

## Route Paths

* path property values in the appRoutes array can contain path parameters
* ex. '/car/:make/:model'

## Route Links

```html
<a routerLink="foo">Foo</a>
<a routerLink="bar">Bar</a>
```

## Route Rendering

* add the following, perhaps in app.component.html
```html
<router-outlet></router-outlet>
```

## Changing Route Programmatically
* include Router like this:
```js
constructor(private router: Router) { ... }
```
* change route like this:
```js
router.navigate([routePath]);
```
* note that an array of "commands" is passed
* both "foo" and "/foo" work for the routePath
* when would more than one "command" be passed?

## Demo
* browse these URLs
  * http://localhost:4200/foo
  * http://localhost:4200/bar
  * http://localhost:4200

