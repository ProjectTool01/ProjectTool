<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    username = user.getUsername()
    userId = user.getId()
    isAdmin = user.isAdmin()
    avatar = user.getAvatar()
        username = user.getUsername()
        email = user.getEmail()
        name = user.getName()
        lastname = user.getSurname()
    >
<#else>
    <#assign
    name = "guest"
    isAdmin = false
    >
</#if>