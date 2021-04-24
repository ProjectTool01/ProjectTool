<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    userId = user.getId()
    isAdmin = user.isAdmin()
    avatar = user.getAvatar()
    >
<#else>
    <#assign
    name = "guest"
    isAdmin = false
    >
</#if>