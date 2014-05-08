{def $tabs=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                           'sort_by', $node.sort_array, ) )}
<div class="tab-area">
    <!-- tabset -->
    <ul class="tabset" id="tab-nav">
        {foreach $tabs as $tab}
            <li><a href="#tab-{$tab.node_id}" class="tab active">// {$tab.data_map.title.content}</a></li>
        {/foreach}
    </ul>
    <!-- tab content -->

    {foreach $tabs as $tab}
        {if $tab.data_map.internal_resource.content}
            {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $tab.data_map.internal_resource.content.remote_id ) )}
            {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
        {else}
            {def $this_block_url=$tab.data_map.exit_url.content|ezurl}
        {/if}
        <div class="tab-content" id="tab-{$tab.node_id}">
            <section class="holder">
                {if tab.data_map.text.content}
                    {attribute_view_gui attribute=$tab.data_map.text}
                {/if}
                {if $tab.data_map.related_objects.has_content}
                    {foreach $tab.data_map.related_objects.content.relation_list as $index => $related_object}
                        {def $child=fetch( 'content', 'object', hash( 'remote_id', $related_object.contentobject_remote_id ) )}
                        {node_view_gui content_node=$child.main_node view=tabboks_forside this_index=$index}
                    {/foreach}
                {/if}
            </section><!-- End section tab -->
            {if $this_block_url}
                {if $tab.data_map.exit_url.data_text}
                    <span class="link-more"><a href={$tab.data_map.exit_url.content|ezurl}>{$tab.data_map.exit_url.data_text}</a></span>
                {/if}
            {/if}
        </div>
    {/foreach}


</div>
