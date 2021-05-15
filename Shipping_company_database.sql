
CREATE TABLE Clients (
    ClientID int,
    FirstName varchar(255),
    LastName varchar(255),
    PhoneNumber int,
    Discount double(2,1),
    Constraint Clients_PK PRIMARY KEY (ClientID)
);

CREATE TABLE Contractors (
    ContractorID int,
    ContractorName varchar(255),
    PhoneNumber int,
    City varchar(255),
    Constraint Contractors_PK PRIMARY KEY (ContractorID)
);

CREATE TABLE Commissions (
    CommissionID int,
    ContractorID int,
    ContractorName varchar(255),
    CommisionDate date,
    Price int,
    MaturityDate date,
    Constraint Commissions_PK PRIMARY KEY (CommissionID),
    constraint CommissionsContractor_FK FOREIGN KEY (ContractorID) REFERENCES Contractors(ContractorID)
);

CREATE TABLE Vehicles (
    VehicleID int,
    VehicleMake varchar(255),
    VehicleModel varchar(255),
    LicencePlate varchar(255),
    Capacity varchar(255),
    LastServiceDate date,
    InsuranceNumber varchar(255),
    Constraint Vehicles_PK PRIMARY KEY (VehicleID)
);

CREATE TABLE Employees (
    EmployeeID int,
    FirstName varchar(255),
    LastName varchar(255),
    BirthDate date,
    EducationalBackground varchar(255),
    JobTitle varchar(255),
    HireDate date,
    Salary int,
    DefaultVehicle int,
    DrivingLicence varchar(255),
    PhoneNumber int,
    Country varchar(255),
    City varchar(255),
    BankAccountNumber varchar(255),
    Constraint Employees_PK PRIMARY KEY (EmployeeID),
    constraint DriversVehicle_FK FOREIGN KEY (DefaultVehicle) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE Out_Transactions_Commissions (
    OUTTransactionCommID int,
    TransactionType varchar(255),
    TransactorID int,
    Amount int,
    TransactionDate date,
    Constraint Outgoing_Transactions_Comm_PK PRIMARY KEY (OUTTransactionCommID),
    Constraint Outgoing_Transactor_Comm_FK FOREIGN KEY (TransactorID) REFERENCES Contractors(ContractorID)
);

CREATE TABLE Out_Transactions_Employees (
    OUTTransactionEmpID int,
    TransactionType varchar(255),
    TransactorID int,
    Amount int,
    TransactionDate date,
    Constraint Outgoing_Transactions_Emp_PK PRIMARY KEY (OUTTransactionEmpID),
    Constraint Outgoing_Transactor_Emp_FK FOREIGN KEY (TransactorID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Incoming_Transactions (
    INTransactionID int,
    TransactionType varchar(255),
    OrderID int,
    Transactor int,
    Amount int,
    TransactionDate date,
    Constraint Incoming_Transactions_PK PRIMARY KEY (INTransactionID)
);

CREATE TABLE Order_Details(
    OrderID int,
    ClientID int,
    DriverID int,
    VehicleID int,
    OrderWeight varchar(255),
    OrderDate date,
    PickupDate date,
    ExpectedDeliveryDate date,
    PickupAddress varchar(255),
    DeliveryAddress varchar(255),
    Price int,
    Cost int,
    MaturityDate date,
    Constraint Order_Details_PK PRIMARY KEY (OrderID),
    constraint Order_DetailsClient_FK FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    constraint Order_DetailsDriver_FK FOREIGN KEY (DriverID) REFERENCES Employees(EmployeeID),
    constraint Order_DetailsVehicle_FK FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE Orders (
    OrderID int,
    VehicleID int,
    DriverID int, 
    ClientID int, 
    INTransactionID int, 
    constraint OrdersOrder_FK FOREIGN KEY (OrderID) REFERENCES Order_Details(OrderID),
    constraint OrdersVehicle_FK FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    constraint OrdersDriver_FK FOREIGN KEY (DriverID) REFERENCES Employees(EmployeeID),
    constraint OrdersClient_FK FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    constraint OrdersINTransaction_FK FOREIGN KEY (INTransactionID) REFERENCES Incoming_Transactions(INTransactionID)
);
