<!-- Landningpage folder -->
<div class="item">
    {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

    {if $ingressbilde}
    <a href={$node.url_alias|ezurl}><img src="/{$ingressbilde.data_map.image.content.[listebilde].full_path}" width="228" alt="image description"></a>
    {/if}
    <div class="holder">
        <h3><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash()}</a></h3>
        {section show=$node.data_map.short_description.content.is_empty|not}
            {attribute_view_gui attribute=$node.data_map.short_description}
        {/section}
        {if $node.data_map.description.has_content }
        <a href={$node.url_alias|ezurl} class="more">Les mer</a>
        {/if}
    </div>
</div>