{def $profilbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

<article class="item" style="margin-top: 10px;">
    {if $profilbilde}
        <img src="/{$profilbilde.data_map.image.content.[listebilde].full_path}" width="150" height="195" alt="{$node.data_map.firstname.content} {$node.data_map.lastname.content}" class="photo" />
    {/if}
    <div class="text-area">
        <div class="holder">
            <h2>{$node.data_map.firstname.content} {$node.data_map.lastname.content}</h2>
            {if $node.data_map.jobtitle.content}
                <div>{$node.data_map.jobtitle.content}</div>
            {/if}
            {if $node.data_map.workplace.content}
                <dl>
                    <dt>Arbeidssted:</dt>
                    <dd>{$node.data_map.workplace.content}</dd>
                </dl>
            {/if}
            {if $node.data_map.mail.content}
                <div>
                    <a href="mailto:{$node.data_map.mail.content}">{$node.data_map.mail.content}</a>
                </div>
            {/if}
            <dl>
                {if $node.data_map.phone.content}<dt>Tlf:</dt><dd>{$node.data_map.phone.content}</dd>{/if}
                {if $node.data_map.fax.content}<dt>Fax:</dt><dd>{$node.data_map.fax.content}</dd>{/if}
                {if $node.data_map.mobile.content}<dt>Mob:</dt><dd>{$node.data_map.mobile.content}</dd>{/if}
            </dl>
            {if $node.data_map.description.content}
                <div>
                    {attribute_view_gui attribute=$node.data_map.description}
                </div>
            {/if}
            {if $node.data_map.url.content}
                <div>
                    <a href={$node.data_map.url.content|ezurl}>{$node.data_map.url.data_text}</a>
                </div>
            {/if}
        </div>
    </div>
</article>
<br clear="all" />