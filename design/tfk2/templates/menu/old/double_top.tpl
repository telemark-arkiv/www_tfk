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
<ul id="nav" class="scaling-active scaling-ready"> {def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )} 

{* FIRST LEVEL *}

{def $i=0}

{section loop=fetch(content,list,hash(parent_node_id,$top_cat, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$base.sort_array))}
	{let child_check=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$base.sort_array))}
	{set $i=inc( $i )}
	<li><span><a href={$:item.url_alias|ezurl}>{$:item.name}

{section show=$child_check|count|gt(0)}

	{* SECOND LEVEL *}
	<!--[if IE 7]><!--></a><!--<![endif]-->
	{if $i|gt( $goleft )}
		<ul class="endstop">
	{else}
		<div class="class="drop-area"><div class="drop"><strong class="arrow"><div class="drop-holder"><ul>
	{/if}
		{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
		{let child_check1=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
	         <li><span><a tabindex="10" {section show=$child_check1|count|gt(0)}class="drop"{/section} href={$:item.url_alias|ezurl}>{$:item.name}
		 </ul></div></div></div>
{section show=$child_check1|count|gt(0)}
				
		{* THIRD LEVEL *}
		<!--[if IE 7]><!--></a><!--<![endif]-->
		<table><tbody><tr><td>
		{if $i|gt( $goleft )}
			<ul class="left">
		{else}
			<ul>
		{/if}
			{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
			{let child_check2=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
			<li><a {section show=$child_check2|count|gt(0)}class="drop"{/section} href={$:item.url_alias|ezurl}>{$:item.name}

{section show=$child_check2|count|gt(0)}

			{* FOURTH LEVEL *}
			<!--[if IE 7]><!--></a><!--<![endif]-->
			<table><tbody><tr><td>
			{if $i|gt( $goleft )}
				<ul class="left">
			{else}
				<ul>
			{/if}
				{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 20, 23, 39),sort_by,$:item.sort_array))}
				<li><a href={$:item.url_alias|ezurl}>{$:item.name}</a></li>
				{/section}
			</ul>
			</td></tr></tbody></table>
			<!--[if lte IE 6]></a><![endif]-->
			{section-else}
			</a>
			{/section}
			</li>
			{/let}	
			{/section}
		</ul>
		</td></tr></tbody></table>
		<!--[if lte IE 6]></a><![endif]-->
		{section-else}
		</a>
		{/section}  
		</li>
		{/let}	
		{/section}
	</ul>
	</td></tr></tbody></table>
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

