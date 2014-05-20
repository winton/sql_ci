$ ->
  $(".diff li").hide()

  line = $(".unchanged + .del, .unchanged .ins").next()

  start = line.prevAll(":contains('[{'):first")
  start.nextUntil(line).show().prev().show()
  
  end = line.nextAll(":contains('}]'):first")
  end.prevUntil(line).show().next().show()

  start_index = $(".diff li:contains('[{')").index(start)
  $("<li class='explain-number'><a href='#' class='pull-right'>Expand all</a><strong>Explain ##{start_index + 1}</strong></li>").insertBefore(start)

  $("a.pull-right").click ->
    $(".diff li").show()
    $(".diff li.explain-number").hide()
    false