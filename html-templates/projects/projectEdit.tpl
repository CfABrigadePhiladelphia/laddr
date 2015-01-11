{extends designs/site.tpl}

{block title}{if $data->isPhantom}{_ 'Create'}{else}{_('Edit %s')|sprintf:$data->Title|escape}{/if} &mdash; {_ 'Projects'} &mdash; {$dwoo.parent}{/block}

{block js-bottom}
    {$dwoo.parent}
    {jsmin "epiceditor.js"}
    {jsmin "pages/project-edit.js"}
    {jsmin "features/tag-fields.js"}
{/block}

{block content}
    {$Project = $data}

    <h2>
        {if $Project->isPhantom}
            {_ "Create new project"}
        {else}
            {_("Edit project %s")|sprintf:$Project->Title|escape}
        {/if}
    </h2>

    {if !$Project->isValid}
    <div class="error well">
        <strong>{_ "There were problems with your entry:"}</strong>
        <ul class="errors">
        {foreach item=error key=field from=$Project->validationErrors}
            <li>{$error}</li>
        {/foreach}
        </ul>
    </div>
    {/if}


    <form method="POST" class="form-horizontal">
        <div class="control-group">
            <label for="field-title" class="control-label">{_ "Title"}:</label>
            <div class="controls">
                <input name="Title" id="field-title" placeholder="{_ 'Train Schedule Analyzer'}"
                    value="{refill field=Title default=$Project->Title}" />
            </div>
        </div>
        <div class="control-group">
            <label for="field-url-users" class="control-label">{_ "Users' URL"}:</label>
            <div class="controls">
                <input name="UsersUrl" id="field-url-users" placeholder="{_ 'http://mypublicapp.org'}"
                    value="{refill field=UsersUrl default=$Project->UsersUrl}" class="input-xxlarge" />
            </div>
        </div>
        <div class="control-group">
            <label for="field-url-developers" class="control-label">{_ "Developers' URL"}:</label>
            <div class="controls">
                <input name="DevelopersUrl" id="field-url-developers" placeholder="http://github.com/..."
                    value="{refill field=DevelopersUrl default=$Project->DevelopersUrl}"  class="input-xxlarge"/>
            </div>
        </div>
        <div class="control-group">
            <label for="topicTagsInput" class="control-label">{_ 'Topic Tags'}:</label>
            <div class="controls">
                <input type="tags" data-tag-prefix="topic" id="topicTagsInput" name="tags[topic]" placeholder="{_ 'Education, Mapping, Crime'}" value="{refill field=tags.topic default=Tag::getTagsString($Project->Tags, topic)}"/>
            </div>
        </div>
        <div class="control-group">
            <label for="techTagsInput" class="control-label">{_ 'Technology Tags'}:</label>
            <div class="controls">
                <input type="tags" data-tag-prefix="tech" id="techTagsInput" name="tags[tech]" placeholder="{_ 'PHP, Bootstrap, JavaScript'}" value="{refill field=tags.tech default=Tag::getTagsString($Project->Tags, tech)}"/>
            </div>
        </div>
        <div class="control-group">
            <label for="eventTagsInput" class="control-label">{_ 'Event Tags'}:</label>
            <div class="controls">
                <input type="tags" data-tag-prefix="event" id="eventTagsInput" name="tags[event]" placeholder="{_ 'Education Hackathon 2014'}" value="{refill field=tags.event default=Tag::getTagsString($Project->Tags, event)}"/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">{_ 'Stage'}:</label>
            <div class="controls">
                <label class="radio">
                    <input type="radio" name="Stage" value="Commenting" {refill field=Stage default=$Project->Stage|default:Commenting checked=Commenting}>
                    <strong>{_ Commenting}</strong>: {Laddr\Project::getStageDescription(Commenting)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Bootstrapping" {refill field=Stage default=$Project->Stage checked=Bootstrapping}>
                    <strong>{_ Bootstrapping}</strong>: {Laddr\Project::getStageDescription(Bootstrapping)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Prototyping" {refill field=Stage default=$Project->Stage checked=Prototyping}>
                    <strong>{_ Prototyping}</strong>: {Laddr\Project::getStageDescription(Prototyping)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Testing" {refill field=Stage default=$Project->Stage checked=Testing}>
                    <strong>{_ Testing}</strong>: {Laddr\Project::getStageDescription(Testing)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Maintaining" {refill field=Stage default=$Project->Stage checked=Maintaining}>
                    <strong>{_ Maintaining}</strong>: {Laddr\Project::getStageDescription(Maintaining)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Drifting" {refill field=Stage default=$Project->Stage checked=Drifting}>
                    <strong>{_ Drifting}</strong>: {Laddr\Project::getStageDescription(Drifting)}
                </label>
                <label class="radio">
                    <input type="radio" name="Stage" value="Hibernating" {refill field=Stage default=$Project->Stage checked=Hibernating}>
                    <strong>{_ Hibernating}</strong>: {Laddr\Project::getStageDescription(Hibernating)}
                </label>
            </div>
        </div>
        <div class="control-group">
            <label for="README" class="control-label">{_ 'README(.md)'}</label>
            <div class="controls">
                <textarea name="README" class="input-block-level" rows="10">{refill field=README default=$Project->README}</textarea>
                <br/><br/>
                <input type="submit" class="btn-small btn" value="{if $Project->isPhantom}{_ 'Create Project'}{else}{_ 'Save Changes'}{/if}"/>
            </div>
        </div>
    </form>
{/block}