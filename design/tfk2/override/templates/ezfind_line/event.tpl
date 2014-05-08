<article class="item">
    <div class="frame">
        <h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
        <em class="date">
            {if $node.data_map.from_time.content.timestamp|datetime( 'custom', '%H' )|ne( '00' )}
                {$node.data_map.from_time.content.timestamp|l10n( 'shortdatetime' )}
                {if $node.data_map.to_time.content.timestamp|gt(0)} - {$node.data_map.to_time.content.timestamp|l10n( 'shortdatetime' )}{/if}
            {else}
                {$node.data_map.from_time.content.timestamp|l10n( 'shortdate' )}
                {if $node.data_map.to_time.content.timestamp|gt(0)} - {$node.data_map.to_time.content.timestamp|l10n( 'shortdate' )}{/if}
            {/if}
        </em>
        <p></p>
        {if $node.data_map.text.has_content }
        <a href={$node.url_alias|ezurl} class="more" title="Les mer om hendelsen: {$node.data_map.title.content|wash()}">Les mer</a>
        {/if}
    </div>
</article>