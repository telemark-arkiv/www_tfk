<!-- Path content: START -->
<ul class="breadcrumb">
    {foreach $pagedata.path_array as $path}
        <li class="breadcrumb__item">
            {if $path.url}
                <a href={cond( is_set( $path.url_alias ), $path.url_alias,
                                        $path.url )|ezurl} class="breadcrumb__item__link">{$path.text|wash}</a>
                                        {delimiter}<div class="breadcrumb__item__separator">/</div>{/delimiter}
            {else}
                <div class="breadcrumb__item__link breadcrumb__item__link--active">{$path.text|wash}</div>
            {/if}
        </li>
    {/foreach}
</ul>