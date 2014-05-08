<div class="text-holder">
	{if $node.data_map.show_name.content}
    	<h2>// {attribute_view_gui attribute=$node.data_map.name}</h2>
    {/if}
    <div class="holder">
        {attribute_view_gui attribute=$node.data_map.textcontent}
    </div>
</div>