{**
 * complete.tpl
 *
 * Copyright (c) 2003-2005 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * The submission process has been completed; notify the presenter.
 *
 * $Id$
 *}

{include file="common/header.tpl"}

<p>{translate key="presenter.submit.submissionComplete" conferenceTitle=$conference->getTitle()}</p>

{* TODO: expedite handler is incomplete
{if $canExpedite}
	{url|assign:"expediteUrl" op="expediteSubmission" paperId=$paperId}
	{translate key="presenter.submit.expedite" expediteUrl=$expediteUrl}
{/if}
*}

<p>&#187; <a href="{url op="track"}">{translate key="presenter.track"}</a></p>

{include file="common/footer.tpl"}