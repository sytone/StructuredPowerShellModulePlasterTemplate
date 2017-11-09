$Verbose = @{}
if($env:APPVEYOR_REPO_BRANCH -and $env:APPVEYOR_REPO_BRANCH -notlike "master") {
    $Verbose.add("Verbose",$True)
}

$ModuleManifestName = '<%=$PLASTER_PARAM_ModuleName%>.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\<%=$PLASTER_PARAM_ModuleName%>\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}