{def $profilbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}


<div class="media item item--horizontal">
    {if $profilbilde}
        <div class="media__img">
            <img src="/{$profilbilde.data_map.image.content.[responsive_01].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}">
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

{*
{if $node.data_map.show_compact.content}

    <article class="item" style="width: 360px;">
        {if $profilbilde}
            <img src="/{$profilbilde.data_map.image.content.[listebilde].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}" width="100" style="margin-right: 10px; float: left" />
        {/if}
        
        <strong>{$node.data_map.firstname.content} {$node.data_map.lastname.content}</strong>
        {if $node.data_map.jobtitle.content}
            <br />{$node.data_map.jobtitle.content}            
        {/if}
        {if $node.data_map.workplace.content}
            <br />{$node.data_map.workplace.content}
        {/if}
        {if $node.data_map.mail.content}
            <br /><a href="mailto:{$node.data_map.mail.content}">{$node.data_map.mail.content}</a>
        {/if}
        {if $node.data_map.phone.content}<br />{$node.data_map.phone.content}{/if}
        {if $node.data_map.fax.content}<br />{$node.data_map.fax.content} (F){/if}
        {if $node.data_map.mobile.content}<br />{$node.data_map.mobile.content}{/if}
        {if $node.data_map.url.content}
            <br /><a href={$node.data_map.url.content|ezurl}>{$node.data_map.url.data_text}</a>
        {/if}
    </article>

{else}
    <article class="item" style="margin-top: 10px; width:500px;">
        {if $profilbilde}
            <img src="/{$profilbilde.data_map.image.content.[listebilde].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}" width="150" height="195" style="margin-right: 10px; float: left;" />
        {/if}
        <h2>{$node.data_map.firstname.content} {$node.data_map.lastname.content}</h2>
            {if $node.data_map.jobtitle.content}
                {$node.data_map.jobtitle.content}<br />
            {/if}
            {if $node.data_map.workplace.content}
                Arbeidssted: {$node.data_map.workplace.content}<br />
            {/if}
            {if $node.data_map.mail.content}
                <a href="mailto:{$node.data_map.mail.content}">{$node.data_map.mail.content}</a><br />
            {/if}
            
            {if $node.data_map.phone.content}{$node.data_map.phone.content}{if or($node.data_map.fax.content, $node.data_map.mobile.content)}, {/if}{/if}{if $node.data_map.fax.content}{$node.data_map.fax.content} (F){if $node.data_map.mobile.content}, {/if}{/if}{if $node.data_map.mobile.content}{$node.data_map.mobile.content}{/if}
            {if or($node.data_map.phone.content, $node.data_map.fax.content, $node.data_map.mobile.content)}<br />{/if}
            
            {if $node.data_map.description.content}
                {attribute_view_gui attribute=$node.data_map.description}<br />
            {/if}
            {if $node.data_map.url.content}
                <a href={$node.data_map.url.content|ezurl}>{$node.data_map.url.data_text}</a>
            {/if}
    </article>
    <br clear="all" />
{/if}
*}