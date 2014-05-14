<aside class="main__right">
    {if $node.object.data_map.hide_title.content|not}
        <h2>{$node.object.data_map.title.content|wash}</h2>
    {/if}

    {if $node.data_map.description.has_content}
            {attribute_view_gui attribute=$node.data_map.description}
    {/if}

    {if and( $node.data_map.related_object.has_content, $node.data_map.children_limit.data_int|gt(0) ) }

      {if $node.data_map.show_last.content}
        {def $children=fetch( 'content', 'tree', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array( 'article', 'file' ),
                                                                 'limit', $node.data_map.children_limit.data_int,
                                                                 'sort_by', array( 'published', false() ) ) ) }
      {else}

        {if $node.data_map.related_object.content.class_identifier|eq( 'event_calendar' )}
          {def $now = currentdate()
               $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array( 'event' ),
                                                         'attribute_filter', array( array( 'event/from_time', '>=', $now ) ),
                                                                 'limit', $node.data_map.children_limit.data_int,
                                                                 'sort_by', array( 'attribute', true(), 'event/from_time' ) ) )}
        {elseif $node.data_map.related_object.content.class_identifier|eq( 'image_gallery' )}
                {def $children=array()}
                {def $bg=fetch( 'content', 'node', hash( 'node_id', $node.data_map.related_object.content.main_node_id ) )}
                {set $children=$children|append($bg)}
        {else}
          {def $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                         'class_filter_type', 'exclude',
                                                         'class_filter_array', array( 'infobox', 'folder', 'frontpage_article', 'event_calendar' ),
                                                                 'limit', $node.data_map.children_limit.data_int,
                                                                 'sort_by', $node.data_map.related_object.content.main_node.sort_array ) )}
        {/if}

      {/if}

        {foreach $children as $child}
            {node_view_gui content_node=$child view=boxline show_intro=$node.data_map.show_intro.content}
        {/foreach}

    {/if}




</aside>


{*

{if $node.object.data_map.hide_title.content|not}
  <div class="contact-block">
    <strong class="title">// {$node.object.data_map.title.content|wash}</strong>
  </div>
{/if}

<div class="infobox">

<div class="content-view-boxfull float-break">
<div class="class-infobox">

{if $node.data_map.description.has_content}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
{/if}

{if and( $node.data_map.related_object.has_content, $node.data_map.children_limit.data_int|gt(0) ) }

  {if $node.data_map.show_last.content}
    {def $children=fetch( 'content', 'tree', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'article', 'file' ),
                                                             'limit', $node.data_map.children_limit.data_int,
                                                             'sort_by', array( 'published', false() ) ) ) }
  {else}
  
    {if $node.data_map.related_object.content.class_identifier|eq( 'event_calendar' )}
      {def $now = currentdate()
           $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                     'class_filter_type', 'include',
                                                     'class_filter_array', array( 'event' ),
                                                     'attribute_filter', array( array( 'event/from_time', '>=', $now ) ),
                                                             'limit', $node.data_map.children_limit.data_int,
                                                             'sort_by', array( 'attribute', true(), 'event/from_time' ) ) )}
    {elseif $node.data_map.related_object.content.class_identifier|eq( 'image_gallery' )}
            {def $children=array()}
            {def $bg=fetch( 'content', 'node', hash( 'node_id', $node.data_map.related_object.content.main_node_id ) )}
            {set $children=$children|append($bg)}
    {else}
      {def $children=fetch( 'content', 'list', hash( 'parent_node_id', $node.data_map.related_object.content.main_node_id,
                                                     'class_filter_type', 'exclude',
                                                     'class_filter_array', array( 'infobox', 'folder', 'frontpage_article', 'event_calendar' ),
                                                             'limit', $node.data_map.children_limit.data_int,
                                                             'sort_by', $node.data_map.related_object.content.main_node.sort_array ) )}
    {/if}
  
  {/if}
  
  <div class="content-view-children">
    {foreach $children as $child}
        {node_view_gui content_node=$child view=boxline show_intro=$node.data_map.show_intro.content}
    {/foreach}
  </div>

{/if}


</div>
</div>

</div>
*}