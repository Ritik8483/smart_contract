// SPDX-License-Identifier: UNLICENSED      code is unlicensed

pragma solidity ^0.8.1;

contract Transactions {             //defines main contract called Transactions
    uint256 transactionCount;           //hold the no of transactions, declares a state variable 

    //address = type, from=variable name
// Events are used to log important information on the blockchain. In this case, the Transfer event is defined with various parameters that represent details of a transaction.
     event Transfer(     
        address from,
        address receiver,
        uint amount,
        string message,
        uint256 timestamp,
        string keyword
    );
// It specifies the properties that a transaction will have, including sender
    struct TransferStruct {         
        address sender; //what properties this oject have and of what type they are going to be
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions; //means transactions variable is array of objects

    //since this is a class we have to define a visibility function

    function addToBlockchain(
        address payable receiver,
        uint amount,
        string memory message,
        string memory keyword
    ) public {
        transactionCount += 1;

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
            msg.sender,
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

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
