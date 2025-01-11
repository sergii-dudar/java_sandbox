-- Function to remove Javadoc comment delimiters and unnecessary symbols
local function clean_javadoc(javadoc)
    -- Remove Javadoc delimiters /** and */
    -- javadoc = javadoc:gsub("/%*%*", ""):gsub("%*/", "")

    -- Remove leading '*' characters
    -- javadoc = javadoc:gsub("%s*%*%s*", "")

    -- Remove extra newlines and trim spaces
    -- javadoc = javadoc:gsub("\n%s*\n", "\n"):gsub("^%s*(.-)%s*$", "%1")

    javadoc = javadoc:gsub(" %* ", ""):gsub("%[(.-)%]%((jdt://.-)%)", "**%1**"):gsub("(%*%*)\n", "%1")
    return javadoc
end

local raw_java = [[
org.springframework.stereotype.Service

Indicates that an annotated class is a "Service", originally defined by Domain-Driven Design (Evans, 2003) as "an operation offered as an interface that stands alone in the model, with no encapsulated state."

May also indicate that a class is a "Business Service Facade" (in the Core J2EE patterns sense), or something similar. This annotation is a general-purpose stereotype and individual teams may narrow their semantics and use as appropriate.

This annotation serves as a specialization of [@Component](jdt://contents/spring-context-6.1.10.jar/org.springframework.stereotype/Component.class?=ticket-service/%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10.jar=/maven.pomderived=/true=/=/javadoc_location=/jar:file:%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10-javadoc.jar%5C!%5C/=/=/maven.groupId=/org.springframework=/=/maven.artifactId=/spring-context=/=/maven.version=/6.1.10=/=/maven.scope=/compile=/=/maven.pomderived=/true=/%3Corg.springframework.stereotype%28Component.class#70), allowing for implementation classes to be autodetected through classpath scanning.

 *  **Since:**

     *  2.5
 *  **Author:**

     *  Juergen Hoeller
 *  **See Also:**

     *  [Component](jdt://contents/spring-context-6.1.10.jar/org.springframework.stereotype/Component.class?=ticket-service/%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10.jar=/maven.pomderived=/true=/=/javadoc_location=/jar:file:%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10-javadoc.jar%5C!%5C/=/=/maven.groupId=/org.springframework=/=/maven.artifactId=/spring-context=/=/maven.version=/6.1.10=/=/maven.scope=/compile=/=/maven.pomderived=/true=/%3Corg.springframework.stereotype%28Component.class#70)

     *  [Repository](jdt://contents/spring-context-6.1.10.jar/org.springframework.stereotype/Repository.class?=ticket-service/%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10.jar=/maven.pomderived=/true=/=/javadoc_location=/jar:file:%5C/home%5C/serhii%5C/.m2%5C/repository%5C/org%5C/springframework%5C/spring-context%5C/6.1.10%5C/spring-context-6.1.10-javadoc.jar%5C!%5C/=/=/maven.groupId=/org.springframework=/=/maven.artifactId=/spring-context=/=/maven.version=/6.1.10=/=/maven.scope=/compile=/=/maven.pomderived=/true=/%3Corg.springframework.stereotype%28Repository.class#61)
]]

local cleaned_javadoc = clean_javadoc(raw_java)
-- print(raw_javadoc)
print(clean_javadoc(raw_java))
