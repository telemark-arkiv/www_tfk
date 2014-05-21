<link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/main-21ea1f4e.css"><!--[if lte IE 8]>
    <link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/no-mq-e744dcb3.css"><![endif]-->
    <link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/popup-7da56998.css">

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