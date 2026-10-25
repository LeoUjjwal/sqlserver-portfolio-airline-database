USE SQLForge_AirlineDB;
GO

INSERT INTO Airports
	(AirportCode,AirportName,City,Country)
	VALUES
		('DEL', 'Indira Gandhi International Airport',
        'Delhi', 'India'),
    ('BOM', 'Chhatrapati Shivaji Maharaj International Airport',
        'Mumbai', 'India'),
    ('BLR', 'Kempegowda International Airport',
        'Bengaluru', 'India');

INSERT INTO Passengers
	(FirstName,LastName,Email,Phone)
	VALUES
		('Aarav', 'Sharma', 'aarav@example.com','9089788967'),
		('Priya', 'Verma', 'priya@example.com','9089788963'),
		('Rahul', 'Singh', 'rahul@example.com','9089788960'),
		('Neha', 'Kumar', 'neha@example.com','9189788966'),
		('Ananya', 'Das', 'ananya@example.com','9289788967');

INSERT INTO Flights
	(FlightNumber,OriginAirportID,DestinationAirportID,DepartureTime,ArrivalTime,SeatCapacity,FlightStatus)
	VALUES
	('SF101', 1, 2, '2026-11-10T08:00:00',
     '2026-11-10T10:10:00', 180, 'Scheduled'),
    ('SF102', 2, 3, '2026-11-10T12:00:00',
     '2026-11-10T13:50:00', 150, 'Scheduled'),
    ('SF103', 1, 3, '2026-11-11T09:00:00',
     '2026-11-11T11:40:00', 200, 'Scheduled');

INSERT INTO Bookings
	(BookingReference,FlightID,BookingDate,BookingStatus)
	VALUES
		('SFBOOK001', 1, '2026-10-01T10:00:00', 'Confirmed'),
		('SFBOOK002', 1, '2026-10-02T11:00:00', 'Confirmed'),
		('SFBOOK003', 2, '2026-10-03T12:00:00', 'Confirmed'),
		('SFBOOK004', 3, '2026-10-04T13:00:00', 'Cancelled');

SELECT * FROM BookingPassengers;


INSERT INTO BookingPassengers
	(BookingID,PassengerID,TicketNumber,SeatNumber,FareAmount,TicketStatus)
	VALUES
		(1, 1, 'SFT10001', '12A', 6500.00, 'Confirmed'),
		(1, 2, 'SFT10002', '12B', 6500.00, 'Confirmed'),
		(2, 3, 'SFT10003', '14A', 7200.00, 'Confirmed'),
		(3, 4, 'SFT10004', '08C', 4800.00, 'Confirmed'),
		(4, 5, 'SFT10005', '10A', 5200.00, 'Cancelled');

PRINT 'Sample data inserted successfully.';
GO