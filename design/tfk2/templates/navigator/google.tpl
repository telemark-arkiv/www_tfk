{* Navigator *}

{default page_uri_suffix=false()
         left_max=7
         right_max=6}
{default name=ViewParameter
         page_uri_suffix=false()
         left_max=$left_max
         right_max=$right_max}

{let page_count=int( ceil( div( $item_count,$item_limit ) ) )
      current_page=min($:page_count,
                       int( ceil( div( first_set( $view_parameters.offset, 0 ),
                                       $item_limit ) ) ) )
      item_previous=sub( mul( $:current_page, $item_limit ),
                         $item_limit )
      item_next=sum( mul( $:current_page, $item_limit ),
                     $item_limit )

      left_length=min($ViewParameter:current_page,$:left_max)
      right_length=max(min(sub($ViewParameter:page_count,$ViewParameter:current_page,1),$:right_max),0)
      view_parameter_text=""
      offset_text=eq( ezini( 'ControlSettings', 'AllowUserVariables', 'template.ini' ), 'true' )|choose( '/offset/', '/(offset)/' )}
{* Create view parameter text with the exception of offset *}
{section loop=$view_parameters}
 {section-exclude match=$:key|eq('offset')}
 {section-exclude match=$:item|eq('')}
 {set view_parameter_text=concat($:view_parameter_text,'/(',$:key,')/',$:item)}
{/section}


{section show=$:page_count|gt(1)}

<ul class="paging" id="{$navigator_id}">

     {switch match=$:item_previous|lt(0) }
       {case match=0}
      <li><span class="prev"><a href={concat($page_uri,$:item_previous|gt(0)|choose('',concat($:offset_text,$:item_previous)),$:view_parameter_text,$page_uri_suffix)|ezurl}><em>&nbsp;</em></a></span></li>
       {/case}
       {case match=1}
       {/case}
     {/switch}

    

{if $:current_page|gt($:left_max)}
<li><span class="other"><a href={concat($page_uri,$:view_parameter_text,$page_uri_suffix)|ezurl}>1</a></span></li>
{if sub($:current_page,$:left_length)|gt(1)}
<li><span class="other">...</span></li>
{/if}
{/if}

    {section loop=$:left_length}
        {let page_offset=sum(sub($ViewParameter:current_page,$ViewParameter:left_length),$:index)}
          <li><span class="other"><a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span></li>
        {/let}
    {/section}

        <li><span class="active">{$:current_page|inc}</span></li>

    {section loop=$:right_length}
        {let page_offset=sum($ViewParameter:current_page,1,$:index)}
          <li><span class="other"><a href={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span></li>
        {/let}
    {/section}

{if $:page_count|gt(sum($:current_page,$:right_max,1))}
{if sum($:current_page,$:right_max,2)|lt($:page_count)}
<li><span class="other">...</span></li>
{/if}
<li><span class="other"><a href={concat($page_uri,$:page_count|dec|gt(0)|choose('',concat($:offset_text,mul($:page_count|dec,$item_limit))),$:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_count}</a></span></li>
{/if}


{switch match=$:item_next|lt($item_count)}
      {case match=1}
        <li><span class="next"><a href={concat($page_uri,$:offset_text,$:item_next,$:view_parameter_text,$page_uri_suffix)|ezurl}><em>&nbsp;</em></a></span></li>
      {/case}
      {case}
      {/case}
    {/switch}

</ul>

{/section}

 {/let}
{/default}
{/default}