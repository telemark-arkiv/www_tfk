{* Kampanjecontainer - full *}

<!-- slide-block -->
<div class="slide-block">
<!-- slideshow -->
    <ul class="slideshow carousel-images">
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

            <li>
                <div class="slide">
                    <div class="slide-box">
                        {if $kampanjebilde}
                            <a href={$this_kampanjeelement_url} target="{$this_kampanjeelement_target}">
                                <img src="/{$kampanjebilde.data_map.image.content.[ingress_smal].full_path}" alt="{$kampanjeelement.data_map.title.content}" style="width: 100%;"/>
                            </a>
                        {else}
                            <a href={$this_kampanjeelement_url} target="{$this_kampanjeelement_target}"><img src="http://placeholder.it/560x250&text=placeholder" alt="" style="width: 100%;"/></a>
                        {/if}
                        <div class="text-area brown">
                            <div class="frame-text">
                                <div class="holder">
                                    <strong class="title">{$kampanjeelement.data_map.title.content}</strong>
                                    <p>{$kampanjeelement.data_map.text.content}</p>
                                 </div>
                                 <a href={$this_kampanjeelement_url} target="{$this_kampanjeelement_target}" class="more">{$kampanjeelement.data_map.url.data_text}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        {/foreach}
    </ul>
    
    <div class="carousel-controls">
        <a href="#" class="prev carousel-prev">prev</a>
        <a href="#" class="next carousel-next">next</a>
    </div>
 </div>
 
{if and($node.data_map.do_auto_rotate.has_content, eq($node.data_map.do_auto_rotate.content, 1)) }
    {literal}
        <script>
            jQuery(window).load(function(){
                setTimeout(function() {
                    jQuery('.carousel-images').roundabout('startAutoplay');
                }, 3000);
            });
        </script>
    {/literal}
{/if}