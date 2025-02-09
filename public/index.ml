<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Simple co-browse with voice example</title>
    <style>
        /* Hide button initially */
        #start-cobrowse {
            display: none;
        }
    </style>
</head>
<body>

    <h1>Simple co-browse with voice example</h1>

    <button type="button" id="start-cobrowse" onclick="genesysWebchat.startCobrowse()">Enter Co-browse Security Key</button>

    <!-- Div with this id required to display security key form -->
    <div id="cobrowse-security-form"></div>

    <!-- Load Genesys WebChat API -->
    <script src="https://apps.mec1.pure.cloud/webchat/jsapi-v1.js" type="text/javascript"></script>

    <!-- Load Genesys Co-browse API -->
    <script src="https://cobrowse.mypurecloud.com/cobrowse-jsapi-v1.js?deploymentKey=c0DQ5r7RZ6tpGnCnwBD8bLwMfl2IU7jB" type="text/javascript"></script>

    <script type="text/javascript">
    let genesysWebchat = (function() {
        function createCobrowseConfig(){
            return {
                "webchatAppUrl": "https://apps.mec1.pure.cloud/webchat",
                "webchatServiceUrl": "https://realtime.mec1.pure.cloud:443",
                "orgGuid": "0e0cf33e-bc71-4644-b318-3a00d283e396",
                "orgName": "EmiratesNBD-UAT",
                "logLevel": "DEBUG",
                "locale": "en",
                "cssClass": "webchat-frame",
                "css": { "width": "100%", "height": "100%" },
                "contentCssUrl": "http://example.com/style.css",
                "containerEl": "cobrowse-security-form",
                "promptForSecurityKey": true
            };
        }

        return {
            startCobrowse: function() {
                let config = createCobrowseConfig();
                ININ.cobrowse.create(config)
                    .then(function(result) {
                        console.log("Co-browse started successfully.");
                    })
                    .catch(function(err) {
                        console.error("Failed to start co-browse:", err);
                    });
            }
        };
    })();

    // Listen for chat connection and agent joining
    window.Genesys("subscribe", "MessagingService.conversationUpdated", function(event) {
        console.log("Chat event received:", event);
        
        if (event.data.participants) {
            let agentJoined = event.data.participants.some(participant => participant.role === "agent" && participant.state === "connected");

            if (agentJoined) {
                console.log("Agent connected! Showing co-browse button.");
                document.getElementById("start-cobrowse").style.display = "block";
            }
        }
    });
    </script>

    <!-- Load Genesys Messenger Script -->
    <script type="text/javascript" charset="utf-8">
      (function (g, e, n, es, ys) {
        g['_genesysJs'] = e;
        g[e] = g[e] || function () {
          (g[e].q = g[e].q || []).push(arguments)
        };
        g[e].t = 1 * new Date();
        g[e].c = es;
        ys = document.createElement('script'); ys.async = 1; ys.src = n; ys.charset = 'utf-8'; document.head.appendChild(ys);
      })(window, 'Genesys', 'https://apps.mec1.pure.cloud/genesys-bootstrap/genesys.min.js', {
        environment: 'prod-mec1',
        deploymentId: 'd6d69019-4fda-438a-a40c-ecb6b983df82'
      });
    </script>

</body>
</html>
