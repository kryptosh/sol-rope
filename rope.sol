pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract usingRope is usingOraclize {
	modifier callback {
		require(msg.sender == oraclize_cbAddress());
		_;
	}

	function rope_raw(string url) internal returns (bytes32 id) {
		return oraclize_query("URL", url);
	}

	function rope_raw(string url, string json) internal returns (bytes32 id) {
		return oraclize_query("URL", url, json);
	}

	function rope_run(string id, string method) internal returns (bytes32 id) {
		return rope_raw("https://run.rope.live/" + id + "/" + method);
	}

	function rope_run(string id, string method, string json) internal returns (bytes32 id) {
		return rope_raw("https://run.rope.live/" + id + "/" + method, json);
	}
}
