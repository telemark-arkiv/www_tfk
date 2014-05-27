{* Kampanjecontainer - full *}

<!-- slide-block -->
<div class="slider">
<!-- slideshow -->
    <ul class="slider__slides">
        {foreach $node.children as $kampanjeelement}
            {def $kampanjebilde=fetch( 'content', 'object', hash( 'remote_id', $kampanjeelement.data_map.image.content.remote_id ) )}
            {if $kampanjeelement.data_map.internal_resource.content}
                {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $kampanjeelement.data_map.internal_resource.content.remote_id ) )}
                {def $this_kampanjeelement_url=$remote_object.main_node.url_alias|ezurl}
            {else}
                {def $this_kampanjeelement_url=$kampanjeelement.data_map.url.content|ezurl}
            {/if}
            {if $kampanjeelement.data_map.open_in_new_window.content}
                {def $this_kampanjeelement_target='_blank'}
            {else}
                {def $this_kampanjeelement_target='_self'}
            {/if}

            <li class="slider__slide">
                <a href={$this_kampanjeelement_url} target="{$this_kampanjeelement_target}" class="top-image top-image--large">
                    <picture>
                        <!--[if IE 9]><video style="display: none;"><![endif]-->
                        <source srcset="/{$kampanjebilde.data_map.image.content.[responsive_12].full_path}" media="(min-width: 886px)"/>
                        <source srcset="/{$kampanjebilde.data_map.image.content.[responsive_09].full_path}" media="(min-width: 600px)"/>
                        <source srcset="/{$kampanjebilde.data_map.image.content.[responsive_06].full_path}" media="(min-width: 400px)"/>
                        <source srcset="/{$kampanjebilde.data_map.image.content.[responsive_04].full_path}"/>
                        <!--[if IE 9]></video><![endif]-->
                        <img srcset="{$kampanjebilde.data_map.image.content.[responsive_12].full_path}" alt="{$kampanjeelement.data_map.title.content}"/>
                    </picture>
                    <div class="top-image__text-wrapper">
                        <div class="top-image__text">
                            <h2 class="top-image__header">{$kampanjeelement.data_map.title.content}</h2>
                            <div class="top-image__body">
                                <p>{$kampanjeelement.data_map.text.content}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
        {/foreach}
    </ul>
 </div>