using Toybox.Application;
using Toybox.Graphics;
using Toybox.System;
using Toybox.WatchUi;

class CyclingBlueApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new CyclingBlueView() ];
    }
}

class CyclingBlueView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var clock = System.getClockTime();

        var hours = clock.hour.toString();
        var minutes = clock.min.toString();

        if (clock.hour < 10) {
            hours = "0" + hours;
        }

        if (clock.min < 10) {
            minutes = "0" + minutes;
        }

        var time = hours + ":" + minutes;

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);

        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2 - 30,
            Graphics.FONT_LARGE,
            time,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
}
