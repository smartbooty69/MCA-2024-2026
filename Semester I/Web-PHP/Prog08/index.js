console.log("=== Window Object ===");
console.log("Window inner width: " + window.innerWidth);
console.log("Window inner height: " + window.innerHeight);
console.log("Window location: " + window.location.href);
console.log("Window title: " + document.title);

console.log("\n=== History Object ===");
console.log("Number of entries in history: " + window.history.length);
console.log("Current URL in history: " + window.history.state);

console.log("\n=== Navigator Object ===");
console.log("User Agent: " + navigator.userAgent);
console.log("Platform: " + navigator.platform);
console.log("Browser Name: " + navigator.appName);
console.log("Browser Version: " + navigator.appVersion);
console.log("Cookies Enabled: " + navigator.cookieEnabled);

console.log("\n=== Screen Object ===");
console.log("Screen width: " + screen.width);
console.log("Screen height: " + screen.height);
console.log("Available screen width: " + screen.availWidth);
console.log("Available screen height: " + screen.availHeight);
console.log("Color depth: " + screen.colorDepth);
console.log("Pixel depth: " + screen.pixelDepth);

console.log("\n=== Additional Information ===");
console.log("Online Status: " + navigator.onLine);
console.log("Timezone: " + Intl.DateTimeFormat().resolvedOptions().timeZone);