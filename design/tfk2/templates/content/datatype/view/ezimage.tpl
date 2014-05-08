{*
Input:
 image_class - Which image alias to show, default is large
 css_class     - Optional css class to wrap around the <img> tag, the
                 class will be placed in a <div> tag.
 alignment     - How to align the image, use 'left', 'right' or false().
 link_to_image - boolean, if true the url_alias will be fetched and
                 used as link.
 href          - Optional string, if set it will create a <a> tag
                 around the image with href as the link.
 border_size   - Size of border around image, default is 0
*}
{default image_class=large
         css_class=false()
         alignment=false()
         link_to_image=false()
         href=false()
         target=false()
         hspace=false()
         border_size=0
         border_color=''
         border_style=''
         margin_size=''
         alt_text=''
         title=''}

{let image_content = $attribute.content}

{if $image_content.is_valid}

    {let image        = $image_content[$image_class]
         inline_style = ''}

    {if $link_to_image}
        {set href = $image_content['original'].url|ezroot}
    {/if}
    {switch match=$alignment}
    {case match='left'}
        <div class="imageleft">
    {/case}
    {case match='right'}
        <div class="imageright">
    {/case}
    {case/}
    {/switch}

    {if $css_class}
        <div class="{$css_class|wash}">
    {/if}

    {if and( is_set( $image ), $image )}
        {if $alt_text|not}
            {if $image.text}
                {set $alt_text = $image.text}
            {else}
                {set $alt_text = $attribute.object.name}
            {/if}
        {/if}
        {if $title|not}
            {set $title = $alt_text}
        {/if}
        {if $border_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'border: ', $border_size, 'px ', $border_style, ' ', $border_color, ';' )}
        {/if}
        {if $margin_size|trim|ne('')}
            {set $inline_style = concat( $inline_style, 'margin: ', $margin_size, 'px;' )}
        {/if}
        {if $href}<a href={$href}{if and( is_set( $link_class ), $link_class )} class="{$link_class}"{/if}{if and( is_set( $link_id ), $link_id )} id="{$link_id}"{/if}{if $target} target="{$target}"{/if}{if and( is_set( $link_title ), $link_title )} title="{$link_title|wash}"{/if}>{/if}
        <img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" {if $hspace}hspace="{$hspace}"{/if} style="{$inline_style}" alt="{$alt_text|wash(xhtml)}" title="{$title|wash(xhtml)}" />
        {if $href}</a>{/if}
    {/if}

    {if $css_class}
        </div>
    {/if}

    {switch match=$alignment}
    {case match='left'}
        </div>
    {/case}
    {case match='right'}
        </div>
    {/case}
    {case/}
    {/switch}

    {/let}

{/if}

{/let}

{/default}