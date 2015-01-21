$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});
var apiKey = "45135002";
var sessionId = "2_MX40NTEzNTAwMn5-MTQyMTg2MjU0NTEwM35KWmoxR0c5MXZieTRtUGREc1lKRHExSmt-fg";
var token = "T1==cGFydG5lcl9pZD00NTEzNTAwMiZzaWc9OGMwNTM3YzE2OTI0YmI5OGU5YTEwYTVmZDAxM2E3M2QwZDU2MDA1Zjpyb2xlPXB1Ymxpc2hlciZzZXNzaW9uX2lkPTJfTVg0ME5URXpOVEF3TW41LU1UUXlNVGcyTWpVME5URXdNMzVLV21veFIwYzVNWFppZVRSdFVHUkVjMWxLUkhFeFNtdC1mZyZjcmVhdGVfdGltZT0xNDIxODYyNjY5Jm5vbmNlPTAuNzY0NjY2Nzc3ODM3Mzg0Ng==";

// Initialize session, set up event listeners, and connect
var session = OT.initSession(apiKey, sessionId);

session.on("streamCreated", function(event) {
  session.subscribe(event.stream);
});

session.connect(token, function(error) {
  var publisher = OT.initPublisher();
  session.publish(publisher);
});


