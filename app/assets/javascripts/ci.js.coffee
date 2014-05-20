$ ->
  $(".diff li").hide()

  line = $(".unchanged + .del").prev().show().prev().show()
  
  $(".ins + .unchanged").show().next().show()
  $(".del, .ins").show()

  line_index = $(".unchanged, .ins").index(line)
  $("<li><strong>Line #{line_index + 1}</strong></li>").insertBefore(line)