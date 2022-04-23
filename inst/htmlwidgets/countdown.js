HTMLWidgets.widget({

  name: 'countdown',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // Set the countDown time we're counting down to
        var countDown = new Date().getTime() + x.count * 1000;

        // Update the count down every 1 second
        var y = setInterval(function() {

          // Get today's date and time
          var now = new Date().getTime();

          // Find the distance between now and the count down date
          var distance = countDown - now;

          // Time calculations for days, hours, minutes and seconds

          el.innerHTML = '';

          // set days
          days = Math.floor(distance / (1000 * 60 * 60 * 24));
          if (x.days) {
            hoursOffset = 0;
            el.innerHTML = el.innerHTML + days + x.sep;
          } else {
            hoursOffset = days * 24;
          }

          // set hours
           hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)) + hoursOffset;
          if (x.hours) {
            minutesOffset = 0;
            el.innerHTML = el.innerHTML + hours + x.sep;
          } else {
            minutesOffset = hours * 60;
          }


          // set minutes
          minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)) + minutesOffset;
          if (x.minutes) {
            secondsOffset = 0;
            el.innerHTML = el.innerHTML + minutes + x.sep;
          } else {
            secondsOffset = minutes * 60;
          }

          // set seconds
          seconds = Math.floor((distance % (1000 * 60)) / 1000) + secondsOffset;
           if (x.seconds) {
            el.innerHTML = el.innerHTML + seconds;
          }

          // Output the result in an element with id="demo"
          // el.innerHTML = Dvis + Dsep + Hvis + Hsep + Mvis + Msep + Svis ;
          // el.innerHTML = minutes + ":" + seconds + "";

          // If the count down is over, write some text
          if (distance < 0) {
            clearInterval(y);
            el.innerHTML = "0:00";
          }
        }, 900);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
