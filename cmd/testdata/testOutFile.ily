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
  \appoggiatura e'''16 d4 d8. d16 d4 d | % 41
  d4 r8 fs a4 r8 fs | % 42
  d8 -. fs -. a -. fs -. d -. fs -. a -. fs -. | % 43
  d4 r r d8 ( cs ) | % 44
  d4 cs b a | % 45
  b8. \trill a32 b a4 ~ a8 as8 ( b a ) | % 46
  b16 ( cs d b ) a! ( b cs a ) g ( a b g ) fs ( g
  a16 fs ) | % 47
  g8. \trill fs32 g fs4 d'8 ( a ) a ( fs ) | % 48
  fs8 ( g ) g4 g8 ( e ) e ( cs ) | \barNumberCheck #49
  cs8 ( d ) d4 b8 ( d8 ) g ( b ) | % 50
  \appoggiatura b16 a8 g16 fs g a b cs d cs b a b cs d e | % 51
  fs16 e d cs d e fs g a8. ( fs16 ) a8. ( fs16 ) | % 52
  a8 -. fs -. d -. a -. d -. a -. fs8 -. d -. | % 53
  d2 \afterGrace e \trill { d16 e } | % 54
  d4 r4 r2 | % 55
  r2 r4 a,8 ( fs' ) | % 56
  e8 ( d ) fs ( a8 ) g ( fs ) d' ( fs ) | % 57
  fs8 ( g ) g4. fs16 g \appoggiatura a16 g8 fs16 e | % 58
  d16 ( cs ) e -. d -. \appoggiatura fs16 e8 d16 cs
  b ( a ) cs -. b -. \appoggiatura d16 cs8 b16 a |
  \barNumberCheck #59
  g8 \f ( fs ) fs2 fs4 ( | % 60
  e16 ) fs ( g fs
  g16 as b as b ) ds ( e ds e fs g fs | % 61
  g16 ) as ( b as b4 ) ~ b16 as ( b as b4 ) ~ | % 62
  b16 cs ( d cs b a! g fs ) e4 fs | % 63
  fs8. \trill e32 fs e4 r2 | % 64
  a,4 cs'4. e,16 cs' e, cs' e, cs' | % 65
  gs,8 e' d'4. e,16 d' e, d' e, d' | % 66
  e,,8 -. gs -. b -. e -. gs ( b d ) d, -! | % 67
  \appoggiatura e4 d2 \trill cs4 r | % 68
  r16 a'16 ( gs a b a16 gs a )
  r16 g! ( fs g a g fs g ) | \barNumberCheck #69
  r16 fs16 ( e fs g fs e fs )  r16 e ( ds e fs e ds e ) | % 70
  ds4 ( c' b a ) | % 71
  gs16 ( a ) b -. a -. gs ( fs ) e -. ds -.
  e16 ( fs ) e ( fs ) e -. d! -. cs -. b -. | %72
  a16 -. e -. cs -. a -. cs
  e16 a cs b gs e b e gs b d | % 73
  cs16 a a' gs \appoggiatura b16 a8 gs16 fs
  ds ( e ) fs -. e -. \appoggiatura e16 d!8 cs16 b | % 74
  a16 -. e -. cs -. a -. cs e16 a cs b gs e b e gs b d | % 75
  cs16 a a' gs \appoggiatura b16 a8 gs16 fs
  ds ( e ) fs -. e -. \appoggiatura e16 d!8 cs16 b | % 76
  cs16 a cs e a
  cs,16 e a cs e, a cs e a, cs e | \barNumberCheck #77
  g!2 \afterGrace g,, \trill { fs16 g } | % 78
  fs4 r8 es'16 ( fs16 ) e!4 r8 ds16 ( e ) | % 79
  d!4 r8 cs16 ( d ) cs4 r8 bs16 ( cs ) | % 80
  b!16 ( cs ) d -. d -.
  d16 ( e ) fs -. fs -. fs ( gs ) a -. a -. a ( b! ) c -. c -. | % 81
  cs16 ( b ) a -. a -. a ( gs ) fs -. fs -. fs ( e ) ds -. ds -.
  ds ( cs ) b16 -. b -. | % 82
  cs8. ( a16 ) d!8. ( b16 ) cs16 ( a d b cs a d b ) | % 83
  cs16 ( a d b e cs fs d ) \afterGrace b2 \trill { a16 b } | % 84
  a4 r r8 e8 \p ( ds e | % 85
  fs8 e ds e ) d! ( cs b a ) | % 86
  gs8 -! \f b -! d4 -! r8
  cs16 \p ( d ) \appoggiatura e16 d8 cs16 -. b -. | \barNumberCheck #87
  a8 ( as b bs ) cs ( a ) d ( cs ) | % 88
  cs2 ( b!8 ) e' ( ds e | % 89
  ds8 e f e ) d ( c b a ) | % 90
  gs8 \f -! b -! d4 -! r8 e16 -. \p  d -.
  \appoggiatura c16 b8 a16 gs | % 91
  a8 -! a' ( gs ) g ( fs! ) f ( e ) ds -! | % 92
  ds2 ( e8 ) b16 -. e -. cs! -. e -. d! -. e -. | % 93
  cs16 e a e b' e, cs' e, d'! e,
  b16 e cs e d e | % 94
  cs16 e a e b' e, cs' e, d'8 e, -. e -. e -. | % 95
  a4 ( e8 ) r r2 | % 96
  r2 r8 e'8 e e | % 97
  a8 ( gs ) fs \trill e d \trill cs b \trill a | \barNumberCheck #98
  \appoggiatura fs'8 e4 e4. e8 ( fs g! ) | % 99
  es8 ( fs ) fs4. gs16 a \appoggiatura gs16 fs8 e16 d | % 100
  cs16 ( a ) d -. b16 -. cs ( a ) d -. b -. b2 \trill | % 101
  cs8 -! e16 ( cs ) r8 cs16 ( a ) r8 a16 ( e ) r8 e16 ( cs ) | % 102
  r8 d16 ( fs ) r8 fs16 ( a ) r8 a16 ( d ) r8 d16 ( fs ) | % 103
  \repeat unfold 8 { a8 -. } | % 104
  a8 -! a8 [ ( e ) ] e [ ( cs ) ] cs [ ( a ) ] a -! | % 105
  e4 e'2 \appoggiatura d16 cs8 b16 a | % 106
  \afterGrace b1 \trill { a16 b } | %107
  a4 
  \tag #'partOnly  { \cueDuring #"violin11" #UP { 
   r4 -\tweak #'outside-staff-priority #200 ^\markup \tiny "Violin I"
    r2 | % 108
  R1*5 | % 113
  r4 
  } 
  } 
  \tag #'scoreOnly { r4 r2 | R1*5 | r4 }
  cs8 -! cs  -! cs ( d
  ) b8 ( gs ) | % 114
  a8 ( cs ) e -! cs -! cs ( d ) b ( gs ) | % 115
  g!4 g4. fs16 g \appoggiatura a16 g8 fs16 e  | % 116
  d16 ( cs ) e -. d -. \appoggiatura fs16 e8 d16 cs b16 ( as ) cs -. b -.
  \appoggiatura d16 cs8 b16 as | % 117
  cs8 ( b ) b4. ( fs'8 ) fs -. fs -. | % 118
  fs8 ( cs ) cs4. ( fs8 ) fs -. fs -. | \barNumberCheck #119
  fs8 ( d ) d4. (
  b'8 ) b -. b -. | % 120
  d4 ( b g es ) | % 121
  es8 ( fs ) fs4. cs'8 ( fs e! ) | % 122
  d8 -! b ( as ) a ( gs ) g ( fs ) es -! | % 123
  es2 ( fs4 ) r4 | % 124
  d16 ( fs ) b -. d -. cs ( b ) as -. b -.
  d, ( fs ) b  -. d -. cs ( b ) as16 -. b -. | % 125
  g16 -. b -. fs -. b -. g b fs b g b fs b g b fs b | % 126
  g,16 ( b ) e -. g16 -. fs ( e ) ds -. e -.
  g, ( b ) e -. g -. fs ( e ) ds -. e -. | % 127
  cs16 -. e -. b -. e -. cs e b e cs e b e cs e b e | % 128
  cs16 ( e ) a -. cs16 -. b ( a ) gs -. a -.
  cs, ( e ) a -. cs -. b ( a ) gs -. a -. |
  \barNumberCheck #129
  fs16 -. a -. e -. a -. fs a e a fs a e a fs a e a | % 130
  fs,16 ( a ) d -. fs16 -. e ( d ) cs -. d -.
  fs, ( a ) d -. fs -. e ( d ) cs -. d -. | % 131
  b16 -. d -. a -. d -. b d a d b d a d b d a d | % 132
  b4 g, ~ g16 b -. d16 -. g -. b -. d -. g -. b -. | % 133
  a4 a,, ~ a16 cs -. d -. fs -. a -. d -. fs -. a -. | % 134
  c4 c,, ~ c16 d -. fs -. a -. c -. fs -. a -. c -. | % 135
  b4 b,, ~ b16 d -. fs16 -. g -. b -. d -. g -. b -. | % 136
  a4 b,, b16 ds -. fs -. as -. b -. ds -. fs -. a! -. | % 137
  g4 g,, ~ g16 b -. ds -. e -. g -. b -. e -. fs -. | \barNumberCheck #138
  g,4 a, a16 cs -. e -. gs -. a -. cs -. e -. g -. | % 139
  fs4 d, ~ d16 fs -. a -. cs -. d -. fs -. a -. d -. | % 140
  \appoggiatura cs16 b8. \trill a16 \appoggiatura a16 g8. \trill fs16
  \appoggiatura fs16 e8. \trill d16 \appoggiatura d16 cs8. \trill b16 | % 141
  \appoggiatura a16 a'1 ~ | % 142
  a4 a, a2 ~ | % 143
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
