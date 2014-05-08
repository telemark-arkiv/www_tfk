<!-- Bildegalleri: Infobox -->

<div>
    {if $node.data_map.show_gallery_name.content}
        <h2>// {attribute_view_gui attribute=$node.data_map.name}</h2>
    {/if}
    {if $node.data_map.description.has_content}
        {attribute_view_gui attribute=$node.data_map.description}
    {/if}

    {def $slides=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                 'sort_by', $node.sort_array, ) )}

    <div class="class-image" style="width: 220px;">
        <div class="visual-inner" style="width: 208px;">
            <div class="visual-holder am-container" id="am-container-{$node.node_id}-{rand()}" data-montage-height="60" style="width: 100%;">
                {foreach $slides as $slide}
                    <div>
                        {def $bilde=fetch( 'content', 'object', hash( 'remote_id', $slide.data_map.image.content.remote_id ) )}
                        <a title="group2" href="/{$bilde.data_map.image.content.[fullskjerm].full_path}">
                            <img src="/{$bilde.data_map.image.content.[medium].full_path}" alt="{$slide.data_map.name.content}" />
                        </a>
                        <div class="popup-block">
                            <!-- panel -->
                            <div class="panel">
                                <div class="decription">
                                    {if $slide.data_map.show_image_name.content}
                                        {if $slide.data_map.name.content}
                                            <strong>{attribute_view_gui attribute=$slide.data_map.name}</strong><br/>
                                        {/if}
                                    {/if}
                                    {if $slide.data_map.show_image_description.content}
                                        {if $slide.data_map.description.content}
                                            {attribute_view_gui attribute=$slide.data_map.description}
                                        {/if}
                                    {/if}
                                    {if $slide.data_map.show_photographer.content}
                                        {if $bilde.data_map.foto_byline.content}
                                            <br /><em>Foto: {attribute_view_gui attribute=$bilde.data_map.foto_byline}</em>
                                        {/if}
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>