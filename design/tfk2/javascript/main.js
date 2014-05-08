function initPage() {
    initNavButtons();
    initButtons();
    initMontages();
}

function initNavButtons() {
    var menu = document.getElementById("nav");
    if(menu) {
        var list = menu.getElementsByTagName("a");
        for(var i = 0; i < list.length; i++) {
            list[i].onmousedown = function() {
                if(this.className.indexOf("pressed") == -1) this.className += " pressed";
            }
            list[i].onmouseup = function() {
                this.className = this.className.replace("pressed","");
            }
            list[i].onmouseout = function() {
                this.className = this.className.replace("pressed","");
            } 
        }
    }
}

function initButtons() {
    var buttons = document.getElementsByTagName("a");
    for(var i = 0; i < buttons.length; i++) {
        if(buttons[i].className.indexOf("button") != -1) {
            buttons[i].onmousedown = function() {
                if(this.className.indexOf("pressed") == -1) this.className += " pressed";
            }
            buttons[i].onmouseup = function() {
                this.className = this.className.replace("pressed","");
            }
            buttons[i].onmouseout = function() {
                this.className = this.className.replace("pressed","");
            } 
        }
    }
}

/* For bildegalleriet */
     
        function makeMontage(containerId, fixedHeight) {

            var $container  = $(containerId),
                $imgs       = $container.find('img').hide(),
                totalImgs   = $imgs.length,
                cnt         = 0;
                
                $imgs.each(function(i) {
                    var $img    = $(this);
                    $('<img/>').load(function() {
                        ++cnt;
                        if( cnt === totalImgs ) {
                            $imgs.show();
                            $container.montage({
                                liquid                  : true,
                                margin                  : 1,
                                fillLastRow             : true,
                                alternateHeight         : false,
                                fixedHeight             : fixedHeight
                            });
                            
                        }
                    }).attr('src',$img.attr('src'));
                }); 

        };

function initMontages() {
    var montageContainers = $('.am-container');

    montageContainers.each(function() {
        var montageContainer = $(this);
        if(montageContainer.attr('id')) {
            var fixedHeight = parseInt(montageContainer.data('montageHeight'), 10);
            var montageContainerId = '#' + montageContainer.attr('id');
            makeMontage(montageContainerId, fixedHeight);
        }
    });
}

if (window.addEventListener)
    window.addEventListener("load", initPage, false);
else if (window.attachEvent && !window.opera)
    window.attachEvent("onload", initPage);