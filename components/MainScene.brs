function init()
    m.audioPlayer = m.top.findNode("audioPlayer")
    startNTSStream()
end function

function startNTSStream()
    m.audioPlayer.content = CreateObject("roSGNode", "ContentNode")
    m.audioPlayer.content.url = "https://stream-relay-geo.ntslive.net/stream"
    m.audioPlayer.content.streamFormat = "mp3"
    m.audioPlayer.content.title = "NTS Radio 1"
    m.audioPlayer.control = "play"
end function