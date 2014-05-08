{def $linkbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

{if $node.data_map.internal_resource.content}
    {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.internal_resource.content.remote_id ) )}
    {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
{else}
    {def $this_block_url=$node.data_map.url.content|ezurl}
{/if}
{if $node.data_map.open_in_new_window.content}
    {def $this_block_target='_blank'}
{else}
    {def $this_block_target='_self'}
{/if}
<article class="item">
    {if $linkbilde}
        <a href={$this_block_url} target="{$this_block_target}"><img src="/{$linkbilde.data_map.image.content.[listebilde].full_path}" width="228" alt="{$node.data_map.alt_image_text.content|wash}" /></a>
    {/if}
    <div class="holder">
        {if $node.data_map.show_title.content}
            <h2 class="title"><a href={$this_block_url} target="{$this_block_target}" title="{$node.data_map.alt_image_text.content|wash}">{$node.data_map.title.content|wash}</a></h2>
        {/if}
        {if $node.data_map.description.content}
            {attribute_view_gui attribute=$node.data_map.description}
        {/if}
        {if $node.data_map.show_url_text.content}
             {if $node.data_map.url.data_text.content}
                <a href={$this_block_url} target="{$this_block_target}" title="{$node.data_map.alt_image_text.content|wash}" class="more">{$node.data_map.url.data_text}</a>
            {/if}
        {/if}
    </div>
</article>