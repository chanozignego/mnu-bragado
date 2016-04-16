;(function(){

  "use strict";

  $(document).on("click", ".js-mass-action-link", function(event){
      var $self = $(this);
      $(".js-action").val($self.data("action"));
      $(".js-mass-assignment-form").submit();
  });

  $(document).on("change", ".js-mass-assignment-check-all", function(event){
      var $self = $(this);
      $self.closest(".js-resource-table").find(".js-mass-assignment-check").prop("checked", this.checked);
  });

})();