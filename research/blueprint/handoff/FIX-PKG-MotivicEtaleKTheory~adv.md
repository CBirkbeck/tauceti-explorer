# FIX-PKG-MotivicEtaleKTheory~adv — supplier-contract checkpoint

Issue #11239. Agent: Codex, session codex-RwuuYS. The claim bot confirmed
the claim on 2026-10-19. This is a **blocked checkpoint**, not a completed
repair or an accepted package. No second issue was claimed.

## Finding → change → remaining work

| Finding | Change in this checkpoint | Disposition |
| --- | --- | --- |
| R1: the all-length algebraic Pfister/pure-symbol comparison is absent, and importing the cohomological Q2.3 criterion would be circular | Named the four required quadratic exports, specified elementary chains including length one, checked an independent algebraic proof in Elman–Karpenko–Merkurjev, and factored §6.4 through an explicit neighbor-isotropy/hyperbolicity comparison. Added square-class, real/complex and strict half-dimension controls. | Consumer contract and proof route repaired. The export must still be added to the owning quadratic successor, outside this job's deliverables. |
| R2: geometric logarithmic Deligne theory is absent from the claimed Hodge supplier | Removed the false Layer 12 dependency attribution to HodgeStructuresPartII. Specified the actual filtered Betti/log de Rham fibre, its differential, period inclusion, real model, compactification/pullback comparisons, products, conjugation and support semipurity. Added point, affine-line, support and integral-invariants controls. | Consumer attribution repaired and missing geometric extension specified. A supplier roadmap still has to own and export this theory. The nonproper regulator roof remains intact. |
| R3: no assigned upstream order/bundle for the arithmetic K-theory family | Rechecked the order file and current upstream PR heads; corrected obsolete StableHomotopyKTheory section numbers and identified exact SchemeKTheoryOperations and GeneralAlgebraicKTheory imports. Recorded the remaining ordering constraints below. | Still blocked on a maintainer assignment. An internal layer order and open supplier PRs do not certify the required lower-tier/same-bundle condition. |

`review.json` therefore remains `needs_changes`, with reviewer
`fix-FIX-PKG-MotivicEtaleKTheory~adv`. The mathematical gaps have not been
closed by relabelling requests, duplicating supplier theory here, or
weakening the roadmap's scope.

Submit this checkpoint as a draft PR for the maintainer. The fix-job
completeness check in `issues.py` currently accepts the existence of all
deliverables without inspecting this `needs_changes` verdict. A ready PR
could therefore be recorded as a completed repair despite R1–R3. The draft
keeps the routing requests available for review without that false completion.

## Why this run is blocked

The issue permits changes only to the consumer README, Suggested.lean,
review.json and this handoff. R1 needs an existing supplier's packet changed;
R2 needs a geometric extension assigned; R3 needs an upstream routing decision.
Those are not additional authorized deliverables. WORKERS.md, “Upstream tiers”,
requires lower-tier or same-bundle imports; PROTOCOL.md §15 assigns each theory
one owner. Moving quadratic-form or geometric Hodge foundations into the
consumer without an ownership decision would not resolve these findings.

The following are concrete requests for the maintainer to route. They are not
new stage identifiers or claims that another roadmap already exports them.

### Quadratic supplier request

Extend QuadraticFormInvariantsPartII Q2.2, after its
`arason-pfister` target and before the cohomological invariant in Q2.3, with
the algebraic comparison specified in the README's exact supplier contracts:

- For every field of characteristic different from two and every n≥1,
  finite elementary chains, Pfister isometry and equality of the associated
  pure Milnor symbols modulo two agree. Include the hyperbolic/zero-symbol
  criterion and every-field-extension naturality.
- Use the native `TauCeti.pfisterForm`, `pfisterFormClass` and `pfisterClass`
  convention 〈1,−a〉; use K2SymbolsBrauer's algebraic Milnor presentation.
  Do not use its later Tate comparison or MotivicEtaleKTheory norm residue.
- The required names are `pfisterChain_iff_isometry`,
  `pfisterSymbol_iff_isometry`, `pfisterSymbol_zero_iff_hyperbolic` and
  `pfisterSymbol_baseChange`. The two-slot identities, pure-subform/common-slot
  induction and Arason–Pfister bound give the proof route.
- Source: Elman–Lam, Theorem 2 and Corollary 1, p.972, proof outline
  pp.972–973; Elman–Karpenko–Merkurjev, Definition 6.9, Theorem 6.10,
  Proposition 6.15, Theorems 6.18,6.20, pp.33–36. The latter was read in the
  author-hosted text linked in the package's References.

The successor presently contains the roundness, hyperbolicity, subform and
dimension inputs, but no all-length pure-symbol comparison. Q2.3 is not an
independent replacement. After the supplier edit, point §6.4 at its new target.

### Geometric Hodge extension request

Assign the logarithmic Deligne–Beilinson foundation to a geometric extension
of HodgeStructures, with ComplexComparisonPartII C5.3,C5.5–C5.7 as the
Betti/log de Rham inputs. HodgeStructuresPartII currently owns connections,
variations and their logarithmic extensions; these do not construct the
Deligne complex. No new roadmap name or layer number has been assigned here.

The README now gives the coefficient-dependent fibre signature and exact
interfaces `logDeligneComplex`, `logDeligne_betti`, `logDeligne_hodge`,
`logDeligne_realModel`, `logDeligne_pullback`,
`logDeligne_compactificationComparison`, `logDeligne_A1`,
`logDeligne_product`, `logDeligne_conjugation`, `logDeligneSupport`, its
enlargement/excision/localization/product maps, and
`logDeligneSupport_semipurity`. The supplier must construct these before the
consumer's `supportProjection_quasiIso` and
`deligneConstantInclusion_quasiIso`; neither quasi-isomorphism is an axiom
about an arbitrary regulator map. Preserve integral coefficients in the
foundation and real coefficients in the support roof. Preserve all smooth
quasiprojective varieties, not just proper ones.

Sources read: Burgos, *The Regulators of Beilinson and Borel*, (10.2)–(10.5),
pp.89–90, and the real model and point calculations pp.91–92; Burgos,
*A C∞ logarithmic Dolbeault complex*, Theorem 1.1, p.63, Theorem 2.1 and
Corollary 2.2, p.67; Burgos–Feliu v1, §§1.8–1.10, Definition 1.28,
(1.30), Proposition 1.31, pp.10–12, and Proposition 2.8, pp.15–16.
The source texts were read, not copied into the repository.

### Upstream routing request

Assign MotivicEtaleKTheory and its arithmetic K-theory suppliers an order or
bundle, then recheck each imported layer against that assignment. The current
Caraiani–Newton order is a subset order and does not make these assignments.
In particular, preserve these directed interfaces:

| Earlier construction | Later consumer |
| --- | --- |
| K2SymbolsBrauer's algebraic Milnor presentation, norms and residues | The present Tate comparison and norm residue; K2SymbolsBrauer's later comparison adapters consume these conclusions |
| KTheoryFiniteLocalFields' independent henselian rigidity | The later motivic/étale local-field applications |
| The present effective transfer/motive construction | MotivesAndAlgebraicCycles' geometric stabilization; its presentation comparison is used only afterwards |
| The present early higher Chern and Deligne regulators | Borel, syntomic and Selmer comparison adapters, whose later outputs are consumed only with their hypotheses |
| The quadratic algebraic comparison and geometric Deligne foundation requested above | §§6.4 and 12.2 respectively |

No placement in this table is a maintainer-approved global tier or bundle.
An assignment must account for these early/late splits rather than treating
the roadmap-level citation graph as an already acyclic graph.

## Current supplier and library evidence

The read-only current roadmap checkout was at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current Pfister Basic, Hyperbolic
and Round modules were inspected: all-length carriers and low-length theorems
are present, but not the required all-length Milnor comparison. Hodge's Tate
and mixed-structure modules supply linear objects, not geometric Deligne
cohomology. No current implementation was reconstructed in this patch.

| Upstream supplier | Head inspected on 2026-10-19 | Imported contract |
| --- | --- | --- |
| [GeneralAlgebraicKTheory #1212](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1212) | `e25a1fe493e4aafe1dcd177fe8c6a7981c4f8901` | §§1.5,3.12,7.4–7.8,11.15–11.16 and 13.8a–13.8c; the last includes the Brauer-lift proof inputs |
| [StableHomotopyKTheory #1227](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1227) | `9cfa5854c4fb8f0499149bd3c940d455522390e2` | §§7.21–7.26 for filtrations, exact couples, pages and convergence; §§7.1–7.8,7.28–7.31 for coefficients/products with restrictions |
| [SchemeKTheoryOperations #1229](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1229) | `31db101431b84ef953418e7d50dcd39cb75fea32` | §§2.6,3.1–3.6, Layer 5 and §§6.2,6.8–6.9 for Cartan, support/localization, projective bundles and operations |
| [TopologicalKTheory #894](https://github.com/TauCetiProject/TauCetiRoadmap/pull/894) | `f2c908debdefa440e7dfda339a54cb3b74cdc51c` | T4 and T7; spectrum realization remains GeneralizedCohomology G5.4 |

All four PRs were open at the final status check. Open PRs are consumed as
existing roadmap plans; their open status alone does not settle R3. The old
StableHomotopyKTheory ranges 7.24–7.34 and 7.24–7.29 did not identify the
actual exact-couple export and have been corrected.

## Adversarial pass on every touched statement

| Statement/interface | Instances and wrong variant tested | Result/change |
| --- | --- | --- |
| Scheme support, Cartan and operations imports | Empty/full support; regular versus singular; missing ample family; degree-zero versus higher operations | Exact supplier sections and their hypotheses retained; no broader operations theorem inferred. |
| Spectral and Moore imports | Zero filtration; nonzero constant filtration with zero graded pages; modulus two and exceptional small Moore moduli | Separate convergence and product restrictions retained; section references corrected. |
| Finite-field import | F₂: K₁=0, K₃=Z/3, K₄=0 | Imported Brauer-lift construction as well as output groups; no replacement by a guessed graded carrier. |
| Algebraic Pfister chain and pure-symbol comparison | n=0,1,2; square slot; R→C; characteristic two | n≥1 and char≠2 explicit; length one uses square classes; zero symbol and anisotropy may change under extension. No use of norm residue. |
| Neighbor embedding/isotropy comparison in §6.4 | n=1 finite scheme; n=2 ranks three/four; tuples (−1,−1) and (1,−1) over R, then C | The prefix represents one, giving the embedding. Strictly more than half the hyperbolic dimension is essential; a positive real rank-two subform is a counterexample at equality. |
| Deligne fibre, filtration and periods | Λ=Z,Q,R; p=0,1,2; complex point; zero filtered term | Point H⁰/H¹ computed; weight zero retains Λ. The filtered complex precedes RΓ; period inclusion is retained. |
| Cone differential and comparison homotopy | Identity of R --1→ R; change only −dω to +dω | Correct square gives 1−1=0; wrong square gives 2. Closed representatives satisfy dω=r−f. |
| Real model, compactification and pullback | Proper case; A¹ nonproper; identity/composite pullback; common refinement | Required geometric comparisons named; analytic exp(z) exposes the incorrect nonproper replacement. These remain requested exports, not certified supplied results. |
| Products and conjugation | Odd degrees; weights 0,1,2; real versus integral coefficients | Cohomological Koszul sign and period sign kept separate; exact invariants asserted only over R. |
| Support fibre and semipurity | Empty/full support; A¹ with one or two points; no codimension-p components | Supported point generators can map to zero without being zero in support cohomology; higher-codimension components contribute nothing in degree 2p. |
| `cubicalOrientationSign`, successor and square theorems | q=0,1,2; constant-sign wrong variant | Values 1,−1,1 and inverse law proved in Lean for the actual definition; successor and square theorems proved for all q. |
| Degree-one orientation example | Face values 7 and 2: source boundary 5, standing boundary −5 | ε(1)·5=ε(0)·(−5). Both sides of the roof use the sign; degree zero stays fixed. |
| Layer 12 dependency attribution | Linear Hodge objects; connections/variations; geometric filtered cohomology | Removed the remaining false assertion that HodgeStructuresPartII supplies Deligne support theory. |

Heavy geometric and Milnor carriers are absent from the pinned Lean build.
Their checks remain in the README and the required names in the closing Lean
comment, following the 2026-10-12 shape rule. No admitted data carrier was
introduced to manufacture Lean examples. The new light integer definition
has two proved examples and two proved API theorems.

## Validation and resume point

- `lean-check research/blueprint/packages/MotivicEtaleKTheory/Suggested.lean`:
  exit 0, only the five existing `declaration uses sorry` warnings. The new
  orientation API and examples have no admissions. A first draft of the
  square proof failed; it was replaced by an explicit power calculation and
  the final file was elaborated successfully.
- All five `MotivicEtaleKTheory--*.json` packets pass
  `python3 scripts/check_blueprint.py`: zero errors and zero warnings each.
  Their pre-existing requests/gaps are unchanged.
- All 71 numbered subsections and all 290 original Check bullets are
  preserved; there are now 304 Checks. No original target was deleted or
  narrowed. The prior reduced-motive, characteristic-p logarithmic
  generation, dyadic signature and weight-zero Deligne repairs remain.
- Suggested.lean has 204 lines, four real-bodied definitions, seven named
  theorems, eight proved examples and the original five theorem admissions.
- `python3 research/blueprint/intake.py check-files` on the four authorized
  deliverables: four files, zero problems. `git diff --check`: exit 0.

Resume after the maintainer routes the three requests above. Apply the
quadratic supplier edit and geometric extension in their own authorized
jobs; update the consumer citations and upstream-order check here; rerun the
adversarial and validation passes before changing the verdict to accepted.
No suspicious executable instructions were encountered in the external text
used for this checkpoint. No source files, source passages, private paths or
temporary downloads are needed to resume.
