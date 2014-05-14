{* Landningpage folder *}
{def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
<div class="item item--vertical grid__item grid__item--4-12">
    {if $ingressbilde}
        <a href={$node.url_alias|ezurl}>
            <img src="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}" alt="image description" aria-hidden="true" tabindex="-1" class="item__imglink imglink"/>
        </a>
    {/if}
    <div class="item__content">
        <h2 class="item__header"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash()}</a></h2>
        {section show=$node.data_map.short_description.content.is_empty|not}
            {attribute_view_gui attribute=$node.data_map.short_description}
        {/section}
        {if $node.data_map.description.has_content }
            <a href={$node.url_alias|ezurl} class="more">Les mer</a>
        {/if}
    </div>
</div>