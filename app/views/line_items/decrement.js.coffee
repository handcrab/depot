# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#cart').html("<%=j render @cart %>")
$('#current_item').css({'background-color':'#88ff88'}).animate({'background-color':'#114411'}, 1000);

#  Hide the cart if empty
if $('#cart tr').length is 1
  $('#cart').hide('blind', 1000)
