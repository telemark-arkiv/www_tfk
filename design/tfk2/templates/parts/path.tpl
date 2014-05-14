<!-- Path content: START -->
<ul class="breadcrumb">
    {foreach $pagedata.path_array as $path}
        <li class="breadcrumb__item">
            {if $path.url}
                <a href={cond( is_set( $path.url_alias ), $path.url_alias,
                                        $path.url )|ezurl} class="class="breadcrumb__item__link"">{$path.text|wash}</a>
            {else}
                <div class="breadcrumb__item__link breadcrumb__item__link--active">{$path.text|wash}</div>
            {/if}
            {delimiter}<div class="breadcrumb__item__separator">/</div>{/delimiter}
        </li>
    {/foreach}
</ul>