<#assign show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search")) />
<#assign globalCSSFileName = "globalCssInclude.css" />
<#assign globalJSFileName = "globalJsInclude.js" />
<#assign localCSSFileName = "DkCssInclude.css" />
<#assign localJSFileName = "DkJsInclude.js" />
<#--
<#assign jsIncludePath = themeDisplay.getPortalURL() + "/documents/" + companyId + "/0/" + globalJSFileName />
<#assign cssIncludePath = themeDisplay.getPortalURL() + "/documents/" + companyId + "/0/" + globalCSSFileName />
-->
<#assign jsDKIncludePath = themeDisplay.getPortalURL() + "/documents/" + themeDisplay.getScopeGroupId() + "/0/" + localJSFileName />
<#assign cssDKIncludePath = themeDisplay.getPortalURL() + "/documents/" + themeDisplay.getScopeGroupId() + "/0/" + localCSSFileName />
<#assign fileService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLFileEntryLocalService") />