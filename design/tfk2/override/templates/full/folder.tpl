{def $section_added=''}
{def $unfiltered_infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $node.path_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }
{foreach $unfiltered_infoboxes as $ib}
  {if or($ib.data_map.inherit.content, eq($ib.parent_node_id, $node.node_id))}
    {set $section_added=1}
  {/if}
{/foreach}

    <div class="main__center">
        {if $node.data_map.show_name.content}
            <h1>{$node.data_map.name.content|wash()}</h1>
        {/if}

{*
        {if $node.data_map.do_show_image.content}
             {if $node.data_map.image.has_content}
                {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
                {if $ingressbilde}
                    <div class="top-image">
                        <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                            <source srcset="/{$ingressbilde.data_map.image.content.[responsive_12].full_path" media="(min-width: 886px)">
                            <source srcset="/{$ingressbilde.data_map.image.content.[responsive_09].full_path" media="(min-width: 600px)">
                            <source srcset="/{$ingressbilde.data_map.image.content.[responsive_06].full_path" media="(min-width: 400px)">
                            <source srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path><!--[if IE 9]></video><![endif]-->
                            <img srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path" alt="Jente på sykkel ved bussholdeplass">
                        </picture>
                        <!--img.top-image__img(src="/{$ingressbilde.data_map.image.content.[responsive_12].full_path")-->
                        <div class="top-image__text-wrapper">
                            <div class="top-image__text">
                                {if $node.data_map.image_title.content}
                                    <h2 class="top-image__header">{attribute_view_gui attribute=$node.data_map.image_title}</h2>
                                {/if}
                                <div class="top-image__body">
                                    {if $node.data_map.image_text.content}
                                        {attribute_view_gui attribute=$node.data_map.image_text}
                                    {/if}
                                    {if $ingressbilde.data_map.foto_byline.content}
                                        <br /><em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                                    {/if}
                               </div>
                            </div>
                        </div>
                    </div>
                {/if}
             {/if}
        {/if}
        {if $node.data_map.short_description.has_content}
            <div class="byline">{attribute_view_gui attribute=$node.data_map.short_description}</div>
        {/if}


        {if $node.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}

                    {if $node.object.data_map.show_children.data_int}
                        {def $limit=10
                             $classes=array( 'article', 'linkbox', 'survey' )
                             $articles=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                                       'sort_by', $node.sort_array,
                                                                       'class_filter_type', 'include',
                                                                       'class_filter_array', $classes
                                                                     ) )
                        }

                        {def $limit=10
                             $classes=array( 'personprofil' )
                             $employees=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                                       'sort_by', $node.sort_array,
                                                                       'class_filter_type', 'include',
                                                                       'class_filter_array', $classes
                                                                     ) )
                        }

                        {def $limit=20
                             $classes=array( 'folder', 'hidden_folder', 'frontpage_article', 'infobox', 'article', 'linkbox', 'personprofil', 'event_calendar', 'survey' )
                             $children_count=fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                                                   'class_filter_type', 'exclude',
                                                                                   'class_filter_array', $classes ) )
                             $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                                       'sort_by', $node.sort_array,
                                                                       'limit', $limit,
                                                                       'offset', $view_parameters.offset,
                                                                       'class_filter_type', 'exclude',
                                                                       'class_filter_array', $classes
                                                                     ) )
                        }

                        {foreach $articles as $article }
                          {node_view_gui content_node=$article view='line'}
                        {/foreach}

                        {foreach $employees as $employee }
                          {node_view_gui content_node=$employee view='line'}
                        {/foreach}



                        <!-- Section: list-area: END-->

                        {foreach $children as $child }
                          {node_view_gui content_node=$child view='line' section_added=$section_added}
                        {/foreach}

                        {include name=navigator
                                 uri='design:navigator/google.tpl'
                                 page_uri=$node.url_alias
                                 item_count=$children_count
                                 view_parameters=$view_parameters
                                 item_limit=$limit}

                    {/if}

*}

    </div><!-- class:main_center -->



{*
<div class="info-area">
    {if $node.data_map.show_name.content}
    <h1>// {$node.data_map.name.content|wash()}</h1>
    {/if}
    {if $node.data_map.do_show_image.content}
      {if $node.data_map.image.has_content}
        {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
        {if $ingressbilde}
            <!-- visual-inner -->
            <div class="visual-inner">
                <div class="visual-holder" style="width: 100%;">
                    {if $section_added}
                      <!-- Smalbilde -->
                      <a title="group" href="/{$ingressbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$ingressbilde.data_map.image.content.[ingress_smal].full_path}" width="508" alt="image description" /></a>
                    {else}
                      <!-- Breibilde -->
                      <a title="group" href="/{$ingressbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$ingressbilde.data_map.image.content.[ingress_bred].full_path}" width="768" alt="image description" /></a>
                    {/if}
                    <div class="popup-block">
                      <!-- panel -->
                      <div class="panel">
                        <div class="decription">
                          {if $node.data_map.image_title.content}
                            <strong>{attribute_view_gui attribute=$node.data_map.image_title}</strong><br/>
                          {/if}
                          {if $node.data_map.image_text.content}
                            {attribute_view_gui attribute=$node.data_map.image_text}
                          {/if}
                          {if $ingressbilde.data_map.foto_byline.content}
                            <br /><em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                          {/if}
                        </div>
                      </div>
                    </div>
                    <div class="block-info"{if $section_added|not} style="width: 746px;"{/if}>
                      <a href="#" class="btn">btn</a>
                      {if $node.data_map.image_title.content}
                        <strong>{attribute_view_gui attribute=$node.data_map.image_title}</strong>
                      {/if}
                      {if $ingressbilde.data_map.foto_byline.content}
                        <br /><em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                      {/if}
                    </div>
                </div>
            </div>
        {/if}
      {/if}
    {/if}

    {if $node.data_map.short_description.has_content}
        <div class="ingress">{attribute_view_gui attribute=$node.data_map.short_description}</div>
    {/if}
</div>

{if $node.data_map.description.has_content}
  {attribute_view_gui attribute=$node.data_map.description}
{/if}

{if $node.object.data_map.show_children.data_int}
    {def $limit=10
         $classes=array( 'article', 'linkbox', 'survey' )
         $articles=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', $classes
                                                 ) )
    }

    {def $limit=10
         $classes=array( 'personprofil' )
         $employees=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', $classes
                                                 ) )
    }

    {def $limit=20
         $classes=array( 'folder', 'hidden_folder', 'frontpage_article', 'infobox', 'article', 'linkbox', 'personprofil', 'event_calendar', 'survey' )
         $children_count=fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                               'class_filter_type', 'exclude',
                                                               'class_filter_array', $classes ) )
         $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'limit', $limit,
                                                   'offset', $view_parameters.offset,
                                                   'class_filter_type', 'exclude',
                                                   'class_filter_array', $classes
                                                 ) )
    }

    <section class="news-list"><!-- Section: News-List: START-->
    {foreach $articles as $article }
      {node_view_gui content_node=$article view='line'}
    {/foreach} 

    {foreach $employees as $employee }
      {node_view_gui content_node=$employee view='line'}
    {/foreach}

    </section><!-- Section: News-List: END-->

{*
    <section class="list-area"><!-- Section: list-area: START--> 
    {foreach $employees as $employee }
      {node_view_gui content_node=$employee view='line'}
    {/foreach}
    </section>
  *}
    <!-- Section: list-area: END-->

    {foreach $children as $child }
      {node_view_gui content_node=$child view='line' section_added=$section_added}
    {/foreach}

    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$node.url_alias
             item_count=$children_count
             view_parameters=$view_parameters
             item_limit=$limit}

{/if}
*}