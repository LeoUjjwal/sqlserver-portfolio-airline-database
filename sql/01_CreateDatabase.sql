/*
	SQLForge Portfolio
	Project 01: Airline Reservation Database
	Run this setup script once.
*/

IF DB_ID(N'SQLForge_AirlineDB') IS NULL
BEGIN
	CREATE DATABASE SQLForge_AirlineDB;
END;
GO