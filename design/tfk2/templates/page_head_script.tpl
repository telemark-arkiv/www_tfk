{* Load JavaScript dependencys + JavaScriptList *}
{*
{ezscript_load( array( ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ), ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) ) )}
*}
{literal}
<!--[if lt IE 9]>
        <script>
        document.createElement('header');
        document.createElement('nav');
        document.createElement('section');
        document.createElement('article');
        document.createElement('aside');
        document.createElement('footer');
        document.createElement('hgroup');
        </script>
<![endif]-->

{/literal}

{*
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-5569947-1']);
  _gaq.push(['_gat._anonymizeIp']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
*}


 <script src="/extension/www_tfk/design/tfk2/javascript/framework/vendor/modernizr-custom-0.4.1-60958dd2.js"></script>
    <script>
      // Picture element HTML5 shiv
      document.createElement( "picture" );
    </script>
    <script src="/extension/www_tfk/design/tfk2/javascript/framework/picturefill-4f393d90.js"></script>
    <noscript>
      <link href="/extension/www_tfk/design/tfk2/images/icons/icons.fallback.css" rel="stylesheet">
    </noscript>