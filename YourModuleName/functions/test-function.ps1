function test-function {
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