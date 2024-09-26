
console.log("=== Window Object ===");
console.log("Window inner width: " + window.innerWidth);
console.log("Window inner height: " + window.innerHeight);
console.log("Window location: " + window.location.href);
console.log("Window title: " + document.title);

// === Window Object ===
// VM114:3 Window inner width: 811
// VM114:4 Window inner height: 607
// VM114:5 Window location: chrome://new-tab-page/
// VM114:6 Window title: New Tab
// VM114:8 

console.log("\n=== History Object ===");
console.log("Number of entries in history: " + window.history.length);
console.log("Current URL in history: " + window.history.state);

// === History Object ===
// VM114:9 Number of entries in history: 1
// VM114:10 Current URL in history: null
// VM114:12 

console.log("\n=== Navigator Object ===");
console.log("User Agent: " + navigator.userAgent);
console.log("Platform: " + navigator.platform);
console.log("Browser Name: " + navigator.appName);
console.log("Browser Version: " + navigator.appVersion);
console.log("Cookies Enabled: " + navigator.cookieEnabled);

// === Navigator Object ===
// VM114:13 User Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36
// VM114:14 Platform: Win32
// VM114:15 Browser Name: Netscape
// VM114:16 Browser Version: 5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36
// VM114:17 Cookies Enabled: true
// VM114:19

console.log("\n=== Screen Object ===");
console.log("Screen width: " + screen.width);
console.log("Screen height: " + screen.height);
console.log("Available screen width: " + screen.availWidth);
console.log("Available screen height: " + screen.availHeight);
console.log("Color depth: " + screen.colorDepth);
console.log("Pixel depth: " + screen.pixelDepth);

// === Screen Object ===
// VM114:20 Screen width: 1366
// VM114:21 Screen height: 768
// VM114:22 Available screen width: 1366
// VM114:23 Available screen height: 728
// VM114:24 Color depth: 24
// VM114:25 Pixel depth: 24
// VM114:27 

console.log("\n=== Additional Information ===");
console.log("Online Status: " + navigator.onLine);
console.log("Timezone: " + Intl.DateTimeFormat().resolvedOptions().timeZone);

// === Additional Information ===
// VM114:28 Online Status: true
// VM114:29 Timezone: Asia/Calcutta