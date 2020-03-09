// Set the begin date
var dateBegin = new Date("Mar 8, 2020 19:30:00").getTime()
// Set the freeze time
var timeFrozen = 60; //minutes
// Set the length of contest
var lengthContest = 300; // minutes


//============================================================
lengthContest *= 1000*60;
var countDownDate = dateBegin + lengthContest; //UTC


// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  if (now >= dateBegin)
  {
    var distance = countDownDate - now;
    var eslaped = now - dateBegin;
    var percentTime = (eslaped/lengthContest*100);
    document.getElementById("timeBar").style.width = percentTime + "%";
    if (distance <= timeFrozen*60*1000)
    {
      document.getElementById("timeBar").className = "progress-bar progress-bar-info progress-bar-striped active";
      document.getElementById("status").innerHTML = "Standing is frozen";
    }
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      
    // Output the result in an element with id="countdown"
    var zeroh = ""; // add 0 to the numbers less than 10
    var zerom = "";
    var zeros = "";
    if (hours < 10)    zeroh = "0";
    if (minutes < 10)  zerom = "0";
    if (seconds < 10)  zeros = "0";
    document.getElementById("countdown").innerHTML = zeroh + hours + ":"
    + zerom + minutes + ":" + zeros + seconds;
      
    // If the count down is over 
    if (distance < 0) {
      clearInterval(x);
      document.getElementById("countdown").innerHTML = "EXPIRED";
    }
  }
  else
  {
    clearInterval(x);
    document.getElementById("countdown").innerHTML = "UPCOMING";
  }
}, 1000);
