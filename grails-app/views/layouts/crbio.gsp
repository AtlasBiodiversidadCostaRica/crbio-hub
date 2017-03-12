<g:set var="orgNameLong" value="${grailsApplication.config.skin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <alatag:addApplicationMetaTags />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">--}%

    <title><g:layoutTitle /></title>
    <r:require modules="bootstrap, hubCore, crbio" />
    <style type="text/css">
    body {
        background-color: #ffffff !important;
    }
    #breadcrumb {
        margin-top: 10px;
    }
    #main-content #searchInfoRow #customiseFacetsButton > .dropdown-menu {
        background-color: #ffffff;
    }
    #footer {
        margin: 20px;
        padding-top: 10px;
        border-top: 1px solid #CCC;
        font-size: 12px;
    }
    #content .nav-tabs > li.active > a {
        background-color: #ffffff;
    }
    .nav {
        margin-top: 20px;
    }
    body > #main-content {
        margin-top: 0px;
    }

    </style>
    <r:script disposition='head'>
        // initialise plugins
        jQuery(function(){
            // autocomplete on navbar search input
            jQuery("form#search-form-2011 input#search-2011, form#search-inpage input#search, input#search-2013").autocomplete('http://bie.ala.org.au/search/auto.jsonp', {
                extraParams: {limit: 100},
                dataType: 'jsonp',
                parse: function(data) {
                    var rows = new Array();
                    data = data.autoCompleteList;
                    for(var i=0; i<data.length; i++) {
                        rows[i] = {
                            data:data[i],
                            value: data[i].matchedNames[0],
                            result: data[i].matchedNames[0]
                        };
                    }
                    return rows;
                },
                matchSubset: false,
                formatItem: function(row, i, n) {
                    return row.matchedNames[0];
                },
                cacheLength: 10,
                minChars: 3,
                scroll: false,
                max: 10,
                selectFirst: false
            });

            // Mobile/desktop toggle
            // TODO: set a cookie so user's choice is remembered across pages
            var responsiveCssFile = $("#responsiveCss").attr("href"); // remember set href
            $(".toggleResponsive").click(function(e) {
                e.preventDefault();
                $(this).find("i").toggleClass("icon-resize-small icon-resize-full");
                var currentHref = $("#responsiveCss").attr("href");
                if (currentHref) {
                    $("#responsiveCss").attr("href", ""); // set to desktop (fixed)
                    $(this).find("span").html("Mobile");
                } else {
                    $("#responsiveCss").attr("href", responsiveCssFile); // set to mobile (responsive)
                    $(this).find("span").html("Desktop");
                }
            });

            $('.helphover').popover({animation: true, trigger:'hover'});
        });
    </r:script>
    <r:layoutResources/>
    <g:layoutHead />
</head>
<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
<g:set var="fluidLayout" value="${grailsApplication.config.skin.fluidLayout?.toBoolean()}"/>
<div id="crbio-navbar" class="navbar navbar-inverse navbar-static-top">
    <div class="navbar-inner ">
        <div class="${fluidLayout?'container-fluid':'container'}">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">${raw(orgNameLong)}</a>
            <div class="nav-collapse collapse">
                <p class="hide navbar-text pull-right">
                    Logged in as <a href="#" class="navbar-link">${username}</a>
                </p>
                <ul class="nav"> 
                    <li><a href="http://www.crbio.cr:8080/neoportal-web/groupNav?gni=579"><g:message code="generic.navbar02.li04" default="Species"/></a></li>
                    <!-- Style of next line must be moved to a class. Originally, it was 'class="active"' --> 
                    <li style="background-color: #999999"><a href="http://datos.crbio.cr/generic-hub"><g:message code="generic.navbar02.li01" default="Occurrences"/></a></li>
                    <li><a href="http://www.crbio.cr/crbio/?page_id=63"><g:message code="generic.navbar02.li02" default="About"/></a></li>
                    <li><a href="http://www.crbio.cr/crbio/?page_id=65"><g:message code="generic.navbar02.li03" default="Contact"/></a></li>
                    <li><langs:selector langs="es, en"/></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
    </div><!--/.navbar-inner -->
</div><!--/.navbar -->

<div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
    <g:layoutBody />
</div><!--/.container-->

<section class="partners">
    <div class="container-fluid">
    <div class="row-fluid">
        <div class="span2 vcenter">
            <a href="http://www.inbio.ac.cr/" target="_blank"><img src="${resource(dir:'images',file:'inbio.jpg')}" class="img-responsive center-block" alt="INBio"></a>
        </div>
        <div class="span1 vcenter">
            <a href="https://www.acguanacaste.ac.cr/" target="_blank"><img src="${resource(dir:'images',file:'acg.jpg')}" class="img-responsive center-block" alt="ACG"></a>
        </div>        
        <div class="span2 vcenter">
            <a href="http://www.ala.org.au/" target="_blank"><img src="${resource(dir:'images',file:'ala.png')}" class="img-responsive center-block" alt="ALA"></a>
        </div>
        <div class="span2 vcenter">
            <a href="https://www.gbif.org/" target="_blank"><img src="${resource(dir:'images',file:'gbif.jpg')}" class="img-responsive center-block" alt="GBIF"></a>
        </div>
        <div class="span2 vcenter">
            <a href="http://www.conicit.go.cr/" target="_blank"><img src="${resource(dir:'images',file:'conicit.png')}" class="img-responsive center-block" alt="Conicit"></a>
        </div>
        <div class="span1 vcenter">
            <a href="http://www.micit.go.cr/" target="_blank"><img src="${resource(dir:'images',file:'micitt.png')}" class="img-responsive center-block" alt="Micitt"></a>
        </div>
        <div class="span2 vcenter">
            <a href="https://crowdin.com/" target="_blank"><img src="${resource(dir:'images',file:'crowdin.png')}" class="img-responsive center-block" alt="Crowdin"></a>
        </div>
    </div>
    </div>
</section>

<div id="footer">
    <div class="container-fluid">
        <div class="row-fluid">
            <a href="http://creativecommons.org/licenses/by/3.0/au/" title="External link to Creative Commons"><img src="http://i.creativecommons.org/l/by/3.0/88x31.png" width="88" height="31" alt=""></a>
            This site is licensed under a <a href="http://creativecommons.org/licenses/by/3.0/au/" title="External link to Creative Commons" class="external">Creative Commons Attribution 3.0 Australia License</a>.
        Provider content may be covered by other <a href="#terms-of-use" title="Terms of Use">Terms of Use</a>.
        </div>
    </div>
</div><!--/#footer -->
<br/>

<!-- JS resources-->
<r:layoutResources/>
</body>
</html>
