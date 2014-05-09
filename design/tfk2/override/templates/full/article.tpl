{*
{def $section_added=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                    'limit', 1,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'infobox' ) ) ) }
*}


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
    <h1>// {$node.data_map.title.content|wash()}</h1>
    <!-- inform-panel -->
     <div class="inform-panel">
        {section show=$node.data_map.author.content.is_empty|not()}
            <dl>
                <dt>Av: </dt>
                <dd>{attribute_view_gui attribute=$node.data_map.author}</dd>
            </dl>
        {/section}

        {if $node.data_map.show_publishdate.content}
            <dl>
                <dt>Publisert: </dt><dd>{$node.object.published|l10n(shortdate)}</dd>
            </dl>
            <em class="date">Oppdatert: {$node.object.modified|l10n(shortdate)}</em>
        {/if}
    </div>
    
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


{section show=$node.data_map.body.content.is_empty|not}
    {attribute_view_gui attribute=$node.data_map.body}
{/section}


<div class="plugin-holder">
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addthis_16x16_style">
<a title="Del på Facebook" class="addthis_button_facebook"></a>
<a title="Del på Twitter" class="addthis_button_twitter"></a>
<a title="Del på Google+" class="addthis_button_google_plusone_share"></a>
<a title="Del på LinkedIn" class="addthis_button_linkedin"></a>
<a title="Del via e-post" class="addthis_button_email"></a>
</div>
{literal}
<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4fd5e24713b656c1"></script>
{/literal}
<!-- AddThis Button END -->

</div>

{def $limit=20
         $classes=array( 'personprofil' )
         $employees=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                   'sort_by', $node.sort_array,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', $classes
                                                 ) )
}

<section class="news-list"><!-- Section: News-List: START-->

  {foreach $employees as $employee }
    {node_view_gui content_node=$employee view='line'}
  {/foreach}

</section><!-- Section: News-List: END-->


{def $underinnhold=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                    'limit', 20,
                                                    'sort_by', $node.sort_array,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'feedback_form', 'textblock', 'image_gallery', 'image_block', 'tabboks', 'kolonneblock' ) ) ) }

{if $underinnhold}
    {foreach $underinnhold as $innhold}
        {node_view_gui content_node=$innhold view='full'}
    {/foreach}
{/if}