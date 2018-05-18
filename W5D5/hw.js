window.setTimeout( ()=> { alert('HAMMER TIME!');}, 5000);


function hammerTime (time) {
  window.setTimeout(function () {
    alert(`${time} is HAMMER TIME!`);
  },time);
};


function chase(cat){
  this.chase(cat);
};
