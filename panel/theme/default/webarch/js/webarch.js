(function($) {

    'use strict';

    var Webarch = function() {
        this.VERSION = "2.8.0";
        this.AUTHOR = "Revox";
        this.SUPPORT = "support@revox.io";
        this.$body = $('body');
        //COLORS
        this.color_green="#27cebc";
        this.color_blue="#00acec";
        this.color_yellow="#FDD01C";
        this.color_red="#f35958";
        this.color_grey="#dce0e8";
        this.color_black="#1b1e24";
        this.color_purple="#6d5eac";
        this.color_primary="#6d5eac";
        this.color_success="#4eb2f5";
        this.color_danger="#f35958";
        this.color_warning="#f7cf5e";
        this.color_info="#3b4751";
    }
    // Set environment vars
    Webarch.prototype.initHorizontalMenu = function() {
        $('.horizontal-menu .bar-inner > ul > li').on('click', function () {
            $(this).toggleClass('open').siblings().removeClass('open');

        });
         if($('body').hasClass('horizontal-menu')){
            $('.content').on('click', function () {
                $('.horizontal-menu .bar-inner > ul > li').removeClass('open');
            });
         }
    }
    // Tooltip
    Webarch.prototype.initTooltipPlugin = function() {
        $.fn.tooltip && $('[data-toggle="tooltip"]').tooltip();
    }
    // Popover
    Webarch.prototype.initPopoverPlugin = function() {
        $.fn.popover && $('[data-toggle="popover"]').popover();
    }
    // Retina Images
    Webarch.prototype.initUnveilPlugin = function() {
        $.fn.unveil && $("img").unveil();
    }
    // Auto Scroll Up
    Webarch.prototype.initScrollUp = function() {
        $('[data-webarch="scrollup"]').click(function () {
            $("html, body").animate({
                scrollTop: 0
            }, 700);
            return false;
        });
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('[data-webarch="scrollup"]').fadeIn();
            } else {
                $('[data-webarch="scrollup"]').fadeOut();
            }
        });
    }
    // Portlet / Panel Tools
    Webarch.prototype.initPortletTools = function() {
        var $this = this;
        $('.grid .tools a.remove').on('click', function () {
            var removable = jQuery(this).parents(".grid");
            if (removable.next().hasClass('grid') || removable.prev().hasClass('grid')) {
                jQuery(this).parents(".grid").remove();
            } else {
                jQuery(this).parents(".grid").parent().remove();
            }
        });

        $('.grid .tools a.reload').on('click', function () {
            var el = jQuery(this).parents(".grid");
            $this.blockUI(el);
            window.setTimeout(function () {
                $this.unblockUI(el);
            }, 1000);
        });

        $('.grid .tools .collapse, .grid .tools .expand').on('click', function () {
            var el = jQuery(this).parents(".grid").children(".grid-body");
            if (jQuery(this).hasClass("collapse")) {
                jQuery(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
            }
        });
        $('.widget-item > .controller .reload').click(function () {
            var el = $(this).parent().parent();
            $this.blockUI(el);
            window.setTimeout(function () {
                $this.unblockUI(el);
            }, 1000);
        });
        $('.widget-item > .controller .remove').click(function () {
            $(this).parent().parent().parent().addClass('animated fadeOut');
            $(this).parent().parent().parent().attr('id', 'id_remove_temp_id');
            setTimeout(function () {
                $('#id_remove_temp_id').remove();
            }, 400);
        });

        $('.tiles .controller .reload').click(function () {
            var el = $(this).parent().parent().parent();
            $this.blockUI(el);
            window.setTimeout(function () {
                $this.unblockUI(el);
            }, 1000);
        });
        $('.tiles .controller .remove').click(function () {
            $(this).parent().parent().parent().parent().addClass('animated fadeOut');
            $(this).parent().parent().parent().parent().attr('id', 'id_remove_temp_id');
            setTimeout(function () {
                $('#id_remove_temp_id').remove();
            }, 400);
        });
        if (!jQuery().sortable) {
            return;
        }
        $(".sortable").sortable({
            connectWith: '.sortable',
            iframeFix: false,
            items: 'div.grid',
            opacity: 0.8,
            helper: 'original',
            revert: true,
            forceHelperSize: true,
            placeholder: 'sortable-box-placeholder round-all',
            forcePlaceholderSize: true,
            tolerance: 'pointer'
        });
    }
    // Scrollbar Plugin
    Webarch.prototype.initScrollBar = function(){
        $.fn.scrollbar && $('.scroller').each(function () {
            var h = $(this).attr('data-height');
            $(this).scrollbar({
                ignoreMobile:true
            });
            if(h != null  || h !=""){
                if($(this).parent('.scroll-wrapper').length > 0)
                    $(this).parent().css('max-height',h);
                else
                    $(this).css('max-height',h);
            }
        });
    }
    // Sidebar
    Webarch.prototype.initSideBar = function(){
        var sidebar = $('.page-sidebar');
        var sidebarWrapper = $('.page-sidebar .page-sidebar-wrapper');
        sidebar.find('li > a').on('click', function (e) {
            if ($(this).next().hasClass('sub-menu') === false) {
                return;
            }
            var parent = $(this).parent().parent();
            parent.children('li.open').children('a').children('.arrow').removeClass('open');
            parent.children('li.open').children('a').children('.arrow').removeClass('active');
            parent.children('li.open').children('.sub-menu').slideUp(200);
            parent.children('li').removeClass('open');

            var sub = jQuery(this).next();
            if (sub.is(":visible")) {
                jQuery('.arrow', jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("active");
                sub.slideUp(200, function () {
                });
            } else {
                jQuery('.arrow', jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(200, function () {
                });
            }
            e.preventDefault();
        });
        //Auto close open menus in Condensed menu
        if (sidebar.hasClass('mini')) {
            var elem = jQuery('.page-sidebar ul');
            elem.children('li.open').children('a').children('.arrow').removeClass('open');
            elem.children('li.open').children('a').children('.arrow').removeClass('active');
            elem.children('li.open').children('.sub-menu').slideUp(200);
            elem.children('li').removeClass('open');
        }
        $.fn.scrollbar && sidebarWrapper.scrollbar();
    }
    // Sidebar Toggler
    Webarch.prototype.initSideBarToggle = function(){
        var $this = this;
        $('[data-webarch="toggle-left-side"]').on('touchstart click', function (e) {
            e.preventDefault();
            $this.toggleLeftSideBar();
        });
        $('[data-webarch="toggle-right-side"]').on('touchstart click', function (e) {
            e.preventDefault();
            $this.toggleRightSideBar();
        });
    }
    // Left Side Bar / Chat view
    Webarch.prototype.toggleLeftSideBar = function(){
        var timer;
        if($('body').hasClass('open-menu-left')){
            $('body').removeClass('open-menu-left');
            timer= setTimeout(function(){
                $('.page-sidebar').removeClass('visible');
            }, 300);
            
        }
        else{
            clearTimeout(timer);
            $('.page-sidebar').addClass('visible');
            setTimeout(function(){
                 $('body').addClass('open-menu-left');
            }, 50);
        }
    }
    // Right Side Bar / Mobile
    Webarch.prototype.toggleRightSideBar = function(){
        var timer;
        if($('body').hasClass('open-menu-right')){
            $('body').removeClass('open-menu-right');
            timer= setTimeout(function(){
                $('.chat-window-wrapper').removeClass('visible');
            }, 300);
        }
        else{ 
            clearTimeout(timer);
            $('.chat-window-wrapper').addClass('visible');
            $('body').addClass('open-menu-right');
        }        
    }
    // Util Functions
    Webarch.prototype.initUtil = function(){
        $('[data-height-adjust="true"]').each(function () {
            var h = $(this).attr('data-elem-height');
            $(this).css("min-height", h);
            $(this).css('background-image', 'url(' + $(this).attr("data-background-image") + ')');
            $(this).css('background-repeat', 'no-repeat');
            if ($(this).attr('data-background-image')) {

            }
        });

        $('[data-aspect-ratio="true"]').each(function () {
            $(this).height($(this).width());
        });

        $('[data-sync-height="true"]').each(function () {
            equalHeight($(this).children());
        });

        $('[data-webarch-toggler="checkall"]').on('click', function () {
            var $el = $(this);
            var $table =  $el.closest('table');
            if ($el.is(':checked')) {
                $table.find(':checkbox').attr('checked', true);
                $table.find('tr').addClass('row_selected'); 
            } else {
               $table.find(':checkbox').attr('checked', false);
               $table.find('tr').removeClass('row_selected');
            }
        });

        $(window).resize(function () {
            $('[data-aspect-ratio="true"]').each(function () {
                $(this).height($(this).width());
            });
            $('[data-sync-height="true"]').each(function () {
                equalHeight($(this).children());
            });

        });
        function equalHeight(group) {
            var tallest = 0;
            group.each(function () {
                var thisHeight = $(this).height();
                if (thisHeight > tallest) {
                    tallest = thisHeight;
                }
            });
            group.height(tallest);
        }
        $('#my-task-list').popover({
            html: true,
            content: function () {
                return $('#notification-list').html();
            }
        });

        $('#user-options').click(function () {
            $('#my-task-list').popover('hide');
        });
        
        $('table th .checkall').on('click', function () {
            if ($(this).is(':checked')) {
                $(this).closest('table').find(':checkbox').attr('checked', true);
                $(this).closest('table').find('tr').addClass('row_selected');
                //$(this).parent().parent().parent().toggleClass('row_selected');   
            } else {
                $(this).closest('table').find(':checkbox').attr('checked', false);
                $(this).closest('table').find('tr').removeClass('row_selected');
            }
        });
    }
    // Progress bar animation
    Webarch.prototype.initProgress = function(){
        $('[data-init="animate-number"], .animate-number').each(function () {
            var data = $(this).data();
            $(this).animateNumbers(data.value, true, parseInt(data.animationDuration, 10));
        });
        $('[data-init="animate-progress-bar"], .animate-progress-bar').each(function () {
            var data = $(this).data();
            $(this).css('width', data.percentage);
        });
    }
    // Select2 Plugin
    Webarch.prototype.initSelect2Plugin = function() {
        $.fn.select2 && $('[data-init-plugin="select2"]').each(function() {
            $(this).select2({
                minimumResultsForSearch: ($(this).attr('data-disable-search') == 'true' ? -1 : 1)
            }).on('select2-opening', function() {
                $.fn.scrollbar && $('.select2-results').scrollbar({
                    ignoreMobile: false
                })
            });
        });
    }
    // Form Elements
    Webarch.prototype.initFormElements = function(){
        $(".inside").children('input').blur(function () {
            $(this).parent().children('.add-on').removeClass('input-focus');
        });

        $(".inside").children('input').focus(function () {
            $(this).parent().children('.add-on').addClass('input-focus');
        });

        $(".input-group.transparent").children('input').blur(function () {
            $(this).parent().children('.input-group-addon').removeClass('input-focus');
        });

        $(".input-group.transparent").children('input').focus(function () {
            $(this).parent().children('.input-group-addon').addClass('input-focus');
        });

        $(".bootstrap-tagsinput input").blur(function () {
            $(this).parent().removeClass('input-focus');
        });

        $(".bootstrap-tagsinput input").focus(function () {
            $(this).parent().addClass('input-focus');
        });
    }
    // Validation Plugin
    Webarch.prototype.initValidatorPlugin = function() {
        $.validator && $.validator.setDefaults({
            errorPlacement: function(error, element) {
                var parent = $(element).closest('.form-group');
                if (parent.hasClass('form-group-default')) {
                    parent.addClass('has-error');
                    error.insertAfter(parent);
                } else {
                    error.insertAfter(element);
                }
            },
            onfocusout: function(element) {
                var parent = $(element).closest('.form-group');
                if ($(element).valid()) {
                    parent.removeClass('has-error');
                    parent.next('.error').remove();
                }
            },
            onkeyup: function(element) {
                var parent = $(element).closest('.form-group');
                if ($(element).valid()) {
                    $(element).removeClass('error');
                    parent.removeClass('has-error');
                    parent.next('label.error').remove();
                    parent.find('label.error').remove();
                } else {
                    parent.addClass('has-error');
                }
            },
            success: function (label, element) {
                // var parent = $(element).parent('.input-with-icon');
                // parent.removeClass('error-control').addClass('success-control'); 
            },
        });

        $('.validate').validate();
    }
    // Block UI
    Webarch.prototype.blockUI = function(el){
        $(el).block({
            message: '<div class="loading-animator"></div>',
            css: {
                border: 'none',
                padding: '2px',
                backgroundColor: 'none'
            },
            overlayCSS: {
                backgroundColor: '#fff',
                opacity: 0.3,
                cursor: 'wait'
            }
        });
    }
    Webarch.prototype.unblockUI = function(el){
        $(el).unblock();
    }
    // Call initializers
    Webarch.prototype.init = function() {
        // init layout
        this.initSideBar();
        this.initSideBarToggle();
        this.initHorizontalMenu();
        this.initPortletTools();
        this.initScrollUp();
        this.initProgress();
        this.initFormElements();
        // init plugins
        this.initSelect2Plugin();
        this.initUnveilPlugin();
        this.initScrollBar();
        this.initTooltipPlugin();
        this.initPopoverPlugin();
        this.initValidatorPlugin();
        this.initUtil();

    }

    $.Webarch = new Webarch();
    $.Webarch.Constructor = Webarch;

})(window.jQuery);

// DEMO STUFF
$(document).ready(function () {

    $("#menu-collapse").click(function () {
        if ($('.page-sidebar').hasClass('mini')) {
            $('.page-sidebar').removeClass('mini');
            $('.page-content').removeClass('condensed-layout');
            $('.footer-widget').show();
        } else {
            $('.page-sidebar').addClass('mini');
            $('.page-content').addClass('condensed-layout');
            $('.footer-widget').hide();
        }
    });

    $(".simple-chat-popup").click(function () {
        $(this).addClass('hide');
        $('#chat-message-count').addClass('hide');
    });

    setTimeout(function () {
        $('#chat-message-count').removeClass('hide');
        $('#chat-message-count').addClass('animated bounceIn');
        $('.simple-chat-popup').removeClass('hide');
        $('.simple-chat-popup').addClass('animated fadeIn');
    }, 5000);
    setTimeout(function () {
        $('.simple-chat-popup').addClass('hide');
        $('.simple-chat-popup').removeClass('animated fadeIn');
        $('.simple-chat-popup').addClass('animated fadeOut');
    }, 8000);


    //***********************************END Grids*****************************				



    //***********************************BEGIN Main Menu Toggle *****************************	
    $('#layout-condensed-toggle').click(function () {
        if ($('#main-menu').attr('data-inner-menu') == '1') {
            //Do nothing
            console.log("Menu is already condensed");
        } else {
            if ($('#main-menu').hasClass('mini')) {
                $('body').removeClass('grey');
                $('body').removeClass('condense-menu');
                $('#main-menu').removeClass('mini');
                $('.page-content').removeClass('condensed');
                $('.scrollup').removeClass('to-edge');
                $('.header-seperation').show();
                //Bug fix - In high resolution screen it leaves a white margin
                $('.header-seperation').css('height', '61px');
                $('.footer-widget').show();
            } else {
                $('body').addClass('grey');
                $('#main-menu').addClass('mini');
                $('.page-content').addClass('condensed');
                $('.scrollup').addClass('to-edge');
                $('.header-seperation').hide();
                $('.footer-widget').hide();
                $('.main-menu-wrapper').scrollbar('destroy');
            }
        }
    });

    if ($.fn.sparkline) {
        $('.sparklines').sparkline('html', {
            enableTagOptions: true
        });
    }

});



//******************************* Bind Functions Jquery- LAYOUT OPTIONS API ***************

(function ($) {
    //Show/Hide Main Menu
    $.fn.toggleMenu = function () {
        var windowWidth = window.innerWidth;
        if(windowWidth >768){
            $(this).toggleClass('hide-sidebar');
        }
    };
    //Condense Main Menu
    $.fn.condensMenu = function () {
        var windowWidth = window.innerWidth;
        if(windowWidth >768){
            if ($(this).hasClass('hide-sidebar')) $(this).toggleClass('hide-sidebar');

            $(this).toggleClass('condense-menu');
            $(this).find('#main-menu').toggleClass('mini');
        }
    };
    //Toggle Fixed Menu Options
    $.fn.toggleFixedMenu = function () {
        var windowWidth = window.innerWidth;
        if(windowWidth >768){
        $(this).toggleClass('menu-non-fixed');
        }
    };

    $.fn.toggleHeader = function () {
        $(this).toggleClass('hide-top-content-header');
    };

    $.fn.toggleChat = function () {
        $.Webarch.toggleRightSideBar();
    };
    $.fn.layoutReset = function () {
        $(this).removeClass('hide-sidebar');
        $(this).removeClass('condense-menu');
        $(this).removeClass('hide-top-content-header');
        if(!$('body').hasClass('extended-layout'))
        $(this).find('#main-menu').removeClass('mini');
    };    

})(jQuery);


$(function() {
    'use strict';
    // Initialize layouts and plugins
    $.Webarch.init();
});