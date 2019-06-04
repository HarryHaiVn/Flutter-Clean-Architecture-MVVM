# Flutter Clean Architecture MVVM sample.
 Sample of flutter using Clean Architecture and MVVM.
# In this article, we show you how MVVM with Flutter could look like.
 We’ll create a functional reactive ViewModel using Darts Stream API.
# MVVM
 Before we look at any code, we should get a basic understanding of MVVM (Model-View-ViewModel).
# How does this look for my Android project?
# Module Structure
There are 3 main modules to help separate the code. They are Data, Domain, and Application.
   
- **Data** contains Local Storage, APIs, Data objects (Request/Response object, DB objects), and the repository implementation.
   
- **Domain** contains UseCases, Domain Objects/Models (Pojos/Kotlin Data Classes), and Repository Interfaces
   
- **Application** contains UI, View Objects, Android components, etc. Can be split into separate modules itself if needed. For example, we could have a module called Device handling things like camera, location, etc.
   
# Repository
 - Bridge between Data layer and Domain layer
 - Connects to data sources and returns mapped data
 - Data sources include DB, Api, and RxCache (Cache of data that is constantly emitting updates to subscribers. More on this in another post).
 - Always store mapped data. E.g. Store the domain objects in the RxCache.
# UseCase
 - Responsible for connecting to repository to retrieve necessary data. Can either return a Flowable that will emit each update (from RxCache), or a Single/Completable that finishes after result is retrieved.
 - This is where the business logic takes place.
 - Returns data downstream.
 - Single use.
 - Lives in Domain (No Android dependencies. Very testable).
# ViewModel
 - Organizes data and holds View state.
 - Talks to use cases.
 - Does not know about the View.
# View
 - Updates UI
 - Knows about the ViewModel
 - Observes changes to ViewModel.
# Router
 - I leave this open ended to suit each projects needs. The main point here is that it is important to consolidate navigation logic to one place. This helps with maintenance and unit testing.

