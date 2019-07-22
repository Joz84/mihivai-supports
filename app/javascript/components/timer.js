     const threshold = .1
      const options = {
        root: null,
        rootMargin: '0px',
        threshold
      }

      const handleIntersect = function (entries, observer) {
        entries.forEach(function (entry) {
          if (entry.intersectionRatio > threshold) {
            entry.target.classList.remove('reveal')
            observer.unobserve(entry.target)
          }
        })
      }

      const increaseCounter = function (entries, observer) {
        entries.forEach(function (entry) {


          if (entry.intersectionRatio > threshold)  {

            var i=708;
            var timer = setInterval(function(){
            document.querySelector("#counter").textContent = i++;
            if(i>728){
              clearInterval(timer);
              document.querySelector("#counter").classList.add("end");
               }
          }, 65);
            //entry.target.classList.remove('reveal')
            //observer.unobserve(entry.target)
          }
        })
      }
      window.addEventListener("DOMContentLoaded", function () {
        const observer = new IntersectionObserver(increaseCounter, options)
        const targets = document.querySelectorAll('#counter')
        targets.forEach(function (target) {

          observer.observe(target)
        })
      })
      document.documentElement.classList.add('reveal-loaded')

      window.addEventListener("DOMContentLoaded", function () {
        const observer = new IntersectionObserver(handleIntersect, options)
        const targets = document.querySelectorAll('.reveal')
        targets.forEach(function (target) {
          observer.observe(target)
        })
      })

