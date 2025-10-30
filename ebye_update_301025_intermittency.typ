#import "slydst.typ": *
#import emoji: *

#show: slides.with(
  title: "Intermittency analysis update (2.76 TeV, 5.02 TeV)", // Required
  subtitle: "PAG-EbyE",
  date: datetime.today().display(),
  authors: "Salman Khurshid Malik, Ramni Gupta, Mesut Arslandok",
  layout: "medium",
  ratio: 4 / 3,
  title-color: none,
  institute: "Department of Physics, University of Jammu",
)

#show raw: set block(fill: silver.lighten(65%), width: 100%, inset: 1em)

== Recap (Intermittency analysis)
  #figure(
    grid(
    columns: (2.5fr,2fr),
    inset: -0pt,
    align: center,
    align(left)[
        - Performed in ($eta,phi$) phase space of $M times M$ bins.  #text(weight:"medium", blue.darken(50%), link("https://journals.aps.org/prc/abstract/10.1103/PhysRevC.85.044914","Hwa and Yang, 2012"))
          - by measuring NFM of multiplicity distributions.
        - #note[*NFM*:] for an $e^"th"$ event $F_q (M) = (angle.l f_q^e (M) angle.r) / (angle.l f_1^e (M) angle.r^q)$

$F_q (M) equiv  (lr(angle.l, size: #200%) 1/M^(2) sum_(i=1)^(M^(2)) n_"ie" (n_"ie"-1)dots(n_"ie"-q+1) lr(angle.r, size: #200%)) / (lr(angle.l, size: #200%) 1/M^(2) sum_(i=1)^(M^(2)) n_"ie" lr(angle.r, size: #200%)^q)$\
  $n_"ie"$: number of particles in an $e^"th"$ event for \ an $i^"th"$ bin. \ $<>$ is average over number \ of events.
  ],
  place(right)[
      #figure(
      image("/images/phasespace.png", width: 102%),
      numbering: none,
    )
  ]
))
  - In case of scale invariant systems (typical for system near PT, CP). \
    → NFM will follow a power law. #note[*M-scaling*: $F_q (M) prop (M^2)^(phi.alt_q)$], $phi.alt_q$ is called the intermittency index.
== Recap (previous presentation)
#place(center, dy: 0em)[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: -4pt,
      align: center,
      figure(image("/images/compf2_276_fb128_10k.png", width: 100%), numbering: none),
      figure(image("/images/compf2_502_fb128_10k.png", width: 100%), numbering: none),
    ),
  )
]
#v(14.5em)
- Shifted to fb128 because of track splitting/merging effects.
- Trends different for 2.76 TeV and 5.02 TeV.

= Filterbits QA

== Dataset
- Comparison of filterbit QA results.
- HIJING three datasets: *2010 (2.76 TeV)*: LHC11a10a_bis, *2015 (5.02 TeV)*: LHC20j6a, *2018 (5.02 TeV)*: LHC20e3a.
#columns-content()[
  - $~$5000 events for each dataset.
  - Centrality: 0--10%.
  - $abs(v_z) < 10$, $abs(eta) < 0.8$, 0 < $phi$ < 2$pi$.
  - Trigger bit: kMB (2010), kINT7 (2015/2018).
  - Centrality estimation: V0M.
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
    - *2010 (2.76 TeV)*: LHC11a10a_bis ($~$ 3M events),
    - *2015 (5.02 TeV)*: LHC20j6a ($~$3.5M),
    - *2018 (5.02 TeV)*: LHC20e3a ($~$3.2M).
  - 0--5% centrality, $abs(v_z) < 10$, $abs(eta) < 0.8$, 0 < $phi$ < 2$pi$.
  - Trigger bit: kMB (2010), kINT7 (2015/2018).
  - Centrality estimation: V0M.
][
  #figure(image("/images/compf2_generated.gif", width: 100%), numbering: none)
  #v(-1em)
  #h(2em)
  Generated Level (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
]
 - HIJING Pileup rejection: #note[#link("https://twiki.cern.ch/twiki/bin/view/ALICE/AliDPGtoolsPileup")[https://twiki.cern.ch/twiki/bin/view/ALICE/AliDPGtoolsPileup].]

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

== fb768 (0.2 $<=$ _p_#sub[T] $<=$ 2.0) with TPC clusters cuts
#place()[
  #figure(
    grid(
      columns: (1.2fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0220/compf2_fb768i2.gif", width: 102%), numbering: none,),
      figure(image("/images/0220/compf2_fb768Primi2.gif", width: 107%), numbering: none,),
    ),
  )
]
#v(13.1em)
- Closure improves for all the datasets.
- Similar trend across datasets.
- 0.2 $<=$ _p_#sub[T] $<=$ 0.4 has different efficiency for 2.76 TeV and 5.02 TeV.
  - note that $F_" q" (M)$ are  robust againts detector efficiencies (widely studied: #note[#link("https://alice-notes.web.cern.ch/node/996")[https://alice-notes.web.cern.ch/node/996].]
- Should check 0.4 $<=$ _p_#sub[T] $<=$ 2.0.

== Generated and fb128 (0.4 $<=$ _p_#sub[T] $<=$ 2.0)
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_generated.png", width: 102%), numbering: none,),
      figure(image("/images/0420/compf2_fb128wcuts.png", width: 102%), numbering: none,),
    ),
  )
]
#place(horizon, dy: 3em)[
  #columns-content()[
    - Closure for 2010 better than 2015/2018.
  ][
    #v(8.4em)
    #figure(image("/images/0420/comp_mult_fb128wcuts.png", width: 92%), numbering: none,),
  ]]

== Generated and fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0)
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_generated.png", width: 102%), numbering: none,),
      figure(image("/images/0420/compf2_fb768.png", width: 102%), numbering: none,),
    ),
  )
]
#place(horizon, dy: 3em)[
  #columns-content()[
    - Closure not good for all datasets.
  ][
    #v(8.4em)
    #figure(image("/images/0420/comp_mult_fb768.png", width: 92%), numbering: none,),
  ]]

== fb128 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) with TPC clusters cuts
#place()[
  #figure(
    grid(
      columns: (1.2fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_fb128wcutsi2.png", width: 102%), numbering: none,),
      figure(image("/images/0420/compf2_fb128wcutsPrimi2.png", width: 107%), numbering: none,),
    ),
  )
]
#v(14.5em)
- Closure deteriorates for all the datasets.

== fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) with TPC clusters cuts
#place()[
  #figure(
    grid(
      columns: (1.2fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_fb768i2.png", width: 102%), numbering: none,),
      figure(image("/images/0420/compf2_fb768Primi2.png", width: 107%), numbering: none,),
    ),
  )
]
#v(14.5em)
- Closure improves with TPC clusters cuts for fb768

== _p_#sub[T] dependent DCA cuts
#columns-content()[
  - An additional set of cuts to improve the closure.
  - 2015/2018 data: Maximum DCA#sub[xy] cut: $0.028 + 0.04 * p_T^((1.01))$
  #text(0.6em)[cut taken from analysis note: #note[#link("https://alice-notes.web.cern.ch/node/1653")[https://alice-notes.web.cern.ch/node/1653].]]
  - 2010 data: Maximum DCA#sub[xy] cut: $0.0182 + 0.035 / p_T^((1.01))$
  #text(0.6em)[cut taken from analysis note: #note[#link("https://alice-notes.web.cern.ch/node/736")[https://alice-notes.web.cern.ch/node/736].]]
][
  #place()[
    #figure(
      grid(
        columns: 1fr,
        rows: (1fr, 1fr),
        inset: 0pt,
        align: center,
        figure(image("/images/dcaxywocut2010.gif", width: 105%), numbering: none,),
        figure(image("/images/dcaxycut2010.gif", width: 105%), numbering: none,),
      ),
    )
  ]
]

== fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) with multiple cuts
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_fb768dca.png", width: 102%), numbering: none, caption: "fb768 with DCA cut"),
      figure(image("/images/0420/compf2_fb768rchi2dca.png", width: 102%), numbering: none, caption: "fb768 wih DCA cut and tpc #crossed rows >= 80"),
    ),
  )
]

== fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) with multiple cuts
#place()[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_fb768shclsdca.png", width: 102%), numbering: none, caption: "fb768 with DCA cut and sharedclusters cuts"),
      figure(image("/images/0420/compf2_fb768shclsrchi2.png", width: 102%), numbering: none, caption: "fb768 with DCA cut and shared clusters cuts and tpc #crossed rows >= 80"),
    ),
  )
]


== fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) with multiple cuts (primaries only)
#place(center, dy: 2em)[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: 0pt,
      align: center,
      figure(image("/images/0420/compf2_fb768rchi2dcaPrim.png", width: 102%), numbering: none, caption: "fb768 with DCA cut and tpc #crossed rows >= 80"),
      figure(image("/images/0420/compf2_fb768shclsrchi2dcaPrim.png", width: 102%), numbering: none, caption: "fb768 wih DCA cut, shared clusters cuts and tpc #crossed rows >= 80"),
    ),
  )
]
#v(17.1em)
- Best closure for fb768 with DCA cut, shared clusters cuts and tpc \#crossed rows >= 80.
- Similar trends for 2.76 TeV and 5.02 TeV, all the datasets.
/* == Final fb128 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place(center, dy: 0em)[
  #figure(
    grid(
      columns: (1fr, 1fr),
      inset: -4pt,
      align: center,
      figure(image("/images/comp_allcuts_128.png", width: 100%), numbering: none),
      figure(image("/images/comp_allcuts_128_1.png", width: 100%), numbering: none),
    ),
  )
]
#place(left, dy: 11em)[
  #figure(image("/images/comp_allcuts_128_leg.png", width: 37%), numbering: none)
] */


== Final fb128 (0.4 $<=$ _p_#sub[T] $<=$ 2.0)
#place(center, dy: 0em)[
  #figure(
    grid(
      columns: (2.1fr, 1fr),
      inset: -9pt,
      align: center,
      figure(image("/images/comp_allcuts_128_1.png", width: 100%), numbering: none),
      v(2em) + figure(image("/images/comp_allcuts_128_leg.png", width: 87%), numbering: none),
    ),
  )
]
/* #place(left, dy: 16em)[#figure(image("/images/comp_allcuts_128_1_1.png", width: 30%), numbering: none)] */
#place(left, dy: 14em)[#figure(image("/images/comp_allcuts_128_1_2.png", width: 40%), numbering: none)]

== Final fb768 (0.4 $<=$ _p_#sub[T] $<=$ 2.0) #checkmark.box
#place(center, dy: 0.18em)[
  #figure(
    grid(
      columns: (2.1fr, 1fr),
      inset: -9pt,
      align: center,
      figure(image("/images/comp_allcuts_768_1.png", width: 100%), numbering: none),
      v(2em) + figure(image("/images/comp_allcuts_768_leg.png", width: 87%), numbering: none),
    ),
  )
]
/* #place(left, dy: 16em)[#figure(image("/images/comp_allcuts_768_1_1.png", width: 30%), numbering: none)] */
#place(left, dy: 14em)[#figure(image("/images/comp_allcuts_768_1_2.png", width: 38%), numbering: none)]


= Conclusions
== Conclusions
- filterbits (128 and 768) studied for Pb--Pb HIJING datasets of 2010 (2.76 TeV), 2015 (5.02 TeV) and 2018 (5.02 TeV):
  - QA within $abs(v_z) < 10$, $abs(eta) < 0.8$, 0--10% central events of each dataset.
  - closure behaviour of $F_" q" (M)$ within $abs(v_z) < 10$, $abs(eta) < 0.8$, _p_#sub[T] ranges: 0.2--2.0 and 0.4--2.0, and most central 0--5% events.
- fb128 method unreliable in AODs. Cuts when applied manually work.
  - but higher contamination (material + weak decays) is observed compared to fb768 across datasets.
  - Good baseline closure behaviour for 2010 but trends of $F_" q" (M)$ completely different for 2.76 TeV and 5.02 TeV.
- fb768 cleaner but has poorer closure baseline.
- Cuts to improve the closure:
  - TPC shared cluster cuts used to mitigate track splitting/merging effects: \#sharedclusters/\#clusters $<=$ 0.3, \#sharedclusters/\#crossedRows $<=$ 0.25, and \#findableclusters/\#clusters $>=$ 0.8.
    - fb768 closure improves consistently with TPC clusters cuts, worsens for fb128.
  - _p_#sub[T] dependent DCA#sub[xy] cuts used:
    - Combined with \#crossedRows $>= 80$ and shared-clusters cuts. #sym.arrow.r #note[best performance for fb768.]

#place(left, dy: 3em)[
      #figure(image("/images/0420/compf2_fb768shclsrchi2.png", width: 42%), numbering: none, caption: ""),
]


= Thank you

= Backup
== Final fb128 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place(center, dy: 0em)[
  #figure(
    grid(
      columns: (2.1fr, 1fr),
      inset: -9pt,
      align: center,
      figure(image("/images/comp_allcuts_128.png", width: 100%), numbering: none),
      v(2em) + figure(image("/images/comp_allcuts_128_leg.png", width: 87%), numbering: none),
    ),
  )
]
/* #place(left, dy: 16em)[#figure(image("/images/comp_allcuts_128_11.png", width: 30%), numbering: none)]
#place(center, dy: 16em)[#figure(image("/images/comp_allcuts_128_12.png", width: 30%), numbering: none)] */


== Final fb768 (0.2 $<=$ _p_#sub[T] $<=$ 2.0)
#place(center, dy: 0em)[
  #figure(
    grid(
      columns: (2.1fr, 1fr),
      inset: -9pt,
      align: center,
      figure(image("/images/comp_allcuts_768.png", width: 100%), numbering: none),
      v(2em) + figure(image("/images/comp_allcuts_768_leg.png", width: 87%), numbering: none),
    ),
  )
]
/* #place(left, dy: 16em)[#figure(image("/images/comp_allcuts_768_11.png", width: 30%), numbering: none)]
#place(center, dy: 16em)[#figure(image("/images/comp_allcuts_768_12.png", width: 30%), numbering: none)] */