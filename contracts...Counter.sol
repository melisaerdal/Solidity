// SPDX-License-Identifier: MIT
/*pragma solidity ^0.8.18;


contract Contract{
    uint public counter;
    string public description;

    constructor(uint initialCounter, string memory initialDescription) {
        counter = initialCounter;
        description = initialDescription;
    }

    // Function to get the counter value
    function getCounter() public view returns (uint) {
        return counter;
    }

    // Function to get the description
    function getDescription() public view returns (string memory) {
        return description;
    }

    // Function to increase the counter
    function incrementCounter() public {
        counter += 1;
    }
} */
pragma solidity ^0.8.0;

contract MeContract {
    struct Proposal {
        string description;
        string title;
        uint256 yesVotes;
        uint256 noVotes;
        uint256 totalVoteToEnd;
        bool proposalPassed;
        bool active;
    }

    mapping(uint256 => Proposal) public proposal_history;
    uint256 public counter;

    function create(string calldata _title, string calldata _description, uint256 _total_vote_to_end) external {
        require(_total_vote_to_end > 0, "Total votes to end must be greater than 0");

        counter += 1;
        proposal_history[counter] = Proposal(_description, _title, 0, 0, _total_vote_to_end, false, true);
    }

    function vote(uint256 proposalId, bool supportsProposal) external {
        Proposal storage proposal = proposal_history[proposalId];
        require(proposal.active, "Proposal is not active");
        require(proposal.totalVoteToEnd > 0, "Proposal has already ended");
        
        if (supportsProposal) {
            proposal.yesVotes += 1;
        } else {
            proposal.noVotes += 1;
        }

        // Check 
        if (proposal.yesVotes >= proposal.totalVoteToEnd) {
            proposal.proposalPassed = true;
            proposal.active = false;
            
        } else if (proposal.noVotes >= proposal.totalVoteToEnd) {
            proposal.active = false;
    
        }
    }
}





    



    
