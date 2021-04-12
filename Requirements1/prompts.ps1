# Earl Chough 001171966

"Please select one of the following options: "
"Press 1: Find all files with .log extensions. Output file: DailyLog.txt"
"Press 2: All files within Requirements1 folder in alphabetical order. Output file: C916contents.txt"
"Press 3: List current CPU%ProcessorTime and memory useage "
"Press 4: List of all different running processes. Sorted by processor time greatest to least."
"Press 5: Exit Script" 

($UserInput = Read-Host - Prompt "Press Enter Selection Here: ")
Switch ($UserInput) 
{
    # Pressing 1 this section executes code that goes into the requirements folder and creates a list of all files with the .log extension and uploads the list into a file called dailylog.txt with appending
    1{Try
    {
        $Filepath = $PSScriptRoot       
        $Dir = Get-ChildItem -Path $Filepath -Recurse
        $List = $Dir | where {$_.extension -eq '.log'}
        $List |ft name |out-file "$Filepath\DailyLog.txt" -Append
    }
    Catch [System.OutOfMemoryException]
    {
        Write-Output "Out of Memory Exception. Returning to terminal"
        return
    }}
    # Pressing 2, this section executes code that creates a list of all files in requirements folder and uploads that list into a file called C916contents.txt
    2{Try
    {
        $Filepath = $PSScriptRoot   
        $List = Get-ChildItem -Path $Filepath -Recurse
        $List |Sort-Object |out-file "$Filepath\C916contents.txt" -Append
    }
    Catch [System.OutOfMemoryException]
    {
        Write-Output "Out of Memory Exception. Returning to terminal"
        return
    }}

    # Pressing 3, this section executes code that gets the current % processor time and physical memory usage in four 5 second intervals
    3{Try
    {
        $CounterArray = '\Processor(_Total)\% Processor Time','\Memory\% Committed Bytes in Use'
        Get-Counter -Counter $CounterArray -MaxSamples 4 -SampleInterval 5
    }
    Catch [System.OutOfMemoryException]
    {
        Write-Output "Out of Memory Exception. Returning to terminal"
        return
    }}

    # Pressing 4, this section executes code that opens an interactive window that shows processes that sort the output by the processor from greatest to least
    4{Try
    {
        Get-Process | Sort CPU -descending | Out-GridView
        Write-Output "Opening new window. One moment..."
    }
    Catch [System.OutOfMemoryException]
    {
        Write-Output "Out of Memory Exception. Returning to terminal"
        return
    }}

    # Pressing 5, this section stops the script and returns to the terminal.
    5{Write-Output "Goodbye"
    return}
}

