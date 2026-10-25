USE SQLForge_AirlineDB;
GO

-- 1. Airports
CREATE TABLE dbo.Airports
(
	AirportID INT IDENTITY(1,1) PRIMARY KEY,
	AirportCode CHAR(3) NOT NULL UNIQUE,
	AirportName NVARCHAR(100) NOT NULL,
	City NVARCHAR(100) NOT NULL,
	Country NVARCHAR(100) NOT NULL
);
GO

-- 2. Passengers
CREATE TABLE dbo.Passengers
(
	PassengerID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(150) NOT NULL,
	Phone VARCHAR(10) NOT NULL,
	CreatedAt DATETIME2(0) NOT NULL
		CONSTRAINT DF_Passengers_CreatedAt
		DEFAULT SYSUTCDATETIME()
);
GO

-- 3. Flights
CREATE TABLE dbo.Flights
(
	FlightID INT IDENTITY(1,1) PRIMARY KEY,
	FlightNumber VARCHAR(10) NOT NULL,
	OriginAirportID INT NOT NULL,
	DestinationAirportID INT NOT NULL,
	DepartureTime DATETIME2(0) NOT NULL,
	ArrivalTime DATETIME2(0) NOT NULL,
	SeatCapacity INT NOT NULL,
	FlightStatus VARCHAR(20) NOT NULL
		CONSTRAINT DF_Flights_Status DEFAULT 'Scheduled',

	CONSTRAINT FK_Flights_Origin
		FOREIGN KEY (OriginAirportID)
		REFERENCES dbo.Airports(AirportID),

	CONSTRAINT FK_Flights_Destination
		FOREIGN KEY (DestinationAirportID)
		REFERENCES dbo.Airports(AirportID),

	CONSTRAINT CK_Flights_Times
		CHECK (ArrivalTime > DepartureTime),

	CONSTRAINT CK_Flights_SeatCapacity
		CHECK (SeatCapacity > 0),

	CONSTRAINT CK_Flights_FlightStatus
		CHECK (FlightStatus IN 
			('Scheduled', 'Departed', 'Completed', 'Cancelled'))
);
GO

-- 4. Bookings
CREATE TABLE Bookings
(
	BookingID INT IDENTITY(1,1) PRIMARY KEY,
	BookingReference VARCHAR(12) NOT NULL UNIQUE,
	FlightID INT NOT NULL,
	BookingDate DATETIME2(0) NOT NULL
		CONSTRAINT DF_Bookings_Date
		DEFAULT SYSUTCDATETIME(),

	BookingStatus VARCHAR(20) NOT NULL
		CONSTRAINT DF_Bookings_Status
		DEFAULT 'Confirmed',

	CONSTRAINT FK_Bookings_Flights
		FOREIGN KEY (FlightID)
		REFERENCES dbo.Flights(FlightID),

	CONSTRAINT CK_Bookings_Status
		CHECK (BookingStatus IN 
			('Confirmed', 'Cancelled', 'Completed'))
);
GO

-- 5. Passengers linked to each booking
CREATE TABLE dbo.BookingPassengers
(
	BookingPassengerID INT IDENTITY(1,1) PRIMARY KEY,
	BookingID INT NOT NULL,
	PassengerID INT NOT NULL,
	TicketNumber VARCHAR(20) NOT NULL UNIQUE,
	SeatNumber VARCHAR(5) NULL,
	FareAmount DECIMAL(12,2) NOT NULL,
	TicketStatus VARCHAR(20) NOT NULL
		CONSTRAINT DF_Ticket_Status DEFAULT 'Confirmed',

	CONSTRAINT FK_BP_Bookings
		FOREIGN KEY (BookingID)
		REFERENCES dbo.Bookings(BookingID),

	CONSTRAINT FK_BP_Passengers
		FOREIGN KEY (PassengerID)
		REFERENCES dbo.Passengers(PassengerID),

	CONSTRAINT UQ_BookingPassenger
		UNIQUE (BookingID, PassengerID),

	CONSTRAINT CK_BP_Fare
		CHECK(FareAmount >=0),

	CONSTRAINT CK_BP_TicketStatus
		CHECK (TicketStatus IN
			('Confirmed', 'Concelled', 'Flown'))
);
GO

PRINT 'SQLForge Airline database created successfully.';

-- 1. Remove the old constraint with the typo
ALTER TABLE BookingPassengers
DROP CONSTRAINT CK_BP_TicketStatus;

-- 2. Add the new constraint with the correct spelling
ALTER TABLE BookingPassengers
ADD CONSTRAINT CK_BP_TicketStatus
	CHECK (TicketStatus IN 
		('Confirmed', 'Cancelled', 'Flown'))