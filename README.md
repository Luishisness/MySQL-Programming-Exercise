MySQL Programming Exercise
Greenwich Village Veterinary Practice

10/27/2014: Clarifications added

In this case study, you have been hired by a small veterinary practice of three veterinarians in Greenwich Village. Each vet takes care of specific animals within the practice. You have been given a table with the following information on every one of animals in their care. They have asked you to design a database. You may assume the following:

You may assume that each pet has only one owner (but a given family can have many pets).
You may assume that each animal is assigned primarily to one veterinarian.
For this exercise, you may assume that each animal , owner, and veterinarian has a unique name so that you can work with these tables with textual data rather than using AUTO_INCREMENT to create surrogate keys if you prefer.
Here are the data that you have been given as though in a spreadsheet:

animal's name
type of animal (dog, cat, bird etc.)
breed (if relevant; for example, the dog could be a poodle, a French bulldog, a dachsund, etc)
owner's name
owner's email
owner's mobile
name of the primary veterinarian assigned to the animal's care
veterinarian's mobile
veterinarian's email
is the animal male or female?
animal's date of birth
owner's address (street, borough/city and zip code suffice for this exercise)
immunizations: for each immunization given, track the cost, name and date
Part 1

Write one or more .SQL scripts to create all of the tables (including any controlled vocabularies) that you need and insert at least five records into each table.
Added 10/29/2014 Note: You only need three records in the table of veterinarians.
HINTS:
This is a sample database; do feel free to make up all of the data (but try to pick animals and breeds that make sense, e.g. a poodle is a dog, not a cat!)
Be sure to define a unique PRIMARY KEY for every table.
Include any FOREIGN KEY information in your script where it applies.
Part 2

Write queries to answer the following questions:

Display the name of the animal, type of animal and breed (if available) for all of the animals who live with owners in our zip code (10012).
How many female cats are in the practice combined?
How many poodles are in the practice? (A poodle is a dog.)
List every dog and its owner on file by name in alphabetical order by the owner's last name along with every immunization and the date.
How much money has this veterinary practiced charged for immunizations for dogs during the current year?
What to submit:

Go to NYU/Classes and submit the following:

your MySQL script (.sql file) that you used to create the data
your MySQL script (.sql file) that you used to run the queries
a transcript of all or part of your session on i6 and/or screenshots of queries in PHPMyAdmin
Note: If you work in PHPMyAdmin, please be sure to write out all of your queries and all of your table structures and submit that information along with at least three screenshots capturing how you worked with the data. You can use STRUCTURE / PRINT VIEW to capture the table structures.
