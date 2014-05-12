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




                {*
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
                 *}
                </a>
            </li>
        {/foreach}
    </ul>

    {*
    <div class="carousel-controls">
        <a href="#" class="prev carousel-prev">prev</a>
        <a href="#" class="next carousel-next">next</a>
    </div>
    *}
 </div>

{*
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
*}
{*
<div class="slider">
    <ul class="slider__slides">
        <li class="slider__slide">
            <a href="/Vaare-tjenester/Kulturminner/Maanedens-kulturminne/PM5" class="top-image top-image--large">
                <picture>
                    <!--[if IE 9]><video style="display: none;"><![endif]-->
                    <source srcset="//localhost:9000/img/content/slider/PM5-ingress-12.jpg" media="(min-width: 886px)"/>
                    <source srcset="//localhost:9000/img/content/slider/PM5-ingress-9.jpg" media="(min-width: 600px)"/>
                    <source srcset="//localhost:9000/img/content/slider/PM5-ingress-6.jpg" media="(min-width: 400px)"/>
                    <source srcset="//localhost:9000/img/content/slider/PM5-ingress-4.jpg"/><!--[if IE 9]></video><![endif]-->
                    <img srcset="//localhost:9000/img/content/slider/PM5-ingress-12.jpg" alt="Månedens kulturminne"/>
                </picture>
                <div class="top-image__text-wrapper">
                    <div class="top-image__text">
                        <h2 class="top-image__header">Månedens kulturminne</h2>
                        <div class="top-image__body">
                            <p>PM5 en av de få bygningene i Skien sentrum som er igjen fra før bybrannen i 1886. PM5 på Smieøya forteller om Telemarks og Norges tidlige industrihistorie.</p>
                        </div>
                    </div>
                </div>
            </a>
        </li>

                  <li class="slider__slide"><a href="/Vaare-tjenester/Utdanning/Fagopplaering/Fag-og-svennebrev/Fag-svenne-og-kompetansebrev-utdeling" class="top-image top-image--large">
                      <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                        <source srcset="//localhost:9000/img/content/slider/Ibsenhuset-2014-12.jpg" media="(min-width: 886px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Ibsenhuset-2014-9.jpg" media="(min-width: 600px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Ibsenhuset-2014-6.jpg" media="(min-width: 400px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Ibsenhuset-2014-4.jpg"/><!--[if IE 9]></video><![endif]--><img srcset="//localhost:9000/img/content/slider/Ibsenhuset-2014-12.jpg" alt="Fag- og svennebrevutdeling"/>
                      </picture>
                      <div class="top-image__text-wrapper">
                        <div class="top-image__text">
                          <h2 class="top-image__header">Fag- og svennebrevutdeling</h2>
                          <div class="top-image__body">
                            <p>Utdeling i Ibsenhuset 28. februar 2014</p>
                          </div>
                        </div>
                      </div></a></li>
                  <li class="slider__slide"><a href="/Vaare-tjenester/Arealbruk-og-transport/Havn" class="top-image top-image--large">
                      <picture><!--[if IE 9]><video style="display: none;"><![endif]-->
                        <source srcset="//localhost:9000/img/content/slider/Forsidebilde-havneplan-12.jpg" media="(min-width: 886px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Forsidebilde-havneplan-9.jpg" media="(min-width: 600px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Forsidebilde-havneplan-6.jpg" media="(min-width: 400px)"/>
                        <source srcset="//localhost:9000/img/content/slider/Forsidebilde-havneplan-4.jpg"/><!--[if IE 9]></video><![endif]--><img srcset="//localhost:9000/img/content/slider/Forsidebilde-havneplan-12.jpg" alt="Høring om godstransport"/>
                      </picture>
                      <div class="top-image__text-wrapper">
                        <div class="top-image__text">
                          <h2 class="top-image__header">Høring om godstransport</h2>
                          <div class="top-image__body">
                            <p>Mer gods skal flyttes fra veg til bane og sjø. Høringsfrist 28.februar 2014.</p>
                          </div>
                        </div>
                      </div></a></li>
                </ul>
              </div>

*}