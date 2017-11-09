<%
@"
# This assumes you are running PowerShell 5

# Parameters for publishing the module
`$Path = '.\$PLASTER_PARAM_ModuleName'
`$PublishParams = @{
    NuGetApiKey = '`$ENV:NUGET_API_KEY' # Swap this out with your API key or set the NUGET_API_KEY environment variable.
    Path = '.\$PLASTER_PARAM_ModuleName'
    ProjectUri = 'https://github.com/$PLASTER_PARAM_ModuleAuthor/$PLASTER_PARAM_ModuleName'
    Tags = @('$PLASTER_PARAM_ModuleName' )
}

# We install and run PSScriptAnalyzer against the module to make sure it's not failing any tests
Install-Module -Name PSScriptAnalyzer -force
Invoke-ScriptAnalyzer -Path `$Path

# ScriptAnalyzer passed! Let's publish
Publish-Module @PublishParams

# The module is now listed on the PowerShell Gallery
Find-Module $PLASTER_PARAM_ModuleName
"@
%>