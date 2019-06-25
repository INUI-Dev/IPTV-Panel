(function($)
{
	"use strict"

	/* Event - Window Scroll */
	$(window).scroll(function()
	{
		var scroll	=	$(window).scrollTop();
		var height	=	$(window).height();

		/*** set sticky menu ***/
		if( scroll >= 90 )
		{
			$('.menu-block').addClass("navbar-fixed-top").delay( 2000 ).fadeIn();
		}
		else if ( scroll <= height )
		{
			$('.menu-block').removeClass("navbar-fixed-top");
		}
		else
		{
			$('.menu-block').removeClass("navbar-fixed-top");
		} // set sticky menu - end		

		if ($(this).scrollTop() >= 50)
		{
			// If page is scrolled more than 50px
			$('#back-to-top').fadeIn(200);    // Fade in the arrow
		}
		else
		{
			$('#back-to-top').fadeOut(200);   // Else fade out the arrow
		}
	});
	/* Event - Window Scroll /- */

	$('#back-to-top').click(function()
	{
		// When arrow is clicked
		$('body,html').animate(
		{
			scrollTop : 0 // Scroll to top of body
		},800);
	});		
	
	$('.dial').each(function ()
	{
		var $this = $(this);
		var myVal = $(this).data("value");		

		$this.appear(function()
		{
			// alert(myVal);
			$this.knob({ });
			$({ value: 0 }).animate({ value: myVal },
			{
				duration: 2000,
				easing: 'swing',
				step: function ()
				{
					$this.val(Math.ceil(this.value)).trigger('change');
				}
			});
		});
	});
	
	
	/* Event - Document Ready /- */	
	$(document).ready(function($)
	{
		var scroll	=	$(window).scrollTop();
		var height	=	$(window).height();

		/*** set sticky menu ***/
		if( scroll >= height -500 )
		{
			$('.menu-block').addClass("navbar-fixed-top").delay( 2000 ).fadeIn();
		}
		else if ( scroll <= height )
		{
			$('.menu-block').removeClass("navbar-fixed-top");
		}
		else
		{
			$('.menu-block').removeClass("navbar-fixed-top");
		} // set sticky menu - end

		$('.navbar-nav li a, .logo-block a').on('click', function(event)
		{
			var anchor = $(this);

			if( anchor == 'undefined' || anchor == null || anchor.attr('href') == '#' ) { return; }
			if ( anchor.attr('href').indexOf('#') === 0 )
			{
				if( $(anchor.attr('href')).length )
				{
					$('html, body').stop().animate( { scrollTop: $(anchor.attr('href')).offset().top - 72 }, 1500, 'easeInOutExpo' );					
				}
				event.preventDefault();
			}
		});

		$('.goto-next a').on('click', function(event)
		{
			var anchor = $(this);

			if( anchor == 'undefined' || anchor == null || anchor.attr('href') == '#' ) { return; }
			if ( anchor.attr('href').indexOf('#') === 0 )
			{
				if( $(anchor.attr('href')).length )
				{
					$('html, body').stop().animate( { scrollTop: $(anchor.attr('href')).offset().top - 150 }, 1500, 'easeInOutExpo' );			
				}
				event.preventDefault();
			}
		});
		
		/* Window Hight Set to Elements /- */
		var window_height = $(window).height();
		var window_width = $(window).width();
		// $(".header").css("height", window_height + "px");
			
		/* Service Section */
		$("#make-clean-service").owlCarousel(
		{
			autoPlay: 3000, //Set AutoPlay to 3 seconds

			items : 3, //10 items above 1000px browser width
			itemsDesktop : [1000,2], //5 items between 1000px and 901px
			itemsDesktopSmall : [900,2], // 3 items betweem 900px and 601px
			itemsTablet: [700,2], //2 items between 600 and 0;
			itemsMobile : [480,1], // itemsMobile disabled - inherit from itemsTablet option 
			navigation : true,
			pagination: false
		});
		
		/* Team Section */
		$("#make-clean-team").owlCarousel(
		{
			autoPlay: 3000, //Set AutoPlay to 3 seconds

			items : 3, //10 items above 1000px browser width
			itemsDesktop : [1200,2], //2 items between 1200px and 901px
			itemsDesktopSmall : [900,2], // 3 items betweem 900px and 601px
			itemsTablet: [700,2], //2 items between 600 and 0;
			itemsMobile : [480,1], // itemsMobile disabled - inherit from itemsTablet option 
			navigation : true,
			pagination: false
		});
		
		/* Partners Section */
		$("#make-clean-partner").owlCarousel(
		{
			autoPlay: 3000, //Set AutoPlay to 3 seconds

			items : 6, //10 items above 1000px browser width
			itemsDesktop : [1200,4], //2 items between 1200px and 901px
			itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
			itemsTablet: [700,3], //2 items between 600 and 0;
			itemsMobile : [550,2], // itemsMobile disabled - inherit from itemsTablet option
			navigation : true,
			pagination: false
		});
				
		$("#default" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/default.css");
			return false;
		});
		
		$("#green" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/green.css");
			return false;
		});
		
		$("#red" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/red.css");
			return false;
		});
		
		$("#yellow" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/yellow.css");
			return false;
		});

		$("#light-green" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/light-green.css");
			return false;
		});

		$("#orange" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/orange.css");
			return false;
		});

		$("#pink" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/pink.css");
			return false;
		});

		$("#black" ).click(function()
		{
			$("#color" ).attr("href", "css/color-schemes/black.css");
			return false;
		});

		// picker buttton
		$(".picker_close").click(function()
		{
			$("#choose_color").toggleClass("position");
		});
		
		/* Type 1 */
		$('.statistics-section').each(function ()
		{
			var $this = $(this);
			var myVal = $(this).data("value");

			$this.appear(function()
			{		
				var statistics_item_count = 0;
				var statistics_count = 0;					
				statistics_item_count = $( "[id*='statistics_1_count-']" ).length;
				//alert(statistics_item_count);

				for(var i=1; i<=statistics_item_count; i++)
				{
					statistics_count = $( "[id*='statistics_1_count-"+i+"']" ).attr( "data-statistics_percent" );
					$("[id*='statistics_1_count-"+i+"']").animateNumber({ number: statistics_count }, 2000);
					// $("[id*='skill_count-"+i+"']").css('width', skills_count);
				}				
			});
		});
		
		/* Price Filter */
		$( "#slider-range" ).slider({
			range: true,
			min: 0,
			max: 15000,
			values: [ 0, 10000 ],
			slide: function( event, ui ) {
				$( "#amount" ).html( "$" + ui.values[ 0 ] )
				$( "#amount2" ).html( "$" + ui.values[ 1 ] );
			}
		});
		
		$( "#amount" ).html( "$" + $( "#slider-range" ).slider( "values", 0 ) );
		$( "#amount2" ).html( " $" + $(  "#slider-range" ).slider( "values", 1 ) );	

		/* Portfolio Details Slider */
		$('#portfolio-carousel').flexslider({
			animation: "slide",
			controlNav: false,			
			animationLoop: true,
			slideshow: false,
			itemWidth: 110,
			itemMargin: 10,
			asNavFor: '#portfolio-slider',
		});

		$('#portfolio-slider').flexslider({
			animation: "fade",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			sync: '#portfolio-carousel',
			directionNav: false
		});
		
		/* Product Details Slider */
		$('#product-carousel').flexslider({
			animation: "slide",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			itemWidth: 125,
			itemMargin: 10,
			asNavFor: '#product-slider',
		});

		$('#product-slider').flexslider({
			animation: "fade",
			controlNav: false,
			animationLoop: false,
			slideshow: false,
			sync: "#product-carousel",
			directionNav: false
		});
		
		/* Lightbox for Highlights Gallery	*/
		$('.portfolio-image-block .zoom-link').magnificPopup({
			delegate: 'a:first-Child',
			type: 'image',
			tLoading: 'Loading image #%curr%...',
			mainClass: 'mfp-img-mobile',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1] // Will preload 0 - before current, and 1 after the current image
			},
			image: {
				tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',				
			}
		});
		
		/* gMAP */
		$("#gmap").gMap({
			controls: false,
			scrollwheel: true,
			
			markers: [
				{
					latitude: 47.670553,
					longitude: 9.588479,
					icon: {
						image: "images/map-marker.png",
						iconsize: [26, 46],
						iconanchor: [12,46]
					}
				},
				{
					latitude: 47.65197522925437,
					longitude: 9.47845458984375
				},
				{
					latitude: 47.594996,
					longitude: 9.600708,
					icon: {
						image: "images/map-marker.png",
						iconsize: [26, 46],
						iconanchor: [12,46]
					}
				}
			],
			icon: {
				image: "images/map-marker.png", 
				iconsize: [26, 46],
				iconanchor: [12, 46]
			},
			latitude: 47.58969,
			longitude: 9.473413,
			zoom: 10
		});
		
		/* Quick Contact Form */
		$( "#btn_submit" ).on( "click", function(event) {
		  event.preventDefault();
		  var mydata = $("form").serialize();
		  
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "quick-contact.php",
				data: mydata,
				success: function(data) {

					if( data["type"] == "error" ){
						$("#alert-msg").html(data["msg"]);
						$("#alert-msg").removeClass("alert-msg-success");
						$("#alert-msg").addClass("alert-msg-failure");
						$("#alert-msg").show();
					} else {
						$("#alert-msg").html(data["msg"]);
						$("#alert-msg").addClass("alert-msg-success");
						$("#alert-msg").removeClass("alert-msg-failure");					
						$("#quick_name").val("");
						$("#quick_phone").val("");
						$("#quick_email").val("");
						$("#quick_message").val("");
						$("#alert-msg").show();						
					}				
				},
				error: function(xhr, textStatus, errorThrown) {
					//alert(textStatus);
				}
			});
			return false;
			
		});		
		/* Quick Contact Form /- */
		
		/* Contact Form */
		$( "#btn_smt" ).on( "click", function(event) {
		  event.preventDefault();
		  var mydata = $("form").serialize();
		  
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "contact.php",
				data: mydata,
				success: function(data) {
					
					if( data["type"] == "error" ){
						$("#alert-msg").html(data["msg"]);
						$("#alert-msg").removeClass("alert-msg-success");
						$("#alert-msg").addClass("alert-msg-failure");
						$("#alert-msg").show();
					} else {
						$("#alert-msg").html(data["msg"]);
						$("#alert-msg").addClass("alert-msg-success");
						$("#alert-msg").removeClass("alert-msg-failure");					
						$("#input_name").val("");
						$("#input_email").val("");
						$("#input_phone").val("");
						$("#input_street").val("");
						$("#input_category").val("");
						$("#input_city").val("");
						$("#input_state").val("");
						$("#input_zipcode").val("");
						$("#textarea_message").val("");
						$("#alert-msg").show();						
					}

				},
				error: function(xhr, textStatus, errorThrown) {
					//alert(textStatus);
				}
			});
			return false;
			
		});		
		/* Contact Form /- */		
		
	});	
	/* document.ready /- */		
	
	/* Event - Window Resize /- */
	$(window).resize(function()
	{
		/* Window Hight Set to Elements /- */
		var window_height = $(window).height();
		var window_width = $(window).width();
		// $(".header").css("height", window_height + "px");
	});
	/* Event - Window Resize /- */

	var $itemsHolder = $('.portfolio-list');
	var $itemsClone = $itemsHolder.clone(); 
	var $filterClass = "";
	$('.portfolio-categories li').click(function(e)
	{
		e.preventDefault();
		$filterClass = $(this).attr('data-value');
		if($filterClass == 'all')
		{
			var $filters = $itemsClone.find('li');
		}
		else
		{
			var $filters = $itemsClone.find('li[data-type='+ $filterClass +']');
		}
		$itemsHolder.quicksand(
		$filters,
		{
			duration: 1000
		});
	});
	
	$('.portfolio-categories li a').on('click', function(e) {
		$(".portfolio-categories li a").removeClass('active');
		$(this).addClass('active');
	});

	var wow = new WOW(
	{
		boxClass:     'wow',      // animated element css class (default is wow)
		animateClass: 'animated', // animation css class (default is animated)
		offset:       0,          // distance to the element when triggering the animation (default is 0)
		mobile:       true,       // trigger animations on mobile devices (default is true)
		live:         true        // act on asynchronously loaded content (default is true)
	});
	wow.init();
	
	/* Event - Window Load */
	$(window).load(function()
	{	

	});
	/* Event - Window Load /- */
	
	if (!$('html').is('.ie6, .ie7, .ie8'))
	{
		/* Event - Window Load */
		$(window).load(function()
		{		
			/* Loader */
			$("#site-loader").delay(1000).fadeOut("slow");
		});
		/* Event - Window Load /- */
	}
	else
	{
		$("#site-loader").css('display','none');
	}
	
})(jQuery);

jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('data-field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});