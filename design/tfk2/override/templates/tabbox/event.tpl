<div class="content-view-boxline">
    <div class="class-{$node.class_identifier}">
        <div class="attribute-title">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content}</a></h2>
        </div>

        {if and( $node.data_map.intro.has_content, $show_intro )}
            <div class="attribute-title">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        {/if}

        {if and( $node.data_map.body.has_content, $show_intro )}
            <div class="attribute-link">
                <p><a href={$node.url_alias|ezurl}>Les mer</a></p>
            </div>
        {/if}
    </div>
</div>