$apiToken = "476xcIQIQDCi7Q.atlasv1.Cg4WT3THBAEcmeonlvmhIu7jk7VCzn9UGGraNbymuOIjH44uHtzlE57OtCRG9j5uFgw"
$organization = "demoBook"
$headers = @{ }
$headers["Authorization"] = "Bearer  $apiToken"
$headers["Content-Type"] = "application/vnd.api+json"
$uriWorkspaces = "https://app.terraform.io/api/v2/organizations/$organization/workspaces"
try
{
    $json = Get-Content("workspace.json")
    $response = Invoke-RestMethod -Uri $uriWorkspaces -Body $json -Headers $headers -Method Post
    $worspaceId = $response.data.id
    Write-Host $worspaceId
}
Catch
{
    $statusCode = $_.Exception.Response.StatusCode
    if ($statusCode -eq 422)
    {
        Write-Host "This Workspace already exist on this organisation"
    }
    else
    {
        Write-Host $_.Exception
    }
}


