<!-- Standard landingsside -->
{def $classes=array( 'linkbox' )
	 $temas=fetch( 'content', 'list', hash( 'parent_node_id', $dennenoden.node_id,
                                                   'sort_by', $dennenoden.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', $classes
                                                 ) )
}


<div class="content">
    <div class="constrained-content">
        {if $dennenoden.data_map.show_name.content}
            <h1>{$dennenoden.data_map.name.content|wash()}</h1>
        {/if}
    
        {if $dennenoden.data_map.short_description.has_content}
            <strong>{attribute_view_gui attribute=$dennenoden.data_map.short_description}</strong>
        {/if}

	    {if $dennenoden.data_map.description.has_content}
	        {attribute_view_gui attribute=$dennenoden.data_map.description}
	    {/if}

        <div class="grid grid--12">
            {foreach $temas as $index => $tema}
	            {node_view_gui content_node=$tema view='landingpage' this_index=$index}
            {/foreach}
        </div>
    </div>
</div>