{def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
<article class="item">
    {if $ingressbilde}
        <a href={$node.url_alias|ezurl}><img src="/{$ingressbilde.data_map.image.content.[listebilde].full_path}" width="228" alt="Gå til skjemaet: {$node.name|wash()}"></a>
    {/if}
    <div class="frame">
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>
        {if $node.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$node.data_map.short_intro}</p>
        {else}
            {def $xml_content=$node.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        <a href={$node.url_alias|ezurl} class="more">Les mer</a>
    </div>
</article>