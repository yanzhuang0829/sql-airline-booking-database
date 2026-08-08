/* Phase 1 - Building the Database */
/* Airline booking system: aircraft, airports, flights, bookings, tickets, seats, boarding passes */

/* Team # 3 */
/* Participating members: Hebe Lee, Juan Marco Salaverria Ungo, Yan Zhuang */
/* Team Leader: Yan Zhuang */


CREATE TABLE zBOOKING

(Booking_Reference VARCHAR2 (6) Primary Key,
    Booking_date TIMESTAMP Not NULL,
        Booking_Total_Amount NUMBER(9,2));

        CREATE TABLE zTICKET
        (Ticket_No NUMBER(13,0),
            Booking_Reference VARCHAR2(6) NOT NULL,
                Passenger_Id VARCHAR2(20) NOT NULL,

                       CONSTRAINT zTICKET_PK PRIMARY KEY (Ticket_No),
                          CONSTRAINT zTICKET_FK FOREIGN KEY (Booking_Reference) references zBooking(Booking_Reference));  



                                CREATE TABLE zAIRCRAFT
                                (Aircraft_Code VARCHAR2(3),
                                    Aircraft_Model VARCHAR2(20) NOT NULL,
                                        Aircraft_Range NUMBER(7,0) NOT NULL,

                                               CONSTRAINT zAIRCRAFT_PK PRIMARY KEY (Aircraft_Code));


                                                  CREATE TABLE zAIRPORT
                                                  (Airport_Code CHAR(3),
                                                      Airport_Name VARCHAR2(50) NOT NULL,
                                                          Airport_City VARCHAR2(20) NOT NULL,
                                                              Airport_Latitude NUMBER(11,8) NOT NULL,
                                                                  Airport_Longitude NUMBER(12,8) NOT NULL,
                                                                      Airport_Time_Zone CHAR(20) NOT NULL,

                                                                             CONSTRAINT zAIRPORT_PK PRIMARY KEY (Airport_Code));




                                                                                   CREATE TABLE zFLIGHT
                                                                                   (Flight_ID NUMBER(8,0),
                                                                                       Airport_Code CHAR(3),
                                                                                           Flight_No VARCHAR2(6) NOT NULL,
                                                                                               Scheduled_Departure TIMESTAMP NOT NULL,
                                                                                                   Scheduled_Arrival TIMESTAMP NOT NULL,
                                                                                                       Departure_Airport_Code CHAR(3) NOT NULL,
                                                                                                           Arrival_Airport_Code CHAR(3) NOT NULL,
                                                                                                               Flight_Status VARCHAR2(19) NOT NULL,
                                                                                                                   Aircraft_Code VARCHAR2(3) NOT NULL,
                                                                                                                       Actual_Departure TIMESTAMP NOT NULL,
                                                                                                                           Actual_Arrival TIMESTAMP NOT NULL,
                                                                                                                               
                                                                                                                                  CONSTRAINT zFLIGHT_PK PRIMARY KEY (Flight_ID),
                                                                                                                                     CONSTRAINT zFLIGHT_FK FOREIGN KEY (Aircraft_code) references zAIRCRAFT (Aircraft_code),
                                                                                                                                        CONSTRAINT zFLIGHT_AIRPORT_FK FOREIGN KEY (Airport_code) references zAIRPORT (Airport_code));
                                                                                                                                            
                                                                                                                                             
                                                                                                                                              
                                                                                                                                               
                                                                                                                                                
                                                                                                                                                 CREATE TABLE zTICKET_FLIGHT
                                                                                                                                                 (Ticket_No NUMBER(13,0),
                                                                                                                                                     Flight_ID NUMBER(8,0) NOT NULL,
                                                                                                                                                         Price_Per_Ticket NUMBER(9,2) NOT NULL,
                                                                                                                                                             
                                                                                                                                                                CONSTRAINT zTICKET_FLIGHT_PK PRIMARY KEY (Ticket_No,Flight_ID),     
                                                                                                                                                                   CONSTRAINT zTICKET_FLIGHT_FK FOREIGN KEY (Flight_ID) REFERENCES zFLIGHT(Flight_ID),
                                                                                                                                                                      CONSTRAINT zTICKET_NO_FK FOREIGN KEY (Ticket_No) REFERENCES zTICKET(Ticket_No));
                                                                                                                                                                           
                                                                                                                                                                            
                                                                                                                                                                             
                                                                                                                                                                              
                                                                                                                                                                               CREATE TABLE zBOARDING_PASS
                                                                                                                                                                               (Ticket_No NUMBER (13,0),
                                                                                                                                                                                Flight_ID NUMBER (8,0) NOT NULL, 
                                                                                                                                                                                    Boarding_No VARCHAR2(20) NOT NULL,
                                                                                                                                                                                        Seat_No NUMBER(11,8) NOT NULL,
                                                                                                                                                                                            
                                                                                                                                                                                               CONSTRAINT zBOARDING_PASS_PK PRIMARY KEY (Ticket_No, Flight_ID),
                                                                                                                                                                                                  CONSTRAINT zBOARDING_PASS_FK FOREIGN KEY (Ticket_No) REFERENCES zTICKET(Ticket_No));  
                                                                                                                                                                                                     
                                                                                                                                                                                                        
                                                                                                                                                                                                         CREATE TABLE zSEAT
                                                                                                                                                                                                         (Aircraft_Code VARCHAR2(3) NOT NULL,          
                                                                                                                                                                                                             Seat_No VARCHAR2(4),                      
                                                                                                                                                                                                                 Fare_Class CHAR(8) NOT NULL,
                                                                                                                                                                                                                     
                                                                                                                                                                                                                        CONSTRAINT zSEAT_PK PRIMARY KEY (Seat_No, Aircraft_code),
                                                                                                                                                                                                                           CONSTRAINT zSEAT_FK FOREIGN KEY (Aircraft_Code) REFERENCES zAIRCRAFT (Aircraft_Code)); 
                                                                                                                                                                                                                                
                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                   /* ---------------------*/
                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                   /* End of Script */
                                                                                                                                                                                                                                   
