pragma solidity ^0.7.4;

contract Crud {
    struct PartnerVialTransaction {
        uint id;
        uint vialId;
        string partnerName;
        uint temperature;
        uint light;
        uint latitude;
        uint longitude;
    }
    PartnerVialTransaction[] public partnerVialTransactionsList;
    uint public nextId;
    
    function create(uint vialId, string memory partnerName, uint temperature, uint light, uint latitude, uint longitude ) public {
        partnerVialTransactionsList.push(PartnerVialTransaction(nextId, vialId, partnerName, temperature, light, latitude, longitude));
        nextId++;
    }
    
    function read(uint id) view public returns(uint, uint, string memory, uint, uint, uint, uint) {
        for(uint i = 0; i< partnerVialTransactionsList.length; i++){
            if(partnerVialTransactionsList[i].id == id ){
                return(partnerVialTransactionsList[i].id, partnerVialTransactionsList[i].vialId,  partnerVialTransactionsList[i].partnerName, partnerVialTransactionsList[i].temperature, partnerVialTransactionsList[i].light, partnerVialTransactionsList[i].latitude, partnerVialTransactionsList[i].longitude );
            }
        }
        
    }
    

    function update(uint id, string memory partnerName) public {
       for(uint i =0; i<partnerVialTransactionsList.length; i++){
            if(partnerVialTransactionsList[i].id == id ){
                partnerVialTransactionsList[id].partnerName = partnerName;
            }
        }
    }

    function destroy(uint id) public {
        delete partnerVialTransactionsList[id];
    }
}

