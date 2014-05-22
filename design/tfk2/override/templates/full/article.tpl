{def $section_added=''}
{def $unfiltered_infoboxes=fetch( 'content', 'list', hash( 'parent_node_id', $node.path_array,
                                                      'class_filter_type', 'include',
                                                      'class_filter_array', array( 'infobox' ) ) ) }
{foreach $unfiltered_infoboxes as $ib}
  {if or($ib.data_map.inherit.content, eq($ib.parent_node_id, $node.node_id))}
    {set $section_added=1}
  {/if}
{/foreach}

<article class="main__center">
    <header class="article__header">
        <h1>{$node.data_map.title.content|wash()}</h1>
        <div class="sidenote">
            {section show=$node.data_map.author.content.is_empty|not()}
                Av: {attribute_view_gui attribute=$node.data_map.author}
            {/section}

            {if $node.data_map.show_publishdate.content}
                / Publisert: {$node.object.published|l10n(shortdate)} / Oppdatert: {$node.object.modified|l10n(shortdate)}
            {/if}
        </div>
    </header>
    {include uri='design/parts/ingressbilde.tpl' node=$node}
    {if $node.data_map.do_show_image.content}
        {def $ingressbilde=fetch( 'content', 'object', hash( 'remote_id', $node.data_map.image.content.remote_id ) )}
        {if $ingressbilde}
            <div class="top-image">
                <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                    <source srcset="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 1024px)">
                    <source srcset="/{$ingressbilde.data_map.image.content.[responsive_12].full_path}" media="(min-width: 846px)">
                    <source srcset="/{$ingressbilde.data_map.image.content.[responsive_09].full_path}" media="(min-width: 560px)">
                    <source srcset="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 360px)">
                    <source srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}"><!--[if IE 9]></video><![endif]-->
                    <img srcset="/{$ingressbilde.data_map.image.content.[responsive_04].full_path}" alt="{$ingressbilde.data_map.image.content.alternative_text}">
                    <!--img.top-image__img(src="/{$ingressbilde.data_map.image.content.[responsive_06].full_path}")-->
                </picture>
                <div class="top-image__text-wrapper">
                    <div class="top-image__text">
                        {if $node.data_map.image_title.content}
                            <div class="top-image__header">
                                {attribute_view_gui attribute=$node.data_map.image_title}
                            </div>
                        {/if}
                        <div class="top-image__body">
                            {if $node.data_map.image_text.content}
                                {attribute_view_gui attribute=$node.data_map.image_text}<br />
                            {/if}
                            {if $ingressbilde.data_map.foto_byline.content}
                                <em>Foto: {$ingressbilde.data_map.foto_byline.content}</em>
                            {/if}
                        </div>
                        <a href="/{$ingressbilde.data_map.image.content.[responsive_12].full_path}" data-title="{attribute_view_gui attribute=$node.data_map.image_title}" class="top-image__expand-link js-popup--gallery"><span class="visuallyhidden">Åpne</span></a>
                    </div>
                </div>
            </div>
        {/if}
    {/if}

    {section show=$node.data_map.intro.content.is_empty|not}
        <div class="byline">{attribute_view_gui attribute=$node.data_map.intro}</div>
    {/section}

    {section show=$node.data_map.body.content.is_empty|not}
        {attribute_view_gui attribute=$node.data_map.body}
    {/section}

</article>

{*

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
*}