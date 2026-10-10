# Independent review of ShimuraCompactifications, revision round 2

Reviewer: Codex, session `codex-SbJxfI`, issue #7090, 10 October 2026.
Job: `REV-ShimuraCompactifications--C0~2`.
Inputs: the C0 packet, reader and Suggested file after revision
`BP-ShimuraCompactifications--C0~2` (PR #8282, session `codex-g4Y4t6`), and
the preceding independent review `REV-ShimuraCompactifications--C0`.
This reviewer authored neither planning round.

Verdict: **needs_changes**. This independent review is complete. It checks the
mathematical planning contracts and applies the clear corrections below.
The outstanding requirement is PROTOCOL section 13: most geometric node,
API and test contracts remain comments in the Suggested file. Successful
elaboration checks the declarations actually present. The packet's honest
partial status and explicit mathematical proof/interface gaps do not, by
themselves, account for this verdict.

## Counts and coverage

| Item | Input | After review |
| --- | ---: | ---: |
| Nodes | 90 | 90 |
| Definitions / constructions | 5 / 22 | 5 / 22 |
| API items | 119 | 119 |
| Definition/construction tests | 92 | 92 |
| Planets | 34 | 34 |
| Pinned baseline declarations | 14 | 14 |
| Explicit gaps / supplier requests | 21 / 37 | 21 / 37 |
| Sources / hashed public PDF versions | 18 / 15 | 18 / 15 |
| Node source citations | 115 | 115 |
| Source issues | 2 | 3 |

The packet has **67 verified and 23 corrected** mathematical node verdicts.
Every node has a fresh individual note in `review.checked`. No node was added,
removed or split, and no implementation is claimed. A verified planning
contract may depend on an explicitly requested supplier or unread proof leaf;
it is not a claim that the theorem has been proved in Lean.

All eight scoped stages remain `planned`, none `closed`, and the packet
remains `partial`, as submitted by the revision. At target granularity, all
stage targets have nodes, and the local prerequisite chains terminate in the
baseline, external nodes/requests or named gaps. Their precise remaining lists
are retained. The local checker does not establish global acyclicity: the
R11.3/C4 supplier ownership issue is explicitly recorded. C6 is outside this
part. No proof was split into lemma-level nodes.

Planet counts remain C0 5, C1 5, C2 6, C2.general 1, C3 5, C3.general 1,
C4 5 and C5 6. These identify central objects and named results, rather than
page locators. Every one of the 27 definitions/constructions has at least
three mathematical tests. The tests distinguish wrong signs, reduction,
nontrivial torsors, face directions, ineffective kernels, missing support,
rank loss, model normalizations and boundary hypotheses.

## Corrections applied in this review

All changed mathematical contracts are synchronized in the reader and in the
Suggested file's outstanding-contract ledger. The typed Lean body is retained;
the ledger changes do not supply missing geometric signatures.

| Node or interface | Correction and evidence |
| --- | --- |
| `C0/relative-fan-properness` | Necessity now requires a **nonempty source fan**, as well as a nonempty base. Over a nonempty base, the empty-source morphism is proper, while its support is empty and cannot equal the inverse image of a nonempty target support containing zero. The acceptance regression states this counterexample. Sufficiency retains the empty-base case. The current AnalyticToricGeometry Layer 5 already records the source-fan restriction. |
| `C2/partial-boundary-charts` | Restored the positive-domain restriction in Pink 6.13, printed p. 103: first construct the ambient torus embedding Y, then use the controlled open `Int_Y(closure_Y(U0))`, where U0 comes from the original positive domain. Added the existing `C1/boundary-incidence` prerequisite. The zero-cone, face-open, anchor and gluing contracts distinguish ambient charts from controlled opens. At a standard rank-one cusp the ambient chart is C, while the controlled chart is the q-disc. The existing rank-one and nilpotent tests now specify which carrier they test. |
| `C2/quotient-separation`, `C2/arithmetic-gluing` | Added the controlled positive-domain opens and restricted elementary identifications to their hypotheses, so the corrected local construction feeds the actual quotient and gluing. |
| `C3/refinement-structure-sheaf`, `C3/refinement-boundary-ideal` | Made the changed-level direction explicit: finer source level H, coarser target Hprime, H normal in Hprime, invariants under Hprime/H. Same-level pushforward equality is separated from changed-level invariant equality. The author-copy reversal is recorded as confirmed source issue E3. |
| `C4/mumford-quotient` | Replaced the nonexistent “Corollary 4.5.2.16” locator: (4.5.2.16) is a displayed isomorphism. The relevant formal quotient/algebraization is Proposition 4.5.2.15, followed by Construction 4.5.2.17 and Definition 4.5.2.18, printed pp. 273–275 of the selected Lan revision. |
| `C4/semiabelian-tate-module` | Specified m dividing n for the transition [n/m] from n-torsion to m-torsion. The API's equivalent n-dividing-m convention was already correct. |
| `C5/etale-chart-relation` | Replaced the incorrect normalization reference 6.3.3.7, which concerns the size of a multirank. The interior relation is (6.3.3.10), p. 512; the normalization is the paragraph after Remark 6.3.3.12, p. 514; etale projections and relation laws are Proposition 6.3.3.13 and Corollary 6.3.3.14, pp. 514–517. |
| `C5/integral-toroidal-space` | Definition 6.3.3.4 is p. 509; Definition 6.3.3.15 and Remark 6.3.3.16 are p. 518; Theorem 6.4.1.1 runs pp. 519–523. The smooth-fan, neat-space and non-neat-stack distinctions are retained. |
| `C5/valuative-properness` | Corrected the distinct all-traits criterion 6.4.1.1(6) to pp. 521–522. Properness itself remains Proposition 6.3.3.17 and the opening theorem assertion. |
| `C5/graded-section-finite-generation` | Restored the **flat preliminary Stein target** hypothesis of Lan Corollary 7.2.2.6. Before defining the minimal Proj, the flat toroidal source over the Dedekind good base gives a torsion-free coherent Stein algebra, hence a flat target. The proof and SF.2 request retain this step. Finite generation is not presented as an arbitrary integral base-change theorem. |
| `ComplexComparisonPartII:C4` request and analytic-algebraization gap | The current supplier includes a planned algebraic-space Hom version through C3/analytic-etale-descent and C3/proper-algebraic-space-gaga. Removed the stale assertion that it treats only schemes. A Hom comparison still assumes an existing algebraic source, so Pink's existence of algebraization and mixed canonical descent remain separate requested inputs; the supplier's own reconstruction gap also remains. |

The remaining corrected nodes have source-pagination fixes:

| Node | Corrected Pink printed locator |
| --- | --- |
| `C0/compatible-common-refinement` | 9.22–9.23, pp. 157–158 |
| `C0/smooth-projective-refinement` | 9.18–9.23, pp. 154–158 |
| `C0/relative-fan-properness` | 6.25 and 6.27, pp. 112–115 |
| `C1/mixed-boundary-datum`, `C1/boundary-mixed-hodge-structure` | 4.7–4.12 includes p. 63 |
| `C1/cusp-label`, `C2/minimal-boundary-map` | 7.2–7.5 includes the proof through p. 121 |
| `C1/boundary-incidence` | 4.15, p. 64; 4.22–4.25, pp. 68–69 |
| `C2/smooth-normal-crossings` | 9.20–9.21, pp. 156–157 |
| `C2/projective-algebraization` | 9.24, pp. 158–159 |
| `C2/canonical-toroidal-model` | 12.1–12.8, pp. 196–200 |
| `C3/level-datum-functoriality` | 6.25, pp. 112–113 |

Source reading metadata carries the corresponding corrections. BCGP 2021
section 8.2's p. 240 is explicitly **arXiv v3 pagination**. Pinned baseline
reading records are refreshed to 10 October; the graded Hodge definition's
incorrect approximate line range is corrected below. The report does not
claim to have read entire books or collated uninspected publisher editions.

## Verification of the previous review's requested corrections

The earlier report was read in full and compared with the revised files.
Its substantive corrections are present, with the further fixes above:

| Earlier requirement | Round-2 result |
| --- | --- |
| Ambient-only boundary Hodge comparison and native MHS | Retained; Pink 4.12 range and native graded-Hodge locator corrected. |
| Partial-chart source 6.13–6.17 | Citation retained; this review additionally repairs the omitted controlled-open operation itself. |
| Continuous minimal map before properness/algebraization | Retained; no prerequisite circle is reintroduced. |
| Projective scheme versus general algebraic-space algebraization | Retained; the refreshed supplier request recognizes its current space Hom version while preserving the distinct existence gap. |
| Negative Poincare character, DD_pol versus DD_ample, doubled auxiliary polarization, isomorphism-groupoid effectivity | All retained and checked against Lan 3.1.5.1, 4.2.1.7, 4.4.6–4.4.7 and 4.4.16. |
| Fibrewise semi-abelian definition, constructible characters and normal-base Hom extension | Retained; selected cleared FC I.2 definitions and proofs were reread. Generic kernel finiteness is still not extended across the boundary. |
| Two good-model embeddings and normalized interior relation | Retained; corrected the relation's remaining wrong source label. |
| Ordinary smooth compatible fans, neat spaces versus non-neat stacks, locally closed completion | Retained, including compatibility beyond neatness alone. |
| Separate properness theorem and all-traits criterion | Retained; remaining criterion pagination corrected. |
| Stein structure sheaf, minimal contraction versus refinement, minimal Hodge ampleness | Retained; restored the missing flat Stein target condition in finite generation. Formal/special-fibre contraction transfer remains its own gap. |
| Same-fan finite normalization versus normalized projective blow-up | Both targets remain distinct; the added projective construction and its three discriminating tests are present. No subdivision is declared finite. |
| Exact integral coefficient functor and Koecher exception | Retained, including the Lan 2017 erratum's dimension-one/nonempty-boundary condition and the missing positivity/growth proof. |
| Full profinite Tate transitions and primewise comparison | Retained; divisibility direction clarified. Compact inverse-limit exactness is still requested. |
| API additions, 92 tests and 34 planets | Present. All 27 definitions/constructions satisfy the mathematical minimum; typed coverage remains incomplete. |
| Source issues E1/E2 and no source quotations | Both freshly confirmed; no excerpt field or source passage is introduced. |
| Reader synchronization | Complete for all current node statements, hypotheses, proof steps, acceptance conditions, prerequisites, APIs, tests and source matches. |
| Full Suggested signatures, APIs and examples | Improved but **unresolved**: local fan components and the affine coefficient square do not discharge the missing global/geometric contracts. |

The revision explicitly submitted a partial checkpoint. Reviewing that scope
honestly does not convert its omitted required Suggested contracts into
completed declarations. This review is a completed review of that input,
not a second planning checkpoint.

## Baseline and current ownership

All 14 cited declarations exist at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, with the conventions claimed in
their `provides` fields. Every statement and its surrounding hypotheses was
read. None is removed or replaced.

| Baseline declaration | Independently confirmed scope |
| --- | --- |
| `TauCeti.Toric.Fan.ext` | The existing finite-cone fan carrier; it does not represent a general finite-orbit arithmetic fan. |
| `TauCeti.SplitTorus.groupScheme` | Finite-rank split torus over Spec R for arbitrary commutative R. |
| `TauCeti.AlgebraicGeometry.irreducibleSpace_of_connected_of_isDomain_stalk` | Locally Noetherian connected scheme with domain stalks; only a specialization of the needed algebraic-space/fibre argument. |
| `MonoidAlgebra.comapDomain` | Injective degree restriction, including the generated additive form; not automatically multiplicative. |
| `AddMonoidAlgebra.lift` | Monoid maps from Multiplicative P correspond to R-algebra maps from R[P]. |
| `AddMonoidAlgebra.lift_single` | Evaluation of the lift on a coefficient monomial. |
| `MonoidAlgebra.mapDomainAlgHom` | Degree-map algebra homomorphism and generated additive form. |
| `MonoidAlgebra.mapRingHom` | Coefficient change and generated additive form. |
| `MonoidAlgebra.domCongr` | Degree-monoid equivalence induces the coefficient-algebra equivalence. |
| `Ideal.quotientKerAlgEquivOfRightInverse` | Kernel quotient equivalence requires the actual right inverse used here. |
| `TauCeti.Hodge.MixedHodgeStructure` | Native rational/complex models, bounded W/F and induced pure graded structures; Basic.lean lines 65–105. |
| `TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure` | Actual definition and filtration comparison, Basic.lean **lines 182–194**, replacing the input's approximate 208–228. |
| `AlgebraicGeometry.Spec` | Existing scheme spectrum, Scheme.lean lines 468–470. |
| `AlgebraicGeometry.Spec.map` | Contravariant scheme map induced by a ring map, lines 477–487. |

The reviewed library audit was checked before assessing ownership. The current
read-only upstream checkout is at
`cd03e06852a13216ad246d0623492c4beac39af2`; current Tau Ceti is at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current AnalyticToricGeometry and
Completed/HodgeStructures were read, and the newer roadmap/library interfaces
were screened for overlap. Current toric scheme gluing and relative Spec
sources were inspected directly, including the AlgebraicVectorBundles owner.
The packet's current-upstream note correctly records the implemented
`affineToricScheme`, `Fan.algebraicRealization`, `Fan.affineToricChartι`,
`CommMon.relativeSpec` and relative-Spec functor. They are imported work,
absent from the pin, rather than new pinned baselines. No files in either
read-only checkout were changed or built.

RS-32's unchanged common lattice/cone/finite complex toric anchor is preserved.
The added work is arbitrary coefficients, actual torsor weight algebras,
arithmetic cusp systems and quotients. No duplicate Hodge, abelian, sheaf,
algebraic-space, analytic or general cohomological carrier is introduced.

## Sources, source issues and supplier limits

All 15 public PDF binaries were fetched afresh and matched against the recorded
hashes. The named target passages were reread; exact versions, URLs and hashes
are retained in the packet. Selected cleared FC I.2, printed pp. 7–13, and
V.2, pp. 149–152, were read directly. No restricted file, extracted passage or
source quotation is copied into the deliverables.

The checks include Pink's actual chart, boundary, refinement and canonical-model
constructions; Lan's ordinary chart, relation, formal quotient, vanishing and
Stein constructions; Lan 2017's normalized model, Hecke maps, coefficient
conditions and author errata; and the routed FKW, Bresciani, BPS, Pilloni,
Boxer–Pilloni, CG, BCGP and Yuan uses. The two Stacks interfaces were checked
at their stated scope. In particular, smooth proper geometrically reduced
families have finite etale Stein factors; that supplies the generic component
detector requested from SF.2. It does not make arbitrary non-neat coarse
closures smooth. [Stacks 76.36.9](https://stacks.math.columbia.edu/tag/0E0D).

The following source issues all carry fresh `review.verdict`, `reason` and
`by: REV-ShimuraCompactifications--C0~2`:

- **E1 confirmed:** Pink Definition 2.1(v), printed p. 30 / one-based PDF p. 31.
  The rendered author copy's middle/top Lie filtration steps fail the subspace
  and exhaustivity checks. The consistent steps are Lie W and Lie P. The
  packet already uses that convention. [Pink author dissertation](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf).
- **E2 confirmed:** Lan Lemma 6.1.2.6, printed p. 444 / PDF p. 472. The
  arbitrary-base reduced-stratum identification fails over Z/4Z: the
  scheme-theoretic off-face quotient preserves its nonzero nilpotent, while
  reduction kills it. Keep the quotient, or reduce both sides.
  [Lan author revision](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf).
- **E3 added and confirmed:** Lan 2017 Proposition 7.5, printed/PDF p. 28,
  compared with Proposition 7.3, p. 27. The invariant clause reverses the
  normal level inclusion and quotient. The source-level-H to target-level-Hprime
  map requires H normal in Hprime and deck group Hprime/H. Both O and the
  boundary-ideal contracts now state this. The rendered page was inspected.
  The one-page author errata's three items do not address this clause; no
  corresponding correction was located in the author material searched.
  [Lan 2017 author copy](https://www.kwlan.org/articles/cpt-ram-nbl.pdf),
  [author errata](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf).

All three findings are limited to the inspected, hashed editions. Publisher
editions are uncollated. The five existing routed source corrections were
checked and retained under their existing owners: Pilloni E40/E109,
Boxer–Pilloni E67, BPS E14 and CG E165. They are not duplicated as new findings.

All 37 requests were checked against the available suppliers. Actual supplier
statements support the imported native Hodge, abelian/Poincare, arithmetic
quotient, ordinary PEL, relative-Spec, space-atlas, bundle and Hecke-span
interfaces at their recorded scope. Missing statements remain explicit
requests. Important limits are:

- R11.3's local Raynaud node verbally uses early C4, so its independent local
  ownership repair remains necessary before C4 imports it.
- Generic space carriers/etale descent do not already supply character-line
  torsor algebras, all proper coherent/Stein APIs or formal effectivity.
- The ordinary good-prime M2 model does not supply every ramified normalized
  model. Same-fan finite normalization and normalized blow-ups remain distinct.
- Characteristic-zero canonical bundles do not already supply Lan's exact
  integral filtered coefficient functor or its Koecher positivity proof.
- R02.1's cochain ML theorem does not itself supply exactness and comparison
  of the full all-prime semi-abelian Tate module.
- The precise modular R13.3 Tate contract is requested because no matching
  node exists; the AG2.4 ordinary instance is not the missing Lan–Stroh
  good-reduction cohomology theorem.
- Formal ordinary/Klingen acyclicity, formal minimal contraction, non-neat
  component transport and mixed canonical boundary descent retain their
  precise missing inputs.

Unread AMRT/KKMS proofs, relative effectivity/theta leaves, Moret-Bailly IX.2.1,
the supporting Lan [17]/[18] arguments, selected level-group extension proofs,
and Lan–Stroh Corollary 5.20 remain named gaps. Partiality here is deliberate
and checked; no library name or general slogan closes those gaps.

RT-AREA-algebraicgeometry/3, /27 and /34 were compared with both the findings
and their confirming reviews. Locally the packet preserves the
nilpotent-preserving analytic carrier request, native HodgeStructures L2
imports, and the uniform arbitrary-ring C0 scheme, including valuation rings.
The BKV nonarchimedean route must import C0 and start with formal/adic/perfectoid
additions. Other owners' missing links/routes remain orchestrator actions;
this review changes no supplier or route file.

## Suggested file and validation

| Contract coverage | Full typed counterpart | Partial local/affine counterpart | Entirely outstanding |
| --- | ---: | ---: | ---: |
| Nodes | 7 | 3 | 80 |
| API items | 11 | 6 | 102 |
| Packet tests | 12 | 5 | 75 |

Thus **83 full node, 108 full API and 80 full test contracts** still require
their intended typed signatures/examples. The coverage ledger's 102 API and
75 test entries exclude the separately listed partial six and five; they
must not be mistaken for the total full-contract deficit.

The seven full nodes are the face projection, coefficient formula, section,
kernel, quotient, coefficient-change square and kernel-extension comparison.
The three partial nodes are the local arithmetic fan, local common refinement
and uniform affine toric chart. The latter's coefficient square uses actual
native schemes and is genuinely Cartesian. The local fan has actual integral
actions, support/orbit/local-finiteness predicates and a finite-overlap witness
for its intersection refinement. These are useful prototypes, but do not
provide global cusp compatibility, torsor descent or the full fan realization.

The entire file was compiled twice in the shared pinned build, including all
three Tau Ceti imports. The final post-correction run exited successfully with
**51 warnings, all `declaration uses sorry`, and no errors**. These are
admitted-proof warnings, not proved mathematics. No opaque geometric Prop,
conclusion-as-field carrier, extra Lean project or source-only substitute was
used to pretend that the absent contracts compile.

Completed checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications--C0.json`:
  **zero errors and zero warnings**.
- Full-file `lean-check`: exit 0, only the 51 admitted-proof warnings above.
- Independent reader comparison of all node statements, hypotheses, proof
  steps, acceptance conditions, prerequisites, API/test statements and source
  matches: **zero mismatches**.
- Definition/construction test minimum, per-stage planet counts and full/partial
  coverage reconciliation: pass.
- Intake file checks and `git diff --check`: pass.

No language server, dependency update, build, cache fetch or second concurrent
Lean process was started. The final Suggested changes affect commentary only;
the review still recompiles the complete resulting file.

## Orchestrator actions

1. Keep this review's mathematical corrections and sourceIssue E3. Route the
   remaining section-13 work to the next authorized revision, with the exact
   full/partial coverage ledger and carrier-owner boundaries preserved.
2. Decide how the missing analytic/algebraic-space/formal supplier prototypes
   will be made available for that work. Do not resolve the signature deficit
   with theorem-as-field placeholders or a duplicate carrier.
3. Retain the local R11.3 ownership repair, exact formal minimal-contraction
   comparison, ramified normalization input and outside-owner RT links/routes
   as their named owner actions. No promotion or global closure is authorized
   by this review.

The packet, reader, report and review handoff contain the durable findings.
Scratch downloads and logs are removed after the pull request is opened.
