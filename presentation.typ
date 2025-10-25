#import "slydst.typ": *

#show: slides.with(
  title: "Intermittency update", // Required
  subtitle: "PAG-EbyE",
  date: datetime.today().display(),
  authors: "Salman Khurshid Malik, Ramni Gupta",
  layout: "medium",
  ratio: 4 / 3,
  title-color: none,
  institute: "Department of Physics, University of Jammu",
)

#show raw: set block(fill: silver.lighten(65%), width: 100%, inset: 1em)

= Filterbits QA

== Dataset
- Comparison of filterbit QA results.
- HIJING three datasets: *2010 (2.76 TeV)*: LHC11a10a_bis, *2015 (5.02 TeV)*: LHC20j6a, *2018 (5.02 TeV)*: LHC20e3a.
#columns-content()[
  - $~$5000 events for each dataset.
  - Centrality: 0--10%.
  - $abs(v_z) < 10$, $abs(eta) < 0.8$.
][
  #place()[#figure(image("/images/tmp37.png", width: 120%), numbering: none,)]
]

== DCA#sub[$x y,z$] comparison
#figure(
  grid(
    columns: (1fr, 1fr, 1fr),
    rows: (1fr, 1fr),
    inset: -3pt,
    align: center,
    figure(image("/images/tmp6.png", width: 105%),numbering: none,),
    figure(image("/images/tmp5.png", width: 105%),numbering: none,),
    figure(image("/images/tmp7.png", width: 105%),numbering: none,),

    figure(image("/images/tmp10.png", width: 105%),numbering: none,),
    figure(image("/images/tmp9.png", width: 105%),numbering: none,),
    figure(image("/images/tmp8.png", width: 105%),numbering: none,),
  ),
  gap: 1em,
)

== TPC \#clusters comparison
#columns-content()[
  #definition(title: "Definition of fb128")[
    $abs("dca"_"xy") < 2.4$, $abs("dca"_"z") < 3.0$,
    TPCNClusters $> 50$,
    $chi^2_"per TPC cluster" <= 4$.
  ]
  - The method used to check filterbits in AODs:
    ```cpp AliAODTrack *track = static_cast<AliAODTrack *>(fAOD->GetTrack(i));
    track->TestFilterBit(128);```

][
  #place()[
    #figure(
      grid(
        columns: 1fr,
        rows: (1fr, 1fr),
        inset: 0pt,
        align: center,
        figure(image("/images/tmp18.png", width: 95%), numbering: none,),
        figure(image("/images/tmp20.png", width: 95%), numbering: none,),
      ),
    )
  ]
]

== TPC \#crossed rows comparison
#columns-content()[
  - The method used to check filterbits in AODs:
    ```cpp AliAODTrack *track = static_cast<AliAODTrack *>(fAOD->GetTrack(i));
    track->TestFilterBit(128);```
  - does not work for 128.
  - Applying cuts manually does work.
][
  #place()[
    #figure(
      grid(
        columns: 1fr,
        rows: (1fr, 1fr),
        inset: 0pt,
        align: center,
        figure(image("/images/tmp22.png", width: 95%), numbering: none,),
        figure(image("/images/tmp24.png", width: 95%), numbering: none,),
      ),
    )
  ]
]

== Contamination in filterbits
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/tmp26.png", width: 95%), numbering: none,),
      figure(image("/images/tmp27.png", width: 95%), numbering: none,),
    ),
  )
]
#place(horizon, dy: 5em)[
  #columns-content()[
    - for 2010 dataset.
    - secondaries from material and weak decays both larger in fb128.
  ][
    #v(4.4em)
    #figure(image("/images/tmp33.png", width: 95%), numbering: none,),
  ]]

== Contamination in filterbits
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/tmp30.png", width: 95%), numbering: none,),
      figure(image("/images/tmp29.png", width: 95%), numbering: none,),
    ),
  )
]
#place(horizon, dy: 5em)[
  #columns-content()[
    - for 2015/2018 dataset.
    - secondaries from material and weak decays both larger in fb128.
    - #note[fb768 works fine with less contamination.]
  ][
    #v(4.4em)
    #figure(image("/images/tmp32.png", width: 95%), numbering: none,),
  ]]

= HIJING Closure

== Dataset
#columns-content()[
  - HIJING:
    - *2010 (2.76 TeV)*: LHC11a10a_bis,
    - *2015 (5.02 TeV)*: LHC20j6a,
    - *2018 (5.02 TeV)*: LHC20e3a.
  - 0--5% centrality, $abs(v_z) < 10$, $abs(eta) < 0.8$.
][
  #figure(image("/images/compf2_generated.gif", width: 100%), numbering: none)
  #v(-1em)
  #h(2em)
  Generated Level (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
]

== fb128 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place(top)[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb128.gif", width: 105%), numbering: none,),
      figure(image("/images/0220/compf2_fb128wcuts.gif", width: 105%), numbering: none,),
    ),
  )
]
#v(12.5em)
- fb128 (right) is the actual closure (with \ cuts in fb128 applied manually).
- Closure for 2010 better than 2015/2018.
#place(bottom+right, dy: 3.5em)[#figure(image("/images/0220/comp_mult_fb128wcuts.gif", width: 45%), numbering: none,),]

== fb128 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb128wcutsPrim.gif", width: 102%), numbering: none,),
      figure(image("/images/0220/compf2_fb128wcutswomat.gif", width: 102%), numbering: none,),
    ),
  )
]
#place(horizon, dy: 3em)[
  #columns-content()[
    - Closure for 2010 better than 2015/2018. 
  ][
    #v(8.4em)
    #figure(image("/images/0220/compf2_fb128wcutswowd.gif", width: 102%), numbering: none,),
  ]]

== fb768 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place()[
  #figure(
    grid(
      columns: (1.3fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb768.gif", width: 102%), numbering: none,),
      figure(image("/images/0220/comp_mult_fb768.gif", width: 110%), numbering: none,),
    ),
  )
]
#v(14.5em)
- fb768 does not show good closure for 2010, 2015/2018.
- the trends for all the datasets are alike.
- stricter cuts can improve the closure.

== fb768 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      rows: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb768.gif", width: 95%), numbering: none,),
      figure(image("/images/0220/compf2_fb768Prim.gif", width: 95%), numbering: none,),
      figure(image("/images/0220/compf2_fb768womat.gif", width: 95%), numbering: none,),
      figure(image("/images/0220/compf2_fb768wowd.gif", width: 95%), numbering: none,),
    ),
  )
]

== TPC clusters cuts
#columns-content()[
  - An additional set of cuts to reduce track spltting/merging effects.
  - \#sharedclusters/\#clusters $<=$ 0.3.
  - \#sharedclusters/\#crossedRows $<=$ 0.25.
  - \#findableclusters/\#clusters $>=$ 0.8.
  #v(9.5em)
  #text(0.6em)[cuts taken from analysis note: #note[#link("https://alice-notes.web.cern.ch/node/1653")[https://alice-notes.web.cern.ch/node/1653].]]
][
  #place()[
    #figure(
      grid(
        columns: 1fr,
        rows: (1fr, 1fr),
        inset: 0pt,
        align: center,
        figure(image("/images/0220/sharedclusters.gif", width: 105%), numbering: none,),
        figure(image("/images/0220/fableclusters.gif", width: 105%), numbering: none,),
      ),
    )
  ]
]

== fb128 (0.2 $<=$ _p_#sub[T] $<=$ 2.0) with TPC clusters cuts
#place()[
  #figure(
    grid(
      columns: (1.2fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb128wcutsi2.gif", width: 102%), numbering: none,),
      figure(image("/images/0220/compf2_fb128wcutsPrimi2.gif", width: 107%), numbering: none,),
    ),
  )
]
#v(14.5em)
- Closure worsens for all the datasets.
