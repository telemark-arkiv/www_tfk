
{*
{def $campaigns=fetch( 'content', 'list', hash( 'parent_node_id', '2',
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'kampanjecontainer' ) ) ) }

{if $campaigns}
	<div class="content">
        <div class="constrained-content">
			{foreach $campaigns as $campaign}
        		{node_view_gui content_node=$campaign view=full}
    		{/foreach}
		</div>
	</div>
{/if}
*}