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

(*
    <li class="breadcrumb__item">
        <a href="//localhost:9000/" class="breadcrumb__item__link">Forside</a>
        <div class="breadcrumb__item__separator">/</div>
    </li>
    <li class="breadcrumb__item">
        <a href="//localhost:9000/aktuelt/index.html" class="breadcrumb__item__link">Aktuelt</a>
        <div class="breadcrumb__item__separator">/</div>
    </li>
    <li class="breadcrumb__item">
        <div class="breadcrumb__item__link breadcrumb__item__link--active">Vil støtte «Kampen om tungtvannet»</div>
    </li>
*}

{*
  <!-- Path content: START -->
  {foreach $pagedata.path_array as $path}
  {if $path.url}
    <a href={cond( is_set( $path.url_alias ), $path.url_alias,
                                        $path.url )|ezurl}>{$path.text|wash}</a>
  {else}
    <span class="path-text">{$path.text|wash}</span>
  {/if}
  {delimiter}<span class="path-separator">/</span>{/delimiter}
  {/foreach}
  <!-- Path content: END -->
*}