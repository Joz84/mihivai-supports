  var totalTime;
  var clock;
  var form;

  function getValues(time,id){
    form = document.getElementById("edit_form_"+id);
    totalTime = time * 60;
  }

  function startTimer(){
    setTimeout(function(){
      clock = $('.timer').FlipClock(totalTime, {
            countdown: true,
            callbacks: {
		        	stop: function() {
		        		form.submit();
		        	}
		        }
        });
    },500);
  }

  export { getValues };
  export { startTimer };
