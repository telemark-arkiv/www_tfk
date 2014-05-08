<div class="content-view-embed">
    <div class="class-image">
        <div class="visual-inner">
            <div class="visual-holder">
                <a title="group" href="/{$object.data_map.image.content.[fullskjerm].full_path}">
                  <img src="/{$object.data_map.image.content.[ingress_bred].full_path}" width="508" alt="{$object.data_map.image.content.alternative_text}" />
                </a>
                <div class="popup-block">
                    <!-- panel -->
                    <div class="panel">
                      <div class="decription">
                        {if $object.data_map.name.has_content}
                          <strong>{attribute_view_gui attribute=$object.data_map.name}</strong><br/>
                        {/if}
                        {if $object.data_map.caption.has_content}
                          {attribute_view_gui attribute=$object.data_map.caption}
                        {/if}
                        {if $object.data_map.foto_byline.has_content}
                          <br /><em>Foto: {attribute_view_gui attribute=$object.data_map.foto_byline}</em>
                        {/if}
                      </div>
                    </div>
                  </div>
                  <div class="block-info">
                    <a href="#" class="btn">btn</a>
                    {if $object.data_map.name.has_content}
                      <strong>{attribute_view_gui attribute=$object.data_map.name}</strong>
                    {/if}
                    {if $object.data_map.foto_byline.has_content}
                      <br /><em>Foto: {attribute_view_gui attribute=$object.data_map.foto_byline}</em>
                    {/if}
                  </div>
            </div>
        </div>
    </div>
</div>