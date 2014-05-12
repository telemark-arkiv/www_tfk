<!--menu_top.tpl--> 
{*
Here we are going to generate some code with ul/li hierarchy A stylesheet called dropdown.css is also necessary to create the 
menu. Of course, it can be modified Only Folder are shown in the menu. This can be changed by adding the id of the class which you want to put into 
it. For example, replace array(1) by array(1,2) for each fetch functions if you want to show folders and Articles in each levels.
*}
{def $goleft=ezini( 'TopDrop', 'goleft', 'design.ini')} 
{let top_cat=2 used_node=false()}
{set used_node=2}

<nav id="menu" role="navigation" class="menu">
    <div class="constrained">
        <!-- navigation -->
	    <ul class="menu__content menu__level">
            <li class="menu__item">
                <div class="menu__item-content-wrapper">
                    <div class="menu__item-content">
	                    <a href="/" class="menu__item-link{if eq($current_node_id, 2)} menu__item-link--active{/if}">Forside</a>
	                </div>
	            </div>
	        </li>

{def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )}

{* FIRST LEVEL *}

{def $i=0}
{def $columns=0}
{def $currentcol=0}
{def $y = 0}
{def $totalsubitems = 0}

{section loop=fetch(content,list,hash(parent_node_id,$top_cat, class_filter_type, "include", class_filter_array, array(1),sort_by,$base.sort_array))}
	{let child_check=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1),sort_by,$base.sort_array))}
	{*Hide hidden folders*}
	{if eq($:item.data_map.hide_from_main_menu.content, 0)}
	    {set $totalsubitems=$child_check|count}
	    {set $i=inc( $i )}
	    <li class="menu__item">
	        <div class="menu__item-content-wrapper">
	            <div class="menu__item-content{if gt($totalsubitems, 0)} menu__item--submenu{/if}">
	                <a href={$:item.url_alias|ezurl} class="menu__item-link{if $nodebane|contains($:item.node_id)} menu__item-link--active{/if}">{$:item.name}</a>
	            </div>
    {/if}
    {*End of hide hidden folders*}

    {section show=$child_check|count|gt(0)}

	{* SECOND LEVEL *}
	{if eq($i,3)} {*SHOWS ONLY MENU 3*}
        {set $totalsubitems=$child_check|count}

	{*
	<div class="drop-area {if le($totalsubitems, 4)}drop-area-small{/if}">
	<div class="drop {if le($totalsubitems, 4)}drop-small{/if}">
	<strong class="arrow">&nbsp;</strong>
	<div class="drop-holder">
	
		<div class="dropholder">
    *}
		{set $y=1}
		{set $columns=ceil( div( $child_check|count, 3 ) )}
		{set $currentcol=$columns}

		{*<ul class="col{$y}">*}

		<ul class="menu__submenu menu__level">

		{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1),sort_by,$:item.sort_array))}
		{let child_check1=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1),sort_by,$:item.sort_array))}
		{if and(eq( $currentcol, 0 ), ge( $totalsubitems, 4 )) } {set $y=inc( $y )} {set $currentcol=$columns} </ul><ul class="col{$y}">{/if}

	       {* <li class="{if eq($current_node_id, $:item.node_id)}active{/if}"><a href={$:item.url_alias|ezurl}><span>{$:item.name}</span></a></li>*}

	       <li class="menu__submenu-item">
	            <a href={$:item.url_alias|ezurl} class="menu__item-link{if eq($current_node_id, $:item.node_id)} menu__item-link--active{/if}">{$:item.name}</a>
	       </li>

		{set $currentcol=dec( $currentcol )} 
{section show=$child_check1|count|gt(0)}
	
			{section-else}
			{/section}
			{/let}	
			{/section}
		</ul>
		{*</div></div></div></div>*}
		{/if} {*END OF SHOWS ONLY MENU 3*}
		{section-else}
		</a>
		{/section}
		{if (not(eq($:item.object.data_map.hide_from_main_menu.content, 1))}
		    </div></li>
		{/if}
		{/let}	
		{/section}

	    </ul>
    </div>
</nav>
	
{/let}

{undef $i}
{undef $goleft}
{undef $base}
{undef $columns}
{undef $currentcol}
{undef $y}
{undef $totalsubitems}

{*
<nav id="menu" role="navigation" class="menu">
    <div class="constrained">
        <ul class="menu__content menu__level">
            <li class="menu__item">
                <div class="menu__item-content-wrapper">
                    <div class="menu__item-content">
                        <a href="//localhost:9000//" class="menu__item-link menu__item-link--active">Forside</a>
                    </div>
                </div>
            </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content"><a href="//localhost:9000/aktuelt/index.html" class="menu__item-link">Aktuelt</a>
                      </div>
                    </div>
                  </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content"><a href="//localhost:9000/politikk/index.html" class="menu__item-link">Politikk</a>
                      </div>
                    </div>
                  </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content menu__item--submenu">
                        <a href="//localhost:9000/vaare-tjenester/index.html" class="menu__item-link menu__item-link--submenu">Våre Tjenester</a>
                            <i class="icon--menu-arrow-down menu__item__dropdown hide--to-l"></i><i class="icon--menu-arrow-right menu__item__dropdown hide--from-l js-menu-dropdown"></i>
                      </div>

                      <ul class="menu__submenu menu__level">
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/arealbruk-og-transport.html" class="menu__item-link">Arealbruk og transport</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/folkehelse/index.html" class="menu__item-link">Folkehelse</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/internasjonalt_arbeid.html" class="menu__item-link">Internasjonalt arbeid</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/kultur-og-idrett/index.html" class="menu__item-link">Kultur og idrett</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/kulturminner/index.html" class="menu__item-link">Kulturminner</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/kurs_og_konferanser.html" class="menu__item-link">Kurs og konferanser</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/miljo_og_friloftsliv.html" class="menu__item-link">Miljø og friluftsliv</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/naeringsliv.html" class="menu__item-link">Næringsliv</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/soeknader_og_tilskudd.html" class="menu__item-link">Søknader og tilskudd</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/tannhelse.html" class="menu__item-link">Tannhelse</a>
                        </li>
                        <li class="menu__submenu-item"><a href="//localhost:9000/vaare-tjenester/utdanning/index.html" class="menu__item-link">Utdanning</a>
                        </li>
                      </ul>
                    </div>
                  </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content"><a href="//localhost:9000/planer.html" class="menu__item-link">Planer</a>
                      </div>
                    </div>
                  </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content"><a href="//localhost:9000/fylkeskommunen.html" class="menu__item-link">Fylkeskommunen</a>
                      </div>
                    </div>
                  </li>
                  <li class="menu__item">
                    <div class="menu__item-content-wrapper">
                      <div class="menu__item-content"><a href="//localhost:9000/om_telemark.html" class="menu__item-link">Om Telemark</a>
                      </div>
                    </div>
                  </li>
        </ul>
    </div>
</nav>
*}