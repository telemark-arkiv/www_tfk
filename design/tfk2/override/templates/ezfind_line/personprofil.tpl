{def $profilbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

<article class="item">
    {if $profilbilde}
        <img src="/{$profilbilde.data_map.image.content.[listebilde].full_path}" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}" width="139"/>
    {/if}
    <div class="frame">
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
    </div>
</article>