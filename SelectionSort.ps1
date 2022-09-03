<#
.SYNOPSIS
    Demo selection sort in action
 
 .DESCRIPTION
    Running this PS script will demonstrate a selection sort by generating a random array of 10 numbers between 1 and 100 
      and sorting them using the selection sort algorithm (via linear search)

.NOTES
    Name: Get-Something
    Author: edD
    Version: 1.0
    DateCreated: 2022-Sep-03
 
 
.EXAMPLE
    ./SelectionSort.ps1
 
#>

$list = @()
$counter=0


function Invoke-SelectionSort {
  for ($i=0; $i -lt ($list.Length - 1); $i++)
  {
    ## i = index
    $curr_i_value = $($list[$i])
    $temp_array = $($list[$i..$list.Length])
    $result = $temp_array | Measure-Object -Minimum -Maximum
    $curr_min_value = $result.Minimum
    $curr_min_index = [array]::indexof($list,$curr_min_value)

    ## swap
    $list[$i] = $curr_min_value
    $list[$curr_min_index] = $curr_i_value
    $script:counter++

    "$list"
    "====================================="
    sleep 2
  }
}


## create randomized array of 10 non-repeating elements between 1 and 100
for ($h=0; $h -lt 10; $h++)
{
  $list = Get-Random -Count 10 -in(1..100)  ## non-repeating
}

"====================================="
"Starting array:"
"$list"
"====================================="

Invoke-SelectionSort

"====================================="
"Final sorted list: $list"
"====================================="
"Number of swaps: $counter"
"====================================="