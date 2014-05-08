{if $addsection}
<article id="content">
{/if}
<!-- Main area content: START -->
{$module_result.content}

<!-- Array med ids som skal kobles eksternt (dvs angular)-->
{def $external_page_ids = array(236, 239, 309, 311, 1821, 3639)}

{if $external_page_ids|contains($current_node_id)}
	{if eq($current_node_id, 236)}
		{include uri='design:external/page_external_saker_til_utvalg.tpl'}
	{elseif eq($current_node_id, 239)}
		{include uri='design:external/page_external_politikere.tpl'}
	{elseif eq($current_node_id, 309)}
		{include uri='design:external/page_external_ansattsok.tpl'}
	{elseif eq($current_node_id, 311)}
		{include uri='design:external/page_external_ledige_stillinger.tpl'}
	{elseif eq($current_node_id, 1821)}
		{include uri='design:external/page_external_handverkere.tpl'}
	{elseif eq($current_node_id, 3639)}
		{include uri='design:external/page_external_postlister.tpl'}
	{/if}
{/if}
<!-- Main area content: END -->
{if $addsection}
</article>
{/if}