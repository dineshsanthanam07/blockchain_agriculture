// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoilMonitoring {
    struct SoilData {
        uint256 pH;
        uint256 moisture;
        uint256 temperature;
        uint256 nutrients;
    }

    mapping(address => SoilData) public soilRecords;

    event SoilDataUpdated(address indexed farmer, uint256 pH, uint256 moisture, uint256 temperature, uint256 nutrients);

    function updateSoilData(
        uint256 _pH,
        uint256 _moisture,
        uint256 _temperature,
        uint256 _nutrients
    ) public {
        soilRecords[msg.sender] = SoilData(_pH, _moisture, _temperature, _nutrients);
        emit SoilDataUpdated(msg.sender, _pH, _moisture, _temperature, _nutrients);
    }

    function getSoilData(address farmer) public view returns (SoilData memory) {
        return soilRecords[farmer];
    }
}
