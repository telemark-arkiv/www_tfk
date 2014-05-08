{set-block scope=root variable=cache_ttl}0{/set-block}
{def $section_added=''}
{def $unfiltered_infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $node.path_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }
{foreach $unfiltered_infoboxes as $ib}
  {if or($ib.data_map.inherit.content, eq($ib.parent_node_id, $node.node_id))}
    {set $section_added=1}
  {/if}
{/foreach}

<div class="info-area">
    <h1>// {$node.name|wash()}</h1>

    {if $node.data_map.do_show_image.content}
      {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
      {if $ingressbilde}
            <!-- visual-inner -->
            <div class="visual-inner">
                <div class="visual-holder" style="width:100%;">
                    {if $section_added}
                      <!-- Smalbilde -->
                      <a title="group" href="/{$ingressbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$ingressbilde.data_map.image.content.[ingress_smal].full_path}" width="508" alt="{$ingressbilde.data_map.image.content.alternative_text}" /></a>
                    {else}
                      <!-- Breibilde -->
                      <a title="group" href="/{$ingressbilde.data_map.image.content.[fullskjerm].full_path}"><img src="/{$ingressbilde.data_map.image.content.[ingress_bred].full_path}" width="768" alt="{$ingressbilde.data_map.image.content.alternative_text}" /></a>
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
                          {if $ingressbilde.data_map.foto_byline.content}
                            <br /><em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                          {/if}
                        </div>
                      </div>
                    </div>
                    
                    <div class="block-info"{if $section_added|not} style="width: 746px;"{/if}>
                      <a href="#" class="btn">btn</a>
                      {if $node.data_map.image_title.content}
                        <strong>{attribute_view_gui attribute=$node.data_map.image_title}</strong>
                      {/if}
                      {if $ingressbilde.data_map.foto_byline.content}
                        <br /><em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                      {/if}
                    </div>
                </div>
            </div>
      {/if}
    {/if}

    {section show=$node.data_map.intro.content.is_empty|not}
        <div class="ingress">{attribute_view_gui attribute=$node.data_map.intro}</div>
    {/section}

</div>

{if $node.data_map.body.has_content}
  {attribute_view_gui attribute=$node.data_map.body}
{/if}


{def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',')
     $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page', 'intro', 'short_intro', 'image_title', 'image_text', 'do_show_image', 'image', 'body')
     $exclude_datatypes = array('ezoption', 'ezmultioption', 'ezmultioption2', 'ezrangeoption', 'ezprice', 'ezmultiprice')}
{set $name_pattern  = $name_pattern|explode('|')|implode(',')}
{set $name_pattern  = $name_pattern|explode('<')|implode(',')}
{set $name_pattern  = $name_pattern|explode(',')}
{foreach $name_pattern  as $name_pattern_string}
    {set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
{/foreach}

{foreach $node.object.contentobject_attributes as $attribute}
    {if and($name_pattern_array|contains($attribute.contentclass_attribute_identifier)|not(),
            $exclude_datatypes|contains($attribute.data_type_string)|not)}
        <div class="attribute-{$attribute.contentclass_attribute_identifier}">
            {attribute_view_gui attribute=$attribute}
        </div>
    {/if}
{/foreach}