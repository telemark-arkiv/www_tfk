{* Kolonne - Full *}

<!-- column -->
<div class="column">
	{if $node.data_map.show_name.content}
		<h2>// {$node.data_map.name.content}</h2>
	{/if}
	{if $node.data_map.body.content}
    	<div>
    		{attribute_view_gui attribute=$node.data_map.body}
    	</div>
	{/if}
</div>