<!-- Bildegalleri: Embed Inline -->

<div>
    {if $object.data_map.show_gallery_name.content}
        <h2>{attribute_view_gui attribute=$object.data_map.name}</h2>
    {/if}
    {if $object.data_map.description.has_content}
        <div>{attribute_view_gui attribute=$object.data_map.description}</div>
    {/if}

    {def $gallerinode=fetch( 'content', 'node', hash( 'node_id', $object.main_node_id ) )}

    {def $slides=fetch( 'content', 'list', hash( 'parent_node_id', $gallerinode.node_id,
                                                     'sort_by', $gallerinode.sort_array, ) )}

    <ul class="grid grid--6 grid--images">
        {foreach $slides as $slide}
            {def $bilde=fetch( 'content', 'object', hash( 'remote_id', $slide.data_map.image.content.remote_id ) )}
            <li class="grid__item grid__item--2-6 item">
                <a href="/{$bilde.data_map.image.content.[responsive_12].full_path}"{if $slide.data_map.show_image_name.content}{if $slide.data_map.name.content} data-title="{attribute_view_gui attribute=$slide.data_map.name}"{/if}{/if}{if $slide.data_map.show_image_description.content}{if $slide.data_map.description.content} data-caption="{attribute_view_gui attribute=$slide.data_map.description}"{/if}{/if}{if $slide.data_map.show_photographer.content}{if $bilde.data_map.foto_byline.content} data-credit="Foto: {attribute_view_gui attribute=$bilde.data_map.foto_byline}"{/if}{/if}  class="js-popup--gallery">
                    <img src="/{$bilde.data_map.image.content.[montage].full_path}" alt="{$slide.data_map.image.content.alternative_text}">
                </a>
            </li>
        {/foreach}
    </ul>
</div>

{*
<div class="text-holder">
    {if $object.data_map.show_gallery_name.content}
        <h2>// {attribute_view_gui attribute=$object.data_map.name}</h2>
    {/if}
    {if $object.data_map.description.has_content}
        {attribute_view_gui attribute=$object.data_map.description}
    {/if}

    {def $gallerinode=fetch( 'content', 'node', hash( 'node_id', $object.main_node_id ) )}

    {def $slides=fetch( 'content', 'list', hash( 'parent_node_id', $gallerinode.node_id,
                                                 'sort_by', $gallerinode.sort_array, ) )}

    <div class="class-image">
        <div class="visual-inner">
            <div class="visual-holder am-container" id="am-container-{$gallerinode.node_id}-{rand()}" data-montage-height="120">
                {foreach $slides as $slide}
                    <div>
                        {def $bilde=fetch( 'content', 'object', hash( 'remote_id', $slide.data_map.image.content.remote_id ) )}
                        <a title="group2" href="/{$bilde.data_map.image.content.[fullskjerm].full_path}">
                            <img src="/{$bilde.data_map.image.content.[montage].full_path}" alt="{$slide.data_map.image.content.alternative_text}"/>
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
*}