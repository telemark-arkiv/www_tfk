{def $menuitems=treemenu( $module_result.path,
                              ,
            ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),
                              ,
                              5,
                              'tree')}

{def $show_from_level = 1}

{* Om vi er under våre tjenester*}
{if $module_result.path[1][node_id]|eq(111)}
    {def $show_from_level = 2}
{/if}

{* Om vi er under Elevombudet *}
{if $module_result.path[3][node_id]|eq(566)}
    {def $show_from_level = 3}
{/if}


{if $menuitems|count|gt(0)}
    <aside class="aside">
        <h2 class="title">// Meny</h2>
        <ul class="side-nav" role="menu">
        {foreach $menuitems as $index => $menuitem}
          {* Remove *}
          {if ge($menuitem.level, $show_from_level)} 
            <li{if $menuitem.is_selected} class="open"{/if} role="menuitem">{if $menuitem.id|eq(3639)}<a href="http://apps.t-fk.no/postlister" target="_blank">{$menuitem.text|wash}</a>{elseif $menuitem.id|eq(309)}<a href="http://apps.t-fk.no/ansatte" target="_blank">{$menuitem.text|wash}</a>{elseif $menuitem.id|eq(235)}<a href="http://apps.t-fk.no/politikere" target="_blank">{$menuitem.text|wash}</a>{elseif $menuitem.id|eq(236)}<a href="http://apps.t-fk.no/politisk" target="_blank">{$menuitem.text|wash}</a>{elseif $menuitem.id|eq(646)}<a href={concat($menuitem.url_alias, "?rnd=", rand())|ezurl}>{$menuitem.text|wash}</a>{else}<a href={$menuitem.url_alias|ezurl}>{$menuitem.text|wash}</a>{/if}
            {if gt( $menuitems[$index|inc].level, $menuitem.level )}
              <ul>
                {elseif lt( $menuitems[$index|inc].level, $menuitem.level )}
                  </li>
                  {for 1 to $menuitem.level|sub( $menuitems[$index|inc].level ) as $i}
      {* Ends UL if not on level 2 *}
                      {if gt($menuitem.level, 2)}</ul>{/if}
                  {/for}
                {else}
                  </li>
                {/if}
            {/if}
        {/foreach}
        </ul>
    </aside>
{/if}