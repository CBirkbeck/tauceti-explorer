# RT-AREA-topology, fix round 2

Job `FIX-RT-AREA-topology~2`, issue #5166. Codex, session `codex-rtOQ9t`,
2026-09-30. Base `ca5d40e1232a69876645fec424a2570d910790de`.
The claim was confirmed against comment 5917127776 by bot reply 5917130513.

This round applies the supplier-side changes for /7 and /11 in the six blueprint
files authorized by the issue, and accounts for all 123 confirmed findings below.
The [original findings](RT-AREA-topology.result.json),
[verification](RT-AREA-topology.review.json) and
[round-one report](RT-AREA-topology.fixes.md) remain the historical record.
No review verdict is changed. Both packets remain `partial`, with their existing
mathematical gaps, source issues and unchecked implementation status.

## Applied: /7, the ideal-tetrahedron volume owner

`Polylogarithms:P.2/hyperbolic-volume` is the sole owner of the ideal-tetrahedron
identity, including its Milnor/Lobachevsky proof step. GeometricTopology layer 7
supplies the ambient curvature -1 hyperbolic geometry, ideal boundary, tetrahedra
and Riemannian volume. QT.5 consumes the identity to obtain the manifold volume
sum from its Bloch invariant. P.1 supplies the Bloch-Wigner function and five-term
identity. K3BlochGroups supplies the algebraic groups and cross-ratios.

The packet's GeometricTopology request previously included Milnor's formula.
It now requests only the geometric substrate. Both affected gap descriptions
keep the formula's missing proof in P.2; the Grassmannian/Borel work does not
transfer that obligation to BorelRegulators. The statement and proof outline
name the sole owner and the direction of consumption.

The reader's `hyperbolic-volume` section now matches the packet, including
`r(infinity,0,1,z)=z`, the sign against V.4's cross-ratio, the three internal
prerequisites and the exact cross-ratio node. It lists the geometric supplier and
removes QT.5 from the inputs and requests. QT.5 is explicitly an export consumer.
The suggested Lean comments record this same contract; no geometric theorem is
invented while its type-level inputs and Milnor proof are missing.

**Import-encoding limitation for the atlas maintainer.** The exact geometric
stage id is preserved in `requests.supplier`, with
`neededBy = ["Polylogarithms:P.2/hyperbolic-volume"]`, and in the reader's
dependency list. Adding that id to the packet node's `prerequisites` currently
fails `scripts/check_blueprint.py`: its `BASE_REF` branch runs before its stage
lookup and misclassifies every `tauceti:TauCetiRoadmap/...` stage as a Lean
declaration. The reproduced error says that the stage is absent from
`baseline.declarations`. It is a roadmap stage, not a declaration, so no false
baseline entry was added. The packet retains the exact structured request and
its existing open status. Maintainer action: resolve known stage ids before
`BASE_REF`, then add
`tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`
to that node's `prerequisites`. This checker is outside this issue's edit list.
The intended stage edge is independently cycle-checked below.

The QT.5 consumer nodes and RS-10 changes described in round one are outside this
round's authorized files. BP-ArithmeticQuantumTopology must cite
`Polylogarithms:P.2/hyperbolic-volume` and
`Polylogarithms:P.1/bloch-wigner-dilogarithm` for the manifold comparison, with
P.1/P.2 as suppliers. The RS-10 maintainer should retain this same owner split.
Milnor's formula remains a mathematical gap, as round one explicitly required.

## Applied: /11, the formal-series/topology boundary

HB.10 records the three source matrices as formal Nahm data and applies HB.9's
module-membership result with its hypotheses. It no longer starts by presenting
the knot-series identification as its own theorem. Its figure-eight Bloch-Wigner
number is labelled approximate and the manifold-volume comparison is assigned
to QT.5. The conditional recipe `I - B^{-1}A` retains the integrality condition;
the source does not guarantee a suitable quad choice for every triangulation.

QT.5 still supplies ideal triangulations and gluing equations. QT.6 owns the full
Neumann-Zagier datum, the Dimofte-Garoufalidis series, their identification with
the formal data, and invariance under changes of triangulation and auxiliary
choices. QT.6 also owns the analytic state-integral problem: contours, Faddeev's
function and the 2-3 move. QT.7 owns quantum modularity. No QT.6 or QT.7
prerequisite is added to HB.10, because HB.10 does not assert those identifications.

Six supplier nodes now record QT.6 in `uses`:

| Supplier node in HabiroNahmSeries | Contract retained at the boundary |
| --- | --- |
| `HB.4/euler-maclaurin-with-remainder` | The stated remainder estimates, when the consumer meets their hypotheses. |
| `HB.4/formal-gaussian-integration` | One algebraic Gaussian operator and its transformation rules, reused in HB.8 and QT.6. |
| `HB.4/radial-asymptotic-expansion` | The corrected positive-definite analytic theorem, including root-order, branch and remainder conditions. |
| `HB.8/fgi-collection` | The formal collection, with non-degeneracy where the chosen solution is used; positivity of the matrix is not required. |
| `HB.8/identification-theorem` | The algebraic identification with the admissible-series expansion, not topological invariance. |
| `HB.9/module-membership` | The specified coefficient ring and excluded-prime/root-order restriction, after the consumer's comparison. |

HB.10's export node names these exact inputs and depends on the supplier nodes.
The reader is synchronized with the packet at both HB.10 interface nodes. Its
stale QT.7, HR.6 and HQ.5/HQ.8 prerequisite entries are removed; those consumers
were already absent from the packet's prerequisites. The reader's QT.5 request
is narrowed to the same geometric input as the packet. Suggested Lean changes
are comments stating the same exports and non-consequences.

The existing figure-eight acceptance check is made concrete: its matrix
`[[1,1],[1,1]]` kills the nonzero vector `(1,-1)`, so it is not positive definite.
HB.4's analytic radial theorem cannot establish this knot example. HB.8's formal
route uses the non-degenerate Hessian at the chosen Nahm solution instead.
No analytic, topological or quantum-modularity theorem is inferred merely from
Habiro-module membership. Existing GZ source corrections are preserved.

## Disposition of /1–/21

The issue assigns the non-supplier work to BP-ArithmeticQuantumTopology and
BP-QSeriesPartitionsAndMockModularForms. Its description says those blueprints
are unwritten; on this base they have partial packets (54 and 536 nodes,
respectively), with no packet review object. They are still outside the seven
authorized deliverables. The handoffs below apply to their continuing blueprint
jobs, not to `content/campaign/` or `data/`.

| Finding | Disposition and exact remaining owner |
| --- | --- |
| /1 | BP-ArithmeticQuantumTopology QT.0 imports framed-link presentations; surgery-calculus extensions go to the appropriate GeometricTopology Part II request. |
| /2 | BP-ArithmeticQuantumTopology QT.3 uses admissible links and Hoste moves, or explicitly chooses the alternative RT route. |
| /3 | BP-ArithmeticQuantumTopology QT.1–QT.3 supply the completed quantum group, bottom-tangle invariant, integral form, pairing and twist machinery. |
| /4 | BP-ArithmeticQuantumTopology QT.4 states the general-Lie-type prerequisites/root-order conditions or narrows its target. |
| /5 | BP-ArithmeticQuantumTopology QT.2 imports the diagram/Jones owner and proves the normalization comparison. |
| /6 | BP-ArithmeticQuantumTopology QT.5 corrects its inputs to P.1/P.2 and the appropriate algebraic/geometry suppliers. |
| /7 | Supplier-side fix applied here; QT.5 and RS-10 handoffs and the checker limitation are recorded above. |
| /8 | BP-ArithmeticQuantumTopology records the cusped-manifold/ideal-triangulation extension request; it does not assume geometric ideal triangulations always exist. |
| /9 | BP-ArithmeticQuantumTopology QT.5 owns the extended Bloch/Rogers/Chern-Simons comparison, separate from the earlier real-volume statement. |
| /10 | BP-ArithmeticQuantumTopology QT.6 supplies the NZ/DG/topological bridge before applying HB.9 membership; retains the quad/integrality hypotheses. |
| /11 | Supplier-side fix applied here; BP-ArithmeticQuantumTopology QT.6 must import the six exact nodes listed above. |
| /12 | BP-ArithmeticQuantumTopology QT.2/QT.7 define Kashaev invariants and distinguish the precise volume conjecture from sourced proved cases. |
| /13 | BP-QSeriesPartitionsAndMockModularForms QM.5 owns generic quantum modular forms and the shared examples; QT.7 imports them for knot statements. |
| /14 | BP-ArithmeticQuantumTopology QT.6 owns Faddeev/state-integral analysis and requests the shared formal pentagon from the q-toolkit owner. |
| /15 | BP-ArithmeticQuantumTopology QT.7 gives resurgence definitions and sources or explicitly excludes that target. |
| /16 | BP-ArithmeticQuantumTopology carries the coloured-Jones/relative-Habiro follow-up, importing HR.1 and the Alexander supplier. |
| /17 | BP-ArithmeticQuantumTopology records q-holonomicity and the A-polynomial target or its explicit boundary. |
| /18 | BP-ArithmeticQuantumTopology records the rational-homology-sphere extension or a sourced non-goal. |
| /19 | BP-ArithmeticQuantumTopology updates its source spine with exact versions/locators; this supplier fix does not claim those papers were freshly read. |
| /20 | Atlas maintainer regenerates the extract after acceptance of the QT.0 prerequisites. No generated extract is edited here. |
| /21 | BP-ArithmeticQuantumTopology corrects QT.6's unused inputs and imports HB.4/HB.8; the supplier export contracts are applied here. |

## Upstream notices, /22–/123

Current WORKERS.md prohibits planning, fixing or reviewing Tau Ceti's own
roadmaps or links between two of them. The following `upstreamNotes` preserve
the historical findings for the maintainer. They do not re-audit the upstream
mathematics or apply round one's proposed upstream edits. The original finding
and same-numbered section of the round-one report contain the exact requested
changes and qualifications. Mixed findings that mention other consumer
blueprints also stay outside this issue's authorized deliverables.

```json
{
  "upstreamNotes": [
    {"roadmaps": ["tauceti:TauCetiRoadmap/AlgebraicTopology"], "note": "Retain RT-AREA-topology/22–/40 for the upstream maintainer; individual topics are indexed below. /40 also needs coordination of the named extension proposals."},
    {"roadmaps": ["tauceti:TauCetiRoadmap/CombinatorialHeegaardFloer"], "note": "Retain RT-AREA-topology/41–/65 for the upstream maintainer, including its interfaces with GeometricTopology and the analytic Floer roadmap."},
    {"roadmaps": ["tauceti:TauCetiRoadmap/GeometricTopology"], "note": "Retain RT-AREA-topology/66–/95 for the upstream maintainer. The only import used in this round is the ambient geometry request from layer 7 to Polylogarithms P.2; no upstream stage or upstream-to-upstream edge is changed."},
    {"roadmaps": ["tauceti:TauCetiRoadmap/HeegaardFloer"], "note": "Retain RT-AREA-topology/96–/117 for the upstream maintainer, including proposed extensions and analytic hypotheses. No atlas-side replacement plan is made here."},
    {"roadmaps": ["tauceti:TauCetiRoadmap/UniversalCovers"], "note": "Retain RT-AREA-topology/118–/123 for the upstream maintainer. The Belyi successor and LieGroups consumer-side changes in /120–/123 remain with their own jobs; their files are outside this round."}
  ]
}
```

Each row below has disposition **retained maintainer notice; no edit authorized
in this round**. The topics identify the historical findings, not a new verdict.

| Finding | Historical topic |
| --- | --- |
| /22 | Compact supports, noncompact duality and proper pushforward |
| /23 | Relative homotopy of arbitrary based pairs |
| /24 | Filtered-complex spectral sequences and convergence |
| /25 | Multiple-basepoint van Kampen |
| /26 | CW approximation and degree-one Hurewicz |
| /27 | Model CW complexes and Hopf fibration |
| /28 | Ordinary characteristic classes |
| /29 | AlgebraicTopology dependency records |
| /30 | Existing relative singular homology |
| /31 | Disk/sphere calculation ordering |
| /32 | Finite-cover Euler characteristic proof |
| /33 | Absolute versus relative homotopy ownership |
| /34 | Existing groupoid-generation results |
| /35 | Euler-characteristic duplicate targets |
| /36 | Fibre-bundle/Serre-fibration hypotheses |
| /37 | Hatcher source locators |
| /38 | CW-type hypothesis on homology spheres |
| /39 | Deck and monodromy imports |
| /40 | Names and boundaries of topology extensions |
| /41 | Link Alexander grading and stabilization exponent |
| /42 | Componentwise variable actions |
| /43 | Grid invariance and tau proof ordering |
| /44 | Unknotting number and crossing changes |
| /45 | Smooth cobordism versus topological slice genus |
| /46 | Seifert genus and grid surfaces |
| /47 | Alternating-link signature inputs |
| /48 | Multivariable Alexander polynomial |
| /49 | Grid polytope versus Thurston norm |
| /50 | Legendrian/contact prerequisites |
| /51 | Bigraded duality and universal coefficients |
| /52 | Torus-knot chirality conventions |
| /53 | Graded modules over graded coefficient rings |
| /54 | Filtered-chain-complex ownership |
| /55 | Nice diagrams and prime-decomposition inputs |
| /56 | Combinatorial/holomorphic reconciliation |
| /57 | Stable-invariant acceptance examples |
| /58 | Negative-definite plumbing moves |
| /59 | Rasmussen s versus tau |
| /60 | Connected sums and tau additivity |
| /61 | Grid/diagram correspondence ownership |
| /62 | Grid source locators |
| /63 | Filtered grid complex and Upsilon |
| /64 | Grid dependency records |
| /65 | Grid pinned-library coverage |
| /66 | Thurston Euler-class conjecture direction |
| /67 | PL local-flatness hypotheses |
| /68 | Geometrization scope and sources |
| /69 | JSJ minimality |
| /70 | Homology-concordance target |
| /71 | Triangulation/CW supply |
| /72 | Shake genus and Rasmussen s |
| /73 | Kirby problem numbers |
| /74 | Generalized Property R status |
| /75 | Fake-manifold smoothability target |
| /76 | Cosmetic-surgery statements |
| /77 | Concordance target ordering |
| /78 | Seifert surfaces and matrix invariants |
| /79 | Concordance/tau dependency cycle |
| /80 | Concordance boundary convention |
| /81 | Balls, corners and gluing inputs |
| /82 | Isotopy extension and cutting |
| /83 | Separation, Schoenflies and annuli |
| /84 | Three-manifold basic predicates |
| /85 | Hyperbolic model normalization |
| /86 | Weeks manifold target |
| /87 | Surface and Heegaard-splitting suppliers |
| /88 | Foliation cohomology and differential geometry |
| /89 | Zeeman conjecture triangulation choice |
| /90 | GeometricTopology pinned coverage |
| /91 | GeometricTopology dependency records |
| /92 | Mutation attribution |
| /93 | Rank/genus attribution |
| /94 | Existing manifold-library imports |
| /95 | Smale inclusion and model |
| /96 | Handleslide invariance proof route |
| /97 | Polygon and neck-stretching compactness |
| /98 | Completed Floer/lattice comparison |
| /99 | Multi-pointed Floer theory |
| /100 | Pointed Heegaard diagrams and Cerf theory |
| /101 | Manifold orientation and degree supplier |
| /102 | Cauchy-Riemann estimate hypotheses |
| /103 | Differential forms and Stokes supplier |
| /104 | Spin-c and obstruction-theory inputs |
| /105 | Four-dimensional cobordism inputs |
| /106 | Symmetric-product topology |
| /107 | Holomorphic polygon counts |
| /108 | Maslov-index proof route |
| /109 | Combinatorial domain ownership |
| /110 | Floer compactness at infinity |
| /111 | Naturality and integral signs |
| /112 | Completed Floer flavors |
| /113 | Nonvacuous holomorphic-count tests |
| /114 | Floer pinned-library coverage |
| /115 | Reconciliation milestone records |
| /116 | Floer dependency records |
| /117 | Ozsvath-Szabo source locators |
| /118 | Completed universal-cover roadmap |
| /119 | Mathlib deck group migration |
| /120 | Finite-cover Galois theory and Belyi import |
| /121 | Universal-cover import in LieGroups |
| /122 | Universal-cover dependency records |
| /123 | LocallyPathConnectedSpace name |

## Evidence read in this round

All reads below were on 2026-09-30, from public sources. They check the changed
interfaces; they are not a fresh extraction of all source papers.

- [Goncharov, arXiv math/0207036v3](https://arxiv.org/abs/math/0207036v3):
  abstract and version metadata rechecked. The abstract identifies the weight-two
  ideal-tetrahedron formula. Section 7 was not read and its proof gap stays open.
- [GSWZ, arXiv 2412.04241v2](https://arxiv.org/pdf/2412.04241v2):
  PDF/printed pp. 14–17 (Theorems 3–5, Section 1.8 and the Section 1.9 boundary),
  p. 48 (Remark 4.2, equation 233). Theorem 5's non-degeneracy and restriction to
  root orders prime to Delta are retained. Section 1.8's unimodular-B comparison
  is a sufficient geometric route; Remark 4.2's integral-B-inverse-A recipe is
  conditional. SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`.
- [Garoufalidis–Zagier, arXiv 1812.07690v1](https://arxiv.org/pdf/1812.07690v1):
  pp. 2, 4–5 (positive-definite analytic Nahm data, formal Gaussian operator,
  Theorem 3.1 and its root-order restrictions). This fix preserves, rather than
  re-adjudicates, the packet's recorded corrections to the printed formula.
  SHA-256 `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66`.
- Reviewed audit entries in `data/library-coverage.json`: Polylogarithms P.2
  and HabiroNahmSeries HB.4, HB.8, HB.10. Their duplicate notices motivate these
  supplier contracts; no target is upgraded to built.
- Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. At the latter, read
  `TauCeti/Probability/Distributions/Gaussian/Density.lean` definitions around
  line 70 and `multivariateGaussian_eq_withDensity` at line 166: these provide
  the density/positive-definite measure theorem, not the formal knot-series
  comparison. Searches for ideal tetrahedra, Bloch-Wigner and formal Gaussian
  integration found no matching target declarations. The `hyperbolicVolume`
  hits in Clifford algebra concern an algebra element, not hyperbolic volume.
  Existing baseline declarations are unchanged; no new declaration claim is made.

## Validation

- `python3 scripts/check_blueprint.py` on each packet: final run has zero errors;
  Polylogarithms retains four reserved-node warnings, HabiroNahmSeries has none.
  The installed declaration index is absent, so checker baseline validation is
  syntactic. The scoped library inspection above is separate evidence.
- `python3 research/blueprint/intake.py check-files` on all seven deliverables;
  `git diff --check`.
- Structural guard: all 75 Polylogarithms and 109 HabiroNahmSeries node ids,
  library baselines, source issues/versions, coverage, existing review records,
  implementation statuses and gap counts are preserved. Only one Polylogarithms
  node and eight HabiroNahmSeries nodes change. No new mathematical node is added.
- Both Lean files have identical non-comment lines before and after this fix.
  They were not compiled: the shared Mathlib checkout is at `30a58f7`, not the
  required pin, and no matching pre-existing build was available. No Lake/cache
  bootstrap or language server was started.
- The figure-eight matrix check gives `A*(1,-1)=(0,0)` exactly. No numerical
  experiment is used as a proof of its knot interpretation.
- `scripts.build.assemble(require_distances=False)` at the base produces 2840
  stages and 8258 edges. Adding the seven imports below sequentially creates no
  reverse path, so they are jointly acyclic. This is a prospective graph check;
  it does not claim that the five missing atlas edges were written.

| Supplier | Consumer | Base status |
| --- | --- | --- |
| GeometricTopology layer 7 | Polylogarithms P.2 | prospective; exact request retained, checker limitation above |
| Polylogarithms P.1 | ArithmeticQuantumTopology QT.5 | prospective; consumer blueprint handoff |
| Polylogarithms P.2 | ArithmeticQuantumTopology QT.5 | prospective; consumer blueprint handoff |
| HabiroNahmSeries HB.4 | ArithmeticQuantumTopology QT.6 | prospective; consumer blueprint handoff |
| HabiroNahmSeries HB.8 | ArithmeticQuantumTopology QT.6 | prospective; consumer blueprint handoff |
| HabiroNahmSeries HB.9 | ArithmeticQuantumTopology QT.6 | already present |
| ArithmeticQuantumTopology QT.5 | HabiroNahmSeries HB.10 | already present |

No reverse QT.6/QT.7 input is present in the Habiro packet. No proposed edge in
this scoped check joins two Tau Ceti roadmaps. The atlas, campaign text, upstream
snapshots, audit data and other jobs' packets are unchanged.
