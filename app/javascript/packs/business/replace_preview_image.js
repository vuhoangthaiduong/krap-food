$("document").ready(function(){

  /* Replace Preview Image */
  $(".custom-file-input").on("change", function(event) {
    var flag = $(this).data("flag");
    var preview = $("#preview-" + flag)[0];
    var sliderPreview = $("#slider-preview-" + flag)[0];
    preview.src = URL.createObjectURL(event.target.files[0]);
    sliderPreview.src = URL.createObjectURL(event.target.files[0]);
    preview.onload = function() {
      URL.revokeObjectURL(preview.src) // free memory
    }
    sliderPreview.onload = function() {
      URL.revokeObjectURL(sliderPreview.src) // free memory
    }
    
  });

}); 
