sub init()
    m.top.functionName = "executeCloudScrape"
end sub

sub executeCloudScrape()
    query = m.top.query
    if query = invalid or query = "" then return

    ' Safe URL encoding formatting for spaces and symbols
    encoder = CreateObject("roUrlTransfer")
    safeQuery = encoder.Escape(query)
    
    ' Point this at YOUR computer's LOCAL network IP + port (default 5000).
    ' Find it with: ipconfig (Windows) / ipconfig getifaddr en0 (Mac) / hostname -I (Linux).
    ' Replace 192.168.1.50 below with your actual address. Note: plain http on the LAN.
    cloudServiceUrl = "http://192.168.1.117:5050/get_audio?q=" + safeQuery
    
    request = CreateObject("roUrlTransfer")
    
    ' CRITICAL: Secure endpoints require the Roku platform bundle certificate mapping
    request.SetCertificatesFile("common:/certs/ca-bundle.crt") 
    request.InitClientCertificates()
    request.SetUrl(cloudServiceUrl)
    
    responseString = request.GetToString()
    
    if responseString <> ""
        json = ParseJson(responseString)
        if json <> invalid and json.url <> invalid
            ' Determine track title using a regular if statement
            trackTitle = "Cloud Live Stream"
            if json.title <> invalid
                trackTitle = json.title
            end if

            ' Roku stream format (m4a/mp3/etc); default to m4a if absent
            trackFormat = "m4a"
            if json.format <> invalid
                trackFormat = json.format
            end if

            ' Transmit parsed properties securely back up to your UI layer
            m.top.response = {
                title: trackTitle,
                url: json.url,
                format: trackFormat
            }
        else
            print "Cloud returned an invalid data payload layout."
            m.top.response = { ok: false }
        end if
    else
        print "Cloud extraction service request failed."
        m.top.response = { ok: false }
    end if
end sub