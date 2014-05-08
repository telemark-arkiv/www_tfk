    {def $menuitems=treemenu( $module_result.path,
                              ,
			      ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),
                              ,
                              2,
                              )}

    {if $menuitems|count|gt(0)}

      <aside class="aside">
       <strong class="title">// Meny</strong>
      <ul class="side-nav">
      {def $last_level=0}
	
      {foreach $menuitems as $menuitem}
      {if gt( $menuitem.level, $last_level)}
        <li{if $menuitem.is_selected} class="selected"{/if}><a href={$menuitem.url_alias|ezurl}>{$menuitem.text|wash}</a>
          <ul>
	{set $last_level=1}
       {elseif lt( $menuitem.level, $last_level )}
        {set $last_level=0}
	</li></ul>
	<li><a href={$menuitem.url_alias|ezurl}>{$menuitem.text|wash}</a>
       {else}
        <li {if $menuitem.is_selected} class="active"{/if}><a href={$menuitem.url_alias|ezurl}>{$menuitem.text|wash}</a>
	{/if}                                                 
      {/foreach}
    {/if}
 </ul></nav>
