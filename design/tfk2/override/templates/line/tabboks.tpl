{def $tabs=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                           'sort_by', $node.sort_array, ) )}

<div class="tabs js-tabs">
    <ul class="tabs__content">
        {foreach $tabs as $tab}
            {if $tab.data_map.internal_resource.content}
                {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $tab.data_map.internal_resource.content.remote_id ) )}
                {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
            {else}
                {def $this_block_url=$tab.data_map.exit_url.content|ezurl}
            {/if}
            <li id="tab-{$tab.node_id}" class="tabs__content__item tabs__content__item--active">
                <h1 class="tabs__content__header js-tabs-tab">{$tab.data_map.title.content}</h1>
                <div class="tabs__content__block">
                    <div class="grid grid--6">
                        {if $tab.data_map.related_objects.has_content}
                            {foreach $tab.data_map.related_objects.content.relation_list as $index => $related_object}
                                {def $child=fetch( 'content', 'object', hash( 'remote_id', $related_object.contentobject_remote_id ) )}
                                {node_view_gui content_node=$child.main_node view=tabboks_forside this_index=$index}
                            {/foreach}
                        {/if}
                    </div>
                    {if $this_block_url}
                        {if $tab.data_map.exit_url.data_text}
                            <a href={$tab.data_map.exit_url.content|ezurl} class="see-more">{$tab.data_map.exit_url.data_text}</a>
                        {/if}
                    {/if}
                </div>
        {/foreach}
    </ul>
</div>

{*

<div class="tabs-holder">
    <!-- tabset -->
    <div class="tabs-nav" style="background: none;">
        <div class="holder" style="width: 100%">
            <ul class="tabset" id="tab-nav">
                {foreach $tabs as $tab}
                    <li><a href="#tab-{$tab.node_id}" class="tab active">// {$tab.data_map.title.content}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!-- tab content -->
    {foreach $tabs as $tab}
        {if $tab.data_map.internal_resource.content}
            {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $tab.data_map.internal_resource.content.remote_id ) )}
            {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
        {else}
            {def $this_block_url=$tab.data_map.exit_url.content|ezurl}
        {/if}
        <div class="tab-content" id="tab-{$tab.node_id}">
            <div class="items-area">
                {if tab.data_map.text.content}
                    {attribute_view_gui attribute=$tab.data_map.text}
                {/if}
                {if $tab.data_map.related_objects.has_content}
                    {foreach $tab.data_map.related_objects.content.relation_list as $related_object}
                        {def $child=fetch( 'content', 'object', hash( 'remote_id', $related_object.contentobject_remote_id ) )}
                        {node_view_gui content_node=$child.main_node view=tabbox}
                    {/foreach}
                {/if}
            </div>
            {if $this_block_url}
                {if $tab.data_map.exit_url.data_text}
                    <span class="link-more"><a href={$tab.data_map.exit_url.content|ezurl}>{$tab.data_map.exit_url.data_text}</a></span>
                {/if}
            {/if}
        </div>
    {/foreach}
</div>
*}