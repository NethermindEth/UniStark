contract Test {
    uint128 public me = 0;

    function setMe() external {
        me = 42;
    }
}
