function init()
    m.audioPlayer = m.top.findNode("audioPlayer")
    m.currentStream = 1 ' Track which stream is playing (1 or 2)

    ' Define stream URLs
    m.streams = {
        "1": {
            url: "https://stream-relay-geo.ntslive.net/stream",
            title: "NTS Radio 1"
        },
        "2": {
            url: "https://stream-relay-geo.ntslive.net/stream2",
            title: "NTS Radio 2"
        }
    }

    ' Set focus to the scene so it can receive key events
    m.top.setFocus(true)

    startNTSStream()
end function

function startNTSStream()
    streamKey = m.currentStream.toStr()
    stream = m.streams[streamKey]

    m.audioPlayer.content = CreateObject("roSGNode", "ContentNode")
    m.audioPlayer.content.url = stream.url
    m.audioPlayer.content.streamFormat = "mp3"
    m.audioPlayer.content.title = stream.title
    m.audioPlayer.control = "play"
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "OK"
            ' Toggle between stream 1 and 2
            if m.currentStream = 1 then
                m.currentStream = 2
            else
                m.currentStream = 1
            end if

            ' Switch to the new stream
            startNTSStream()
            return true
        end if
    end if
    return false
end function
