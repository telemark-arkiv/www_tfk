<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="/extension/www_tfk/design/tfk2/javascript/vendor/jquery-1.10.2.min.js"><' + '/script>');</script>
<script src="/extension/www_tfk/design/tfk2/javascript/main-c9aacf34.js"></script>
<script src="/extension/www_tfk/design/tfk2/javascript/slider-45281904.js"></script>
<script src="/extension/www_tfk/design/tfk2/javascript/tabs-63bab98a.js"></script>

{*
{if $pagedesign.data_map.footer_script.has_content}
<script type="text/javascript">
<!--
    {$pagedesign.data_map.footer_script.content}
-->
</script>
{/if}
*}
{* Override this template and place javascript based statestics here (like Google Analytics) *}

{*
{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::yui3', 'ezjsc::yui3io', 'ezjsc::yui2', 'ezajaxsearch.js', 'ezajax_autocomplete.js' ) )}
<script>
jQuery('#ezautocompletecontainer').css('width', jQuery('input#SearchText').width() + 60);
var autocomplete = new eZAJAXAutoComplete({ldelim}
    url: '{'ezjscore/call/ezfind::autocomplete'|ezurl('no')}',
    inputid: 'SearchText',
    containerid: 'ezautocompletecontainer',
    minquerylength: {ezini( 'AutoCompleteSettings', 'MinQueryLength', 'ezfind.ini' )},
    resultlimit: {ezini( 'AutoCompleteSettings', 'Limit', 'ezfind.ini' )}
{rdelim});
</script>
*}