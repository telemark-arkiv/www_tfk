<!-- Standard landingsside -->
{def $classes=array( 'linkbox' )
	 $temas=fetch( 'content', 'list', hash( 'parent_node_id', $dennenoden.node_id,
                                                   'sort_by', $dennenoden.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', $classes
                                                 ) )
}


<div class="info-area">
    {if $dennenoden.data_map.show_name.content}
    <h1 class="landingpage-header">{$dennenoden.data_map.name.content|wash()}</h1>
    {/if}
    
    {if $dennenoden.data_map.short_description.has_content}
        <strong>{attribute_view_gui attribute=$dennenoden.data_map.short_description}</strong>
    {/if}
	{if $dennenoden.data_map.description.has_content}
	  {attribute_view_gui attribute=$dennenoden.data_map.description}
	{/if}
</div>


<div class="info-block" style="background: transparent;">
	
{foreach $temas as $index => $tema}
	{node_view_gui content_node=$tema view='landingpage' this_index=$index}
{/foreach}
	
</div>