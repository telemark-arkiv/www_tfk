<div class="content-view-line">
<div class="class-file">

{if $node.data_map.image.has_content}
<div class="attribute-image">
{attribute_view_gui attribute=$node.data_map.image.content.data_map.image image_class='small'}
</div>
{/if}

<div class="attribute-title">
<h2>{$node.data_map.title.content|wash}</h2>
</div>

{if $node.data_map.description.has_content}
<div class="attribute-short">
{attribute_view_gui attribute=$node.data_map.description}
</div>
{/if}

<div class="attribute-file">
    <p>{attribute_view_gui attribute=$node.data_map.file icon_size='small' icon_title=$node.name icon='yes'}</p>
</div>

{if or( $node.object.can_edit, $node.object.can_remove )}
    <div class="controls">
        <form action={"/content/action"|ezurl} method="post">
        {if $node.object.can_edit}
            <input type="image" name="EditButton" src={"edit-infobox-ico.gif"|ezimage} alt="Edit" />
            <input type="hidden" name="ContentObjectLanguageCode" value="{$node.object.current_language}" />
        {/if}
        {if $node.object.can_remove}
            <input type="image" name="ActionRemove" src={"trash-infobox-ico.gif"|ezimage} alt="Remove" />
        {/if}
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        </form>
    </div>
{/if}

</div>
</div>