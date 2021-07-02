$(document).ready(() => {
  //Event delegation
  $("#cart-items").on("click", ".inc", function(event){
    count = $(this).prev();   
    count.val(parseInt(count.val(), 10) + 1);
    cartItemCount = $(`.menu-item[data-item-id="${$(this).parent().parent().data("item-id")}"]`).find(".count-number-input");
    cartItemCount.val(parseInt(cartItemCount.val(), 10) + 1);
    updateCart();
  });

  $("#cart-items").on("click", ".dec", function(event){
    count = $(this).next();
    if (count.val() == 1) {
      $(this).parent().parent().remove();
      $(`.menu-item[data-item-id="${$(this).parent().parent().data("item-id")}"]`).remove();
    }
    else {
      count.val(parseInt(count.val(), 10) - 1);
      cartItemCount = $(`.menu-item[data-item-id="${$(this).parent().parent().data("item-id")}"]`).find(".count-number-input");
      cartItemCount.val(parseInt(cartItemCount.val(), 10) - 1);
    }
    updateCart();
  });

//Order Online
  $(".add-item").on("click", function(event){
    $(event.target).addClass("d-none");
    $(event.target).next().removeClass("d-none");

    //Hide cart is empty
    $("#cart-is-empty").removeClass("d-flex");
    $("#cart-is-empty").addClass("d-none");

    //Show cart
    $("#cart-items").removeClass("d-none");

    //Add item to cart
    if ('content' in document.createElement('template')) {
      $itemTemplate = $("#cart-item-template");
      $node = $itemTemplate.prop('content');
      itemId = $(event.target).parent().data("item-id")
      itemName = $(event.target).parent().find("h6.mb-1").text();
      itemPrice = $(event.target).parent().find(".text-gray.mb-0").text();
      $node.querySelector('.gold-members').setAttribute("data-item-id", itemId);
      $node.querySelector('.item-name').textContent = `${itemName}`;
      $node.querySelector('.item-price').textContent = `${itemPrice}`;

      var clone = $node.cloneNode(true);
      $("#cart-items").append(clone);
    } else {
      console.log("Not supported");
    }

    updateCart();

  });

  $(".inc").on("click", function(event){
    count = $(this).prev();
    count.val(parseInt(count.val(), 10) + 1);
    cartItemCount = $(`.cart-item[data-item-id="${$(this).parent().data("item-id")}"]`).find(".count-number-input");
    cartItemCount.val(parseInt(cartItemCount.val(), 10) + 1);
    updateCart();
  });

  $(".dec").on("click", function(event){
    count = $(this).next();
    console.log(count.val());
    if (count.val() == 1) {
      $(this).parent().addClass("d-none");
      $(this).parent().prev().removeClass("d-none");
      $(`.cart-item[data-item-id="${$(this).parent().data("item-id")}"]`).remove();
    }
    else {
      count.val(parseInt(count.val(), 10) - 1);
      cartItemCount = $(`.cart-item[data-item-id="${$(this).parent().data("item-id")}"]`).find(".count-number-input");
      cartItemCount.val(parseInt(cartItemCount.val(), 10) - 1);
    }
    updateCart();
  });

  $(".checkout-button").on("click", function(event){
    event.preventDefault();
    _url = $(this).data("url");
    var $cartItems = $('.cart-item');
    var cartItemsAsArray = [];
    $cartItems.each(function(){
      itemID = $(this).data("item-id");
      itemQuantity = $(this).find(".count-number-input").val();
      let itemObject = {
        food_id: itemID,
        amount: itemQuantity
      };
      cartItemsAsArray.push(itemObject);
    });
    debugger
    $.ajax({
      type: 'POST',
      url: _url,
      data: {data: cartItemsAsArray}
    });
  });

  function toggleCheckoutButtonState(){
    if ($("#cart-items").find(".cart-item").length == 0) {
      $(".checkout-button").addClass("disabled");
      //Show cart is empty
      $("#cart-is-empty").addClass("d-flex");
      $("#cart-is-empty").removeClass("d-none");
      //Hide payment
      $("#payment").addClass("d-none");
    }
    else {
      $(".checkout-button").removeClass("disabled");
      //Show payment
      $("#payment").removeClass("d-none");
    }
  }

  function updateNumberOfCartItems(){
    $("#number-of-cart-items").text(`${$("#cart-items").find(".cart-item").length} ITEMS`);
  }

  function updateSubTotal(){
    subTotal = 0;
    $cartItems = $("#cart-items").find(".cart-item");
    $cartItems.each(function() {
      itemCount = parseInt($(this).find(".count-number-input").val());
      itemPrice = parseInt($(this).find(".item-price").text());
      subTotal += itemCount * itemPrice;
      console.log(itemCount);
      console.log(itemPrice);
    });
    $("#subtotal").text(subTotal);
  }

  function updateCart(){
    toggleCheckoutButtonState();
    updateNumberOfCartItems();
    updateSubTotal();
  }

})
