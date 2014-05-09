<link rel="stylesheet" href="/design/css/main-5d648cfa.css"><!--[if lte IE 8]>
    <link rel="stylesheet" href="/design/css/no-mq-5aeb01e6.css"><![endif]-->



{*
{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

<style type="text/css">
    @import url({'stylesheets/debug.css'|ezdesign});

{if $load_css_file_list}
    {foreach ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) as $css_file}
        @import url({concat( 'stylesheets/',$css_file )|ezdesign});
    {/foreach}
    {* foreach ezini( 'StylesheetSettings', 'BackendCSSFileList', 'design.ini' ) as $css_file}
        @import url({concat( 'stylesheets/',$css_file )|ezdesign});
    {/foreach *}
{/if}
</style>
*}