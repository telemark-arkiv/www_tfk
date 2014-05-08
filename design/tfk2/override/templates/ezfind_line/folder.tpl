
{def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
<article class="item">
    {if $ingressbilde}
        <a href={$node.url_alias|ezurl}><img src="/{$ingressbilde.data_map.image.content.[listebilde].full_path}" width="139" alt="Gå til mappen: {$node.data_map.name.content|wash()}"></a>
    {/if}
    <div class="frame">
        <h2><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash}</a></h2>
        {if $node.data_map.show_publishdate.content}
           <em class="date">Publisert {$node.object.published|l10n(date)}</em>
        {/if}
        {if $node.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$node.data_map.short_intro}</p>
        {else}
            {def $xml_content=$node.data_map.short_description.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        {if $node.data_map.description.has_content }
        <a href={$node.url_alias|ezurl} class="more" title="Gå til mappen: {$node.data_map.name.content|wash()}">Les mer</a>
        {/if}
    </div>
</article>