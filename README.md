# SQL Airline Booking Database

A relational database design for an airline booking system, covering aircraft, airports, flights, bookings, tickets, seats, and boarding passes. Built in Oracle SQL for CS 605 (Data Management and SQL), team project with Hebe Lee and Juan Marco Salaverria Ungo (team lead: Yan Zhuang).

## Schema

Eight tables model the core entities of an airline booking system, with primary/foreign key constraints enforcing referential integrity throughout (e.g. a ticket must reference a valid booking; a flight must reference a valid aircraft and valid departure/arrival airports).

| Table | Description |
|---|---|
| `zAIRCRAFT` | Aircraft models and range |
| `zAIRPORT` | Airport code, name, location, time zone |
| `zFLIGHT` | Scheduled/actual departure and arrival, linked to aircraft and departure/arrival airports |
| `zSEAT` | Seat number and fare class per aircraft |
| `zBOOKING` | Booking reference, date, and total amount |
| `zTICKET` | Ticket tied to a booking and passenger |
| `zTICKET_FLIGHT` | Links tickets to flights, with price per ticket |
| `zBOARDING_PASS` | Boarding number and seat assignment per ticket/flight |

## Files

| File | Description |
|---|---|
| `phase1_database_build.sql` | Initial DDL script creating all 8 tables with primary/foreign key constraints |
| `phase2_database_build.sql` | Revised DDL script, rebuilt to prepare the schema for importing sample data |
| `data_dictionary.xlsx` | Field-by-field data dictionary: descriptions, sample values, and data types for every table |
| `sample_data/` | Sample datasets used to populate the tables (aircraft, airports, flights, bookings, seats) |

## Tech stack

Oracle SQL (SQL Developer) — DDL, primary/foreign key constraints, relational schema design
