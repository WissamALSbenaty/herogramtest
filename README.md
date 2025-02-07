

Project arhitecture 

It Depends on Clean architecture and Test driven development princples "TDD"

the project consists of core file which contains the frequantly used files, it has controllers, presentation and utils

the data layer represent data source layer which consists of models,repos, errors, clients

each feature file represents a single feature with its pages, widgets,controllers

the third parties module represents the outsourse packages where can be easy replaced 

the state management of the application is Mobx where it relay on reactive programming princples 