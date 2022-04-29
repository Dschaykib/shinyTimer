HTMLWidgets.widget({

  name: 'countdown',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        // Set the countDown time we're counting down to
        const countDownTime = new Date().getTime() + x.count * 1000

        // Update the count down every 1 second
        const y = setInterval(() => {
          // Get today's date and time
          const now = new Date().getTime()
          // Find the distance between now and the count down date
          const distance = countDownTime - now

          // Time calculations for days, hours, minutes and seconds
          el.innerHTML = ''
          // set days
          const days = Math.floor(distance / (1000 * 60 * 60 * 24))
          if (x.is_days) {
            hoursOffset = 0
            el.innerHTML = el.innerHTML + days.toString().padStart(2, "0") + x.sep
          } else {
            hoursOffset = days * 24
          }

          // set hours
          const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)) + hoursOffset
          if (x.is_hours) {
            minutesOffset = 0
            el.innerHTML = el.innerHTML + hours.toString().padStart(2, "0") + x.sep
          } else {
            minutesOffset = hours * 60
          }

          // set minutes
          const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)) + minutesOffset
          if (x.is_minutes) {
            secondsOffset = 0
            el.innerHTML = el.innerHTML + minutes.toString().padStart(2, "0") + x.sep
          } else {
            secondsOffset = minutes * 60
          }

          // set seconds
          const seconds = Math.floor((distance % (1000 * 60)) / 1000) + secondsOffset
           if (x.is_seconds) {
            el.innerHTML = el.innerHTML + seconds.toString().padStart(2, "0")
          }

          // If the count down is over, write some text
          if (distance < 0) {
            clearInterval(y)
            el.innerHTML = "00" + x.sep + "00"
          }
        }, 900)
      },
      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }
    }
  }
})
