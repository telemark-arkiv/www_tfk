{* Slidecontainer: Embed Inline*}

{def $kampanjenode=fetch( 'content', 'node', hash( 'node_id', $object.main_node_id ) )}

{def $slides=fetch( 'content', 'list', hash( 'parent_node_id', $kampanjenode.node_id,
                                             'sort_by', $kampanjenode.sort_array, ) )}


<div class="slider">
    <ul class="slider__slides">
        {foreach $slides as $slide}
            {def $image=fetch( 'content', 'object', hash( 'remote_id', $slide.data_map.image.content.remote_id ) )}

            {if $slide.data_map.internal_resource.content}
                {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $slide.data_map.internal_resource.content.remote_id ) )}
                {def $this_slide_url=$remote_object.main_node.url_alias|ezurl}
            {else}
                {def $this_slide_url=$slide.data_map.url.content|ezurl}
            {/if}
            {if $slide.data_map.open_in_new_window.content}
                {def $this_slide_target='_blank'}
            {else}
                {def $this_slide_target='_self'}
            {/if}
            <li class="slider__slide">
                <a href={$this_slide_url} target="{$this_slide_target}" class="top-image top-image--large">
                    <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                        <source srcset="/{$image.data_map.image.content.[responsive_12].full_path}" media="(min-width: 886px)"/>
                        <source srcset="/{$image.data_map.image.content.[responsive_09].full_path}" media="(min-width: 600px)"/>
                        <source srcset="/{$image.data_map.image.content.[responsive_06].full_path}" media="(min-width: 400px)"/>
                        <source srcset="/{$image.data_map.image.content.[responsive_04].full_path}"/><!--[if IE 9]></video><![endif]--><img srcset="/{$image.data_map.image.content.[responsive_12].full_path}" alt="{$slide.data_map.title.content}"/>
                    </picture>
                    <div class="top-image__text-wrapper">
                        <div class="top-image__text">
                            <h2 class="top-image__header">{$slide.data_map.title.content}</h2>
                            <div class="top-image__body">
                                <p>{$slide.data_map.text.content}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
        {/foreach}
    </ul>
</div>









{*

{if and($kampanjenode.data_map.do_auto_rotate.has_content, eq($kampanjenode.data_map.do_auto_rotate.content, 1)) }
    {literal}
        <script>
            $(function() {
                jQuery('div.slide-holder').scrollGallery({
                mask: 'div.frame',
                slider: '>ul',
                slides: '>li',
                currentNumber: 'span.cur-num',
                totalNumber: 'span.all-num',
                btnPrev: 'a.prev',
                btnNext: 'a.next',
                disableWhileAnimating: true,
                generatePagination: 'div.pagination',
                circularRotation: true,
                pauseOnHover: true,
                autoRotation: true,
                maskAutoSize: false,
                switchTime: 4000,
                animSpeed: 600,
                step: 1
            });
        });
        </script>
    {/literal}
{/if}
*}