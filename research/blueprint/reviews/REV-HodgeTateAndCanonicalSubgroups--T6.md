# Review REV-HodgeTateAndCanonicalSubgroups--T6

Independent review of `BP-HodgeTateAndCanonicalSubgroups--T6` (issue #756, PR #6817): the packet
`research/blueprint/packets/HodgeTateAndCanonicalSubgroups--T6.json` and its suggested file
`research/blueprint/suggested/HodgeTateAndCanonicalSubgroups--T6.lean`, for the stages
`HodgeTateAndCanonicalSubgroups:T6`, `T6:log-sites` and `T6:comparison`, planned at target level
(distance 9 in `data/roadmap-classification.json`). Reviewer: Claude, session `claude-k97uLQ`
(issue #433). The plan was written by Codex, session `codex-gcEbbg`.

**Verdict: `needs_changes`, corrected in place.** The pass is complete and what it plans is now right:
every node was read against its source and corrected where needed, six missing nodes were added, the
closure was rebuilt on exact supplier nodes, and the three red-team findings are handled as their fix
job decided. Two things stop an acceptance:

1. The reader `research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T6.md` is not a deliverable
   of this review and now disagrees with the packet almost everywhere (68 of 68 nodes changed,
   requests, gaps, restructure entries and source issues). Promoting the packet would publish a reader
   that contradicts it. The revision round must regenerate it from this packet.
2. The suggested file elaborates, but most geometric declarations, API items and theorems are still
   catalogue comments (section 6). The revision should extend typed coverage where an honest
   signature exists.

The revision round (`BP-HodgeTateAndCanonicalSubgroups--T6~2`) is mostly mechanical: regenerate the
reader, then settle the questions in section 10.

## Counts

| | Submitted | After review |
| --- | ---: | ---: |
| Nodes | 62 | 68 (6 added) |
| Definitions / constructions / theorems / applications | 11 / 21 / 29 / 1 | 11 / 24 / 32 / 1 |
| API items | 127 | 246 |
| Unit tests | 96 | 126 |
| Source entries (excerpt + match) | 62 | 257 |
| Planets | 11 | 11 |
| Requests | 14 | 11 |
| Gaps | 9 | 10 |
| Source issues | 1 | 13 (E1 confirmed, 12 added) |
| Node verdicts | — | 62 corrected, 6 added |

`python3 scripts/check_blueprint.py` (with the pinned declaration index) reports 0 errors and
0 warnings before and after. `lean-check` on the rebuilt suggested file: exit 0, 105 warnings, all
`declaration uses 'sorry'`.

## 1. Method

The three public sources were downloaded again and hashed; all three SHA-256 values match the
packet (DLLZ-adic `209e5983…`, DLLZ-RH `dccd18f6…`, BP `d340c9a0…`). PDF page numbers equal printed
page numbers in all three. Six checkers each read one group of nodes against the source text at the
locators (DLLZ-adic §§2–3, §§4–5.1, §§5.3–6; DLLZ-RH §§2–3.3 and Appendix A, §§3.2–3.6; DLLZ-RH §5
and BP 4.4.38–4.4.40). A seventh checked every cross-roadmap citation against the supplier packets
and ran the cycle analysis; an eighth audited and rebuilt the suggested file. After the corrections
were merged, four further readers who had not seen the findings read every corrected node again
against the sources; their 33 findings (8 medium, 25 low) were checked and applied. Every
decoration-level misprint was confirmed on a rendered page image before it was recorded. I checked
the baseline declarations, the red-team handling, the source-issue verdicts and the merge myself, and
spot-checked the worked tests (lattice shifts, the Tate line, the Siegel H₁ sequence).

## 2. Sources

- **Excerpts and matches.** Every one of the 62 submitted source entries had the same `match`
  sentence ("The stated construction/result with the hypotheses and analytic conventions recorded
  here; …"), and many excerpts were one to four words ("Kummer étale" occurs 256 times in DLLZ-adic,
  "factors through" 38 times). Every node now cites each source result it bundles, with a literal
  passage of 8–40 words (257 entries, every one found in the hashed text) and a match that says what
  the passage states and how the node differs from it.
- **Locators corrected:** continuous-log-differentials (Definition 3.2.14 is formal log smoothness;
  the construction is (3.2.5)–(3.2.8), Proposition 3.2.9); log-differential-descent (Proposition 3.3.7
  is base change along arbitrary cartesian squares, not log-étale base change, and the
  formal-smoothness equivalence is Proposition 3.3.16, not Theorem 3.3.17); analytic-log-de-rham
  (residues are DLLZ-RH §3.4, (3.4.1), not Corollary 3.5.7); kummer-root-covers (domination of Kummer
  covers is Lemmas 4.2.5–4.2.6); canonical-arithmetic-monodromy (there is no Lemma 5.6.6);
  finite-levi-torsor (the cyclotomic twist is explained in BP §4.4.8 and §4.4.23, not Remark 4.4.10,
  and the submitted excerpt "up to a cyclotomic twist" came from Theorem 4.4.40 itself).
- **BP read sections.** The manuscript has no heading §4.4.5 and no Propositions 4.4.38–4.4.39:
  4.4.38 is a numbered paragraph and 4.4.39 a remark. `readSections` now names them and the
  convention passages used (§4.0 p. 49, §4.4.8 p. 68, §4.4.23 p. 74, §4.6.1 p. 90).

## 3. Baseline

All nine declarations exist at the pins (Mathlib `082e2d3`, Tau Ceti `f790474`), read in the source
files of the pinned trees.

| Reference | Module | Verdict |
| --- | --- | --- |
| `tauceti:TauCeti.Huber.Pair` | `TauCeti/RingTheory/Huber/Pair.lean` | confirmed (open, integrally closed `plus ≤ A°`) |
| `tauceti:TauCeti.Huber.Pair.Hom` | same | confirmed (continuous, preserves plus rings) |
| `tauceti:TauCeti.Huber.Pair.Hom.spaComap` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/HuberPair.lean` | confirmed; cited by no node |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | confirmed |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | confirmed; kind corrected `def` → `abbrev` |
| `mathlib:Derivation` | `Mathlib/RingTheory/Derivation/Basic.lean` | confirmed |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | confirmed |
| `mathlib:BDeRhamPlus` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean` | confirmed (ker θ-adic completion of `W(R♭)[1/p]`; no DVR or sheaf statement) |
| `mathlib:fontaineThetaInvertP` | same | confirmed (hypotheses `Fact p.Prime`, `¬IsUnit p`, `IsAdicComplete (p)`) |

No citation was removed. The reviewed library audit has no T6 record, and nothing the packet plans
is in the pinned libraries.

## 4. Statements, closure and granularity

**Corrections to statements.** Every submitted node was changed; the record for each is in the
appendix and in the packet's `review.checked`. The substantive ones:

- *Hypotheses.* DLLZ allow normal crossings divisors (étale locally SNC), not only SNC
  (divisorial-analytic-log, rigid-abhyankar, boundary-local-system-extension, the §6 and §3 nodes).
  DLLZ-RH §3 takes k a p-adic field in its sense (perfect residue field) and K any perfectoid field
  containing k_∞; the submitted log-riemann-hilbert and log-oc-pushforward restricted K. Properness
  in proper-log-period-cohomology is needed for every comparison, not only the arithmetic ones.
  boundary-local-system-extension needs k⁺=O_k. kummer-etale-morphism follows DLLZ's definition by
  local Kummer charts with the index invertible in O_Y. The §6 nodes state the residue
  characteristic p and the perfectoid base that DLLZ's proofs use (source issues E4, E5).
- *The lattice Hodge–Tate filtration.* two-de-rham-lattices filtered M⁰ by the "de Rham-induced"
  filtration. By the filtered comparison that filtration on the horizontal sections is Fil^jM, which
  would make the Hodge–Tate filtration trivial. BP intersects the lattice filtrations
  Fil^iL=Fil^iB_dR·L; corrected, with tests computed on rank-one lattices, the Tate line (jump at −1)
  and the Siegel H₁ sequence 0→Lie(A)⊗Ô(1)→H₁⊗Ô→ω_{A^t}⊗Ô→0. One vacuous test (relative_position)
  was replaced by a computation.
- *The canonical comparison.* DLLZ-RH Theorem 5.3.1 compares filtered log connections, not period
  sheaves; canonical-log-period-comparison now composes it with the period isomorphism of
  DLLZ-RH Corollary 3.4.21 / proof of Theorem 3.2.12(2). canonical-pro-kummer-realizations now also
  constructs p-W_dR=D_dR,log(W_p) and p-W_B, which the next three nodes compare and no node defined;
  its uniqueness comes from the boundary extension, not from unipotent monodromy.
- *Graph defects.* normalized-log-residues stated the D_dR,log residue result, but the node defining
  D_dR,log depends on it (a cycle); the clause moved to arithmetic-log-de-rham. unipotent-log-tensor
  listed log-rh-pullback, but the source proves pullback from the tensor theorem's nilpotence; the
  edge is reversed and the canonical nodes cite log-rh-pullback directly. kummer-root-covers proved
  domination through rigid-abhyankar, which depends on it.
- *Second reading.* Among the 33 findings: the Hodge-type node used DLLZ's cohomological
  normalisation (V₀ realized by R¹f_*) while the packet's imports and BP use homology H₁(A); and it
  claimed every W is cut out of a single V₀^{⊗m}(−t), which holds for irreducible W only. A test
  (BoundaryMonodromy.finite_character) was false for characters unramified along D; the
  π₁^két(X(ξ))≅Ẑ′(1)^J description needed local branches for non-strict normal crossings; a
  boundary_value test described a homomorphism that cannot exist.

**Nodes added** (each marked `"addedBy": "REV-HodgeTateAndCanonicalSubgroups--T6"`):

| Node | Kind | Source | Why |
| --- | --- | --- | --- |
| log-sites/toric-log-adic-space | construction | DLLZ-adic Lemmas 2.2.11–2.2.13, Def. 2.2.17, Ex. 2.2.19–2.2.21 | the spaces X⟨P⟩ that charts, root covers and toric towers use; planned nowhere |
| log-sites/kummer-etale-higher-direct-images | theorem | DLLZ-adic Lemma 4.4.27, (4.4.28), Lemma 4.4.29 | requested by PrismaticCohomology PR.8; used by Lemma 4.6.2 |
| comparison/kummer-proper-pushforward-local-systems | theorem | DLLZ-adic Corollary 6.3.5 | input of relative-log-comparison |
| comparison/bdr-coefficient-sheaves | construction | DLLZ-RH Definition 3.1.1, Lemma 3.1.4 | used by Proposition 3.3.3 and Theorem 3.2.3 |
| comparison/hodge-tate-parabolic-reduction | construction | BP p. 80 | P_HT, which S6 imports by name and finite-levi-torsor needs |
| comparison/hodge-type-comparison-agreement | theorem | BP Remark 4.4.39; DLLZ-RH §5.5 | requested by S6 |

DLLZ-adic Proposition 5.1.12 (pro-finite Kummer objects as profinite π₁-sets), Proposition 5.2.1,
Lemma 6.3.6, Definition 4.3.6, the strictly local π₁^két (Proposition 4.4.9, Corollary 4.4.22),
toric charts (Proposition 3.1.10), monodromy along one component (Remark 6.3.13) and DLLZ-RH
Corollary A.1.21 were used but planned nowhere; each is now part of the statement and API of the node
that uses it.

**Closure.** Stage-level citations were replaced by exact supplier nodes wherever one states the
need: AdicSpacesPartII R0/R1/R3/R4 nodes, PerfectoidSpaces P0/P1/P3 nodes, DiamondsAndVStacks D0
(filtered colimits, Čech-to-derived, stackification), ClassicalAdicEtaleCohomology H0 nodes,
PadicHodgeTheory P8:local-rational and R06.1 nodes, AutomorphicBundles B0–B3 nodes, AdicEtaleGeometry
A1/A4 nodes. All 142 cross-roadmap node citations (91 distinct supplier nodes) resolve to existing nodes. Changes to citations that did not match:

- CrystallineCohomology CR.5:log-algebra nodes are stated for the étale site of a scheme; T6 uses
  them on adic étale ringed sites. They are kept, with a new request that CR.5 state log structures,
  logification, pullback, charts and characteristic monoids for an arbitrary ringed site.
- CrystallineCohomology:CR.5/log-connection is the crystalline notion on a PD envelope; it is no
  longer cited, and the analytic log connections are defined in analytic-log-de-rham and
  filtered-log-connection (DLLZ-RH Definition 3.1.7).
- log-perfectoid-basis cited PadicHodgeTheory:P8 (added by a checker), against the stage rule "No P8
  or CP.3 input" for T6:log-sites, and a cycle risk through PR.8 → CP.4 → P8. It now cites
  PerfectoidSpaces:P3/etale-almost-acyclicity and P3/etale-site-tilting-equivalence; Scholze's
  Corollary 3.17(i) without the noetherian hypothesis is in the H0 request. No log-sites node has a
  P8, P8:local-rational or CohomologyComparisons ancestor.
- MotivesAndAlgebraicCycles:MC.7 was cited by special-point-comparison (submitted) and two nodes the
  checkers touched. Across all research packets this closes a cycle that does not exist without it:
  AutomorphicBundles B5 cites T6:comparison, and B5 → C5 → PELModuli M6 → R28.1 → R28.4 → MC.7. No
  MC.7 node states Blasius's theorem either. The citations and the MC.7 request are removed; the CM
  inputs (Blasius, Shimura–Taniyama potential good reduction, [IIK21]) stay in the gap.
- The P8 citations for Scholze's §5 lemmas stay (no P7 node states Lemmas 4.12, 5.3–5.9 or Theorem
  5.1); P8 is already an ancestor of T6:comparison, so they add no cycle (section 8).

**Requests** (14 → 11). Dropped: AdicSpacesPartII R1, R4 and PerfectoidSpaces P3 (exact nodes
cover every need) and MotivesAndAlgebraicCycles MC.7 (cycle). Added: CrystallineCohomology
CR.5:log-algebra. Narrowed: R0 to analytic normalization (rigid-abhyankar only), R3 to étale descent
of coherent modules (DLLZ-adic Proposition A.10), H0 to five named classical inputs, E1 to the
projection formula and hypercohomology, E2 to derived limits on X_prokét, P8 to Scholze's §5 lemmas
with the decided P8:primitive order. Every request's supplier is a prerequisite of each node in its
`neededBy`, and `neededBy` lists are recomputed from the prerequisites.

**Gaps** (9 → 10). Rewritten: the primitive-comparison owner (decided, not yet a stage; the
submitted claim that late P8 would close a cycle with CP.3 is false for T6), analytic normalization
with the three named inputs of rigid Abhyankar ([Han20], [Lüt93], [Bar76]) and rigid resolution for
Corollary 6.2.3, Banach decompletion (now naming Berger–Colmez TS(3), Liu–Zhu Proposition 3.3 and
Corollary A.1.21), CM special points, derived limits on X_prokét, and the collation of the
author-copy findings. New: the Liu–Zhu interior Riemann–Hilbert package (no accepted owner:
PAPER-LIU-ZHU-17 route 8, towards the ordinary prefix of T6:comparison, was sent back by its review),
and the remaining external inputs (Huber's comparison and log purity for Lemma 4.6.2, André–
Baldassarri, Kisin, Katz, [SW20, Thm. 10.5.1]). Removed: "Supplier-dependent suggested geometric
signatures", which named every node and no mathematical input; the carriers it meant are the
supplier nodes already cited, and the suggested file's status is recorded in section 6.

**Granularity.** Target level is right (distance 9). Every target in the three stage texts is
realised; the added nodes are targets' definitions or key theorems, not proof lemmas. The coverage
of each stage stays `planned`, with remaining lists rewritten to name the supplier work.

**Consumers.** The packet now answers the requests other packets make of T6:
PrismaticCohomology PR.8 (kummer-etale-higher-direct-images), PerfectoidShimuraVarieties S6
(canonical-log-period-comparison, lattice-hodge-tate-filtration, hodge-tate-parabolic-reduction,
finite-levi-torsor, hodge-type-comparison-agreement, and the evaluation of the period sheaves on log
affinoid perfectoid objects in constant-log-periods, structural-log-period-plus and
toric-structural-period-model), OverconvergentAutomorphicForms O8 (finite-levi-torsor), and
CohomologyComparisons CP.6 (the period, Poincaré and Faltings nodes). Two requests are outside T6:
S6's "kummer-to-v-bridge" is part of the proof of BP Theorem 4.4.40 and §4.6.1, hence S6's; and
AutomorphicBundles B5's compact-support/subcanonical comparison is not in DLLZ-RH at all (the only
(−D) twist there is the vanishing Theorem 4.2.1), but in Lan–Liu–Zhu arXiv:1912.13030, which is not
a source of this roadmap.

## 5. API, tests and planets

Every definition and construction has an API outline and at least three tests; the checkers added
119 API items and 30 tests (functoriality, extensionality, characterisations, the evaluation on log
affinoid perfectoid objects, Galois and Čech structure of root covers, the Tate-line and Siegel
tests that pin the Hodge–Tate sign conventions). Vague tests were made concrete (a rank-two point
missed by a family of discs, a shrinking-disc system excluded by openness). Planets: 11, at most
six per layer, all named from the sources; the planet a checker put on toric-log-adic-space
(a second "Log adic spaces") was removed.

## 6. Suggested Lean file

The submitted file elaborated, with 59 of its 253 names given a typed component and the rest in a
comment catalogue. Its components had no false test and no Prop placeholder, but about a dozen tests
never evaluated the declaration they named (for example `not_unshifted` restated a structure field,
the three `BoundaryMonodromy` tests ignored the representation, the `RamificationIndex` tests took
exponents of hand-picked groups rather than cokernels of maps), and two of its test names
(`KummerEtale.identity`, `KummerEtale.coordinate_root`) are not packet names. All were rewritten
against the declarations they name. `FilteredLogConnection` could only express R-submodule
filtrations; it is redesigned with a positive subring R⁺ and lattices of Ω^log, so that the B_dR⁺-
lattice filtrations, log t-connections (∇(fe)=f∇e+t·e⊗df) and the Higgs reduction of DLLZ-RH
Definitions 3.1.6–3.1.7 and Lemmas 3.1.8–3.1.9 can be stated; integrability is not encoded (it needs
the exterior algebra of Ω^log). New typed components include the monoid algebra R[P] with its chart
(MonoidAlgebraLog), the t-adic filtration of the B_dR-coefficient modules, the Kummer, log-smooth and
log-étale chart conditions on P^gp→Q^gp, the ramification index of a chart map, unipotence and
monodromy along one component, the characteristic monoid, the lattice filtration in a rank-one
model, and the parabolic-reduction membership.

The rebuilt file is generated from the corrected packet: the hand-written components, then the
catalogue of every node, API item and test with its statement. 117 of the 406 packet names now have
a typed component (20 of 68 declarations, 45 of 212 API names, 52 of 126 tests); the other 289 are
marked "not stated" in the catalogue. A name check finds every packet name in the file. `lean-check`
(shared build, Mathlib `082e2d3`; the imported `TauCeti.RingTheory.Huber.Pair` is identical to the
pinned Tau Ceti source) exits 0 with 105 warnings, all `sorry`. No theorem node has a typed statement:
each needs the geometric carriers (log adic spaces, Kummer sites, period sheaves) of its suppliers.

## 7. Mistakes in the sources

| Id | Source | Kind | Locator | Correction | Affects |
| --- | --- | --- | --- | --- | --- |
| E1 | DLLZ-adic | error | Corollary 6.3.4, p. 88 | finiteness needs X proper; extension statements hold without | a stated result |
| E2 | DLLZ-adic | gap | Definition 3.2.4 and text after (3.2.8), p. 27 | "finite, therefore complete" needs Huber's noetherian assumption | the proof |
| E3 | DLLZ-adic | misprint | Lemma 4.4.29, p. 65 | target R^iε_*(µ_n^{⊗i}), as Lemma 4.6.2 uses | a stated result |
| E4 | DLLZ-adic | gap | §6.1, Proposition 6.1.1, p. 81 | k must be perfectoid for Ẽ to be log affinoid perfectoid | the proof |
| E5 | DLLZ-adic | gap | Theorem 6.2.1, p. 85 | residue characteristic p is needed for the finiteness | the proof |
| E6 | DLLZ-RH | error | Corollary 2.4.6, p. 21 | the first term needs the filtration-completed tensor product | a stated result |
| E7 | DLLZ-RH | misprint | Proposition 3.3.3(2), p. 28 | O_Z for O_X | nothing |
| E8 | DLLZ-RH | misprint | Theorem A.2.2.3, p. 74 | {A_{m,k̂_∞}} for {A_m} | nothing |
| E9 | DLLZ-RH | gap | Corollaries 2.4.2(4), 2.4.5 | Corollary 2.2.6 applied outside its hypothesis; descent step needed | nothing |
| E10 | DLLZ-RH | gap | (2.2.8), Definition 2.2.10, p. 13 | the W(κ)-structures need κ perfect | nothing |
| E11 | DLLZ-RH | misprint | proof of Corollary 3.5.7, p. 40 | Res_{Z₀} for Res_Z | nothing |
| E12 | DLLZ-RH | misprint | proof of Proposition 3.4.16, p. 37 | stalk of F, not of 𝓔 | nothing |
| E13 | BP | misprint | text after Remark 4.4.39, p. 79 | M=W_p⊗B_dR⁺ (B⁺_{dR,log} is undefined); M₀ = M⁰ | nothing |

**E1 is confirmed.** Corollary 6.3.4 begins "Let k, X, and U be as in Theorem 4.6.1": X smooth with a
normal crossings divisor, char(k)=0, k⁺=O_k, and no properness anywhere in §6, §6.1, §6.3 or the
conventions. Its proof uses Theorem 6.2.1, which assumes X proper, and Remark 6.2.2's closed disc
has infinite H¹(D,F_p). Checked on the rendered pages 68, 81, 85 and 88. The entry's reason now
says normal crossings rather than "smooth SNC pair", and notes that DLLZ-RH applies the corollary
only with a proper compactification. All entries are scoped to the hashed author copies; the
published DLLZ-adic chapter and the JAMS version of DLLZ-RH were not available, so the collation gap
remains. A checker's proposed entry on DLLZ-RH's citation "[DLLZ, Prop. 5.4.3]" (Theorem 5.4.3 in the
final DLLZ-adic) was not recorded: DLLZ-adic itself uses both labels, and earlier versions may differ.

## 8. Red-team findings

- **RT-AREA-padic-1/4** (BP Theorem 4.4.40 planned twice). Respected. No node asserts Theorem 4.4.40:
  the package stops at "We have the identification of torsors on the pro-étale site
  M^an_HT = M^an_dR ×^{µ,Z_p^×} Z_p(1), compatible with the Hecke action. This implies that a
  cyclotomic twist of M^an_HT is already defined on the étale site." (BP p. 80). The diamond limit,
  the triviality of G_pet,p on it, π^tor_HT and the pullback statement are S6's. The owners entry
  and restructure entry match FIX-RT-AREA-padic-1 (finding /4, edits 2–6); the atlas texts of T6,
  T6:comparison and the roadmap summary still contain Theorem 4.4.40 until those edits are applied.
- **RT-AREA-padic-1/23** (BCGP-25 Theorem 4.4.1 routed to T4–T6). Handled as the fix decided: the four
  comparisons go to TorsionCohomologyInfrastructure TC.2 and route 22; no T6 node owns completed or
  coherent cohomology of the tower. At this packet's baseline the paper result still lists the four
  items in route 23 (the fix's edits there are not applied yet).
- **RT-AREA-padic-1/24** (primitive comparison unowned). The submitted request and restructure entry
  placed P8:primitive **before** P8:local-rational, the order the fix rejected: Scholze's §5 uses
  the toric charts of his Lemma 5.2, planned at P8:local-rational, so that order is a 2-cycle. Both
  now follow the fix: P8:primitive after P8:local-rational and before P8, CP.3, AI.4, TC.2, IG.3 and
  T6:log-primitive; T6:log-primitive after T6:log-sites, made of the six primitive-comparison nodes,
  exporting to T6:comparison (DLLZ-RH Lemma 3.6.1), TC.2 and the HigherHidaAndColemanTheory design.
  Neither stage is in the atlas yet, so the three consumers cite PadicHodgeTheory:P8.

## 9. Cycles and stage edges

With the atlas stage edges and the promoted blueprints, the corrected packet adds no strongly
connected component (19 with and without it, none containing a T6 stage), also with the
FIX-RT-AREA-padic-1 /24 stages and edges added. Across all research packets the packet adds nothing
once the MC.7 citations are gone; a large pre-existing component through T6:comparison (B5, C5, …,
PR.8, CP.4, P8, T1, T2) exists without this packet and is reported below. The prerequisite graph of
the packet is acyclic, and no T6:log-sites node depends on a T6:comparison node. The node citations
imply new stage edges into T6:log-sites from ClassicalAdicEtaleCohomology H0, AdicSpacesPartII R3,
AdicEtaleGeometry A4 and PerfectoidSpaces P0, P1, P3, and into T6:comparison from
ArithmeticLocallySymmetricSpaces ALS.1; all are acyclic and recorded in a restructure entry with the
dependency lines (D4, D6 and C3.general serve only Theorem 4.4.40 and can leave T6:comparison).

## 10. Questions for the orchestrator and work for the revision

1. **Regenerate the reader** `research/blueprint/readmes/HodgeTateAndCanonicalSubgroups--T6.md` from
   this packet. It mirrors all 62 submitted node statements verbatim; only 1 of the 68 corrected
   statements occurs in it. Requests, gaps, restructure entries, coverage and source issues also
   changed. Reviews cannot edit readers; either route `BP-HodgeTateAndCanonicalSubgroups--T6~2` to
   do it, or let review jobs resync the reader when they correct a packet in place.
2. **Apply FIX-RT-AREA-padic-1** (findings /4, /23, /24): the atlas texts of T6 and T6:comparison,
   BCGP-25 route 23, and the P8:primitive and T6:log-primitive stages. After that the three P8
   citations become P8:primitive node citations.
3. **Liu–Zhu ownership.** PAPER-LIU-ZHU-17 route 8 (the ordinary prefix of T6:comparison) is the
   direction its review endorsed but did not accept. Once it is, T6 should plan the interior
   Riemann–Hilbert package (Liu–Zhu Theorems 1.2, 2.1, 3.8, 3.9, Corollary 3.12) as nodes, which
   closes the largest remaining gap.
4. **CM special points.** Blasius's theorem and [IIK21] need an owner that does not depend on T6;
   MotivesAndAlgebraicCycles MC.7 lies downstream of T6 through B5–C5–M6–R28.
5. **Consumers citing whole stages.** B5, S3, O8, CP.6 and S6 cite the stage T6:comparison; with the
   node ids now available (section 4) they can cite exact nodes, which would also break the large
   pre-existing cycle through T6:comparison. B5's compact-support request needs Lan–Liu–Zhu
   (arXiv:1912.13030) as a source somewhere; it is not a T6 source.
6. **Suggested file.** The revision should extend typed coverage where an honest signature exists
   (theorem statements need the supplier carriers), keeping the generator so that the file stays in
   step with the packet.
7. **Normalisation.** The packet uses BP's homological normalisation (W_p of the standard
   representation is H₁(A,Q_p)) throughout; DLLZ-RH (5.5.2) uses the contragredient one. T1 and T2
   should state the same convention when they are planned.

## Appendix: per-node record

The same notes are in the packet's `review.checked`.

- **T6:log-sites/log-adic-space** (corrected). Checked against DLLZ-adic Convention 2.2.1, Definition 2.2.2(1)-(10), Lemma 2.2.4, Remarks 2.2.3, 2.2.5-2.2.6 and Example 2.2.7 (pp. 7-9). Morphisms are arbitrary morphisms of adic spaces (not 'adic maps'); added associated log structure, characteristic, integrality/saturation, exactness and the stalk criterion for strictness; the coherent/fine/fs clause moved to integral-adic-chart, where DLLZ define it via charts (Definition 2.3.5); stated the analytic specialisation forced by the A1 étale site; sources replaced. Second reading: (low) Exactness is restated on characteristic stalks. (low) The match says that part (8) defines exactness on characteristic stalks. Added the stage CrystallineCohomology:CR.5:log-algebra with a request: its log-structure, associated-log and pullback nodes are stated for schemes and must be stated for an arbitrary ringed site.
- **T6:log-sites/toric-log-adic-space** (added). Added by the review. Second reading: (low) Dropped hypothesis: case (1) of Lemma 2.2.13 is 'analytic and strongly noetherian'.
- **T6:log-sites/integral-adic-chart** (corrected). Checked against DLLZ-adic Definition 2.3.1, Remarks 2.3.2-2.3.4, Definition 2.3.5, Lemmas 2.3.6-2.3.7, Proposition 2.3.11, Propositions 2.3.13 and 2.3.21-2.3.22 and Definition 2.3.19 (pp. 12-18). The integral-image condition and characteristic formula are right; added the strict-toric-morphism characterisation, coherent/fine/fs log adic spaces (moved here from log-adic-space), Proposition 2.3.11, morphism charts and their existence; replaced the unclear acceptance item; added the missing toric-log-adic-space prerequisite; sources replaced. Second reading: (low) Remark 2.3.2 identifies O⁺-integral θ with log morphisms to Spa(R⟨P⟩,R⁺⟨P⟩) only when that space is étale sheafy, because P^log is defined only then (Definition 2.2.17). (low) This item drops the same étale-sheafiness hypothesis of Remark 2.3.2 as the statement does. Added the stage CrystallineCohomology:CR.5:log-algebra with a request for ringed-site charts and characteristic monoids.
- **T6:log-sites/divisorial-analytic-log** (corrected). Checked against DLLZ-adic Examples 2.3.16-2.3.17 (pp. 16-17) and Example 3.1.13 (p. 25). DLLZ need X normal (smooth for charts) over any nonarchimedean field and allow étale-local normal crossings divisors; dropped the characteristic-zero/SNC restriction, made the integral-image rescaling explicit, added the maximality of U, smooth toric charts and log smoothness; replaced stage prerequisites R1/R4 by exact supplier nodes; added a discriminating non-example; sources replaced.
- **T6:log-sites/saturated-adic-products** (corrected). Checked against DLLZ-adic Proposition 2.3.23, Remarks 2.3.24-2.3.30, Convention 2.3.31, Proposition 2.3.32 and Lemma 2.3.33 (pp. 18-21). The statement now gives the exact existence condition (underlying fibre product exists), the chart models, the functoriality remarks and the four-point lemma that the locator bundled but the statement omitted; added exact R0 supplier nodes and toric-log-adic-space; made the root-cover test precise (n invertible, μ_n⊂k); sources replaced. Second reading: (low) One sentence mixes two settings and clashes in notation.
- **T6:log-sites/log-smooth-chart-criterion** (corrected). Checked against DLLZ-adic Definition 3.1.1, Remark 3.1.2, Propositions 3.1.3-3.1.7, Proposition 3.1.10, Corollary 3.1.11 and Definition 3.1.12 (pp. 21-25). Log smoothness is defined by the chart condition (not proved 'intrinsic'); the statement now separates the definition from Proposition 3.1.4 (injective, torsion-free charts), lft-ness, base change, composition and the strict case, and adds toric and smooth toric charts, which downstream nodes use and no node planned; proof steps now follow DLLZ's proofs; exact R0 suppliers and toric-log-adic-space added; sources replaced.
- **T6:log-sites/continuous-log-derivation** (corrected). Checked against DLLZ-adic Definitions 3.2.1-3.2.2 and Remark 3.2.3 (p. 26). The derivation conditions are correct; added the pre-log and log Huber ring definitions (Definition 3.2.1, not planned elsewhere), the B-module structure and the trivial-log case; replaced the unused log-adic-space prerequisite by CR.5 associated-log and Huber pairs; added API items and a trivial-log characterisation test; clarified the boundary_value test; sources replaced. Second reading: (medium) The base data are ill-posed.
- **T6:log-sites/continuous-log-differentials** (corrected). Checked against DLLZ-adic Definition 3.2.4, (3.2.5)-(3.2.8), Proposition 3.2.9, Lemma 3.2.10, Theorem 3.2.18 and Proposition 3.2.25 (pp. 26-33). The tft condition (finite generation of N^gp/((f♯M)^gp β⁻¹(B×))) and the pre-log setting were missing; the locator cited Definition 3.2.14 (formal log smoothness) instead of the construction; added the noetherian-type hypothesis implicit in DLLZ's use of Huber (1.6.2), API for the first fundamental sequence and the toric computation, and exact R0 suppliers in place of the R3 stage; sources replaced.
- **T6:log-sites/log-differential-descent** (corrected). Checked against DLLZ-adic Definition 3.3.1, Constructions 3.3.2-3.3.4, Lemmas 3.3.3, 3.3.5, Proposition 3.3.7, Lemma 3.3.15, Proposition 3.3.16 and Theorem 3.3.17 (pp. 34-40). Corrected: the sheaf needs coherent log adic spaces; Proposition 3.3.7 is base change along arbitrary cartesian squares in the coherent/fine/fs categories, not log-étale base change, and gives no conormal or transitivity sequence (that is Theorem 3.2.18 globalised in 3.3.17(1)); the formal-smoothness equivalence is Proposition 3.3.16, not Theorem 3.3.17; added 3.3.17(4)-(5) and the rank formula; locator extended to p. 40; sources replaced. Second reading: (low) The step says the gluing is over 'finite étale covers'.
- **T6:log-sites/analytic-log-de-rham** (corrected). Checked against DLLZ-adic Definition 3.3.19 (p. 40), DLLZ-RH Example 2.1.2 (p. 10), Definitions 3.1.6-3.1.7 (pp. 23-24), §3.4 (3.4.1) (p. 33) and Theorem 3.2.3(4) with the proof of Corollary 3.5.7 (pp. 25, 39-40). The residue is defined in DLLZ-RH §3.4, not at the cited Corollary; residues are along irreducible components of a normal crossings divisor, the pullback formula sums over components with multiplicities m_WZ, and Definition 3.1.7(4) asks no continuity (it is automatic for coherent modules); locator and statement corrected, exact R3 suppliers added; sources replaced. Second reading: (medium) The claim that the components of an R4 smooth pair are smooth is false. Dropped CrystallineCohomology:CR.5/log-connection (the crystalline notion on a PD envelope); the analytic log connection is defined here.
- **T6:log-sites/kummer-etale-morphism** (corrected). Checked against DLLZ-adic Definitions 4.1.1–4.1.2, Lemmas 4.1.11, 4.1.13, Corollary 4.1.9 and Propositions 4.1.14–4.1.15 (pp. 41–46). The source defines Kummer maps by étale-local Kummer charts (not by a stalk condition) with the cokernel order invertible in O_Y; the statement now follows that, records the stalk and log-étale characterisations, cancellation and openness, and adds the cancellation input (Theorem 3.3.17) as a prerequisite.
- **T6:log-sites/kummer-root-covers** (corrected). Checked against DLLZ-adic Definitions 4.1.5, 4.1.8, Proposition 4.1.6, Lemma 4.3.2 and Lemmas 4.2.5–4.2.6. The source chart is torsion-free (not necessarily sharp) for X^{1/n}; the domination of Kummer covers by root covers is Lemmas 4.2.5–4.2.6, not rigid Abhyankar (citing it created a cycle with rigid-abhyankar, which depends on this node); statement, proof, strictify and tests corrected, Galois/Čech/refinement API added. Second reading: (low) The test does not require n to be invertible in k. Added toric-log-adic-space: X⟨(1/n)P⟩ is a monoid-algebra log adic space.
- **T6:log-sites/kummer-ramification-index** (corrected). Checked against DLLZ-adic Definition 4.1.12 (p. 44) with Lemmas 4.1.10–4.1.13: the index is the smallest positive integer annihilating the group cokernel (the exponent, not the order), as the node says. Added the global index (lcm, when defined) and the invertibility of the local index, and replaced the proof sketch, which only cited Lemma 4.1.13, by the actual argument (exactness of Kummer maps gives strictness; strict Kummer étale charts are isomorphisms).
- **T6:log-sites/kummer-etale-site** (corrected). Checked against DLLZ-adic Definition 4.1.16, Remarks 4.1.17–4.1.18, Theorem 4.3.1, Corollary 4.3.3, Propositions 4.3.4–4.3.5 and the opening of §4.5. Statement made exact (representability holds for Mor_X(−,Y) for every Y→X, Rε_*O, ε_*M, generating covers, functoriality f_két); the vague non-example test was replaced in substance by a concrete rank-two-point family, and two api items and one computation test were added. Second reading: (low) The identity k⟨S⟩^{μ_n}=k⟨S^n⟩ and the description of D×_D D as μ_n copies hold only when n is invertible in k. (low) Read literally, the set {|T|<1} contains the rank-two point with |T| infinitesimally below 1, which contradicts 'miss'.
- **T6:log-sites/kummer-coherent-acyclicity** (corrected). Checked against DLLZ-adic Definition 4.3.6 and Theorem 4.3.7 (pp. 55–56): the two alternatives are faithfully kept. The statement now defines analytic coherent and coherent O_{X_két}-modules (no other node owns Definition 4.3.6), and the vague field-case proof step was replaced by the source argument (group cohomology of a finite group of invertible order on a k-vector space, then ε_ét).
- **T6:log-sites/finite-kummer-descent** (corrected). Checked against DLLZ-adic Propositions 4.2.7–4.2.8, Construction 4.4.3, Propositions 4.4.7 and 4.4.9, Theorems 4.4.12 and 4.4.15, Corollaries 4.4.13, 4.4.18 and 4.4.22. Added the Kummer-étale locality of log smoothness/log étaleness/Kummer étaleness (used in the proof of Theorem 4.4.12, owned by no node) and the strictly local computation of π₁^két (needed by the new higher-direct-image node and geometric-boundary-monodromy); fibres are finite π₁-sets, and the module form is marked as a formal consequence.
- **T6:log-sites/kummer-etale-higher-direct-images** (added). Added by the review.
- **T6:log-sites/rigid-abhyankar** (corrected). Checked against DLLZ-adic Proposition 4.2.1 and Lemmas 4.2.2–4.2.3 (pp. 47–49) and Example 2.3.17. The source allows any normal crossings divisor (étale locally SNC) and a finite étale surjective h; it adds the affinoid basis statement; the splitting after X^{1/d!} is local (Lemmas 4.2.2–4.2.3). The proof extends globally by [Han20] and checks Kummer étaleness locally, so finite-kummer-descent was removed from the prerequisites and the external inputs [Han20], [Lüt93], [Bar76] are named.
- **T6:log-sites/boundary-local-system-extension** (corrected). Checked against DLLZ-adic Theorem 4.6.1, Lemmas 4.6.2 and 4.6.5 and Corollary 4.6.7 (pp. 68–70). Added the omitted hypothesis k⁺=O_k, replaced SNC by normal crossings as in the source, marked the extension of Corollary 4.6.7 from F_p to torsion coefficients, replaced the self-referential proof step by the source argument, and added the inputs it uses (root covers, the new higher-direct-image node, the site).
- **T6:log-sites/pro-kummer-presentations** (corrected). Checked against DLLZ-adic §5.1 opening, Definition 5.1.1 and Lemma 5.1.4 (pp. 70–71). Statement completed with Definition 5.1.1(1)/(3) and the stability, openness and finite-limit facts of Lemma 5.1.4; the vague non-example test was made concrete (shrinking discs, excluded by openness of pro-Kummer étale maps); api items for composition, openness and pro-finiteness added; Corollary 4.1.9/Proposition 4.1.14 owner added as prerequisite.
- **T6:log-sites/corrected-pro-kummer-covers** (corrected). Checked against DLLZ-adic Definition 5.1.2(1)–(3), Lemma 5.1.4(8) and the bibliography: DLLZ's covering definition already contains the transfinite tower condition and cites [Sch16], Scholze's corrigendum; 'corrected' refers to that corrigendum and is not DLLZ's word, which the node now says. Added the omitted condition U_μ∈X_prokét, the empty-limit convention, the composition argument (ordinal concatenation, implicit in DLLZ), and replaced the meta-level non-example by a concrete family; one test and one api item added.
- **T6:log-sites/pro-kummer-etale-site** (corrected). Checked against DLLZ-adic §5.1 opening, Definition 5.1.2, Lemma 5.1.4, Proposition 5.1.5 and the opening of §5.2 (pp. 70–73). The coverings are exactly those of Definition 5.1.2 (a pretopology), the qcqs statements of Proposition 5.1.5 are now listed, and the trivial-log comparison is marked as a consequence of the definitions (not a DLLZ statement); kummer-etale-site added as a direct prerequisite for ν. Added DLLZ-adic Definitions 5.1.9–5.1.10 and Proposition 5.1.12 (pro-finite Kummer étale objects over connected X ≃ profinite π_1^két-sets), used by Lemma 5.2.3 and Proposition 6.1.1, with an API item, a test, proof step, sources and prerequisites (Corollary 4.4.18 via finite-kummer-descent; profinite G-sets supplier).
- **T6:log-sites/log-site-projections** (corrected). Checked against DLLZ-adic Propositions 5.1.6–5.1.7 and Corollary 5.1.8 (p. 72). The first two sentences match; the vague last sentence ('combine ν with ε … and with restriction to the boundary complement') was replaced by the precise composite of Corollary 4.6.7 with Proposition 5.1.7, and the proof sketch now follows the source. Added DLLZ-adic Proposition 5.2.1 (ν⁻¹ commutes with derived pushforward along qcqs morphisms), used by relative-log-comparison through DLLZ-RH, to the statement, proof sketch, acceptance and sources.
- **T6:log-sites/all-root-toric-tower** (corrected). Checked against DLLZ-adic Proposition 3.1.10/Definition 3.1.12, Lemma 5.3.4, §6.1 (pp. 81–82, (6.1.3)–(6.1.5), Lemma 6.1.6) and DLLZ-RH §2.3 and (3.3.4). Restated the three towers with the source's indexing, Galois groups and character decomposition; made the perfectoid hypothesis on k explicit (the source omits it, see sourceIssues); added the toric-chart existence statement, which no node owned; dropped almost purity (not used) and added the chart and perfectoid-covering suppliers; sources replaced.
- **T6:log-sites/log-affinoid-perfectoid** (corrected). Checked against DLLZ-adic Definition 5.3.1, Remarks 5.3.2–5.3.5 and Lemmas 5.3.6–5.3.8 (pp. 74–76). Statement kept; made the uniformization/completion convention and the Q_p simplification of Remark 5.3.2 explicit, tightened the non-example to the presentation level, added the qcqs and realization-functor API items, and added the uniformization and Kummer root-cover (Lemma 4.2.5, used in Lemma 5.3.8) prerequisites; sources replaced. Second reading: (low) As written the test is false for n=1, which is prime to p: every monoid is 1-divisible, so condition (4) of Definition 5.3.1 holds for n=1.
- **T6:log-sites/log-perfectoid-basis** (corrected). Checked against DLLZ-adic Lemmas 5.3.7–5.3.8 and Propositions 5.3.11–5.3.13 (pp. 76–78). Restated the four bundled results exactly (fibre products rather than 'finite products used in the source', the topos equivalence of Lemma 5.3.8, the basis B of Proposition 5.3.13); replaced the prerequisite rigid-abhyankar (Proposition 4.2.1 is for smooth rigid pairs and is not used) by kummer-root-covers (Lemma 4.2.5); added the toric tower (Lemma 5.3.4) and the perfectoid universal-cover supplier; Scholze's inputs to Proposition 5.3.13 (F_p-acyclicity of the affinoid perfectoid Û_∞ and the pro-étale/étale comparison of his Corollary 3.17(i)) come from PerfectoidSpaces:P3/etale-almost-acyclicity and P3/etale-site-tilting-equivalence and the H0 request, not from PadicHodgeTheory:P8, which T6:log-sites may not cite; sources replaced.
- **T6:log-sites/completed-structural-log-sheaves** (corrected). Checked against DLLZ-adic Definition 5.4.1 and Proposition 5.4.2 (pp. 78–79). Added the missing Ô^♭=lim_Φ Ô, corrected the monoid-sections formula to every pro-Kummer étale presentation (not only perfectoid ones), made the constant_point test precise, added a trivial-log compatibility test, a monoid-sections API item and the kummer-etale-site prerequisite; sources replaced.
- **T6:log-sites/log-perfectoid-almost-acyclicity** (corrected). Checked against DLLZ-adic Theorems 5.4.3–5.4.4 (pp. 79–81). Restated parts (1)–(5) of Theorem 5.4.3 and Theorem 5.4.4 exactly; removed the clause about finite locally constant Z_p-sheaves, which is not in these theorems (it is Proposition 5.3.13/Lemma 6.3.3, owned elsewhere); added the almost Čech criterion supplier used for the sheaf property; sources replaced.
- **T6:log-sites/kummer-padic-local-systems** (corrected). Checked against DLLZ-adic Definition 6.3.1 (p. 88): statement faithful. Added the locally noetherian fs hypothesis, a stalk API item (used by Definition 6.3.7) and a test that torsion systems rationalize to zero; replaced the prerequisite pro-kummer-etale-site (the definition lives on X_két) by kummer-etale-site; sources replaced. Second reading: (low) Misdescribes Definition 6.3.7.
- **T6:log-sites/completed-kummer-local-systems** (corrected). Checked against DLLZ-adic Definition 6.3.2 and Lemma 6.3.3 (p. 88). Added the definition of Ẑ_p- and Q̂_p-local systems, stated the equivalence for all Z_p-local systems and the vanishing R^i lim_n ν⁻¹(L_n)=0 as sheaves on X_prokét (it was restricted to the basis), recorded only what the source says about rationalization, and added the derived-limit and rationalization API items; sources replaced. Added DLLZ-adic Lemma 6.3.6 (completed Q̂_p-local systems under strict closed immersions on log affinoid perfectoid objects) as part (3), with an API item, proof step, sources and the prerequisites it needs (Theorem 5.4.4, Proposition 5.4.5 via log-perfectoid-almost-acyclicity; Ô via completed-structural-log-sheaves).
- **T6:log-sites/geometric-boundary-monodromy** (corrected). Checked against DLLZ-adic Definition 6.3.7, Example 6.3.8 and Lemma 6.3.11 (pp. 89–90), with Corollary 4.4.22. Made the setting explicit (normal crossings pair of Example 2.3.17, Q_p-local system on X_két, every log geometric point over every geometric point of D), recorded the identification π_1^két(X(ξ))≅Ẑ′(1)^J, and added the divisorial log structure prerequisite; sources replaced. Added the per-component notion (unipotent/quasi-unipotent geometric monodromy along an irreducible component Z, via Example 6.3.8, Lemma 6.3.11 and Remark 6.3.13) needed for n_Z and Res_Z in log-rh-pullback, with API item unipotent_along, a componentwise test, sources and uses. Second reading: (medium) Dropped hypothesis: the claimed equivalence 'Q_p-local system on X_két, equivalently on U_ét' comes from Corollary 6.3.4, which is stated in the setting of Theorem 4.6.1 and needs char(k)=0 and k⁺=O_k. (medium) π_1^két(X(ξ))≅Ẑ′(1)^J with J = set of global components meeting at ξ is only valid in the strict setting of Example 6.3.8 (each X_J smooth and geometrically connected). (low) Same non-strict issue in the per-component reformulation: at a self-intersection point of Z there is no single 'factor indexed by Z'; (low) Misdescribes the proof of Lemma 6.3.11. (low) The test is false when char k=2. (medium) The test is false as written.
- **T6:comparison/toric-kummer-cohomology** (corrected). Checked against DLLZ-adic §6.1: Proposition 6.1.1, Lemmas 6.1.6–6.1.11 and the proof on pp. 84–85. The node's base field is now the one the proof needs (perfectoid of characteristic zero over Q_p with all roots of unity, k⁺=O_k) instead of an algebraically closed one, with the source's omission recorded as a source issue; restated Lemma 6.1.7 with its coefficients; rewrote the proof sketch along the source and added the Kummer-descent, site-projection and almost-descent inputs; sources replaced. Second reading: (low) Notation clash changes the content of part (3): the statement fixes n=dim V, then states Lemma 6.1.7 for k⁺/p^n-modules, so read literally (3) is only asserted for the exponent p^{dim V}. (low) Acceptance item is not checkable as written: 'the prescribed almost torsion' is not what Lemma 6.1.7 gives (it gives exact annihilation by ζ_m−1, not an almost statement), and 'retains its exterior cohomology' names no module, so the item cannot fail.
- **T6:comparison/proper-log-almost-finiteness** (corrected). Checked against DLLZ-adic Theorem 6.2.1(1), Lemma 6.2.4 and the proof on pp. 86–87. Corrected the ideal of almost mathematics (the maximal ideal of O_k, not of k⁺; the proof reduces to k⁺=O_k), made the residue-characteristic-p hypothesis explicit, added the reduction step to k⁺=O_k and its prerequisites (log perfectoid basis, toric charts); sources replaced.
- **T6:comparison/log-primitive-comparison** (corrected). Checked against DLLZ-adic Theorem 6.2.1(2) and its proof (pp. 85, 87). Statement kept, residue characteristic p made explicit; proof sketch rewritten along the source (Artin–Schreier sequence on the tilted sheaf, Scholze 2013 Lemmas 2.12 and 3.18); prerequisites now list the tilted structure sheaf, the basis and the site projection that the proof uses, and drop completed-kummer-local-systems, which the F_p-statement does not use; sources replaced. Second reading: (low) The match says the node states Theorem 6.2.1(2) 'with the same hypotheses', but the node adds residue characteristic p (source issue on Theorem 6.2.1, E5), so the match misdescribes the relation.
- **T6:comparison/log-cohomology-finite-vanishing** (corrected). Checked against the last paragraph of DLLZ-adic Theorem 6.2.1, its proof (p. 87), Remark 6.2.2 and Corollary 6.2.3 with proof (pp. 85–86). The 2 dim X bound is stated for the normal crossings case of Example 2.3.17 (not only SNC), the base field of Corollary 6.2.3 is made explicit, and the proof of the bound (Proposition 6.1.1 and the cohomological dimension of X_an) is cited with its prerequisites; sources replaced.
- **T6:comparison/proper-padic-boundary-cohomology** (corrected). Checked against DLLZ-adic Corollary 6.3.4 (p. 88), its setting (Theorem 4.6.1, Examples 2.3.16–2.3.17) and Remark 6.2.2; E1 confirmed (no properness anywhere in the ambient setup). The node now keeps the source's generality (normal crossings, any complete extension of Q_p rather than a p-adic field), adds properness for the finiteness and for the comparison with lim_n H^i, and states which parts hold without properness; prerequisites now include the definition node and the site projection; sources replaced.
- **T6:comparison/kummer-proper-pushforward-local-systems** (added). Added by the review. Second reading: (low) The hypothesis text asserts, without source or argument, that properness of f alone does not make R^if_két,*(L) lisse (i.e.
- **T6:comparison/constant-log-periods** (corrected). Checked against DLLZ-RH Definition 2.2.3, Proposition 2.2.4, Remark 2.2.5 and Corollaries 2.2.6–2.2.7 (pp. 11–12). The statement now records the source's base (X over Spa(Q_p,Z_p)), the arbitrary local generator t (the cyclotomic t is only chosen in (2.3.2)), the evaluation and acyclicity on log affinoid perfectoid objects (Proposition 2.2.4, needed by S6), and keeps Corollary 2.2.6's roots-of-unity hypothesis for the Tate-twisted graded pieces; API, tests, prerequisites and sources were sharpened.
- **T6:comparison/structural-log-period-plus** (corrected). Checked against DLLZ-RH (2.2.8)–(2.2.9) and Definition 2.2.10(1) (p. 13), with the boundary reduction on p. 18. The source defines OB⁺_dR,log for any locally noetherian fs X over Spa(k,k⁺) (k of characteristic 0, residue characteristic p), not only over p-adic fields; the hypotheses, the exact relation, θ_log, the presheaf on log affinoid perfectoid objects and the algebra structures are now stated, with added API (algebra structures, filtration, functoriality) and sharpened tests.
- **T6:comparison/structural-log-period-complete** (corrected). Checked against DLLZ-RH Definition 2.2.10(2)–(3), the note after it and Remark 2.2.11 (p. 13). Added the exact limit formula, Fil⁰ as a sheaf of rings with OB_dR,log=(Fil⁰)[t⁻¹], independence of t, the source's 'not equal' wording, the constant-period prerequisite and API items; tests kept with a precise trivial-log test.
- **T6:comparison/structural-period-connection** (corrected). Checked against DLLZ-RH (2.2.13)–(2.2.17) (p. 14) and (2.4.3)–(2.4.4) (p. 21). The statement now gives the uniqueness on S_{i,r}, the (ker θ_log)-transversality, the three extensions, the general base of the definition, and writes the coordinate formulas with δ(a_j); integrability (used by the source in §3.3 without a separate statement) is proved in the sketch. Added the direct prerequisites structural-log-period-plus and log-differential-descent, and API for Leibniz, linearity and the relative connection.
- **T6:comparison/toric-structural-period-model** (corrected). Checked against DLLZ-RH §2.3 (Lemmas 2.3.7, 2.3.11, 2.3.12, (2.3.6), (2.3.14), Proposition 2.3.15 and the remark after its proof, Corollaries 2.3.17 and 2.3.20, pp. 15–20). The source works with any toric chart P=P̄⊕Q (not only smooth/free charts) strictly étale over a stratum E, and n=rank P^gp; the statement now records this, the presheaf-level evaluation Ŝ_i≅OB⁺_dR,log(U) on log affinoid perfectoid U (needed by S6), and the stratum compatibility. The connection node was not an input of these results and was replaced by the actual inputs.
- **T6:comparison/log-poincare** (corrected). Checked against DLLZ-RH Remark 2.4.1 and Corollaries 2.4.2 and 2.4.6 (pp. 20–22). The statement now lists the four parts of Corollary 2.4.2 (including the Tate-twisted graded complex) and the relative version with its filtered strictness; the relative first term must be the filtration-completed tensor product (the printed uncompleted one fails exactness, reported as a source issue). Added the connection, gr B_dR, differential-basis, chart and formal Poincaré inputs to the prerequisites.
- **T6:comparison/log-faltings-extension** (corrected). Checked against DLLZ-RH Corollary 2.4.5 (p. 21) and its inputs Corollaries 2.2.6 and 2.4.2. The statement now has the hypothesis of Remark 2.4.1, the module structure, both maps and the local splitting; the identification gr¹B_dR⁺≅Ô(1) over a p-adic base needs a localization not spelled out in the source (reported as a source issue). Added the Poincaré-lemma and differential-basis prerequisites.
- **T6:comparison/bdr-coefficient-sheaves** (added). Added by the review.
- **T6:comparison/filtered-log-connection** (corrected). Checked against DLLZ-RH Definitions 3.1.6–3.1.7 and Lemmas 3.1.8–3.1.9 (pp. 23–24), with the target category of Theorem 3.2.3(1). The statement now gives the four notions of Definition 3.1.7 exactly (B_dR-linear connections, log t-connections with the modified Leibniz rule, log Higgs bundles with the (−1) twist, coherent filtered connections), the filtration by locally free O_X⊗̂_kB_dR⁺-submodules, and Lemma 3.1.8's condition Fil^r=t·Fil^{r−1}; the coefficient sheaves of Definition 3.1.1 and Lemma 3.1.4 are moved to a new prerequisite node bdr-coefficient-sheaves. Dropped CrystallineCohomology:CR.5/log-connection (the crystalline notion on a PD envelope).
- **T6:comparison/log-tower-decompletion** (corrected). Checked against DLLZ-RH Definitions A.1.2, A.1.6, A.1.9, Theorems A.1.8, A.1.10, Propositions A.2.1.1, A.2.2.1, A.2.3.3, Theorems A.2.1.2, A.2.2.3, A.2.3.4 and Remarks A.1.3, A.2.1.3, A.2.2.4 (pp. 66–76). A.2.1.2 and A.2.2.3 are decompletion-system statements (stable decompletion is Propositions A.2.1.1 and A.2.2.1); the statement now defines decompletion systems, lists the three towers with their exact data and hypotheses, and states that the deformation towers are only weakly decompleting. Added the toric character-cohomology input (DLLZ-adic Lemma 6.1.7). Second reading: (medium) Plainly missing internal input.
- **T6:comparison/log-oc-pushforward** (corrected). Checked against DLLZ-RH §3.2 setup, the definition of Z on p. 28, Proposition 3.3.3, Lemmas 3.3.8, 3.3.15, 3.3.16 and Remarks 3.3.12, 3.3.14 (pp. 22, 25, 28–31). The source allows any normal crossings divisor (not only SNC) and any perfectoid K containing k_∞, the statement covers Z (X or an open subspace of a smooth stratum) with rank rk L only for Z=X, and the module is over O_Z⊗̂_kK (printed gr⁰(O_X⊗̂_kB_dR), reported as a misprint). Added the B_dR-coefficient, OC_log, local-system and almost-acyclicity prerequisites.
- **T6:comparison/log-riemann-hilbert** (corrected). Checked against DLLZ-RH §3 opening (p. 22), eq. (3.2.2), Theorem 3.2.3(1) (p. 25) and §3.3 (pp. 27–28). Corrected the base: K is any perfectoid field containing k_∞ (not the completion of an algebraic extension), k is a p-adic field in the DLLZ sense (perfect residue field, not only finite over Q_p), D is normal crossings; spelled out the 𝒳-bundle, filtration and rank; made LogRH.grade avoid the forward reference to H_log; sharpened the constant test; added API for RH⁺_log, exactness and open restriction; replaced the sources. Added bdr-coefficient-sheaves (Lemma 3.1.4 and the B_dR-coefficient bundles).
- **T6:comparison/log-higgs-functor** (corrected). Checked against DLLZ-RH Theorem 3.2.4(1) (pp. 25–26), Lemmas 3.1.8–3.1.9 and Definition 3.1.7(3) (p. 24), and §3.3. Added the rank and the identification with µ′_*(L̂⊗OC_log) (Proposition 3.3.3), the log-oc-pushforward prerequisite, API for rank/OC description/Higgs complex, and replaced the vague residue test by a precise unipotent rank-two computation; replaced the sources.
- **T6:comparison/log-regularity-and-extension** (corrected). Checked against DLLZ-RH Propositions 3.4.16–3.4.17 and their proofs (pp. 37–38). The statement matches; made the setting explicit (smooth X over the p-adic field k, normal crossings D, residues of a torsion-free sheaf read off its locally free locus), rewrote the proof sketch to follow the source (completed stalks via AB01/ABC20, bidual, matrix argument, Lemma 3.1.4 for the 𝒳 variant), added the filtered-log-connection prerequisite for that variant, and replaced the sources.
- **T6:comparison/normalized-log-residues** (corrected). Checked against DLLZ-RH Theorem 3.2.3(2) (p. 25), Lemmas 3.4.3, 3.4.7, 3.4.11–3.4.13, Remark 3.4.8 and the proof of Theorem 3.2.12 (pp. 33–39). The geometric-irreducibility hypothesis belongs only to RH_log; the D_dR,log clause (Theorem 3.2.7(2), Proposition 3.4.15) needs the arithmetic functor, which depends on this node, so it is moved to arithmetic-log-de-rham. Made the local residue formula precise, followed the source proof, added the residue and toric-model prerequisites, and replaced the sources. Added completed-kummer-local-systems (DLLZ-adic Lemma 6.3.6, used through DLLZ-RH Lemma 3.4.9 in the eigenvalue step) to the prerequisites.
- **T6:comparison/arithmetic-log-de-rham** (corrected). Checked against DLLZ-RH (3.2.6), Theorem 3.2.7(1)–(2) (p. 26), Lemmas 3.3.17–3.3.18, Propositions 3.4.15–3.4.16, Lemma 3.4.18 and Corollaries 3.4.21–3.4.22 (pp. 31–38). Moved here the D_dR,log residue normalization (it needs this construction), stated the Galois-invariant description, the filtration, the adjunction map to RH_log and its de Rham isomorphism; added the decompletion, OC, Higgs and de Rham-sheaf prerequisites, API items for these maps and a non-de Rham test; replaced the sources.
- **T6:comparison/log-rh-pullback** (corrected). Checked against DLLZ-RH Theorems 3.2.3(4), 3.2.4(3), 3.2.7(4) (pp. 25–26), Lemmas 3.5.2–3.5.3 and Corollary 3.5.7 (pp. 39–40); rendered p. 25 to confirm the hypothesis ∑_Z m_WZ n_Z≤1 for every component W of E. Separated the unconditional injectivity (Lemma 3.5.3; the Higgs map is only injective, it has no filtration) from the conditional isomorphism, stated the log-adic setting (normal crossings, h⁻¹(D)⊂E), made the proof follow the source, added the RH, residue and monodromy prerequisites, and replaced the sources.
- **T6:comparison/unipotent-log-tensor** (corrected). Checked against DLLZ-RH Theorem 3.2.12 (p. 27) and its proof (pp. 38–39). Restated the exact source and target categories and the period isomorphisms the proof produces; rewrote the proof sketch to follow the source (nilpotent residues, vanishing of nontrivial characters in (3.3.9), isomorphism (3.3.13), then the LZ17 tensor argument) instead of an extension-uniqueness argument; removed the reversed prerequisite log-rh-pullback (pullback uses this circle of results, not conversely) and added RH, Higgs, arithmetic and de Rham prerequisites; replaced the sources.
- **T6:comparison/proper-log-period-cohomology** (corrected). Checked against DLLZ-RH Theorems 3.2.3(3), 3.2.4(2), 3.2.7(3) (pp. 25–26) and Lemmas 3.5.9, 3.6.1–3.6.4 (pp. 40–42); Lemma 3.6.1 runs Scholze's Theorem 8.4 argument with DLLZ-adic Theorem 6.2.1 as input. Corrected the hypothesis line, which suggested properness is needed only for the arithmetic conclusions: X proper and K the completion of k̄ are needed for every conclusion, the de Rham hypothesis only for the D_dR,log ones. Added the pro-Kummer intermediate comparisons, normal crossings, and the direct inputs log-riemann-hilbert, log-oc-pushforward, constant-log-periods and the de Rham notion; replaced the sources. DLLZ-RH proves no compactly supported version.
- **T6:comparison/relative-log-comparison** (corrected). Checked against DLLZ-RH Theorem 3.2.7(5) (pp. 26–27), the proof in §3.5 (pp. 40–41: (3.5.8), Lemmas 3.5.9, 3.5.11, Corollary 3.5.14) and DLLZ-adic Corollary 6.3.5 (p. 89). Corrected that R^if_két,*L is a Z_p-local system on Y_két (de Rham only on V), recorded D=f⁻¹(E), rewrote the proof to the source route including the Katz residue argument, replaced the non-inputs proper-log-period-cohomology and log-rh-pullback by the actual inputs, and replaced the sources. Added the new node kummer-proper-pushforward-local-systems (DLLZ-adic Corollary 6.3.5) and log-site-projections (Proposition 5.2.1), both cited in the first proof step, to the prerequisites.
- **T6:comparison/canonical-pro-kummer-realizations** (corrected). Checked against DLLZ-RH Proposition 5.2.10 (p. 54), §5.2 (5.2.12)–(5.2.16) and Proposition 5.2.17 (pp. 55–56) and BP §4.4.38 (p. 79). The node now also constructs the p-adic side p-W_dR=D_dR,log(W_p) and the p-adically reconstructed Betti system p-W_B, which nodes 54–56 compare but which no node defined; added the de Rham input (LZ17 Theorem 1.2 as cited on DLLZ-RH p. 55), the D_dR,log prerequisite and API/tests for them. Second reading: (low) Wrong causal claim. (low) Same non sequitur as in the statement. (low) Missing step.
- **T6:comparison/special-point-comparison** (corrected). Checked against DLLZ-RH Proposition 5.4.1 and its proof (pp. 58–60) and the special-point step of the proof of Proposition 5.4.4 (p. 60). Stated the trivial local system and the actions exactly as printed, made the Hodge-filtration clause cite Proposition 5.4.4’s proof (Proposition 5.4.1 itself is only about Betti systems), fixed the page range, and added the realization node and the pullback-to-points input as prerequisites. Second reading: (low) Wrong reason for the triviality step. Removed the MotivesAndAlgebraicCycles:MC.7 citation: MC.7 states no Blasius node and lies downstream of T6:comparison through other packets (a cycle); the CM inputs are the gap 'CM special-point comparison inputs'.
- **T6:comparison/canonical-arithmetic-monodromy** (corrected). Checked against DLLZ-RH Proposition 5.4.5, Remark 5.4.6, Lemmas 5.4.7–5.4.8 (p. 61), §5.5 (Lemmas 5.5.1, 5.5.3, 5.5.6, Corollary 5.5.7, Proposition 5.5.9, pp. 62–64) and §5.6 (Theorem 5.6.1, Lemmas 5.6.5 and 5.6.7, pp. 64–66). Made the statement exact (monodromy of p-W_B on a fixed component through the special-point identification; uniqueness by Borel density), corrected the locator (there is no Lemma 5.6.6) and added the realization, Hodge-tensor and absolute-Hodge inputs used in §5.5 as prerequisites. Removed the MotivesAndAlgebraicCycles:MC.7 citation (cycle through B5–C5–M6–R28; no MC.7 node supplies the input).
- **T6:comparison/canonical-log-period-comparison** (corrected). Checked against BP §4.4.38 (p. 79), DLLZ-RH Theorem 5.3.1 (p. 56), Proposition 5.4.4 (p. 60) and the proof of Theorem 3.2.12(2) (p. 39). Theorem 5.3.1 compares filtered log connections, not period sheaves; the OB_dR,log isomorphism is its composite with the log Riemann–Hilbert period isomorphism of Corollary 3.4.21/proof of Theorem 3.2.12(2), now stated and cited, with the D_dR,log node and canonical-extension descent added as prerequisites. Second reading: (low) Notation clash on µ. Added log-rh-pullback for the Hecke, level and Shimura-data pullbacks.
- **T6:comparison/two-de-rham-lattices** (corrected). Checked against BP Remark 4.4.39 and the text after it (p. 79; page image checked). The filtrations BP intersects are the lattice filtrations Fil^iL=Fil^iB_dR·L of the two lattices; the former wording “de Rham-induced” filtration on M⁰ would give Fil^jM⁰=t^jM by the filtered comparison and a trivial HT filtration, so it was corrected. Added the local argument that M⁰ is a B_dR⁺-lattice (BP asserts it without proof; DLLZ-RH does not state it), its prerequisites, API items for the filtrations and tensor compatibility, and a Tate-line test. Second reading: (low) Vacuous test.
- **T6:comparison/lattice-hodge-tate-filtration** (corrected). Checked against BP text after Remark 4.4.39 (pp. 79–80; page images checked): F_{−j}=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰) and Gr_j(W_p⊗Ô)(j)=Gr^jW_dR⊗Ô, verified on rank-one lattices M⁰=tᵃM (jump at a) and on the Tate line (jump at −1). Made the filtrations those of two-de-rham-lattices, added the canonical comparison and Poincaré lemma as direct inputs of the graded relation, a local-splitting API item, and Tate-line and Siegel tests that fix the sign convention.
- **T6:comparison/canonical-ht-tensor** (corrected). Checked against BP p. 80 (“This construction is functorial with respect to the Hecke action and compatible with the Tannakian formalism”). Made the tensor, dual, unit and exactness statements precise, moved the construction of the P^c_µ-reduction to the new node hodge-tate-parabolic-reduction (which consumers import), and added the lattice and comparison nodes as direct prerequisites. Added log-rh-pullback for the Hecke pullbacks.
- **T6:comparison/hodge-tate-parabolic-reduction** (added). Added by the review.
- **T6:comparison/finite-levi-torsor** (corrected). Checked against BP text after Remark 4.4.39 (p. 80) and the definition of the twisted torsor in §4.4.8 (p. 68); BP’s conventions P^std_µ={lim_{t→∞}Ad µ(t)g exists}, P_µ={lim_{t→0}…} are on p. 49. Verified that M_HT=M_dR×^{µ,Z_p^×}Z_p(1) matches Gr_j(W_p⊗Ô)(j)=Gr^jW_dR⊗Ô (µ acts on Gr^jW_dR by weight −j). Fixed the locator (the cited “Remark 4.4.10” is the paragraph on perfectoid Siegel varieties; the twist is explained in §4.4.8 and §4.4.23), replaced the excerpt from Theorem 4.4.40 by the finite-level sentence, stated the site and parabolics exactly, and added an associated-bundle API item and a graded-compatibility test.
- **T6:comparison/hodge-type-comparison-agreement** (added). Added by the review. Second reading: (medium) Normalization clash. (medium) Too strong. Does not cite MotivesAndAlgebraicCycles:MC.7 (cycle); the CM inputs are a gap.
- **T6/finite-level-canonical-package** (corrected). Checked the boundary against BP §4.4.38–Theorem 4.4.40 (pp. 79–80): the package stops at the finite-level identification M_HT=M_dR×^{µ,Z_p^×}Z_p(1) on S^tor_{K,Σ}; the diamond limit, triviality of G_pet,p over it, π^tor_HT and the pullback statement are Theorem 4.4.40 and stay with S6. Added the P^c_µ-reduction and the Hodge-type agreement (both requested by S6) to the exported package and replaced the generic excerpt.
