<div class="item item--vertical {if $section_added}grid__item--3-6{else}grid__item--3-9{/if}">
    {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
    {if $ingressbilde}
        <a href={$node.url_alias|ezurl} aria-hidden="true" tabindex="-1" class="item__imglink imglink">
            <img src="/{$ingressbilde.data_map.image.content.[responsive_03].full_path}" alt="Les artikkelen: {$node.data_map.title.content|wash()}"/>
        </a>
    {/if}
    <div class="item__content">
        <h2 class="item__header">
            <a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a>
        </h2>
        {if $node.data_map.show_publishdate.content}
            <span class="sidenote">Publisert {$node.object.published|l10n(date)}</span>
        {/if}
        {if $node.data_map.short_intro.content}
            <div class="item__intro">{attribute_view_gui attribute=$node.data_map.short_intro}</div>
        {else}
            {def $xml_content=$node.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <div class="item__intro">{$text_content|shorten(85)}</div>
        {/if}
        {*
        {if $node.data_map.body.has_content }
            <div class="item__intro"><a href={$node.url_alias|ezurl} class="more">Les mer</a></div>
         {/if}
         *}
    </div>
</div>