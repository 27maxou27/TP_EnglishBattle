//  https://jsfiddle.net/prafuitu/xRmGV/

$(document).ready(function () {

    var theTimer;
    var theSeconds = 60;

    var radius = 60;
    var offset = 10;

    var col_H = 120;
    var col_S = 95;
    var col_L = 48;

    var miliseconds = null;

    function hsl2rgb(H, S, L) {
        var R, G, B;
        var t1, t2;

        H = H / 360;
        S = S / 100;
        L = L / 100;

        if (S == 0) {
            R = G = B = L;
        } else {
            function hue2rgb(t1, t2, t3) {
                if (t3 < 0) t3 += 1;
                if (t3 > 1) t3 -= 1;

                if (t3 * 6 < 1) return t2 + (t1 - t2) * 6 * t3;
                if (t3 * 2 < 1) return t1;
                if (t3 * 3 < 2) return t2 + (t1 - t2) * (2 / 3 - t3) * 6;

                return t2;
            }

            var t1 = (L < 0.5) ? L * (1 + S) : L + S - L * S;
            var t2 = 2 * L - t1;

            R = hue2rgb(t1, t2, H + 1 / 3);
            G = hue2rgb(t1, t2, H);
            B = hue2rgb(t1, t2, H - 1 / 3);
        }

        return [
            Math.round(R * 255),
            Math.round(G * 255),
            Math.round(B * 255)
        ];
    }

    function drawCoord(radius, degrees) {
        var radians = degrees * Math.PI / 180;

        var rX = radius + offset + Math.sin(radians) * radius;
        var rY = radius + offset - Math.cos(radians) * radius;

        var dir = (degrees > 180) ? 1 : 0;

        var coord = 'M' + (radius + offset) + ',' + (radius + offset) + ' ' +
            'L' + (radius + offset) + ',' + offset + ' ' +
            'A' + radius + ',' + radius + ' 0 ' + dir + ',1 ' +
            rX + ',' + rY;

        return coord;
    }


    function updateTimer() {
        var date = new Date();

        if (miliseconds == null) miliseconds = date.getTime();

        var diff = (date.getTime() - miliseconds) % (1000 * theSeconds);
        var degrees = 0.36 * diff / theSeconds;
        var seconds = theSeconds - Math.floor(diff / 1000);

        update(degrees, seconds);
    }

    function update(deg, sec) {
        var RGB = [];
        var draw = drawCoord(radius, deg);

        //$('#progress_1, #progress_2, #progress_3').attr('d', draw);
        $('#progress_3').attr('d', draw);

        col_H = 120 - Math.round(deg / 3);
        RGB = hsl2rgb(col_H, col_S, col_L);

        $('#progress_3').attr('fill', 'rgb(' + RGB.join(', ') + ')');
        //$('#seconds_1, #seconds_2, #seconds_3').html(sec);
        $('#seconds_3').html(sec);
    }

    for (var x = 0; x < 24; x++) {
        var path = document.createElementNS('http://www.w3.org/2000/svg', 'path');

        path.setAttributeNS(null, 'd', 'M70,70 L70,10 A60,60 0 0,1 77.3121,10.4472');
        path.setAttributeNS(null, 'fill', '#333');
        path.setAttributeNS(null, 'fill-opacity', 0.3);
        path.setAttributeNS(null, 'stroke', '#333');
        path.setAttributeNS(null, 'stroke-width', 1);
        path.setAttributeNS(null, 'stroke-opacity', 0.4);
        path.setAttributeNS(null, 'transform', 'rotate(' + ((x * 15) - 4) + ' 70 70)');


        //$('#first')[0].insertBefore(path, $('#progress_1')[0].nextSibling);
    }

    function _start() {
        theTimer = setInterval(updateTimer, 16);
    }

    function _stop() {
        clearInterval(theTimer);
    }

    function _refresh() {
        _stop();
        _start();
    }

    function _reset() {
        _stop();
        miliseconds = null;
        _start();
    }

    function _update() {
        update(this.value, Math.floor(this.value * 100 / 360) + '%');
    }

    _start();
})
