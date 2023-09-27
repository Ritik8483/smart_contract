// SPDX-License-Identifier: UNLICENSED      code is unlicensed

pragma solidity ^0.8.1;

contract Transactions {             //defines main contract called Transactions
    uint256 transactionCount;           //hold the no of transactions, declares a state variable 

    //address = type, from=variable name
// Events are used to log important information on the blockchain. In this case, the Transfer event is defined with various parameters that represent details of a transaction.
// it emits an event Transfer whenever a new transaction is added to the blockchain
     event Transfer(     
        address from,
        address receiver,
        uint amount,
        string message,
        uint256 timestamp,
        string keyword
    );
// It specifies the properties that a transaction will have, including sender.This is a custom data structure that represents a transaction
    struct TransferStruct {         
        address sender; //what properties this oject have and of what type they are going to be
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions; //means transactions variable is array of objects.It is an array of transfetStruct object

    //since this is a class we have to define a visibility function

    function addToBlockchain(
        address payable receiver,   //The Ethereum address of the receiver of the transaction.(Metamask account address)
        uint amount,        //The amount of cryptocurrency to be transferred in the transaction.(amount like 0.00001)
        string memory message,      //A string containing a message associated with the transaction.(Hello transaction)
        string memory keyword       //Another string that acts as a keyword associated with the transaction.(Hello keyword)
    ) public {
        transactionCount += 1;      //This line increments a counter named transactionCount by 1, which likely keeps track of the total number of transactions.
//creates a new TransferStruct object with the provided details, pushes it into the transactions array, and emits a Transfer event to log the transaction
        transactions.push(
            TransferStruct(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );

        emit Transfer(          //emits the Transfer event to log the transaction details. which represents details of transaction
            msg.sender,             //emitting events is a way to log information about transactions on the blockchain. 
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

// is public (can be called by anyone), has the view modifier (it does not modify the state of the contract), and returns an array of TransferStruct objects.
    function getAllTransactions()  
        public                  
        view
        returns (TransferStruct[] memory)
    {
        return transactions;        //returns all transactions data
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;        //returns the current value of transactionCount, indicating the total number of transactions recorded on the blockchain using this contract.
    }
}


//In this code snippet, emit is used to trigger the Transfer event. The event is then logged on the Ethereum blockchain, 
//and its data can be accessed by external applications, including React front-ends, by listening to events emitted by the contract.