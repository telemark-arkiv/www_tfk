{def $profilbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

<div class="{if $node.data_map.show_compact.content}grid__item grid__item--3-6 {/if}media item item--horizontal">
    {if $profilbilde}
        <div class="media__img">
            {if $node.data_map.show_compact.content}
                <img src="/{$profilbilde.data_map.image.content.[responsive_01].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}">
            {else}
                <img src="/{$profilbilde.data_map.image.content.[responsive_02].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}">
            {/if}
        </div>
    {/if}
    <div class="media__bd">
        <h2 class="item__header">{$node.data_map.firstname.content} {$node.data_map.lastname.content}</h2>
        <p class="sidenote">
            {if $node.data_map.jobtitle.content}<em>{$node.data_map.jobtitle.content}</em>{/if}
            {if $node.data_map.workplace.content}<br />{$node.data_map.jobtitle.content}{/if}
            {if $node.data_map.mail.content}<br /><a href="mailto:{$node.data_map.mail.content}">{$node.data_map.mail.content}</a>{/if}
            {if $node.data_map.phone.content}<br /><span>{$node.data_map.phone.content}</span>{/if}
            {if $node.data_map.fax.content}<br /><span>{$node.data_map.fax.content} (F)</span>{/if}
            {if $node.data_map.mobile.content}<br /><span>{$node.data_map.mobile.content}</span>{/if}
            {if $node.data_map.url.content}
                <br /><a href={$node.data_map.url.content|ezurl}>{$node.data_map.url.data_text}</a>
            {/if}
        </p>
        {if $node.data_map.description.content}
            <div class="sidenote">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
    </div>
</div>