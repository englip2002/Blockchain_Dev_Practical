//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ballot {
    struct Voter {
        uint256 weight;
        bool voted;
        uint8 vote;
        uint256 createTime;
        Stage stage;
    }

    struct Proposal {
        uint256 proposalID;
        string topic;
        uint256 voteCount;
    }

    enum Stage {
        Init,
        Reg,
        Vote,
        Done
    }

    uint256 public proposalCount = 0;
    uint256 public VoterCount = 0;
    address public chairperson;


    //Voter struct is used to define a mapping of address.
    mapping(address => Voter) public voters;

    Proposal[] public proposals;

    constructor() {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        voters[chairperson].createTime = block.timestamp;
    }

    function addProposalDetail(uint256 _id, string memory _subjectProposal) public
    {
        Proposal memory b = Proposal(_id, _subjectProposal, 0);
        proposals.push(b);
        proposalCount++;
    }

    // Give $(toVoter) the right to vote on this ballot.
    // May only be called by $(chairperson).
    //Instead of use if statement to do validation of chairperson,we can use CUSTOM MODIFIER
    function register(address toVoter) public {
        //the sender must be chairperson (at deploy account register)
        if (msg.sender != chairperson || voters[toVoter].voted == true || voters[toVoter].stage!=Stage.Init) return;
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
        voters[toVoter].createTime = block.timestamp;
        VoterCount++;
    }

    /// Give a single vote to proposal $(toProposal).
    // toProposal is the id of proposal
    function vote(uint8 toProposal) public {
        Voter storage sender = voters[msg.sender];
        if (
            sender.voted ||
            toProposal >= proposals.length||
            sender.stage!=Stage.Init
        ) return;
        sender.voted = true;
        sender.vote = toProposal;

        proposals[toProposal].voteCount += sender.weight;
    }

    function winningProposal() public view returns (uint8 _winningProposal) {
        uint256 winningVoteCount = 0;

        for (uint8 prop = 0; prop < proposals.length; prop++)
            if (proposals[prop].voteCount > winningVoteCount) {
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
    }

    function advanceState(address voter) public{

        // 1 minutes is too long for the demo time, change to 2 seconds
        if (block.timestamp > (voters[voter].createTime + 10 seconds)) {
            if (voters[voter].stage == Stage.Init) {
                voters[voter].stage = Stage.Reg;
                return;
            }

            if (voters[voter].stage == Stage.Reg) {
                voters[voter].stage = Stage.Vote;
                return;
            }

            if (voters[voter].stage == Stage.Vote) {
                voters[voter].stage = Stage.Done;
                return;
            }
            return;
        }
    }
}
