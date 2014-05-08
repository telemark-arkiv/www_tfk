<article class="item">
    <div class="frame">
        <h2><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash}</a></h2>
        <em class="date">Publisert {$node.object.published|l10n(date)}</em>
        {if $node.data_map.description.content}
            {def $xml_content=$node.data_map.description.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        <a href={$node.url_alias|ezurl} class="more" title="Last ned filen: {$node.data_map.name.content|wash()}">Last ned</a>
    </div>
</article>