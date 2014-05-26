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

    {if $node.data_map.do_show_image.content}
        {if $node.data_map.image.has_content}
            {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
            {if $ingressbilde}
                <div class="top-image">
                    <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                        <source srcset="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 1024px)">
                        <source srcset="/{$ingressbilde.data_map.image.content.[responsive_12].full_path}" media="(min-width: 846px)">
                        <source srcset="/{$ingressbilde.data_map.image.content.[responsive_09].full_path}" media="(min-width: 560px)">
                        <source srcset="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 360px)">
                        <source srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}"><!--[if IE 9]></video><![endif]-->
                        <img srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}" alt="{$ingressbilde.data_map.image.content.alternative_text}">
                        <!--img.top-image__img(src="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}")-->
                    </picture>
                    <div class="top-image__text-wrapper">
                        <div class="top-image__text">
                            {if $node.data_map.image_title.content}
                                <div class="top-image__header">
                                    {attribute_view_gui attribute=$node.data_map.image_title}
                                </div>
                            {/if}
                            <div class="top-image__body">
                                {if $node.data_map.image_text.content}
                                    {attribute_view_gui attribute=$node.data_map.image_text}<br />
                                {/if}
                                {if $ingressbilde.data_map.foto_byline.content}
                                    <em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                                {/if}
                            </div>
                            <a href="/{$ingressbilde.data_map.image.content.[responsive_12].full_path}" data-title="{attribute_view_gui attribute=$node.data_map.image_title}" class="top-image__expand-link js-popup--gallery"><span class="visuallyhidden">Åpne</span></a>
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

                        {if $articles}
                            <div class="grid {if $section_added}grid--6{else}grid--9{/if}">
                                {foreach $articles as $article }
                                    {node_view_gui content_node=$article view='line' section_added=$section_added}
                                {/foreach}
                            </div>
                        {/if}

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



</div><!-- class:main_center -->