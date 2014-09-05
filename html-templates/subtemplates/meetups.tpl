{template meetup event headingLevel=h4 showRsvp=true}
    {$endTime = $event.time + $event.duration}
    <article class="event">
        <{$headingLevel}>{$event.name}</{$headingLevel}>

        <p class="muted">{strip}
            {$event.time/1000|date_format:"%A, %b %e <br> %l:%M%P"}&ndash;
            {$endTime/1000|date_format:"%l:%M%P"}
            &#32;@&nbsp;<a href="http://maps.google.com/?q={$event.venue.address_1},%20{$event.venue.zip}">{$event.venue.name}</a>
        {/strip}</p>

        {if $showRsvp}
            <p><a href="{$event.event_url}">{sprintf(_("RSVP @ %s"), parse_url($event.event_url, $.const.PHP_URL_HOST))}</a> {if $event.yes_rsvp_count}({_("%s so far")|sprintf:$event.yes_rsvp_count}){/if}</p>
        {/if}
    </article>
{/template}