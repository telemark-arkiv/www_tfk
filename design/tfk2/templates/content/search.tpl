{ezpagedata_set( 'extra_menu', false() )}

{def $search=false()}
{if $use_template_search}
    {set $page_limit=10}

    {def $activeFacetParameters = array()}
    {if ezhttp_hasvariable( 'activeFacets', 'get' )}
        {set $activeFacetParameters = ezhttp( 'activeFacets', 'get' )}
    {/if}

    {def $dateFilter=0}
    {if ezhttp_hasvariable( 'dateFilter', 'get' )}
        {set $dateFilter = ezhttp( 'dateFilter', 'get' )}
        {switch match=$dateFilter}
            {case match=1}
                {def $dateFilterLabel="Last day"|i18n("design/standard/content/search")}
            {/case}
            {case match=2}
                {def $dateFilterLabel="Last week"|i18n("design/standard/content/search")}
            {/case}
            {case match=3}
                {def $dateFilterLabel="Last month"|i18n("design/standard/content/search")}
            {/case}
            {case match=4}
                {def $dateFilterLabel="Last three months"|i18n("design/standard/content/search")}
            {/case}
            {case match=5}
                {def $dateFilterLabel="Last year"|i18n("design/standard/content/search")}
            {/case}
        {/switch}
    {/if}

    {def $filterParameters = fetch( 'ezfind', 'filterParameters' )
         $defaultSearchFacets = fetch( 'ezfind', 'getDefaultSearchFacets' )}
    {* def $facetParameters=$defaultSearchFacets|array_merge_recursive( $activeFacetParameters ) *}

    {set $search=fetch( ezfind,search,
                        hash( 'query', $search_text,
                              'offset', $view_parameters.offset,
                              'limit', $page_limit,
                              'sort_by', hash( 'score', 'desc' ),
                              'facet', $defaultSearchFacets,
                              'filter', $filterParameters,
                              'publish_date', $dateFilter,
                              'class_id', array( 'folder', 'article' ),
                              'section_id', 1, 
                              'spell_check', array( true() ),
                              'search_result_clustering', hash( 'clustering', 'true') )
                             )}
    {set $search_result=$search['SearchResult']}
    {set $search_count=$search['SearchCount']}
    {def $search_extras=$search['SearchExtras']}
    {set $stop_word_array=$search['StopWordArray']}
    {set $search_data=$search}
    {debug-log var=$search_extras.facet_fields msg='$search_extras.facet_fields'}
{/if}
{def $baseURI=concat( '/content/search?SearchText=', $search_text )}

{* Build the URI suffix, used throughout all URL generations in this page *}
{def $uriSuffix = ''}
{foreach $activeFacetParameters as $facetField => $facetValue}
    {set $uriSuffix = concat( $uriSuffix, '&activeFacets[', $facetField, ']=', $facetValue )}
{/foreach}

{foreach $filterParameters as $name => $value}
    {set $uriSuffix = concat( $uriSuffix, '&filter[]=', $name, ':', $value )}
{/foreach}

{if gt( $dateFilter, 0 )}
    {set $uriSuffix = concat( $uriSuffix, '&dateFilter=', $dateFilter )}
{/if}


{literal}
  <script>
    // toggle block
    function ezfToggleBlock( id )
    {
        var value = (document.getElementById(id).style.display == 'none') ? 'block' : 'none';
        ezfSetBlock( id, value );
        ezfSetCookie( id, value );
    }

    function ezfSetBlock( id, value )
    {
        var el = document.getElementById(id);
        if ( el != null )
        {
            el.style.display = value;
        }
    }

    function ezfTrim( str )
    {
        return str.replace(/^\s+|\s+$/g, '') ;
    }

    function ezfGetCookie( name )
    {
        var cookieName = 'eZFind_' + name;
        var cookie = document.cookie;

        var cookieList = cookie.split( ";" );

        for( var idx in cookieList )
        {
            cookie = cookieList[idx].split( "=" );

            if ( ezfTrim( cookie[0] ) == cookieName )
            {
                return( cookie[1] );
            }
        }

        return 'none';
    }

    function ezfSetCookie( name, value )
    {
        var cookieName = 'eZFind_' + name;
        var expires = new Date();

        expires.setTime( expires.getTime() + (365 * 24 * 60 * 60 * 1000));

        document.cookie = cookieName + "=" + value + "; expires=" + expires + ";";
    }
  </script>
{/literal}

{switch name=Sw match=$search_count}
  {case match=0}
  {ezpagedata_set( 'extra_menu', true() )}
  {/case}
  {case}
  <aside class="aside" id="search_controls">
          {def $activeFacetsCount=0}
          
          {foreach $defaultSearchFacets as $key => $defaultFacet}
              {if array_keys( $activeFacetParameters )|contains( concat( $defaultFacet['field'], ':', $defaultFacet['name']  ) )}
              <strong class="title">// Filter</strong>
              <ul class="side-nav">
                  {def $facetData=$search_extras.facet_fields.$key}
                  {foreach $facetData.nameList as $key2 => $facetName}
                      {if eq( $activeFacetParameters[concat( $defaultFacet['field'], ':', $defaultFacet['name'] )], $facetName )}
                          {set $activeFacetsCount=sum( $key, 1 )}
                          {def $suffix=$uriSuffix|explode( concat( '&filter[]=', $facetData.queryLimit[$key2]|solr_quotes_escape ) )|implode( '' )|explode( concat( '&activeFacets[', $defaultFacet['field'], ':', $defaultFacet['name'], ']=', $facetName ) )|implode( '' )}
                          <li>
                              <a href={concat( $baseURI, $suffix )|ezurl}>[x]{$facetName|trim('"')|wash}</a>
                          </li>
                      {/if}
                  {/foreach}
                  {undef $facetData}
              {/if}
          {/foreach}

          {* handle date filter here, manually for now. Should be a facet later on *}
          {if gt( $dateFilter, 0 )}
              <li>
                 {set $activeFacetsCount=$activeFacetsCount|inc}
                 {def $suffix=$uriSuffix|explode( concat( '&dateFilter=', $dateFilter ) )|implode( '' )}
                  <a href={concat( $baseURI, $suffix )|ezurl}>[x]</a> <strong>{'Creation time'|i18n( 'extension/ezfind/facets' )}</strong>: {$dateFilterLabel}
              </li>
          {/if}

          {if ge( $activeFacetsCount, 2 )}
              <li>
                  <a href={$baseURI|ezurl}>[x]</a> <em>{'Clear all'|i18n( 'extension/ezfind/facets' )}</em>
              </li>
          {/if}
          {if $activeFacetsCount}
          </ul>
          {/if}

          
          {foreach $defaultSearchFacets as $key => $defaultFacet}
              {if array_keys( $activeFacetParameters )|contains( concat( $defaultFacet['field'], ':', $defaultFacet['name']  ) )|not}
              {if $defaultFacet['name']}<strong class="title">// {$defaultFacet['name']|i18n( 'extension/ezfind/facets' )}</strong>{/if}
             <ul class="side-nav">
                {def $facetData=$search_extras.facet_fields.$key}
                    {foreach $facetData.nameList as $key2 => $facetName}
                        {if ne( $key2, '' )}
                             <li><a href={concat(
                                $baseURI, '&filter[]=', $facetData.queryLimit[$key2]|solr_quotes_escape|rawurlencode,
                                '&activeFacets[', $defaultFacet['field'], ':', $defaultFacet['name'], ']=',
                                $facetName|rawurlencode,
                                $uriSuffix )|ezurl}>
                            {$facetName|wash}</a> ({$facetData.countList[$key2]})</li>
                        {/if}
                    {/foreach}
                  {undef $facetData}
              {/if}
           </ul>
          {/foreach}  
            {* date filtering here. Using a simple filter for now. Should use the date facets later on *}
          {if eq( $dateFilter, 0 )}
           <strong class="title">// {'Creation time'|i18n( 'extension/ezfind/facets' )}</strong>
                  <ul class="side-nav">
                    <li>
                        <a href={concat( $baseURI, '&dateFilter=1', $uriSuffix )|ezurl}>{"Last day"|i18n("design/standard/content/search")}</a>
                    </li>
                    <li>
                        <a href={concat( $baseURI, '&dateFilter=2', $uriSuffix )|ezurl}>{"Last week"|i18n("design/standard/content/search")}</a>
                    </li>
                    <li>
                        <a href={concat( $baseURI, '&dateFilter=3', $uriSuffix )|ezurl}>{"Last month"|i18n("design/standard/content/search")}</a>
                    </li>
                    <li>
                        <a href={concat( $baseURI, '&dateFilter=4', $uriSuffix )|ezurl}>{"Last three months"|i18n("design/standard/content/search")}</a>
                    </li>
                    <li>
                        <a href={concat( $baseURI, '&dateFilter=5', $uriSuffix )|ezurl}>{"Last year"|i18n("design/standard/content/search")}</a>
                    </li>
                  </ul>
           {/if}
          {*$search_extras|attribute(show,2)*}
  </aside>
  {/case}
{/switch}
 
<div class="content-holder">


  <div id="results-block">

<form action={"/content/search/"|ezurl} method="get">
    <h1>// Søkeresultat</h1>

{switch name=Sw match=$search_count}
  {case match=0}
  <div class="warning">
  <h2>{'No results were found when searching for "%1".'|i18n("design/ezwebin/content/search",,array($search_text|wash))}</h2>
  {if $search_extras.hasError}
      {$search_extras.error|wash}
  {/if}
  {*if $search_extras.spellcheck_collation}
     <b>Did you mean {$search_extras.spellcheck_collation} ?</b>
  {/if*}
  </div>
    <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
    <ul>
        <li>{'Check spelling of keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try changing some keywords (eg, "car" instead of "cars").'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Try searching with less specific keywords.'|i18n('design/ezwebin/content/search')}</li>
        <li>{'Reduce number of keywords to get more results.'|i18n('design/ezwebin/content/search')}</li>
    </ul>
  {/case}
{/switch}


    {include name=Navigator
             uri='design:navigator/google.tpl'
             page_uri='/content/search'
             page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)), $uriSuffix )
             item_count=$search_count
             view_parameters=$view_parameters
             item_limit=$page_limit
             navigator_id='paging'}

<section class="results">
  {foreach $search_result as $result
             sequence array(bglight,bgdark) as $bgColor}
       {node_view_gui view=ezfind_line sequence=$bgColor use_url_translation=$use_url_translation content_node=$result}
  {/foreach}
</section>
    

    {include name=Navigator
             uri='design:navigator/google.tpl'
             page_uri='/content/search'
             page_uri_suffix=concat('?SearchText=',$search_text|urlencode,$search_timestamp|gt(0)|choose('',concat('&SearchTimestamp=',$search_timestamp)), $uriSuffix )
             item_count=$search_count
             view_parameters=$view_parameters
             item_limit=$page_limit
             navigator_id='paging2'}
  
</form>

</div>

</div>
{*$search|attribute(show,2)*}

{ezscript_require( array('ezjsc::jquery', 'ezjsc::yui2', 'ezajax_autocomplete.js') )}
<script>
jQuery('#mainarea-autocomplete-rs').css('width', jQuery('input#Search').width());
var autocomplete = new eZAJAXAutoComplete({ldelim}
    url: "{'ezjscore/call/ezfind::autocomplete'|ezurl('no')}",
    inputid: 'Search',
    containerid: 'mainarea-autocomplete-rs',
    minquerylength: {ezini( 'AutoCompleteSettings', 'MinQueryLength', 'ezfind.ini' )},
    resultlimit: {ezini( 'AutoCompleteSettings', 'Limit', 'ezfind.ini' )}
{rdelim});

{literal}
ezfSetBlock( 'ezfFacets', ezfGetCookie( 'ezfFacets' ) );
ezfSetBlock( 'ezfHelp', ezfGetCookie( 'ezfHelp' ) );
{/literal}
</script>