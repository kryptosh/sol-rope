pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract usingRope is usingOraclize {
	modifier callback {
		require(msg.sender == oraclize_cbAddress());
		_;
	}

	function rope_raw(string url) internal returns (bytes32 _id) {
		return oraclize_query("URL", url);
	}

	function rope_raw(string url, string json) internal returns (bytes32 _id) {
		return oraclize_query("URL", url, json);
	}

	function rope_run(string method) internal returns (bytes32 _id) {
		return rope_raw(strConcat("https://run.rope.live/", method));
	}

	function rope_run(string method, string arg) internal returns (bytes32 _id) {
		return rope_raw(strConcat("https://run.rope.live/", method, "?0=", arg));
	}

	function rope_run(string method, string arg1, string arg2) internal returns (bytes32 _id) {
		return rope_raw(strConcat("https://run.rope.live/", method, "?0=", arg1, "&1=", arg2));
	}

	function rope_run(string method, string arg1, string arg2, string arg3) internal returns (bytes32 _id) {
		return rope_raw(strConcat("https://run.rope.live/", method, "?0=", arg1, "&1=", arg2, "&2=", arg3));
	}

	function rope_run_id(string id, string method) internal returns (bytes32 _id) {
		return rope_raw(strConcat("https://run.rope.live/", id, "/", method));
	}

	function rope_run_id(string id, string method, string arg) internal returns (bytes32 _id) {
		string args = strConcat("?0=", arg);
		return rope_raw(strConcat("https://run.rope.live/", id, "/", method, args));
	}

	function rope_run_id(string id, string method, string arg1, string arg2) internal returns (bytes32 _id) {
		string args = strConcat("?0=", arg1, "&1=", arg2);
		return rope_raw(strConcat("https://run.rope.live/", id, "/", method, args));
	}

	function rope_run_id(string id, string method, string arg1, string arg2, string arg3) internal returns (bytes32 _id) {
		string args = strConcat("?0=", arg1, "&1=", arg2, "&2=", arg3);
		return rope_raw(strConcat("https://run.rope.live/", id, "/", method, args));
	}

}
