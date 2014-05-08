<div class="text-holder">

{if $node.data_map.show_name.content}
    <h2>// {attribute_view_gui attribute=$node.data_map.name}</h2>
{/if}

{def $blockbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}

{if $blockbilde}
    <!-- visual-inner -->
    <div class="visual-inner">
      <div class="visual-holder" style="width:100%;">
          {if $section_added}
            <!-- Smalbilde -->
            <a title="group" href="/{$blockbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$blockbilde.data_map.image.content.[ingress_smal].full_path}" width="508" alt="{$blockbilde.data_map.image_title.content}" /></a>
          {else}
            <!-- Breibilde -->
            <a title="group" href="/{$blockbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$blockbilde.data_map.image.content.[ingress_bred].full_path}" width="768" alt="{$blockbilde.data_map.image_title.content}" /></a>
          {/if}
          <div class="popup-block">
            <!-- panel -->
            <div class="panel">
              <div class="decription">
                {if $node.data_map.image_title.content}
                  <strong>{attribute_view_gui attribute=$node.data_map.image_title}</strong><br/>
                {/if}
                {if $node.data_map.image_text.content}
                  {attribute_view_gui attribute=$node.data_map.image_text}
                {/if}
                {if $blockbilde.data_map.foto_byline.content}
                  <br /><em>Foto: {$blockbilde.data_map.foto_byline.content}</em>
                {/if}
              </div>
            </div>
          </div>
          
          <div class="block-info"{if $section_added|not} style="width: 746px;"{/if}>
            <a href="#" class="btn">btn</a>
            {if $node.data_map.image_title.content}
              <strong>{attribute_view_gui attribute=$node.data_map.image_title}</strong>
            {/if}
            {if $blockbilde.data_map.foto_byline.content}
              <br /><em>Foto: {$blockbilde.data_map.foto_byline.content}</em>
            {/if}
          </div>
      </div>
    </div>
{/if}

{*
    {if $blockbilde}
        <!-- visual-inner -->
        <div class="visual-inner">
            <div class="visual-holder">
                {if $section_added}
                <!-- Smalbilde -->
                <img src="/{$blockbilde.data_map.image.content.[ingress_smal].full_path}" width="508" alt="image description" />
                {else}
                <!-- Breibilde -->
                <img src="/{$blockbilde.data_map.image.content.[ingress_bred].full_path}" width="768" alt="image description" />
                {/if}
            </div>
        </div>
    {/if}
*}
</div>