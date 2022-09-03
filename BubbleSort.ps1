<#
.SYNOPSIS
    Demo bubble sort in action
 
 .DESCRIPTION
    Running this PS script will demonstrate a bubble sort by generating a random array of 10 numbers between 1 and 100 
      and sorting them using the bubble sort algorithm

.NOTES
    Name: Get-Something
    Author: edD
    Version: 1.0
    DateCreated: 2022-Aug-29
 
 
.EXAMPLE
    ./BubbleSort.ps1
 
#>

$list = @()
$swapped = $false
$counter=0

function Invoke-Evaluation
{
  if ($swapped)
  {
    $swapped = $false
    Invoke-BubbleSort
  } else {
      "Final sorted list: $list"
  }
}

function Invoke-BubbleSort {
  for ($i=0; $i -lt 10; $i++)
  {
    if ($list[-($i+1)] -lt $list[-($i+2)])
    {
     $j = $list[-($i+1)]
     $k = $list[-($i+2)]
     
     $list[-($i+2)] = $j
     $list[-($i+1)] = $k
     $script:swapped = $true
     $global:counter++
     "$list"
     "**********"
     sleep 3

    } else {
        continue     
    }
  }

  #Invoke-Evaluation
}

for ($h=0; $h -lt 10; $h++)
{
  $list += (Get-Random -Minimum 1 -Maximum 100)
}

"====================================="
"Starting array:"
"$list"
"====================================="

Invoke-BubbleSort

while ($swapped)
{ 
  $swapped = $false
  Invoke-BubbleSort
}

"====================================="
"Final sorted list: $list"
"====================================="
"Number of swaps: $counter"
"====================================="
