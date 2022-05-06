HTMLWidgets.widget({

  name: 'countdown',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance
    // var thisCount = new countdown(el.id)

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
          outputtime = ''


          function padNumber(x, n = 2, char = "0") {
            return x.toString().padStart(n, char)
          }

          // set days
          const days = Math.floor(distance / (1000 * 60 * 60 * 24))
          if (x.is_days) {
            hoursOffset = 0
            outputtime = outputtime + padNumber(days) + x.sep
            days_final = '00' + x.sep
          } else {
            hoursOffset = days * 24
            days_final = ''
          }

          // set hours
          const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)) + hoursOffset
          if (x.is_hours) {
            minutesOffset = 0
            outputtime = outputtime + padNumber(hours) + x.sep
            hours_final = '00' + x.sep
          } else {
            minutesOffset = hours * 60
            hours_final = ''
          }

          // set minutes
          const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)) + minutesOffset
          if (x.is_minutes) {
            secondsOffset = 0
            outputtime = outputtime + padNumber(minutes) + x.sep
            minutes_final = '00' + x.sep
          } else {
            secondsOffset = minutes * 60
            hours_final = ''
          }

          // set seconds
          const seconds = Math.floor((distance % (1000 * 60)) / 1000) + secondsOffset
           if (x.is_seconds) {
            outputtime = outputtime + padNumber(seconds)
            seconds_final = '00'
          } else {
            seconds_final = ''
          }



          el.style.alignContent = "center"
          el.style.border = "thin solid #0000FF"
          el.style.backgroundColor = "#337ab7"
          el.style.color = "#fff"
          el.style.borderColor = "#2e6da4"
          el.style.display = "flex"
          el.style.justifyContent = "center"

          el.style.padding = "0px 5px"


          // If the count down is over, write some text
          if (distance <= 0) {
            clearInterval(y)
            outputtime = days_final + hours_final + minutes_final + seconds_final
            el.style.backgroundColor = "red"
          }

          el.innerHTML = outputtime


        }, 500)
      },
      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size
      }
    }
  }
})
