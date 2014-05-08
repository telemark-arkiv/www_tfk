<!--double_top.tpl--> 
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
	<ul id="nav"> {def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )} 

{* FIRST LEVEL *}

{def $i=0}
{def $columns=0}
{def $currentcol=0}
{def $y = 0}

{section loop=fetch(content,list,hash(parent_node_id,$top_cat, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$base.sort_array))}
	{let child_check=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$base.sort_array))}
	{set $i=inc( $i )}
	<li class="{concat('menu_',$i)} {if $:item.is_selected} selected{/if}"><span><a tabindex="13" href={$:item.url_alias|ezurl}>{$:item.name}</a></span>

{section show=$child_check|count|gt(0)}

	{* SECOND LEVEL *}
	<!--[if IE 7]><!--></a><!--<![endif]-->
	<div class="drop-area">
	<div class="drop">
	<strong class="arrow">&nbsp;</strong>
	<div class="drop-holder">
	
		<div class="dropholder">
		{set $y=1}
		{set $columns=ceil( div( $child_check|count, 3 ) )}
		{set $currentcol=$columns}
		<ul class="col{$y}">
		{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
		{let child_check1=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
		{if eq( $currentcol, 0 )} {set $y=inc( $y )} {set $currentcol=$columns} </ul><ul class="col{$y}">{/if}
	        <li class><a {section show=$child_check1|count|gt(0)}class="drop"{/section} href={$:item.url_alias|ezurl}><span>{$:item.name}
		{set $currentcol=dec( $currentcol )}
		  
{section show=$child_check1|count|gt(0)}
		<!--[if lte IE 6]></a><![endif]-->				
			{section-else}
			</a>
			{/section}
			{/let}	
			{/section}
		</ul>
		</div></div></div></div>
		<!--[if lte IE 6]></a><![endif]-->
		{section-else}
		</a>
		{/section}  
		</li>
		{/let}	
		{/section}
	</ul></nav>
	<!--[if lte IE 6]></a><![endif]-->
	<!--[if !IE]> --><!-- <![endif]-->
{section-else}
     </a>
{/section}
	
	</li>
	{/let}
	{/section}

{undef $i}
{undef $goleft}
{undef $base}
 </ul></nav>

{/let}

