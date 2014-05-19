<link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/main-8f9d599b.css"><!--[if lte IE 8]>
    <link rel="stylesheet" href="/extension/www_tfk/design/tfk2/stylesheets/no-mq-44ed26a2.css"><![endif]-->
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