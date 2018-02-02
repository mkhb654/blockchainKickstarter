
pragma solidity ^0.4.17;

contract campaignFactory {
   address[] public deployedcampaigns;


   function createCampaign(uint minimum) public {
     address newCampaign =  new Campaign(minimum, msg.sender);
     deployedcampaigns.push(newCampaign);
   }
   function getDeployedCampaigns() public view returns (address[]){
       return deployedcampaigns;
   }
}
contract campaign {
   //brand new type , not an instance of a variable  what is this? it is just outlining our request
   struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address=> bool) approvals;
   }
   //variables
   Request[] public requests;
   address public manager;
   uint minimumContribution;

   mapping(address => bool) public approvers;
   uint public approvalCount;

   modifier restricted(){
       require(msg.sender == manager);
       _;
   }
   function Campaign(uint minimum) public {
       manager = msg.sender;
       minimumContribution = minimum;

   }
   //need to send the greater of the minimum
   function contribute()public payable{
    require (msg.value > minimumContribution);
    approvers [msg.sender] = true;
    approversCount++;
   }


   }

   //create a new straut of type request and add
   function createRequest(string description, uint value, address recipient, )
       public restricted{
       require(approvers[msg.sender])
       Request meomory new Request = Request({
       descrption: description,
       value: value,
       recipient: recipient,
       complete: false
       approvalCount = 0;
       });
       Request(description, value, recipient, false);

       request.push(newRequest);

   }
   function approveRequst(uint index) public {
       Request storage request = request[index];

       request(approvers[msg.sender]);
       request(!request [index].approvals[msg.sender]);

       request[index]approvals[msg.sender] = true;
       request[index].approvalCount++;

   }
   function finalizeRequest(uint index )public restricted{
        Request storage  request = request[index];
        require(require.approvalCount > (approvalCount/ 2));
        require(!request[index].complete);
        request.recipient.transfer
        request.
