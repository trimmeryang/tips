var sleep= function () {
    var now = new Date();
    var exitTime = now.getTime() + number;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
};
