{extends designs/site.tpl}

{block title}Saved {$data->Title|escape} &mdash; Projects &mdash; {$dwoo.parent}{/block}

{block content}
    {$Project = $data}

    {capture assign=projectLink}{projectLink $Project}{/capture}

    {if $Project->isNew}
        <p>{_("Your project has been created: %s")|sprintf:$projectLink}</p>
    {else}
        <p>{_("Your changes to %s have been saved.")|sprintf:$projectLink}</p>
    {/if}
{/block}