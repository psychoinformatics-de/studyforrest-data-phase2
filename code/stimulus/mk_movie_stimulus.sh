##end credits music
melt -profile hdv_720_25p -video-track gray_screen.png out=9398 -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_5s.flac forrest_gump_ger_stereo.flac in=195024 out=204422 -mix 125 -mixer mix:-1 -consumer avformat:fg_av_ger_seg99.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


##segment: 0
##frames: 22550.0
##TRs: 451.0
##Duration: 902.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=35 out=22585 -mix 25 -mixer luma gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=2550 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=0 out=22550 -mix 25 -mixer mix:-1 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg0.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


##segment: 1
##frames: 22050.0
##TRs: 441.0
##Duration: 882.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=22185 out=32348 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=36385 out=48273 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=2050 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=22150 out=32312 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=36349 out=48237 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg1.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


##segment: 2
##frames: 21900.0
##TRs: 438.0
##Duration: 876.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=47873 out=57835 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=58507 out=70446 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=1900 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=47837 out=57799 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=58471 out=70409 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg2.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#segment: 3
#frames: 24400.0
#TRs: 488.0
#Duration: 976.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=70046 out=86036 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=89332 out=97742 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=4400 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=70009 out=85999 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=89295 out=97705 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg3.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#segment: 4
#frames: 23100.0
#TRs: 462.0
#Duration: 924.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=97342 out=117391 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=120656 out=123708 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=3100 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=97305 out=117353 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=120618 out=123670 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg4.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#segment: 5
#frames: 21950.0
#TRs: 439.0
#Duration: 878.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=123308 out=141496 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=145908 out=149671 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=1950 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=123270 out=141457 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=145869 out=149632 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg5.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#segment: 6
#frames: 27100.0
#TRs: 542.0
#Duration: 1084.0
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=149271 out=152304 -mix 25 -mixer luma forrest_gump_bluray_orig.mkv force_fps=25.000 in=154288 out=178356 gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=7100 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=149232 out=152265 -mix 25 -mixer mix:-1 forrest_gump_ger_stereo.flac in=154249 out=178316 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg6.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#segment: 7
#frames: 16876.0
#TRs: 337.52
#Duration: 675.04
melt -profile hdv_720_25p -video-track -attach-track watermark:gray_bars_hdv720.png gray_screen_hdv720.png out=25 forrest_gump_bluray_orig.mkv force_fps=25.000 in=177956 out=194832 -mix 25 -mixer luma gray_screen_hdv720.png out=200 -mix 100 -mixer luma -video-track  meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=9999 meta.media.width=1280 meta.media.height=720 indicator/.all.png ttl=1 aspect_ratio=1 progressive=1 out=6876 -attach-track affine transition.geometry=1245/690:50x30:100 -transition composite -audio-track -attach-track ladspa.1197 0=-70 1=-10 -attach-track ladspa.2152 0=128 1=502 2=0 3=20 6=3 -attach-track ladspa.2152 0=128 1=502 2=0 3=-20 6=10 -attach-track volume gain=3 silence_1s.flac forrest_gump_ger_stereo.flac in=177916 out=194792 -mix 25 -mixer mix:-1 silence_5s.flac -mix 100 -mixer mix:-1 -consumer avformat:fg_av_ger_seg7.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#entire movie cut: english
melt -profile hdv_720_25p -video-track forrest_gump_bluray_orig.mkv force_fps=25.000 in=35 out=32348 forrest_gump_bluray_orig.mkv force_fps=25.000 in=36385 out=57835 forrest_gump_bluray_orig.mkv force_fps=25.000 in=58507 out=86036 forrest_gump_bluray_orig.mkv force_fps=25.000 in=89332 out=117391 forrest_gump_bluray_orig.mkv force_fps=25.000 in=120656 out=141496 forrest_gump_bluray_orig.mkv force_fps=25.000 in=145908 out=152304 forrest_gump_bluray_orig.mkv force_fps=25.000 in=154288 out=194832 -audio-track  forrest_gump_eng_stereo.flac in=0 out=32312 forrest_gump_eng_stereo.flac in=36349 out=57799 forrest_gump_eng_stereo.flac in=58471 out=85999 forrest_gump_eng_stereo.flac in=89295 out=117353 forrest_gump_eng_stereo.flac in=120618 out=141457 forrest_gump_eng_stereo.flac in=145869 out=152265 forrest_gump_eng_stereo.flac in=154249 out=194792 -consumer avformat:forrestgump_researchcut_eng.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#entire movie cut: german
melt -profile hdv_720_25p -video-track forrest_gump_bluray_orig.mkv force_fps=25.000 in=35 out=32348 forrest_gump_bluray_orig.mkv force_fps=25.000 in=36385 out=57835 forrest_gump_bluray_orig.mkv force_fps=25.000 in=58507 out=86036 forrest_gump_bluray_orig.mkv force_fps=25.000 in=89332 out=117391 forrest_gump_bluray_orig.mkv force_fps=25.000 in=120656 out=141496 forrest_gump_bluray_orig.mkv force_fps=25.000 in=145908 out=152304 forrest_gump_bluray_orig.mkv force_fps=25.000 in=154288 out=194832 -audio-track  forrest_gump_ger_stereo.flac in=0 out=32312 forrest_gump_ger_stereo.flac in=36349 out=57799 forrest_gump_ger_stereo.flac in=58471 out=85999 forrest_gump_ger_stereo.flac in=89295 out=117353 forrest_gump_ger_stereo.flac in=120618 out=141457 forrest_gump_ger_stereo.flac in=145869 out=152265 forrest_gump_ger_stereo.flac in=154249 out=194792 -consumer avformat:forrestgump_researchcut_ger.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


#entire movie cut: german AD
melt -profile hdv_720_25p -video-track forrest_gump_bluray_orig.mkv force_fps=25.000 in=35 out=32348 forrest_gump_bluray_orig.mkv force_fps=25.000 in=36385 out=57835 forrest_gump_bluray_orig.mkv force_fps=25.000 in=58507 out=86036 forrest_gump_bluray_orig.mkv force_fps=25.000 in=89332 out=117391 forrest_gump_bluray_orig.mkv force_fps=25.000 in=120656 out=141496 forrest_gump_bluray_orig.mkv force_fps=25.000 in=145908 out=152304 forrest_gump_bluray_orig.mkv force_fps=25.000 in=154288 out=194832 -audio-track  forrest_gump_ad_ger_stereo.flac in=0 out=32312 forrest_gump_ad_ger_stereo.flac in=36349 out=57799 forrest_gump_ad_ger_stereo.flac in=58471 out=85999 forrest_gump_ad_ger_stereo.flac in=89295 out=117353 forrest_gump_ad_ger_stereo.flac in=120618 out=141457 forrest_gump_ad_ger_stereo.flac in=145869 out=152265 forrest_gump_ad_ger_stereo.flac in=154249 out=194792 -consumer avformat:forrestgump_researchcut_ad_ger.mkv f=matroska acodec=libmp3lame ab=256k vcodec=libx264 b=5000k


