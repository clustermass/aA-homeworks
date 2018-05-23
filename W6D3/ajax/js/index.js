console.log("Hello from the JavaScript console!");



$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!")
    console.log(data);
    console.log(data.name)
      $(".test").append("City: ").append(data.name).append("<br>");
      $(".test").append("Temperature: ").append((data.main.temp - 273.15)).append("<br>");
      $(".test").append("Humidity: ").append(data.main.humidity).append("<br>");
      $(".test").append("Visibility: ").append(data.visibility).append("<br>");



  },
  error() {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
