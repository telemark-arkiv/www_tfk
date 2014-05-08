{* Slidecontainer: Embed Inline*}

{def $kampanjenode=fetch( 'content', 'node', hash( 'node_id', $object.main_node_id ) )}

{def $slides=fetch( 'content', 'list', hash( 'parent_node_id', $kampanjenode.node_id,
                                             'sort_by', $kampanjenode.sort_array, ) )}
<div class="slide-holder autorotation-active">
    <div class="frame">
        <!-- slideshow -->
        <ul class="slideshow">
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
                <li>
                    <a href={$this_slide_url} target="{$this_slide_target}">
                        <img src="/{$image.data_map.image.content.[ingress_smal].full_path}" width="508" height="208" alt="" />
                    </a>
                    <div class="text-area">
                        <a href={$this_slide_url} target="{$this_slide_target}" class="more">{$slide.data_map.url.data_text}</a>
                        <div class="holder">
                            <strong class="title">{$slide.data_map.title.content}</strong>
                            <p>{$slide.data_map.text.content}</p>
                        </div>
                    </div>
                </li>
            {/foreach}
        </ul>
    </div>
    <!-- pagination -->
    <div class="pagination">
        <ul>
            {foreach $slides as $slide}
                <li><a href="#">1</a></li>
            {/foreach}
        </ul>
    </div>
    <!-- Prev/Next -->
    <a href="#" class="prev">prev;</a>
    <a href="#" class="next">next;</a>
</div>

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