{* Infobox view of Event *}

<div class="content-view-boxline">
<div class="class-event">

<div class="attribute-title">
{if or( $node.data_map.description.has_content, $show_intro|not )}
<p><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></p>
{else}
<p>{$node.data_map.title.content|wash}</p>
{/if}

<p class="date">
{if $node.data_map.from_time.content.timestamp|datetime( 'custom', '%H' )|ne( '00' )}
    {$node.data_map.from_time.content.timestamp|l10n( 'shortdatetime' )}
{else}
    {$node.data_map.from_time.content.timestamp|l10n( 'shortdate' )}
{/if}
</p>

</div>

</div>
</div>