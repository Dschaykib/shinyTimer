HTMLWidgets.widget({

  name: 'EasyTimer',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.

        // basic timer
        // var timer = new easytimer.Timer();
        // timer.start();
        // timer.addEventListener('secondsUpdated', function (e) {
        //   el.innerText = timer.getTimeValues().toString();
        // });

        var elementId = el.id;
        var container = document.getElementById(elementId);
        var timerDisplay = container.getElementsByClassName("EasyTimerTmp2")[0];

        var timer = new easytimer.Timer({ countdown: x.countdown, startValues: { seconds: x.seconds }, target: { seconds: 0} });

        //timer.start();
        timerDisplay.innerText = timer.getTimeValues().toString();

        timer.addEventListener('secondsUpdated', function (e) {
         timerDisplay.innerText = timer.getTimeValues().toString();
        });

        timer.addEventListener('targetAchieved', function (e) {
         timerDisplay.innerText = x.message;
        });

        // Set up the zoom button click listeners
        var timerMenu = container.getElementsByClassName("timer-menu")[0];
        timerMenu.getElementsByClassName("timer-start")[0]
          .onclick = function() { timer.start(); };
        timerMenu.getElementsByClassName("timer-pause")[0]
          .onclick = function() { timer.pause(); };
          timerMenu.getElementsByClassName("timer-stop")[0]
          .onclick = function() { timer.stop(); };
          timerMenu.getElementsByClassName("timer-reset")[0]
          .onclick = function() { timer.reset(); };

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
