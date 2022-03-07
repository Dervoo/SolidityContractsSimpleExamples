
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract emotions {
    enum Feeling {Nothing, Love, Like, Hate}
    Feeling public feeling;
    constructor() {
        feeling = Feeling.Nothing;
    }
    function Nothing() public {
        feeling = Feeling.Nothing;
    }
    function Love() public {
        feeling = Feeling.Love;
    }
    function Like() public {
        feeling = Feeling.Like;
    }
    function Hate() public {
        feeling = Feeling.Hate;
    }
    function DoYouLove() public view returns(bool) {
        return feeling == Feeling.Love;
    }
    function DoYouLike() public view returns(bool) {
        return feeling == Feeling.Like;
    }
    function DoYouHate() public view returns(bool) {
        return feeling == Feeling.Hate;
    }
    function FeelNothing() public view returns(bool) {
        return feeling == Feeling.Nothing;
    }
    function GetCurrentFeeling() public view returns(string memory) {
        if(feeling == Feeling.Nothing) {
            return "Nothing";
        } else if(feeling == Feeling.Love) {
            return "Love";
        } else if(feeling == Feeling.Like) {
            return "Like";
        } else if(feeling == Feeling.Hate) {
            return "Hate";
        }
    }
}