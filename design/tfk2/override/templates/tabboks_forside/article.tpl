<div class="item item--vertical tabs__content__item__text grid__item--4-12">
    {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
    {if $ingressbilde}
        <a href={$node.url_alias|ezurl} aria-hidden="true" tabindex="-1" class="item__imglink imglink">
            <img src="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}" alt="Les artikkelen: {$node.data_map.title.content|wash()}"/>
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
            <p class="item__intro">{attribute_view_gui attribute=$node.data_map.short_intro}</p>
        {else}
            {def $xml_content=$node.data_map.intro.content.xml_data}
            {def $text_content=$xml_content|strip_tags()}
            <p class="item__intro">{$text_content|shorten(85)}</p>
        {/if}
        {*
        {if $node.data_map.body.has_content }
            <p class="item__intro"><a href={$node.url_alias|ezurl} class="more">Les mer</a></p>
         {/if}
         *}
    </div>
</div>


{*

<article class="col" style="height: 350px;{if eq(mod($this_index,3), 0)} margin-left: 0;{/if}">
    {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
    {if $ingressbilde}
    <a href={$node.url_alias|ezurl}>
        <img src="/{$ingressbilde.data_map.image.content.[listebilde_stort].full_path}" width="288" alt="Les artikkelen: {$node.data_map.title.content|wash()}" />
    </a>
    {/if}
    <div class="frame">
        <h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash()}</a></h2>
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
            <p><a href={$node.url_alias|ezurl} class="more">Les mer</a></p>
        {/if}
    </div>
</article>

*}