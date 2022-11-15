// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract airdropTest is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("airdropTest", "ADT") {}

    function mintNFT(address recipient, string memory tokenURI, uint256 id)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        _mint(recipient, id);
        _setTokenURI(id, tokenURI);

        return id;
    }
}
