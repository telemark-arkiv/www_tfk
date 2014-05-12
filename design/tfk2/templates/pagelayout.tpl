<!DOCTYPE html>
{def $persistent=first_set( $module_result.content_info.persistent_variable, $persistent_variable, array() )}
{if is_set( $persistent.redirect )}{redirect( $persistent.redirect, 302 )}{/if}
<html lang="no">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">

{include uri='design:page_head_displaystyles.tpl'}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{*
{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
*}

{def $pagedata         = ezpagedata()
     $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $pagedesign       = $pagedata.template_look
     $current_node_id  = $pagedata.node_id
     $parent_node_id   = $pagedata.root_node
     $main_node_id     = $pagedata.main_node_id
     $current_class_identifier    = $pagedata.class_identifier
}

<!-- Array med ider til noder som skal ha egne landingssider-->
{def $landing_page_ids = array(111, 112, 792)}
<!-- Denne noden: {$current_node_id} -->
{if $landing_page_ids|contains($current_node_id)}
  {def $is_landingpage = 1}
  <!-- Denne noden skal ha landingsside -->
{/if}

{def $dennenoden=fetch( 'content', 'node', hash( 'node_id', $current_node_id ) )}

{* Sjekker om dette er en folder og om den i så fall har bannerbilde *}

{if $current_class_identifier|eq(folder)}
    {def $dennemappen=fetch( 'content', 'node', hash( 'node_id', $current_node_id ) )}
    {def $banner_bilde=fetch( 'content', 'object', hash( 'remote_id', $dennemappen.data_map.banner.content.remote_id ) )}
{/if}

{include uri='design:page_head.tpl'}

{* Sjekker om dette er en artikkel og legger i så fall inn Open Graph Metadata og metadata*}
{if $current_class_identifier|eq(article)}
    
    <meta name="keywords" content="{$dennenoden.data_map.meta_keywords.content|wash()}">
    <meta name="description" content="{$dennenoden.data_map.meta_description.content|wash()}">

    <meta property="og:type" content="article">
    <meta property="og:url" content="http://www.telemark.no/{$dennenoden.url}">
    <meta property="article:published_time" content="{$dennenoden.object.published|datetime('custom', '%c')}">
    <meta property="article:modified_time" content="{$dennenoden.object.modified|datetime('custom', '%c')}">
    <meta property="article:author" content="{attribute_view_gui attribute=$dennenoden.data_map.author}">
    <meta property="og:title" content="{$dennenoden.data_map.title.content|wash()}">
    <meta property="og:description" content="{attribute_view_gui attribute=$dennenoden.data_map.intro}">
    <meta property="og:site_name" content="www.telemark.no">

    {def $dennenode_ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $dennenoden.data_map.image.content.remote_id ) )}
    {if $dennenode_ingressbilde}
        <meta property="og:image" content="http://www.telemark.no/{$dennenode_ingressbilde.data_map.image.content.[ingress_smal].full_path}">
    {/if}

{/if}


{* Sjekker om dette er en mappe og legger i så fall inn metadata*}
{if $current_class_identifier|eq(folder)}
    
    <meta name="keywords" content="{$dennenoden.data_map.meta_keywords.content|wash()}">
    <meta name="description" content="{$dennenoden.data_map.meta_description.content|wash()}">

{/if}


{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>
<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->
{*<div id="page" class="{$pagestyle}">*}

  {if and( is_set( $pagedata.persistent_variable.extra_template_list ),
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
      {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
  {/if}
<div class="menu-container">
      <div id="mp-pusher" class="menu-pusher">

  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->




{*
  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}
*}

{*
  <!-- Top menu area: START -->
  {if $pagedata.top_menu}
   {include uri='design:menu/menu_top.tpl' nodebane=$dennenoden.path_array}
  {/if}
  <!--  Top menu area: END -->
*}

  <!-- Visualblock area: START -->
  {include uri='design:page_visualblock.tpl'}
  <!-- Visualblock area: START -->

  <!-- Path area: START -->
  {* Sjekker om current_node_id er hovedsiden (id 2) *}
  {if or( $module_result.node_id|is_set|not, $module_result.node_id|ne( 2 ) )}
    {if $banner_bilde}
      {include uri='design:page_toppath_banner.tpl'}
    {else}
      {include uri='design:page_toppath.tpl'}
    {/if}
  {else}
    {def $isfrontpage=1}
    {include uri='design:page_toppath_main.tpl'}
  {/if}
  <!-- Path area: END -->

  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    {include uri='design:page_toolbar.tpl'}
  {/if}
  <!-- Toolbar area: END -->
  <!-- main: START -->

{*
   {/cache-block}
{/cache-block}
*}


{*
{def $infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $current_node_id,
                                                      'sort_by', $dennenoden.sort_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }

{def $inherited_infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $dennenoden.parent.path_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }

*}


{def $infoboxes=array()}
{def $unfiltered_infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $dennenoden.path_array,
                                                      'sort_by', $dennenoden.sort_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }
{foreach $unfiltered_infoboxes as $ib}
  {if or($ib.data_map.inherit.content, eq($ib.parent_node_id, $current_node_id))}
    {set $infoboxes=$infoboxes|append($ib)}
  {/if}
{/foreach}


{if $infoboxes}
  {def $addsection=1}
  {set scope=global $persistent_variable=$#persistent_variable|merge( hash( 'addsection', 1 ) )}
{/if}

  <div id="main">
  
{if $pagedata.extra_menu|not}
  <!-- Frontpage start -->
  <!-- Columns area: START -->
  {elseif $is_landingpage}
    <!-- Dette er en landingsside-->

{elseif eq($module_result.section_id, 3)}
 <!-- Dette er en media side-->

  {elseif $addsection}
    <section class="main-block"><!-- Section Main-Block: START-->
     <!-- LeftSide menu area: START -->
    {include uri='design:menu/page_leftmenu.tpl'}
    <!-- LeftSide menu area: END -->
    <div class="content-holder">


    {elseif eq($current_class_identifier, 'event_calendar')}

    <section class="main-block"><!-- Section Main-Block: START-->
     <!-- LeftSide menu area: START -->
    {include uri='design:menu/page_leftmenu.tpl'}
    <!-- LeftSide menu area: END -->
    <div class="content-holder">


  {else}
    <!-- content-block -->
      <div class="content-holder">
  {/if}
   

 
    <!-- Main area: START -->
    {if $is_landingpage}
      <!-- Landingsside  -->
      {include uri='design:page_landing_standard.tpl'}
    {elseif or( $module_result.node_id|is_set|not, $module_result.node_id|ne( 2 ) )}
      {include uri='design:page_mainarea.tpl' addsection=$addsection current_node_id=$current_node_id}
    {else}
      {include uri='design:page_mainarea_frontpage.tpl'}
    {/if}
    <!-- Main area: END -->

  

{if $pagedata.extra_menu|not}
<!-- Frontpage end-->
{elseif eq($module_result.section_id, 3)}
<!-- Media seksjon -->
{elseif $is_landingpage}
<!-- Landingsside -->
{elseif $addsection}
    <!-- Sidebar infoboxes: START -->
    {include uri='design:page_sidebar.tpl' current_node_id=$current_node_id}
    <!-- Sidebar infoboxes: END -->
</div>
 

</section><!-- Section Main-Block: END-->

{elseif eq($current_class_identifier, 'event_calendar')}

    <!-- Sidebar infoboxes: START -->
    {include uri='design:page_sidebar_calendar.tpl'}
    <!-- Sidebar infoboxes: END -->
</div>
 

</section><!-- Section Main-Block: END-->


{else}
 
</div>
  <!-- LeftSide menu area: START -->
  {include uri='design:menu/page_leftmenu.tpl'}
  <!-- LeftSide menu area: END -->
{/if}



    


<!-- main: END -->
</div> 
{*
  {cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}
*}

    {if is_unset($pagedesign)}
        {def $pagedata   = ezpagedata()
             $pagedesign = $pagedata.template_look}
    {/if}

{*
    <!-- Extra area: START -->
    {if $pagedata.extra_menu}
        {include uri='design:page_extramenu.tpl'}
    {/if}
    <!-- Extra area: END -->
*}

  </div>
  </div>
  <!-- Columns area: END -->

  <!-- Footer area: START -->
  {include uri='design:page_footer.tpl'}
  <!-- Footer area: END -->

{*</div>*}
<!-- Complete page area: END -->

{*
{/cache-block}
*}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->
</html>
