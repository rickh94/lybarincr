\version "2.18.2"
\language "english"

#(ly:set-option 'relative-includes #t)
\include "../violin1_include.ily"

\addQuote "violin11" { \violin_one_first_mov }

violin_solo_first_mov = \relative {
  | % 1
  \key d \major
  \time 4/4
  \new CueVoice { \set instrumentCueName = "Violin I" }
  \tag #'partOnly {
  \cueDuring #"violin11" #UP {
    s1*41
  }
  }
  \tag #'scoreOnly { R1*41 }
  \tag #'partOnly { \break }
  \appoggiatura e'''16 d4 d8. d16 d4 d | % 43
  d4 r8 fs a4 r8 fs | % 44
  d8 -. fs -. a -. fs -. d -. fs -. a -. fs -. | % 45
  d4 r r d8 ( cs ) | % 46
  d4 cs b a | % 47
  b8. \trill a32 b a4 ~ a8 as8 ( b a ) | % 48
  b16 ( cs d b ) a! ( b cs a ) g ( a b g ) fs ( g
  a16 fs ) | % 49
  g8. \trill fs32 g fs4 d'8 ( a ) a ( fs ) | % 50
  fs8 ( g ) g4 g8 ( e ) e ( cs ) | \barNumberCheck #51
  cs8 ( d ) d4 b8 ( d8 ) g ( b ) | % 52
  \appoggiatura b16 a8 g16 fs g a b cs d cs b a b cs d e | % 53
  fs16 e d cs d e fs g a8. ( fs16 ) a8. ( fs16 ) | % 54
  a8 -. fs -. d -. a -. d -. a -. fs8 -. d -. | % 55
  d2 \afterGrace e \trill { d16 e } | % 56
  d4 r4 r2 | % 57
  r2 r4 a,8 ( fs' ) | % 58
  e8 ( d ) fs ( a8 ) g ( fs ) d' ( fs ) | % 59
  fs8 ( g ) g4. fs16 g \appoggiatura a16 g8 fs16 e | % 60
  d16 ( cs ) e -. d -. \appoggiatura fs16 e8 d16 cs
  b ( a ) cs -. b -. \appoggiatura d16 cs8 b16 a |
  \barNumberCheck #61
  g8 \f ( fs ) fs2 fs4 ( | % 62
  e16 ) fs ( g fs
  g16 as b as b ) ds ( e ds e fs g fs | % 63
  g16 ) as ( b as b4 ) ~ b16 as ( b as b4 ) ~ | % 64
  b16 cs ( d cs b a! g fs ) e4 fs | % 65
  fs8. \trill e32 fs e4 r2 | % 66
  a,4 cs'4. e,16 cs' e, cs' e, cs' | % 67
  gs,8 e' d'4. e,16 d' e, d' e, d' | % 68
  e,,8 -. gs -. b -. e -. gs ( b d ) d, -! | % 69
  \appoggiatura e4 d2 \trill cs4 r | % 70
  r16 a'16 ( gs a b a16 gs a )
  r16 g! ( fs g a g fs g ) | \barNumberCheck #71
  r16 fs16 ( e fs g fs e fs )  r16 e ( ds e fs e ds e ) | % 72
  ds4 ( c' b a ) | % 73
  gs16 ( a ) b -. a -. gs ( fs ) e -. ds -.
  e16 ( fs ) e ( fs ) e -. d! -. cs -. b -. | %74
  a16 -. e -. cs -. a -. cs
  e16 a cs b gs e b e gs b d | % 75
  cs16 a a' gs \appoggiatura b16 a8 gs16 fs
  ds ( e ) fs -. e -. \appoggiatura e16 d!8 cs16 b | % 76
  a16 -. e -. cs -. a -. cs e16 a cs b gs e b e gs b d | % 77
  cs16 a a' gs \appoggiatura b16 a8 gs16 fs
  ds ( e ) fs -. e -. \appoggiatura e16 d!8 cs16 b | % 78
  cs16 a cs e a
  cs,16 e a cs e, a cs e a, cs e | \barNumberCheck #79
  g!2 \afterGrace g,, \trill { fs16 g } | % 80
  fs4 r8 es'16 ( fs16 ) e!4 r8 ds16 ( e ) | % 81
  d!4 r8 cs16 ( d ) cs4 r8 bs16 ( cs ) | % 82
  b!16 ( cs ) d -. d -.
  d16 ( e ) fs -. fs -. fs ( gs ) a -. a -. a ( b! ) c -. c -. | % 83
  cs16 ( b ) a -. a -. a ( gs ) fs -. fs -. fs ( e ) ds -. ds -.
  ds ( cs ) b16 -. b -. | % 84
  cs8. ( a16 ) d!8. ( b16 ) cs16 ( a d b cs a d b ) | % 85
  cs16 ( a d b e cs fs d ) \afterGrace b2 \trill { a16 b } | % 86
  a4 r r8 e8 \p ( ds e | % 87
  fs8 e ds e ) d! ( cs b a ) | % 88
  gs8 -! \f b -! d4 -! r8
  cs16 \p ( d ) \appoggiatura e16 d8 cs16 -. b -. | \barNumberCheck #89
  a8 ( as b bs ) cs ( a ) d ( cs ) | % 90
  cs2 ( b!8 ) e' ( ds e | % 91
  ds8 e f e ) d ( c b a ) | % 92
  gs8 \f -! b -! d4 -! r8 e16 -. \p  d -.
  \appoggiatura c16 b8 a16 gs | % 93
  a8 -! a' ( gs ) g ( fs! ) f ( e ) ds -! | % 94
  ds2 ( e8 ) b16 -. e -. cs! -. e -. d! -. e -. | % 95
  cs16 e a e b' e, cs' e, d'! e,
  b16 e cs e d e | % 96
  cs16 e a e b' e, cs' e, d'8 e, -. e -. e -. | % 97
  a4 ( e8 ) r r2 | % 98
  r2 r8 e'8 e e | % 99
  a8 ( gs ) fs \trill e d \trill cs b \trill a | \barNumberCheck #100
  \appoggiatura fs'8 e4 e4. e8 ( fs g! ) | % 101
  es8 ( fs ) fs4. gs16 a \appoggiatura gs16 fs8 e16 d | % 102
  cs16 ( a ) d -. b16 -. cs ( a ) d -. b -. b2 \trill | % 103
  cs8 -! e16 ( cs ) r8 cs16 ( a ) r8 a16 ( e ) r8 e16 ( cs ) | % 104
  r8 d16 ( fs ) r8 fs16 ( a ) r8 a16 ( d ) r8 d16 ( fs ) | % 105
  \repeat unfold 8 { a8 -. } | % 106
  a8 -! a8 [ ( e ) ] e [ ( cs ) ] cs [ ( a ) ] a -! | % 107
  e4 e'2 \appoggiatura d16 cs8 b16 a | % 108
  \afterGrace b1 \trill { a16 b } | %109
  a4 
  \tag #'partOnly  { \cueDuring #"violin11" #UP { 
   r4 -\tweak #'outside-staff-priority #200 ^\markup \tiny "Violin I"
    r2 | % 110
  R1*5 | % 115
  r4 
  } 
  } 
  \tag #'scoreOnly { r4 r2 | R1*5 | r4 }
  cs8 -! cs  -! cs ( d
  ) b8 ( gs ) | % 116
  a8 ( cs ) e -! cs -! cs ( d ) b ( gs ) | % 117
  g!4 g4. fs16 g \appoggiatura a16 g8 fs16 e  | % 118
  d16 ( cs ) e -. d -. \appoggiatura fs16 e8 d16 cs b16 ( as ) cs -. b -.
  \appoggiatura d16 cs8 b16 as | % 119
  cs8 ( b ) b4. ( fs'8 ) fs -. fs -. | % 120
  fs8 ( cs ) cs4. ( fs8 ) fs -. fs -. | \barNumberCheck #121
  fs8 ( d ) d4. (
  b'8 ) b -. b -. | % 122
  d4 ( b g es ) | % 123
  es8 ( fs ) fs4. cs'8 ( fs e! ) | % 124
  d8 -! b ( as ) a ( gs ) g ( fs ) es -! | % 125
  es2 ( fs4 ) r4 | % 126
  d16 ( fs ) b -. d -. cs ( b ) as -. b -.
  d, ( fs ) b  -. d -. cs ( b ) as16 -. b -. | % 127
  g16 -. b -. fs -. b -. g b fs b g b fs b g b fs b | % 128
  g,16 ( b ) e -. g16 -. fs ( e ) ds -. e -.
  g, ( b ) e -. g -. fs ( e ) ds -. e -. | % 129
  cs16 -. e -. b -. e -. cs e b e cs e b e cs e b e | % 130
  cs16 ( e ) a -. cs16 -. b ( a ) gs -. a -.
  cs, ( e ) a -. cs -. b ( a ) gs -. a -. |
  \barNumberCheck #131
  fs16 -. a -. e -. a -. fs a e a fs a e a fs a e a | % 132
  fs,16 ( a ) d -. fs16 -. e ( d ) cs -. d -.
  fs, ( a ) d -. fs -. e ( d ) cs -. d -. | % 133
  b16 -. d -. a -. d -. b d a d b d a d b d a d | % 134
  b4 g, ~ g16 b -. d16 -. g -. b -. d -. g -. b -. | % 135
  a4 a,, ~ a16 cs -. d -. fs -. a -. d -. fs -. a -. | % 136
  c4 c,, ~ c16 d -. fs -. a -. c -. fs -. a -. c -. | % 137
  b4 b,, ~ b16 d -. fs16 -. g -. b -. d -. g -. b -. | % 138
  a4 b,, b16 ds -. fs -. as -. b -. ds -. fs -. a! -. | % 139
  g4 g,, ~ g16 b -. ds -. e -. g -. b -. e -. fs -. | \barNumberCheck #140
  g,4 a, a16 cs -. e -. gs -. a -. cs -. e -. g -. | % 141
  fs4 d, ~ d16 fs -. a -. cs -. d -. fs -. a -. d -. | % 142
  \appoggiatura cs16 b8. \trill a16 \appoggiatura a16 g8. \trill fs16
  \appoggiatura fs16 e8. \trill d16 \appoggiatura d16 cs8. \trill b16 | % 143
  \appoggiatura a16 a'1 ~ | % 144
  a4 a, a2 ~ | % 145
  a4 a,2 a8 ( fs' ) | % 146
  e8 ( d ) fs ( a ) g ( fs ) d' ( fs ) | % 147
  fs8 ( g ) g4. fs16 g \appoggiatura a16 g8 fs16 e | % 148
  d16 ( cs ) e -. d16 -. \appoggiatura fs16 e8 d16 cs
  b ( a ) cs -. b -. \appoggiatura d16 cs8 b16 a | % 149
  g8 \f ( fs ) fs2 fs4 | \barNumberCheck #150
  e16 ( fs g fs g as b as b ) ds ( e ds e fs g fs
  | % 151
  g16 ) as ( b as b4 ) ~ b16 as ( b as
  b4 ) ~ | % 152
  b16 ( cs d cs ) \appoggiatura e16 d8 cs16 b
  \appoggiatura b16 a!8 g16 fs \appoggiatura g16 e8 d16 cs | % 153
  d4 
  \tag #'partOnly \cueDuring #"violin11" #UP { 
   r4 ^\markup \tiny "Violin I"
    r2 | % 154
  R1 | % 155
  r4 
  } 
  \tag #'scoreOnly { r4 r2 R1 r4 }
  
  r8 fs ( g8 ) g -! r fs ( | % 156
  e8 ) e -! r d -! cs -! d -! \appoggiatura fs16 e8 d16 cs | % 157
  d4 d'4. fs,16 d' fs, d' fs, d' | % 158
  fs,,8  d' c'4. d,16 c' d, c' d, c' | % 159
  d,,8 -. fs -. a -. d -. fs ( [ a8 c ) ] c, -! | % 160
  \appoggiatura d4 \afterGrace c2 ( \trill { b16 c } b4 ) r4 | % 161
  r16 b'16 ( as b c b as b ) r a! ( gs a b a gs a ) | \barNumberCheck #162
  r16 gs16 ( fs gs a gs16 fs gs ) r g ( fs g a g fs g ) | % 163
  fs4 ( f e d ) | % 164
  cs16 ( e ) d -. cs -. d ( e ) fs! -. gs -. a ( b ) a ( b )
  a16 -. g -. fs -. e -. | % 165
  d16 -. a -. fs -. d -.
  fs16 a d fs e cs a e a cs e g | % 166
  fs16 d d' cs \appoggiatura e16 d8 cs16 b gs ( a ) b a
  \appoggiatura a16 g8 fs16 e | % 167
  d16 -. a -. fs -. d -.
  fs16 a d fs e cs a e a cs e g | % 168
  fs16 ( a ) cs, -. e -. d ( fs ) as, -. cs -. b ( d ) fs, -. a -.
  g ( b16 ) e, -. g -. | % 169
  fs16 -. d -. fs -. a -.
  d16 fs, a d fs a, d fs a! d, fs a | % 170
  c2 \afterGrace c,, \trill { b16 c } | % 171
  b4 r8 as''16 ( b16 ) a4 r8 gs16 ( a ) | \barNumberCheck #172
  g!4 r8 fs16 ( g ) fs4 r8 es16 ( fs ) | % 173
  e!16 ( fs ) g -. g -. g ( a ) b -. b -.
  b ( cs ) d -. d -. d ( e ) f -. f -. | % 174
  fs!16 ( e ) d -. d -. d ( cs ) b -. b -. b ( a ) gs -. gs -.
  gs ( fs ) e16 -. e -. | % 175
  fs8. ( d16 ) g!8. ( e16 ) fs ( d g e fs d g e ) | % 176
  fs16 ( d g e a fs b g ) \afterGrace e2 \trill { d16 e } | % 177
  d4 
  
  \tag #'partOnly  {
    \cueDuring #"violin11" #UP {
   r ^\markup \tiny "Violin I" 
    r2 | % 178
  R1*2 | % 180
  r2 
  }
  }
  \tag #'scoreOnly { r4 r2 | R1*2 | r2 }
  r8 a8 \p ( gs a | % 181
  b8 a gs a ) g ( fs e d ) | % 182
  cs8 -! \f e -! g4 -! r8 fs16 \p g
  \appoggiatura a16 g8 fs16 -. e -. | % 183
  d8 ( ds e es ) fs ( d ) g ( fs ) | % 184
  fs2 ( e8 ) a ( gs a | % 185
  bf8 a gs a )
  g8 ( f e d ) | % 186
  cs8 -! \f e -! g4 -! r8 a'16 \p -. g! -.
  \appoggiatura g16 e8 d16 cs | % 187
  d8 -! d' ( cs ) c ( b ) bf ( a ) gs -! | % 188
  gs2 ( a8 ) e16 -. a -.
  fs!16 -. a -. g! -. a -. | \barNumberCheck #189
  fs16 a d a cs a d a e' a, e a fs a g a | % 190
  fs16 a d a cs a d a e'8 a,, -. a -. a -. | % 191
  d4 ( a8 ) r r2 | % 192
  r2 r8 a'8 -. a -. a -. | % 193
  d8 ( cs ) b \trill ( a ) g \trill ( fs ) e \trill ( d ) | % 194
  \appoggiatura b'8 a4 a4. a8 ( b c ) | % 195
  as8 ( b ) b4. cs16 d \appoggiatura cs16 b8 as16 g | % 196
  fs16 ( d ) g -. e -. fs ( d ) g -. e -.
  \afterGrace e2 \trill { d16 e } | % 197
  d8 -!  a'16 ( fs ) r8 fs16 ( d ) r8 d16 ( a ) r8 a16 ( fs ) | % 198
  r8 b16 ( d16 ) r8 d16 ( g16 ) r8 g16 ( b16 ) r8 b16 ( d16 ) | \barNumberCheck #199
  a,2 \afterGrace e' \trill { d16 e } | % 200
  fs16 ( d ) a' -. a -. a16 ( fs ) d' -. d -.
  d16 -. a -. fs -. d -. a' -. fs -. d -. a -. | % 201
  b16-. g-. d'-. b-. g'-. d-. b'-. g-. d'4 gs,,, | % 202
  a8 b16 cs d e fs g! a8 b16 cs d e fs g! | % 203
  \appoggiatura b16 a8 g16-. fs-. g-. a-.
  b16-. cs-. d ( cs ) b-. a-. b-. cs-. d-. e-. | % 204
  fs16 ( e ) d-. cs-. d-. e-. fs-. g-. a8-. a-. a-. a-. | % 205
  gs8 ( a ) es ( fs ) cs ( d ) gs, ( a ) | % 206
  a,4 a'4. b16-. cs-. d ( a ) fs-. d-. |  \barNumberCheck #207
  \afterGrace e1 \trill { d16 e } | % 208
  d4 r4 r2 | % 209
  R1*2 | % 211
  r2 r4 d4 | % 212
  fs4. g16 e \afterGrace e2 \fermata \trill { d16 e } | % 213
  d4 
  \tag #'partOnly {\cueDuring #"violin11" #UP {
    r4 -\tweak #'outside-staff-priority #200 ^\markup \tiny "Violin I"
    r2 | % 214
  R1*7
  }
  }
  \tag #'scoreOnly { r4 r2 R1*7 }
  \bar "|."
}
