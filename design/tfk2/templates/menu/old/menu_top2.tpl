<!--menu_top.tpl--> 
{*
Here we are going to generate some code with ul/li hierarchy A stylesheet called dropdown.css is also necessary to create the 
menu. Of course, it can be modified Only Folder are shown in the menu. This can be changed by adding the id of the class which you want to put into 
it. For example, replace array(1) by array(1,2) for each fetch functions if you want to show folders and Articles in each levels.
*}
{def $goleft=ezini( 'TopDrop', 'goleft', 'design.ini')} 
{let top_cat=2 used_node=false()}
{set used_node=2}
	
<nav class="nav-holder">
<!-- navigation -->
	<ul id="nav"> <li class="menu_0"><span class="{if eq($current_node_id, 2)}active{/if}"><a tabindex="13" href="/" class=" ">Forside</a></span></li>{def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )} 

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
	{set $i=inc( $i )}
	<li class="{concat('menu_',$i)}"><span class="{if $nodebane|contains($:item.node_id)}active{/if}"><a href={$:item.url_alias|ezurl}>{$:item.name}</a></span>
	{*<li class="{concat('menu_',$i)}"><span class="{if eq($current_node_id, $:item.node_id)}active{/if}"><a href={$:item.url_alias|ezurl}>{$:item.name}</a></span>*}
	{*End of hide hidden folders*}
	{/if}

{section show=$child_check|count|gt(0)}

	{* SECOND LEVEL *}
	{if eq($i,3)} {*SHOWS ONLY MENU 3*}
        {set $totalsubitems=$child_check|count}
	
	<div class="drop-area {if le($totalsubitems, 4)}drop-area-small{/if}">
	<div class="drop {if le($totalsubitems, 4)}drop-small{/if}">
	<strong class="arrow">&nbsp;</strong>
	<div class="drop-holder">
	
		<div class="dropholder">
		{set $y=1}
		{set $columns=ceil( div( $child_check|count, 3 ) )}
		{set $currentcol=$columns}
		<ul class="col{$y}">
		{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1),sort_by,$:item.sort_array))}
		{let child_check1=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1),sort_by,$:item.sort_array))}
		{if and(eq( $currentcol, 0 ), ge( $totalsubitems, 4 )) } {set $y=inc( $y )} {set $currentcol=$columns} </ul><ul class="col{$y}">{/if}
	        <li class="{if eq($current_node_id, $:item.node_id)}active{/if}"><a href={$:item.url_alias|ezurl}><span>{$:item.name}</span></a></li>
		{set $currentcol=dec( $currentcol )} 
{section show=$child_check1|count|gt(0)}
			{/let}	
			{/section}
		</ul>
		</div></div></div></div>
		{/if} {*END OF SHOWS ONLY MENU 3*}
		</li>
		{/let}	
		{/section}
	</ul></nav>
	
	{/let}

{undef $i}
{undef $goleft}
{undef $base}
{undef $columns}
{undef $currentcol}
{undef $y}
{undef $totalsubitems}

</header>
