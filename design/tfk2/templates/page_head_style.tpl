<link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/main-0e3819e8.css"><!--[if lte IE 8]>
    <link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/no-mq-7767cc5e.css"><![endif]-->
    <link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/popup-3b7c2ec3.css">

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