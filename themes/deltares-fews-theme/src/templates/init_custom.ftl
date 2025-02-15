<#--
This file allows you to override and define new FreeMarker variables.
-->

<#assign logo_img = images_folder + '/logo.png' />


<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />

<#assign footerWC = "" />

<#-- If this page has an open day colour scheme, drop the banner on -->

<#assign defaultCompanyId = staticUtil["com.liferay.portal.kernel.util.PortalUtil"].getDefaultCompanyId()/>
<#assign groupLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.GroupLocalService") />
<#assign globalGroupId = groupLocalService.getCompanyGroup(defaultCompanyId).getGroupId()/>
<#assign footerWCArticleId = "PAGE-FOOTER">

<#if journalArticleLocalService.fetchArticle(themeDisplay.getScopeGroupId(), footerWCArticleId)?? >
    <#assign footerWCArticle = journalArticleLocalService.fetchArticle(themeDisplay.getScopeGroupId(), footerWCArticleId) >
    <#assign footerWCContent = journalArticleLocalService.getArticleContent(footerWCArticle, footerWCArticle.getDDMTemplateKey(), "VIEW", locale, themeDisplay) />
</#if>
