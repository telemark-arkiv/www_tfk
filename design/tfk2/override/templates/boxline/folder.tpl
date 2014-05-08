<div class="content-view-boxline">
<div class="class-{$node.class_identifier}">

<div class="attribute-title">
<h3><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h3>
</div>

{if and( $node.data_map.short_description.has_content, $show_intro )}
<div class="attribute-short">
{attribute_view_gui attribute=$node.data_map.short_description}
</div>
{/if}

{if and( $node.data_map.description.has_content, $show_intro )}
<div class="attribute-link">
<p><a href={$node.url_alias|ezurl}>Les mer</a></p>
</div>
{/if}

</div>
</div>