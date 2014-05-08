{* Kolonneblock - Line *}

<!-- columns -->
<section class="columns">
	{if $node.data_map.show_name.content}
		<h2>// {$node.data_map.name.content|wash()}</h2>
	{/if}
    <div class="columns-holder">
        {foreach $node.children as $kolonne}
            {node_view_gui content_node=$kolonne view=full}
        {/foreach}
    </div>
</section>