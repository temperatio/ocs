{**
 * index.tpl
 *
 * Copyright (c) 2003-2004 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Conference management index.
 *
 * $Id$
 *}

{assign var="pageTitle" value="manager.conferenceSiteManagement"}
{include file="common/header.tpl"}

<h3>{translate key="manager.managementPages"}</h3>

<ul class="plain">
	{if $announcementsEnabled}
		<li>&#187; <a href="{url op="announcements"}">{translate key="manager.announcements"}</a></li>
	{/if}
	<li>&#187; <a href="{url op="files"}">{translate key="manager.filesBrowser"}</a></li>
	{*<li>&#187; <a href="{url op="importexport"}">{translate key="manager.importExport"}</a></li>*}
	<li>&#187; <a href="{url op="languages"}">{translate key="common.languages"}</a></li>
	<li>&#187; <a href="{url op="emails"}">{translate key="manager.emails"}</a></li>
	<li>&#187; <a href="{url page="rtadmin"}">{translate key="manager.readingTools"}</a></li>
	<li>&#187; <a href="{url op="schedConfs"}">{translate key="manager.scheduledConferences"}</a></li>
	<li>&#187; <a href="{url op="setup"}">{translate key="manager.conferenceSiteSetup"}</a></li>
	<li>&#187; <a href="{url op="plugins"}">{translate key="manager.plugins"}</a></li>
	{call_hook name="Templates::Manager::Index::ManagementPages"}
</ul>


<h3>{translate key="manager.scheduledConferences"}</h3>
{iterate from=schedConfs item=schedConf}
	<h4>{$schedConf->getFullTitle()}</h4>
	<ul class="plain">
		<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="tracks"}">{translate key="track.tracks"}</a></li>
		<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="groups"}">{translate key="manager.groups"}</a></li>
		<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="schedConfSetup"}">{translate key="manager.schedConfSetup"}</a></li>
		<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="statistics"}">{translate key="manager.statistics"}</a></li>
		{if $registrationEnabled}
			<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="registration"}">{translate key="manager.registration"}</a></li>
		{/if}
		<li>&#187; <a href="{url schedConf=$schedConf->getPath() page="manager" op="people"}">{translate key="manager.roles"}</a></li>
		{call_hook name="Templates::Manager::Index::SchedConfManagementPages"}
	</ul>
{/iterate}


<h3>{translate key="manager.users"}</h3>

<ul class="plain">
	<li>&#187; <a href="{url op="people" path="all"}">{translate key="manager.people.allUsers"}</a></li>
	<li>&#187; <a href="{url op="createUser"}">{translate key="manager.people.createUser"}</a></li>
	{*<li>&#187; <a href="{url op="mergeUsers"}">{translate key="manager.people.mergeUsers"}</a></li>*}
	{call_hook name="Templates::Manager::Index::Users"}
</ul>


<h3>{translate key="manager.roles"}</h3>

<ul class="plain">
	<li>&#187; <a href="{url op="people" path="manager"}">{translate key="user.role.manager"}</a></li>
	{call_hook name="Templates::Manager::Index::Roles"}
</ul>

{include file="common/footer.tpl"}