/* Phase 2 - Rebuilding tables to prepare for data import */
/* Airline booking system: aircraft, airports, flights, bookings, tickets, seats, boarding passes */

CREATE TABLE zBooking (
    Booking_reference Varchar2(6),
    Booking_date date NOT NULL,
    Booking_Total_Amount numeric(10,2) NOT NULL,
    constraint zbooking_Reference_PK Primary Key (Booking_reference)
);


CREATE TABLE zAircraft (
    Aircraft_Code Varchar2(3),
    Aircraft_Model Varchar2(100) NOT NULL,
    Aircraft_Range Integer NOT NULL,
    CONSTRAINT zAircraft_PK Primary Key (Aircraft_Code)
);

CREATE TABLE zAirport (
    Airport_Code Varchar2(3),
    Airport_Name Varchar2(150) NOT NULL,
    Airport_city Varchar2(100) NOT NULL,
    Airport_Latitude Number(11,8),
    Airport_Longitude Number(12,8),
    Airport_time_zone Varchar2(75) NOT NULL,
    CONSTRAINT zAirport_PK Primary Key (Airport_Code)
);


CREATE TABLE zSeat (
    Aircraft_Code Varchar2(3),
    Seat_No Varchar2(4),
    Fare_Class Varchar2(10) NOT NULL,
    CONSTRAINT zSeat_PK Primary Key (Aircraft_Code, Seat_No),
    CONSTRAINT zSeat_FK FOREIGN KEY (Aircraft_Code) references zAircraft(Aircraft_Code)
);

CREATE TABLE zTicket (
    Ticket_No Varchar2(13),
    Booking_Reference Varchar2(6) NOT NULL,
    Passenger_Id Varchar2(20) NOT NULL,
    CONSTRAINT zTicket_PK Primary Key (Ticket_No),
    CONSTRAINT zTicket_FK Foreign KEY (Booking_Reference) references zBooking(Booking_Reference)
    );

CREATE TABLE zBoarding_Pass (
    Ticket_No Varchar2(13),
    Flight_Id integer,
    Boarding_No integer NOT NULL,
    Seat_No Varchar2(4) NOT NULL,
    CONSTRAINT zBoarding_Pass_PK Primary Key (Ticket_No, Flight_Id),
    CONSTRAINT zBoarding_Pass_FK FOREIGN KEY (Ticket_No) references zTicket(Ticket_No)
);


CREATE TABLE zFlight (
    Flight_Id integer,
    Flight_No Varchar2(6) NOT NULL,
    Scheduled_Departure Date NOT NULL,
    Scheduled_Arrival Date  NOT NULL,
    Departure_Airport_Code Varchar2(3),
    Arrival_Airport_Code Varchar2(3),
    Flight_Status Varchar2(20) NOT NULL,
    Aircraft_Code Varchar2(3),
    Actual_Departure Date,
    Actual_Arrival Date,
    CONSTRAINT zFlight_PK Primary KEY (Flight_Id),
    CONSTRAINT zDeparture_Airport_Code_FK FOREIGN KEY (Departure_Airport_Code) References zAirport(Airport_Code),
    CONSTRAINT zArrival_Airport_Code_FK FOREIGN KEY (Arrival_Airport_Code) References zAirport(Airport_Code),
    CONSTRAINT zAircraft_Code_FK FOREIGN KEY (Aircraft_Code) References zAircraft(Aircraft_Code)
);

CREATE TABLE zTicket_Flight (
    Ticket_No Varchar2(13),
    Flight_Id integer,
    Price_Per_Ticket Number(10,2) NOT NULL,
    CONSTRAINT zTicket_Flight_PK Primary Key (Ticket_No, Flight_Id),
    CONSTRAINT zTicket_No_FK FOREIGN KEY (Ticket_No) references zTicket(Ticket_No),
    CONSTRAINT zFlight_Id_FK FOREIGN KEY (Flight_Id) references zFlight(Flight_Id)
);
