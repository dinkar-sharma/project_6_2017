/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   queueProg.cpp
 * Author: mikeakl
 *
 * Created on August 1, 2017, 6:49 PM
 */
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <asm/types.h>

/*
#define DWORD  __u32
#define WORD   unsigned short
#define BYTE   unsigned char
#define LPSTR  char*
*/
#include <PCANBasic.h>

#define PCAN_DEVICE		PCAN_USBBUS1

#include <stdlib.h>
#include <iostream>
#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>  // Connector/C++ exceptions could be used 
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>

using namespace std; 

typedef struct MMessage{
    BYTE nodeID;
    BYTE  requestedFloor;
    string  doorState;
    BYTE  currentFloor;    
} MMsg_t;

/*********PROTOTYPES*********************/
int table_query(MMsg_t *CANMsg);
int read_current_floor(void);
void table_delete_query(void);
/****************************************/


int read_current_floor(void){
    
    int cFVal = 0;
    sql::Driver *driver;	// Pointer to MySQL driver object
    sql::Connection *con;	// Pointer to database connection object
    sql::Statement *stmt;	// Pointer to statement object
    sql::ResultSet *res;	// Pointer to ResultSet object

    /* Create a connection */
    driver = get_driver_instance();
    con = driver->connect("tcp://127.0.0.1:3306", "root", ""); // IP and password of MySQL server database 
    con->setSchema("elevator_project_2017");	// Connect to the MySQL "test" database - replace with your database
    
    /* Execute a query and wait for result */ 
    stmt = con->createStatement(); 
    res = stmt->executeQuery("SELECT currentFloor FROM cFloor_table");  // Query (see previous lectures)
    //cout << "TEST CURRENT_FLOOR " << endl;
    while (res->next()) {
        cFVal = res->getInt(1);
    }
    
    /* Clean up pointers */
    delete res;
    delete stmt;
    delete con;
    
    return cFVal;
}

int table_query(MMsg_t *CANMsg){
    
    sql::Driver *driver;	// Pointer to MySQL driver object
    sql::Connection *con;	// Pointer to database connection object
    sql::Statement *stmt;	// Pointer to statement object
    sql::ResultSet *res;	// Pointer to ResultSet object
    int count = 0;
    
    /* Create a connection */
    driver = get_driver_instance();
    con = driver->connect("tcp://127.0.0.1:3306", "root", ""); // IP and password of MySQL server database 
    con->setSchema("elevator_project_2017");	// Connect to the MySQL "test" database - replace with your database

    /* Execute a query and wait for result */  
            
    stmt = con->createStatement(); 
    
    res = stmt->executeQuery("SELECT * FROM queue_table LIMIT 1");  // Query (see previous lectures)
    //cout << "TEST TABLE_QUERY " << endl;
    
    count = res->rowsCount();
   
    while (res->next()) {
//		cout << "\t.. MySQL replies:: ";
//		cout << res->getString(2) << endl;
//              cout << res->getString(2) << endl;
//              cout << res->getString(3) << endl;
            CANMsg->nodeID = res->getInt(2);
            //cout << "THIS IS A TEST: " << CANMsg->nodeID << endl;
            //cout << res->getInt(2) << " " << res->getInt(3) << " " << res->getString(4) << " " << res->getInt(5) << endl;
            CANMsg->requestedFloor = res->getInt(3);
            //CANMsg->doorState = res->getString(4);
            CANMsg->currentFloor = res->getInt(5);
            //test = res->getString(2);
	}
      
    /* Clean up pointers */
    delete res;
    delete stmt;
    delete con;
    
    return count;
}

void table_delete_query(void){
    
    sql::Driver *driver;	// Pointer to MySQL driver object
    sql::Connection *con;	// Pointer to database connection object
    //sql::Statement *stmt;	// Pointer to statement object
    sql::PreparedStatement  *prep_stmt;
    sql::ResultSet *res;	// Pointer to ResultSet object

    /* Create a connection */
    driver = get_driver_instance();
    con = driver->connect("tcp://127.0.0.1:3306", "root", ""); // IP and password of MySQL server database 
    con->setSchema("elevator_project_2017");	// Connect to the MySQL "test" database - replace with your database

    /* Execute a query and wait for result */  
    //cout << "TEST DELETE_QUERY 1" << endl;       
    prep_stmt = con->prepareStatement("DELETE FROM queue_table LIMIT 1"); 
    //cout << "TEST DELETE_QUERY 2" << endl;
    //res = stmt->executeQuery("DELETE FROM queue_table LIMIT 1");  // Query (see previous lectures)
    prep_stmt->execute();
    //cout << "TEST DELETE_QUERY 3" << endl;
    cout << "TEST DELETE_QUERY 3" << endl;
    /* Clean up pointers */
    delete res;
    //delete stmt;
    delete prep_stmt;
    delete con;
    
}

int main(void)
{
    MMsg_t CANMsg;
    BYTE message = 0;
    TPCANMsg TXMessage;
    TPCANStatus TXStatus;
    //unsigned long ulIndex = 0;
    int x = 0;
    int cF = 0;
    int count = 0;
   
    TXStatus = CAN_Initialize(PCAN_DEVICE, PCAN_BAUD_125K, 0, 0, 0);
    printf("Initialize CAN: %x\n",(int)TXStatus);
    //printf("test %2x\n\n", message);

    while(1){ 
        TXMessage.ID = 0x100;
        TXMessage.LEN = 8;
        TXMessage.MSGTYPE = PCAN_MESSAGE_STANDARD;

        for (x = 0; x<8; x++){
            TXMessage.DATA[x]= 0x00;
        }
        
//        sql::Driver *driver;	// Pointer to MySQL driver object
//        sql::Connection *con;	// Pointer to database connection object
//        sql::Statement *stmt;	// Pointer to statement object
//        sql::ResultSet *res;	// Pointer to ResultSet object
//
//
//        /* Create a connection */
//        driver = get_driver_instance();
//        con = driver->connect("tcp://127.0.0.1:3306", "root", ""); // IP and password of MySQL server database 
//        con->setSchema("elevator_project_2017");	// Connect to the MySQL "test" database - replace with your database
//
//        /* Execute a query and wait for result */  
//
//        stmt = con->createStatement(); 
//    
//        res = stmt->executeQuery("SELECT * FROM queue_table");  // Query (see previous lectures)
//        
//        count = res->rowsCount();
        
        //cout << count << endl;
        
        count = table_query(&CANMsg);
        //printf("TEST1");
        
        while(count != 0){
        
            table_query(&CANMsg);

            //if (tempMsg == cF){
                message = CANMsg.requestedFloor + 4;
                //tempMsg = (CANMsg.requestedFloor + 4);
                TXMessage.DATA[0] = message;

                cF = read_current_floor();               
                if (cF != CANMsg.requestedFloor){
                    while(TXStatus == PCAN_ERROR_OK) {
                        TXStatus = CAN_Write(PCAN_DEVICE,&TXMessage);
                        if (TXStatus != PCAN_ERROR_OK){
                            break;
                        }
                        //TXMessage.DATA[0];
                        //ulIndex++;
                        //if ((ulIndex % 1000) == 0)
                              //  printf("  - T Message %i\n", (int)ulIndex);

                        //break;

                    }
                }


            cF = read_current_floor();
            
            if (cF == CANMsg.requestedFloor)
            {
               table_delete_query();
               sleep(3);
            }          
            
            break;

        }    
        //printf("STATUS %i\n", (int)Status);
    }
        return 0;
}