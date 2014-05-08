<div class="info-area">
	<h1>// {$node.data_map.title.content|wash}</h1>
	<div class="inform-panel">
		<em class="date">
			{if $node.data_map.from_time.content.timestamp|datetime( 'custom', '%H' )|ne( '00' )}
				{$node.data_map.from_time.content.timestamp|l10n( 'shortdatetime' )}
				{if $node.data_map.to_time.content.timestamp|gt(0)} - {$node.data_map.to_time.content.timestamp|l10n( 'shortdatetime' )}{/if}
			{else}
				{$node.data_map.from_time.content.timestamp|l10n( 'shortdate' )}
				{if $node.data_map.to_time.content.timestamp|gt(0)} - {$node.data_map.to_time.content.timestamp|l10n( 'shortdate' )}{/if}
			{/if}
		</em>
	</div>
</div>

{if $node.data_map.text.has_content}
	<div class="attribute-long">
		{attribute_view_gui attribute=$node.data_map.text}
	</div>
{/if}