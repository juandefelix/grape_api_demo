var order;
var url = 'http://localhost:9292/v1/records/';

var displayData = function(data) {
  $('table').remove();
  $('#results').append('<table><tr>\
    <th>Last Name</th>\
    <th>First Name</th>\
    <th>Gender</th>\
    <th>Color</th>\
    <th>Date of Birth</th>\
    </tr></table>');

  $.each(data, function(index, value){
    $('table').append('<tr>\
      <td>' + value.last + '</td>\
      <td>' + value.first + '</td>\
      <td>' + value.gender + '</td>\
      <td>' + value.color + '</td>\
      <td>' + value.birthdate + '</td></tr>');
  })
};

var getRecords = function(url) {
  $.getJSON( url, function( data ) {
    displayData(data);
  });
};

var postRecord = function(data) {
  $.post('http://localhost:9292/v1/records', data, function() { 
    $("input[type=text]").val("");
  });
  getRecords();
}

$('a').click(function(e){
  e.preventDefault();
  order = e.target.dataset.order;
  getRecords(url + order);
});

$('form').submit(function(e){
  e.preventDefault();
  var data = $(e.target);
  data = data.serialize();
   $.post('http://localhost:9292/v1/records', data, function() { 
    $("input[type=text]").val("");
  });
  getRecords(url + order);
})
