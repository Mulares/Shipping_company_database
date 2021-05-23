# Shipping_company_database

## Table of contents
1. [Introduction](#Introduction)
2. [Technologies](#Technologies)
3. [Setup](#Setup)

## Introduction

The goal of this project is creation of a database of shipping company. The first step was the design of database and creation of all the tables on a local server. 
Diagram of this database is presented in the "Database_Diagram.png" file. Afterwards, using python, all the data was randomly generated in a realistic manner. 
Then the data was uploaded into the MySQL local server.

## Technologies

* Software to open a Jupyter notebook file
* MySQL Workbench 8.0
* Python 3.9.2  
  * Pandas 1.2.3
  * Numpy 1.20.1
  * Matplotlib 3.3.4
  * Os
  * Random
  * Datetime
  * String
  * Dateutil 2.8.1
  * Mysql.connector 8.0.24
  
## Setup
In order to run this project, a connection to MySQL server is necessary. First, a new schema called "company" must be created, then the script "Shipping_company_database.sql" 
should be run, to create all the tables. 

Afterwards, running the cells of the jupyter notebook file "Shipping_company_database.ipynb" will generate all the data in tables (the .txt files present in the repository are 
necessary for the generation to go correctly, as the data in them will be used for all names). The code in the Inserting data into the server section will connect to the 
server and upload the data. However, the host, user and password values are only placeholder values and the need to be changed for the ones used earlier to connect to the MySQL server.
