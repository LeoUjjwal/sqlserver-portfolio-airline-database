USE SQLForge_AirlineDB;
GO

SELECT 
	b.BookingReference,
	f.FlightNumber,
	p.FirstName + N' ' + p.LastName AS PassengerName,
	bp.TicketNumber,
	bp.TicketStatus
	FROM dbo.Bookings AS b
	INNER JOIN dbo.Flights AS f
		ON f.FlightID = b.FlightID
	INNER JOIN dbo.BookingPassengers as bp
		ON bp.BookingID = b.BookingID
	INNER JOIN dbo.Passengers p
		on p.PassengerID = bp.PassengerID
	ORDER BY b.BookingReference,bp.TicketNumber;

-- Query B: Revenue by flight
-- Only confirmed bookings and confirmed tickets contribute to this example's confirmed fare total.

SELECT 
	f.FlightNumber,
	COUNT(bp.BookingID) AS ConfirmedTickets,
	SUM(bp.FareAmount) as TotalConfirmedFare
	FROM dbo.Flights AS f
	INNER JOIN dbo.Bookings AS b
		ON b.FlightID = f.FlightID
	INNER JOIN dbo.BookingPassengers AS bp
		ON bp.BookingID = b.BookingID
		WHERE b.BookingStatus = 'Confirmed'
			AND bp.TicketStatus = 'Confirmed'
		GROUP BY f.FlightNumber
		ORDER BY TotalConfirmedFare DESC;

-- Query C: Flight occupancy
-- Calculate the percentage of seats occupied by confirmed tickets for each flight.

SELECT 
	f.FlightNumber,
	f.SeatCapacity,
	COUNT(bp.BookingPassengerID) AS ConfirmedPassengers,
	CAST
	(
		100.0 * COUNT(bp.BookingPassengerID)
			  / NULLIF(f.SeatCapacity,0) AS DECIMAL(5,2)
	) AS OccupancyPercentage
	FROM dbo.Flights AS f
	LEFT JOIN dbo.Bookings AS b
		ON b.FlightID = f.FlightID
		AND b.BookingStatus = 'Confirmed'
	LEFT JOIN dbo.BookingPassengers AS bp
		ON bp.BookingID = b.BookingID
		AND bp.TicketStatus = 'Confirmed'
	GROUP BY f.FlightNumber,f.SeatCapacity
	ORDER BY OccupancyPercentage DESC;