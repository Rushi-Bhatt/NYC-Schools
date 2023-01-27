# NYC-Schools
Take Home Assignment representing various NYC schools 

## Instructions: 
To build and run the program, simply use xcodeproj file. No additonal setup required.

## Requirements: 
1) Display a list of NYC High Schools.
    * Get your data here: https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2
2) Selecting a school should show additional information about the school
    * Display all the SAT scores - include Math, Reading and Writing.
        * SAT data here: https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
        * It is up to you to decide what additional information to display
        
## Assumptions in requirement: 
1) We are not allowed to make any changes in the BE structure of the endpoints [No Pagination and have to fetch the entire response at once]
2) **School** and **SchoolSATDetail** objets are kept separate [even though the API should provide the SATDetails for a particular school id, rather than dumping the data of all schools] 
3) All the navigations are Push for details, and modal for quick actions. 
4) If the schools are missing the SAT scores, we are displaying "N/A" in place.
5) In the interest of time, Few UI specs are not implemented to exactly be production ready, and more focus has been given on architecting the app better. 
6) Test coverage was not factored in while writing test cases, and only few Unit tests have been added. In the interest of time and Considering the simple nature of the app, **UI Testing and Functional Testing has been ommited for the purpose of this exercise** 
7) **No considetation** has been given to Instrumentation, experimentation, **Accessibility**, CI/CD Pipeline or any other thing that a production ready app should include. 

## Design Decisions: 
* MVVM model with following objects: 
  * Models -> School and SchoolSATDetail
  * ViewModels ->  SchoolOverviewCellViewModel, HomeViewModel and SchoolDetailsViewModel 
  * Views ->  SchoolOverviewCell, HomeViewController, SchoolDetailsViewController

* RouterProtocol is created to handle the navigation throughout the app. Concrete implmentation Router is injected in service. 
* NetworkProtocol is created to handle the URLSessions and other network queries. Concrete implementation Network is injected in service.
* SchoolServiceProtocol is created to handle APIs. Concrete implementation SchoolService is injected in ViewModels
* ViewModelProtocol is created to expose all the properties/methods that VC/Views needs to access. Concrete implementation ViewModel is injected in ViewControllers/Views.
* Proper Localization is handled using scalable Helper classes (but respective localization is to be configured in project).
* Generic reusable Extensions are provided to ease the coding process for UI components. 
* No Storyboards in order to promote programmtic UI.
* No third party dependency usage.
* Some Unit tests are added for the viewModels and services, although in the interest of time, most ommitted.

## Further Improvements:  
* All required improvements are marked with TODO in the codebase 
* SchoolDetailsViewController can be refactored to use UITableView, nested stackviews overcomplicate the design. All different sections can further be separated into their own views and viewModels.
* All the constants used in constraints should be moved to a separate Constant struct within that class: 
```
struct Constant {
   let parentStackViewLeadingMargin: Float = 5.0 
   let parentStackViewTrailingMargin: Float = -5.0
   ....
}

Usage: 

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

## Screenshots:
<img src = "https://user-images.githubusercontent.com/21224635/215017484-6b98c0ae-3b7c-43e3-bfb3-c1e3c401dc4a.png" width = 300>
<img src = "https://user-images.githubusercontent.com/21224635/215017522-055aa91f-1f18-4c6b-9660-83738d67f15f.png" width = 300>
<img src = "https://user-images.githubusercontent.com/21224635/215017722-204666a3-d781-417a-9514-c51866573365.png" width = 300>
<img src = "https://user-images.githubusercontent.com/21224635/215017747-9e94572b-81a8-4e22-bdd3-95b049603086.png" width = 300>
<img src = "https://user-images.githubusercontent.com/21224635/215017754-e8e8cabc-6a89-40d6-b5c2-97bfccff76b1.png" width = 300>
<img src = "https://user-images.githubusercontent.com/21224635/215017765-95ee01fe-f5ee-440f-a071-51d6f0d6b16a.png" width = 300>
