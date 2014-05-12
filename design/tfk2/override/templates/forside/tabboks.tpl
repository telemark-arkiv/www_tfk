{def $tabs=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                           'sort_by', $node.sort_array, ) )}
<div class="tabs js-tabs">
    <ul class="tabs__content">
        {foreach $tabs as $tab}
            {if $tab.data_map.internal_resource.content}
                {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $tab.data_map.internal_resource.content.remote_id ) )}
                {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
            {else}
                {def $this_block_url=$tab.data_map.exit_url.content|ezurl}
            {/if}
            <li id="tab-{$tab.node_id}" class="tabs__content__item tabs__content__item--active">
                <h1 class="tabs__content__header js-tabs-tab">{$tab.data_map.title.content}</h1>
                <div class="tabs__content__block">
                    <div class="grid grid--12">
                        {if $tab.data_map.related_objects.has_content}
                            {foreach $tab.data_map.related_objects.content.relation_list as $index => $related_object}
                                {def $child=fetch( 'content', 'object', hash( 'remote_id', $related_object.contentobject_remote_id ) )}
                                {node_view_gui content_node=$child.main_node view=tabboks_forside this_index=$index}
                            {/foreach}
                        {/if}
                    </div>
                </div>
        {/foreach}
    </ul>
</div>

{*

    {foreach $tabs as $tab}
        {if $tab.data_map.internal_resource.content}
            {def $remote_object=fetch( 'content', 'object', hash( 'remote_id', $tab.data_map.internal_resource.content.remote_id ) )}
            {def $this_block_url=$remote_object.main_node.url_alias|ezurl}
        {else}
            {def $this_block_url=$tab.data_map.exit_url.content|ezurl}
        {/if}
        <div class="tab-content" id="tab-{$tab.node_id}">
            <section class="holder">
                {if tab.data_map.text.content}
                    {attribute_view_gui attribute=$tab.data_map.text}
                {/if}
                {if $tab.data_map.related_objects.has_content}
                    {foreach $tab.data_map.related_objects.content.relation_list as $index => $related_object}
                        {def $child=fetch( 'content', 'object', hash( 'remote_id', $related_object.contentobject_remote_id ) )}
                        {node_view_gui content_node=$child.main_node view=tabboks_forside this_index=$index}
                    {/foreach}
                {/if}
            </section><!-- End section tab -->
            {if $this_block_url}
                {if $tab.data_map.exit_url.data_text}
                    <span class="link-more"><a href={$tab.data_map.exit_url.content|ezurl}>{$tab.data_map.exit_url.data_text}</a></span>
                {/if}
            {/if}
        </div>
    {/foreach}
    </ul>
</div>

*}

{*
<div class="tabs js-tabs">
                <ul class="tabs__content">
                  <li id="frontpage-0" class="tabs__content__item tabs__content__item--active">
                    <h1 class="tabs__content__header js-tabs-tab">Aktuelt</h1>

                    <div class="tabs__content__block">
                      <div class="grid grid--12">
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Verdensarvsoeknaden-paa-vei-til-Unesco" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Verdensarvsoeknaden-4.jpg" alt="Klima- og miljøvernminister Tine Sundtoft mottar søknaden fra Tinn og Notodden kommune"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Verdensarvsoeknaden-paa-vei-til-Unesco">Verdensarvsøknaden på vei til Unesco</a></h2><span class="sidenote">Publisert 28. januar 2014</span>
                            <p class="item__intro">En søknad det blir gøy å levere fra seg!</p>
                          </div>
                        </div>
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Ny-oekonomisjef-i-fylkeskommunen" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Ailin-Aastvedt_fullskjerm-4.jpg" alt="Ailin Aastvedt"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Ny-oekonomisjef-i-fylkeskommunen">Ny økonomisjef i fylkeskommunen</a></h2><span class="sidenote">Publisert 27. januar 2014</span>
                            <p class="item__intro">Ailin Aastvedt er ansatt som økonomisjef i fylkeskommunen</p>
                          </div>
                        </div>
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Liker-ikke-fisk" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Laksewraps-4.jpg" alt="Laksewrap"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Liker-ikke-fisk">«Liker ikke fisk»</a></h2><span class="sidenote">Publisert 25. januar 2014</span>
                            <p class="item__intro">Mer fisk og mindre sukker i kantina på Hjalmar Johansen vgs</p>
                          </div>
                        </div>

                      </div>
                    </div>
                  </li>

                  <li id="frontpage-1" class="tabs__content__item">
                    <h1 class="tabs__content__header js-tabs-tab">Prosjekter</h1>
                    <div class="tabs__content__block">
                      <div class="grid grid--12">
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Liker-ikke-fisk" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Laksewraps-4.jpg" alt="Laksewrap"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Liker-ikke-fisk">«Liker ikke fisk»</a></h2><span class="sidenote">Publisert 25. januar 2014</span>
                            <p class="item__intro">Mer fisk og mindre sukker i kantina på Hjalmar Johansen vgs</p>
                          </div>
                        </div>
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Verdensarvsoeknaden-paa-vei-til-Unesco" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Verdensarvsoeknaden-4.jpg" alt="Klima- og miljøvernminister Tine Sundtoft mottar søknaden fra Tinn og Notodden kommune"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Verdensarvsoeknaden-paa-vei-til-Unesco">Verdensarvsøknaden på vei til Unesco</a></h2><span class="sidenote">Publisert 28. januar 2014</span>
                            <p class="item__intro">En søknad det blir gøy å levere fra seg!</p>
                          </div>
                        </div>
                        <div class="item item--vertical tabs__content__item__text grid__item--4-12"><a href="/Aktuelt/Ny-oekonomisjef-i-fylkeskommunen" aria-hidden="true" tabindex="-1" class="item__imglink imglink"><img src="//localhost:9000/img/content/news/Ailin-Aastvedt_fullskjerm-4.jpg" alt="Ailin Aastvedt"/></a>
                          <div class="item__content">
                            <h2 class="item__header"><a href="/Aktuelt/Ny-oekonomisjef-i-fylkeskommunen">Ny økonomisjef i fylkeskommunen</a></h2><span class="sidenote">Publisert 27. januar 2014</span>
                            <p class="item__intro">Ailin Aastvedt er ansatt som økonomisjef i fylkeskommunen</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul><a href="/nyheter" class="see-more">Se flere nyheter</a>
              </div>

*}ß