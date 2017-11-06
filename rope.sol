pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract usingRope is usingOraclize {
	modifier callback {
		require(msg.sender == oraclize_cbAddress());
		_;
	}

	function rope_query(string url) internal returns (bytes32 id) {
		return oraclize_query("URL", url);
	}
}
