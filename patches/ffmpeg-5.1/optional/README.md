These patches mostly fix processing DRM DASH/HLS streams.

hls-changes sets a rather high buffer size (tuned towards 1080p VOD content),
which may be undesirable for live streams or SD VOD content.

dash-hacks contains some fixes that may help with DASH streams that contain
subtitles and multiple audio streams (esp. switching between streams on CST).
