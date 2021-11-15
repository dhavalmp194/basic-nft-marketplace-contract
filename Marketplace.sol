// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

contract Marketplace is IERC721Receiver{
    
    IERC721 public nftToken;
    
    IERC20 public token;
    
    mapping (uint256 => bool) public isNFTTokenAvailableForSale ;
    
    mapping (uint256 => bool) public isNFTTokenListedOnMarket ;
    
    mapping (uint256 => address) public ownerOfListedNFTToken ;
    
    mapping (uint256 => uint256) public priceOfNFTToken ;
    
    uint256[] public tokensOnSale;
    
    constructor(IERC721 _nftToken, IERC20 _token) {
        nftToken = _nftToken;
        token = _token;
    } 
    
    function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
    
    function listNFTTokenOnMarket(uint256 _tokenId) public {
        require(msg.sender == nftToken.ownerOf(_tokenId), "listTokenOnMarket: not authorized");
        require(!isNFTTokenListedOnMarket [_tokenId], "listTokenOnMarket: token already listed");
        isNFTTokenListedOnMarket [_tokenId] = true;
        ownerOfListedNFTToken [_tokenId] = msg.sender;
        nftToken.safeTransferFrom(msg.sender, address(this), _tokenId);
    }
    
    function removeNFTTokenFromMarket(uint256 _tokenId) public {
        require(msg.sender == nftToken.ownerOf(_tokenId), "removeTokenFromMarket: not authorized");
        require(isNFTTokenListedOnMarket [_tokenId], "removeTokenFromMarket: token is not listed");
        isNFTTokenListedOnMarket [_tokenId] = false;
        if(isNFTTokenAvailableForSale [_tokenId]){
            isNFTTokenAvailableForSale [_tokenId] = false;
            removeNFTTokenIdFromSale(_tokenId);
        }
        ownerOfListedNFTToken [_tokenId] = address(0);
        nftToken.safeTransferFrom(address(this), msg.sender, _tokenId);
    }
    
    function putYourNFTTokenForSale(uint256 _tokenId, uint256 _price) public {
        require(msg.sender == ownerOfListedNFTToken [_tokenId], "putYourTokenForSale: not authorized");
        require(isNFTTokenListedOnMarket [_tokenId], "putYourTokenForSale: token is not listed");
        require(!isNFTTokenAvailableForSale [_tokenId], "putYourTokenForSale: token already on sale");
        isNFTTokenAvailableForSale [_tokenId] = true;
        priceOfNFTToken [_tokenId] = _price;
        tokensOnSale.push(_tokenId);
    }
    
    function removeYourNFTTokenFromSale(uint256 _tokenId) public {
        require(msg.sender == ownerOfListedNFTToken [_tokenId], "removeYourTokenFromSale: not authorized");
        require(isNFTTokenListedOnMarket [_tokenId], "removeYourTokenFromSale: token is not listed");
        require(isNFTTokenAvailableForSale [_tokenId], "removeYourTokenFromSale: token is not on sale");
        isNFTTokenAvailableForSale [_tokenId] = false;
        priceOfNFTToken [_tokenId] = 0;
        removeNFTTokenIdFromSale(_tokenId);
    }
    
    function buyNFTFromMarket(uint256 _tokenId, uint256 _amount) public {
        require(isNFTTokenListedOnMarket [_tokenId], "buyNFTFromMarket: token is not listed");
        require(isNFTTokenAvailableForSale [_tokenId], "buyNFTFromMarket: token is not on sale");
        require(_amount == priceOfNFTToken [_tokenId], "buyNFTFromMarket: Insufficient amount");
        isNFTTokenListedOnMarket [_tokenId] = false;
        isNFTTokenAvailableForSale [_tokenId] = false;
        token.transferFrom(msg.sender, ownerOfListedNFTToken [_tokenId], _amount);
        nftToken.safeTransferFrom(address(this), msg.sender, _tokenId);
        ownerOfListedNFTToken [_tokenId] = address(0);
        removeNFTTokenIdFromSale(_tokenId);
    }
    
    function removeNFTTokenIdFromSale(uint256 _tokenId) internal {
        for(uint i = 0; i < tokensOnSale.length; i++){
            if(_tokenId == tokensOnSale[i]){
                for (uint j = i; j < tokensOnSale.length - 1; j++) {
                    tokensOnSale[j] = tokensOnSale[j + 1];
                }
               tokensOnSale.pop();
            }
        }
    }
}
