function test-function {
	<#
	.SYNOPSIS
		Extracts function names from a PowerShell script file.
	
	.DESCRIPTION
		Parses a PowerShell script file and extracts all function names using regex pattern matching.
		Returns an array of function names found in the file.
	
	.PARAMETER path
		The path to the PowerShell script file to parse.
	
	.EXAMPLE
		PS C:\> test-function -path "C:\Scripts\MyScript.ps1"
		Returns an array of function names found in MyScript.ps1
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]$path
	)
	
	begin {
		$content = Get-Content -Path $path
	}
	
	process {
		$array = @()
		foreach ($line in $content) {
			if ($line -match 'function\s+(\w+)\s*{') {
				$functionName = $matches[1]
				$array += $functionName
			}
		}
	}
	
	end {
		return $array
	}
}