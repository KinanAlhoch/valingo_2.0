$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});


var apiKey = "45115102";
var sessionId = "2_MX40NTExNTEwMn5-MTQxOTQ0NzMzMjUzNH4ybjZZajNEeTJBM0c5UjRRMWYwSG55UFV-fg";
var token = "T1==cGFydG5lcl9pZD00NTExNTEwMiZzaWc9ZDQ5NzM5YmMwZmM1MWE1ZmEwMWM3ZDE4MGQ2OWYzYmIyMzI0MmZhMzpyb2xlPXB1Ymxpc2hlciZzZXNzaW9uX2lkPTJfTVg0ME5URXhOVEV3TW41LU1UUXhPVFEwTnpNek1qVXpOSDR5YmpaWmFqTkVlVEpCTTBjNVVqUlJNV1l3U0c1NVVGVi1mZyZjcmVhdGVfdGltZT0xNDE5NDQ3Mzc2Jm5vbmNlPTAuNDIyMDIwMzE5MzA3MTY5Mg==";

// Initialize session, set up event listeners, and connect
var session = OT.initSession(apiKey, sessionId);

session.on("streamCreated", function(event) {
  session.subscribe(event.stream);
});

session.connect(token, function(error) {
  var publisher = OT.initPublisher();
  session.publish(publisher);
});


