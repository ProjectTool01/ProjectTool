<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    profileAddress = user.getProfileAddress()
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "guest"
    isAdmin = false
    >
</#if>