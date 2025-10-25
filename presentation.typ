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

== fb128
#columns-content()[
  #figure(image("/images/0220/compf2_fb128.gif", width: 100%), numbering: none)
][
  #figure(image("/images/0220/compf2_fb128wcuts.gif", width: 100%), numbering: none)
]
