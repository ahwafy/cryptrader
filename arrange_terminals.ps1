param (
    [int]$ScreenWidth = 1920,
    [int]$ScreenHeight = 1040
)

# Compile the C# class for Win32 API calls including EnumWindows for partial title matching
Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    using System.Text;
    using System.Collections.Generic;

    public class Win32 {
        public delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);

        [DllImport("user32.dll")]
        public static extern bool EnumWindows(EnumWindowsProc enumProc, IntPtr lParam);

        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString, int nMaxCount);

        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);

        public static IntPtr FindWindowByPartialTitle(string partialTitle) {
            IntPtr found = IntPtr.Zero;
            EnumWindows(delegate(IntPtr wnd, IntPtr param) {
                StringBuilder sb = new StringBuilder(256);
                GetWindowText(wnd, sb, 256);
                string title = sb.ToString();
                if (title.Contains(partialTitle)) {
                    found = wnd;
                    return false; // Stop enumerating
                }
                return true;
            }, IntPtr.Zero);
            return found;
        }
    }
"@

# Define the Custom Layout Sizes
$MonitorHeight = [math]::Floor($ScreenHeight * 0.20)
$MonitorWidth = $ScreenWidth
$MonitorY = $ScreenHeight - $MonitorHeight

# Calculate remaining grid for the other windows
$GridHeight = $ScreenHeight - $MonitorHeight
$Cols = 4
$Rows = 3
$WinWidth = [math]::Floor($ScreenWidth / $Cols)
$WinHeight = [math]::Floor($GridHeight / $Rows)

# List of partial window titles to search for
$Windows = @(
    "1. Ingestor",
    "2. Telegram Ingestor",
    "3. AI Classifier",
    "4. Trade Executor",
    "6. Binance Copy",
    "8. On-Chain",
    "9. CoinMarketCap",
    "10. Automated DB Cleaner",
    "11. Live DB Backup",
    "12. Trade Auditor"
)

# Wait a few seconds to ensure all CMD windows have spawned
Start-Sleep -Seconds 3

# 1. Position the Trade Monitor at the very bottom, full width (20% height)
$hWndMonitor = [Win32]::FindWindowByPartialTitle("5. Trade Monitor")
if ($hWndMonitor -ne [IntPtr]::Zero) {
    [Win32]::MoveWindow($hWndMonitor, 0, $MonitorY, $MonitorWidth, $MonitorHeight, $true)
}

# 2. Position the rest of the engines in a neat grid above it
$index = 0
foreach ($title in $Windows) {
    $hWnd = [Win32]::FindWindowByPartialTitle($title)
    if ($hWnd -ne [IntPtr]::Zero) {
        $Col = $index % $Cols
        $Row = [math]::Floor($index / $Cols)
        
        $X = $Col * $WinWidth
        $Y = $Row * $WinHeight
        
        [Win32]::MoveWindow($hWnd, $X, $Y, $WinWidth, $WinHeight, $true)
    }
    $index++
}

Write-Host "Terminal windows arranged!" -ForegroundColor Green
