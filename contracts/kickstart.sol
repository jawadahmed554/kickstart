pragma solidity ^0.4.19;



contract kickstartCampaign {
    
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        mapping(address => bool) approvals;
        uint approvalsCount;
        
    }
    
    modifier onlyManager() {
        msg.sender == manager;
        _;
    }
    
    
    address public manager;
    uint public minimumContribution;
    Request[] public requests;
    mapping(address => bool) public approvers;
    
    
    constructor kick(uint minimum) public {
        msg.sender == manager;
        minimumContribution = minimum;
        
    }
    
    function contribute() public {
        require(msg.value >= minimumContribution);
        approvers[msg.sender] == true;
        
    }
    
    function createRequest(string _description, uint _value, address _recipient) public onlyManager {
        Request[] memory newRequest;
        newRequest.description = _description;
        newRequest.value = _value;
        newRequest.recipient = _recipient;
        newRequest.complete = false;
        newRequest.approvalsCount = 0;
        
        
        
        requests.push(newRequest);
    }
    
  

}