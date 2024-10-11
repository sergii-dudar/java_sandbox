#!/usr/bin/lua

--print(string.match(" TicketServiceApplication.java ", "TicketServiceApplication.java:?%d*"))
--print(string.match("sdfsdf (TicketServiceApplication.java:13) ", "[A-Za-z0-9_-]*%.?%w*:13"))

local stack_trace = [[
java.lang.IllegalArgumentException: http://${app.client.service.agency.url} is malformed
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.getUrl(FeignClientsRegistrar.java:124)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.getUrl(FeignClientsRegistrar.java:370)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.eagerlyRegisterFeignClientBeanDefinition(FeignClientsRegistrar.java:222)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.registerFeignClient(FeignClientsRegistrar.java:211)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.registerFeignClients(FeignClientsRegistrar.java:201)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.registerBeanDefinitions(FeignClientsRegistrar.java:151)
        at org.springframework.context.annotation.ImportBeanDefinitionRegistrar.registerBeanDefinitions(ImportBeanDefinitionRegistrar.java:86)
        at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.lambda$loadBeanDefinitionsFromRegistrars$1(ConfigurationClassBeanDefinitionReader.java:376)
        at java.base/java.util.LinkedHashMap.forEach(LinkedHashMap.java:986)
        at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitionsFromRegistrars(ConfigurationClassBeanDefinitionReader.java:375)
        at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitionsForConfigurationClass(ConfigurationClassBeanDefinitionReader.java:148)
        at org.springframework.context.annotation.ConfigurationClassBeanDefinitionReader.loadBeanDefinitions(ConfigurationClassBeanDefinitionReader.java:120)
        at org.springframework.context.annotation.ConfigurationClassPostProcessor.processConfigBeanDefinitions(ConfigurationClassPostProcessor.java:429)
        at org.springframework.context.annotation.ConfigurationClassPostProcessor.postProcessBeanDefinitionRegistry(ConfigurationClassPostProcessor.java:290)
        at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanDefinitionRegistryPostProcessors(PostProcessorRegistrationDelegate.java:349)
        at org.springframework.context.support.PostProcessorRegistrationDelegate.invokeBeanFactoryPostProcessors(PostProcessorRegistrationDelegate.java:118)
        at org.springframework.context.support.AbstractApplicationContext.invokeBeanFactoryPostProcessors(AbstractApplicationContext.java:788)
        at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:606)
        at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:146)
        at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:754)
        at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:456)
        at org.springframework.boot.SpringApplication.run(SpringApplication.java:335)
        at org.springframework.boot.SpringApplication.run(SpringApplication.java:1363)
        at org.springframework.boot.SpringApplication.run(SpringApplication.java:1352)
        at com.hitachirail.pass.service.ticket.TicketServiceApplication.main(TicketServiceApplication.java:13)
Caused by: java.net.MalformedURLException: Illegal character found in host: '{'
        at java.base/java.net.URL.<init>(URL.java:806)
        at java.base/java.net.URL.<init>(URL.java:654)
        at java.base/java.net.URL.<init>(URL.java:590)
        at org.springframework.cloud.openfeign.FeignClientsRegistrar.getUrl(FeignClientsRegistrar.java:121)
        ... 24 common frames omitted
Caused by: java.lang.IllegalArgumentException: Illegal character found in host: '{'
        at java.base/java.net.URLStreamHandler.setURL(URLStreamHandler.java:523)
        at java.base/java.net.URLStreamHandler.parseURL(URLStreamHandler.java:326)
        at java.base/java.net.URL.<init>(URL.java:801)
        ... 27 common frames omitted
]]

-- Function to parse stack trace lines and extract file info
local function parse_stack_trace(trace)
    local items = {}

    -- Match patterns like "Class.method(FileName.java:LineNumber)"
    --for file, line in string.gmatch(trace, "([%w%.%/%_]+%.java):(%d+)") do
    for cp_path, method, file, line in string.gmatch(trace, "([%w%.%/%_-]*)%.([%w_-]+)%(([%w%.%/%_-]+%.java):(%d+)") do

        local file_no_ex = string.match(file, "([^.]+)")
        cp_path = string.gsub(cp_path, "."..file_no_ex, "")
        local path = string.gsub(cp_path, "%.", "/")
        print(path .. ", " .. method .. ", " .. file .. ", " .. line)
        --table.insert(items, {
        --    filename = file,  -- Just the file name (we'll resolve the path later)
        --    lnum = tonumber(line),
        --    col = 1,  -- Default to column 1
        --    text = "From stack trace"  -- Customize this to show relevant information
        --})
    end

    return items
end

local items = parse_stack_trace(stack_trace)

for _, item in ipairs(items) do
    -- Use Neovim's built-in file search to resolve the file name
    --local full_path = vim.fn.findfile(item.filename)
    --if full_path ~= "" then
    --    item.filename = full_path  -- Update the filename with the full path
    --    table.insert(resolved_items, item)
    --end
    print(item.filename .. ": " .. item.lnum .. ": " .. item.col ..": " .. item.text)
end

