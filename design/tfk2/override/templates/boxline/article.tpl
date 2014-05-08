<div class="content-view-boxline">
    <div class="class-{$node.class_identifier}">
        <div class="attribute-title">
            <p><a href={$node.url_alias|ezurl}>{$node.data_map.title.content}</a></p>
        </div>

        {if $node.data_map.show_publishdate.content}
           <em class="date">Publisert {$node.object.published|l10n(date)}</em>
        {/if}
        {if $node.data_map.short_intro.content}
            <p>{attribute_view_gui attribute=$node.data_map.short_intro}</p>
        {else}
            {def $xml_content=$node.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p>{$text_content|shorten(85)}</p>
        {/if}
        {if $node.data_map.body.has_content }
        <a href={$node.url_alias|ezurl} class="more">Les mer</a>
        {/if}
    </div>
</div>