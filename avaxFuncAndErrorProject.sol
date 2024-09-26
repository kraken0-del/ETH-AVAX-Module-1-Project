// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract AttendanceTracker {

    struct Participant {
        string name;
        bool isCheckedIn;
    }

    mapping(uint => Participant) public participants;
    uint[] private participantIds;
    uint public totalCheckedIn;

    function addParticipant(uint id, string memory name) external {
        require(bytes(participants[id].name).length == 0, "Participant already exists");
        participants[id] = Participant(name, false);
        participantIds.push(id);
    }

    function checkIn(uint id) external {
        if (bytes(participants[id].name).length == 0) {
            revert("Participant does not exist");
        }
        require(!participants[id].isCheckedIn, "Participant already checked in");
        participants[id].isCheckedIn = true;
        totalCheckedIn++;
        assert(participants[id].isCheckedIn == true);
    }

    function removeParticipant(uint id) external {
        if (bytes(participants[id].name).length == 0) {
            revert("Participant does not exist");
        }
        if (participants[id].isCheckedIn) {
            totalCheckedIn--;
        }
        delete participants[id];
        for (uint i = 0; i < participantIds.length; i++) {
            if (participantIds[i] == id) {
                participantIds[i] = participantIds[participantIds.length - 1];
                participantIds.pop();
                break;
            }
        }
        assert(bytes(participants[id].name).length == 0);
    }

    function resetAttendance() external {
        for (uint i = 0; i < participantIds.length; i++) {
            uint id = participantIds[i];
            if (participants[id].isCheckedIn) {
                participants[id].isCheckedIn = false;
            }
        }
        totalCheckedIn = 0;
        assert(totalCheckedIn == 0);
    }
     function getAllParticipantIds() external view returns (uint[] memory) {
        return participantIds;
    }
}
