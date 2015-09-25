$(function(){
  $("body").on("click", "#delete" function(){
    event.preventDefault();
    alert("HI");

    var id = $(this).data("id");
    
    $.ajax({
      method: "DELETE",
      url: "/business/"+id,
    }).done(function(response){
      $("#business-list li");
      // Find the one with the matching data-id
      // Remove, with .remove()
    })
  })

})