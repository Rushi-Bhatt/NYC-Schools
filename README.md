# NYC-Schools
Take Home Assignment representing various NYC schools 

## Instructions: 
To build and run the program, simply use xcodeproj file. No additonal setup required.

## Assumptions in requirement: 
1) We are not allowed to make any changes in the BE structure of the endpoints [No Pagination and have to fetch the entire response at once]
2) School and SATDetails objets are kept separate [even though the API should provide the SATDetails for a particular school id, rather than dumping the data of all schools] 
3) All the navigations are Push for details, and modal for quick actions. 
4) If the schools are missing the SAT scores, we are displaying "N/A" in place.
5) In the interest of time, Few UI specs are not implemented to exactly be production ready, and more focus has been given on architecting the app better 
6) Test coverage was not factored in while writing test cases, and only few Unit tests have been added. In the interest of time and Considering the simple nature of the app, **UI Testing and Functional Testing has been ommited for the purpose of this exercise** 
7) No considetation has been given to Instrumentation, experimentation, CI/CD Pipeline or any other thing that a production ready app should include 

## Design Decisions: 
* MVVM model with following objects: 
  * Models -> School and SchoolSATDetail
  * ViewModels ->  SchoolOverviewCellViewModel, HomeViewModel and SchoolDetailsViewModel 
  * Views ->  SchoolOverviewCell, HomeViewController, SchoolDetailsViewController

* SecurityTableViewCell is reused with proper configurations in each screen 
* SecurityManager instance is created to provide a generic security handling
* SecurityService protocol is created, along with providing capablity to promote dependency injection, and LocalSecurityService is used as a concrete implemention 
* Proper Localization is handled using scalable Helper classes, and 2 sample locales are added (FR and ES) 
* Generic reusable Extensions are provided to ease the coding process 
* Removed Storyboards in order to promote programmtic UI
* No third party dependency usage
* Appropriate Unit tests are added for the viewModels and services 

## Further Improvements: 
* All required improvements are marked with TODO in the codebase 
* All the constants used in constraints should be moved to a separate Constant struct within that class: 
```
struct Constant {
   let parentStackViewLeadingMargin: Float = 5.0 
   let parentStackViewTrailingMargin: Float = -5.0
   ....
}

Usage: 
```
parentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.parentStackViewLeadingMargin)
```

* Better extensions to handle the NSLayoutConstraints code. (exp. pinEdges func on UIView that adds all 4 directional constraints)

```
titleLabel.pinEdges(to: contentView, edges: [.top(Constant.titleTopMargin), .bottom(Constant.titleBottomMargin)])
```
* In general, Following separations could benefit the design: 
  * Interfaces: All public backend interfaces and enums.
  * Foundation: All public extensions and constants.
  * Localization: All Localization logic and helper classes. 
  * UI: All public reusable UI components like alert, toast and progress bar. 
  * And then all the domains can use above frameworks as a dependency to faciliate coding process. 
* SwiftLint and Fastlane integration could benefit the developement process and enforce the coding guidelines 
