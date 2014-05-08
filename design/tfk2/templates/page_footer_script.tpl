{if $pagedesign.data_map.footer_script.has_content}
<script type="text/javascript">
<!--
    {$pagedesign.data_map.footer_script.content}
-->
</script>
{/if}
{* Override this template and place javascript based statestics here (like Google Analytics) *}

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