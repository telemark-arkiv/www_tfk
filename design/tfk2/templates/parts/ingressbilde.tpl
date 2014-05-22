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