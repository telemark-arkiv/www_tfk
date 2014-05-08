<article class="col" style="height: 100px; margin-left: 15px;">
    <strong class="date">
        {$node.data_map.from_time.content.timestamp|datetime( 'custom', '%d' )}
        <span>{$node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )}</span>
    </strong>
    <div class="frame">
        <strong class="title"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></strong>
        {if and($node.object.data_map.to_time.has_content,  ne( $node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M"), $node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M") ))}
        {$node.data_map.from_time.content.timestamp|datetime( 'custom', '%d' )} {$node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )}
        - {$node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M")|shorten( 6 , '')}
    {/if}
        <p>{attribute_view_gui attribute=$node.data_map.short_description}</p>
        <ul>
            <li><a href={$node.url_alias|ezurl}>Les mer</a></li>
        </ul>
    </div>
</article>


{*






<div class="content-view-line">
    en kalenderevent tjo-bing
<div class="class-event">

<div class="attribute-date">
<h2>
<span class="day">{$node.data_map.from_time.content.timestamp|datetime( 'custom', '%d' )}</span>
<span class="month">{$node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )}</span>
</h2>
</div>

<div class="attribute-title">
{if $node.data_map.description.has_content}
<h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
{else}
<h2>{$node.data_map.title.content|wash}</h2>
{/if}
</div>

<div class="attribute-short">
{attribute_view_gui attribute=$node.data_map.short_description}
</div>

{if $node.data_map.description.has_content}
<div class="attribute-link">
<p><a href={$node.url_alias|ezurl}>Les mer</a></p>
</div>
{/if}

</div>
</div>

*}