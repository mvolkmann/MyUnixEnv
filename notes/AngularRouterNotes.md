# Angular Router Notes

## Basic Setup
* modify app.module.ts to follow this pattern
```js
...
import {RouterModule, Routes} from '@angular/router';

const appRoutes: Routes = [
  {path: 'foo', component: FooComponent},
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

* add this to app.component.html
```html
<router-outlet></router-outlet>
```

* browse these URLs
  * http://localhost:4200/foo
  * http://localhost:4200/bar
  * http://localhost:4200

## Route Paths