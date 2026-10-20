# FIX-PKG-HabiroCohomologyFoundationsPartII~adv1

Issue #11405. Codex, session `codex-0hu66Y`, 2026-10-20.
The claim bot confirmed comment 6291287655 before work began. This run
takes no second job. Baseline: `37aeb044233ad9c5acd8ac89252111b1d4032065`.

**Blocked checkpoint.** All authorized Part II edits and checks are complete.
Family acceptance remains blocked by the outgoing HC edit that none of the
named sibling jobs is authorized to make, as well as the pending sibling
merges below. `review.json` remains `needs_changes`; this checkpoint does
not certify an acyclic family graph or readiness for the upstream draft.

## Finding dispositions

The issue's `~adv` report does not exist. The actual findings are R1–R4 in
`research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md`,
read together with its handoff and the existing design relocation manifest.
Only this handoff and the three authorized Part II package files are edited.

| Finding | Part II change | Supplier verification |
| --- | --- | --- |
| R1: Part I still consumes RT | Receive the absolute 2-inverted spherical E₂ case as `TraceInput.ofSpherical`; preserve the full relative base/branch/R₂/global-amplitude hypotheses in §1.1. Preserve the E₁ ku-counterexample, the absence of a supplied E₂ ku-counterexample and the unproved image-of-J possibility. Explain the Čech limit followed by even-filtered circle fixed points in §1.2, and termwise identity-cover multiplication for a general cover. The perfected-lift criterion remains §2.2, the explicit ℤ[1/2][x] comparison §3.3 and the degree-zero arithmetic exports Layer 4. The independent Nygaard/trace boundary retains completion, twists and syntomic ownership. | Pending Part I fix #11401 (`FIX-PKG-HabiroCohomologyFoundations~adv4`). Its actual outgoing Layer 6 §§6.1–6.5, the trace clause of §8.1 and the trace comparison of §9.15 were checked against these destinations. |
| R2: HC ↔ HR and the unnecessary higher QSeries supplier | No Part II theorem or completion construction is duplicated. The family inventory below records the required relocation of HC §5.5 into HR.2 and the Gaussian-polynomial input from HC.1 to HR §2.13. | #11403 (`FIX-PKG-HabiroRings~adv3`) is submitted in PR #11410, still unmerged at the final audit. The ordinary/derived comparison is actually in **HabiroCyclotomicCompletions**, not in HabiroCohomologyFoundations as the sibling issue's wording suggests. Removing HC's outgoing owner and HR prerequisite needs an additional maintainer assignment; #11403 does not authorize HC files. |
| R3: RT's stale HR.6 étale comparison | All Part II contracts already use Part I §4.21 for QH Corollary 3.13; preserve them, including Layer 4's proof. Current HR.6 scalar extension is not a replacement for that comparison. | Pending RT follow-up #11406 (`FIX-PKG-RefinedTraceMethods~adv3`). The issue names `~adv2`, but #11304 closed before these findings; #11406 explicitly carries R3 and R4. |
| R4: full framed theorem owned twice | Remove local §§3.1–3.2 and their `framedTrace`, `framedTrace_einfty`, `qPDDiagonal`, `framedCech` targets. Import the full framed, all-dimensional theorem, pair coherences, E∞/derived-commutative refinement, q-PD normalization and Čech proof through the exact RT §6.10 contract. Keep the canonical comparison in §3.3, as the issue requests. Remove the diagonal numerator definition and its proofs/example from Suggested.lean. Retarget the toric quotient witness, scope, source remarks and layer dependencies to the supplier. | Pending #11406. The supplier must contain the full theorem and its proof inputs/checks, including prime-two polynomial/perfect-root resolution comparison; its old one-variable example alone is insufficient. |

The `### 3.3` locator is intentionally retained: it is the consumer target
named by the issue and design, while §§3.1–3.2 cease to be local owners.
The surviving layer has no empty placeholders for those deleted subsections.

## Conservation of moved content

| Part I material | Receiving contract or target in Part II |
| --- | --- |
| §6.1 absolute theorem and full relative inputs | §1.1 `TraceInput`, `ofSpherical`, branch-sensitive morphisms and Checks; §1.2 `tracePair`, its four clauses, completed comparison and conditional Eₙ₋₁ structure. Trace existence itself remains RT §§6.9–6.10. |
| §6.2 ku/image-of-J boundary | §1.1 `TraceInput.kuLift` and §1.3 `traceHabiro_kuLiftInsufficient`; QH Lemma 3.3 excludes every pair on the exponent-one perfected quotient, not merely one choice of spherical cover. No E₂ ku-counterexample or image-of-J theorem is asserted. |
| §6.3 E₁ refinement | §1.1 complete lifted augmented cosimplicial data; §1.2 limit-before-fixed-points construction, all-prime Nikolaus comparison and multiplication; §2.3 identity-cover independence. Ordinary preimage on R is not asserted for a general cover. |
| §6.4 perfected lift | §2.2 `perfectedLiftNaive`, completed flat base change and descent, toric x−1 witness; §2.1 distinguishes sufficient spherical exponents from the stronger algebraic higher-power result at 2. |
| §6.5 arithmetic ring export | §§4.1–4.2: periodic KU, genuine finite fixed points, residual-circle homotopy fixed points, spectral divisibility limit, then π₀; all number fields and the separate Δ divisibilities. |
| §8.1 trace example | §3.3 `canonicalFramedTrace_line`, including S[1/2][x], alongside the dimension-zero, tensor-domain, derived-reduction and Laurent controls. |
| §9.15 trace construction/comparison boundary | Scope's independent-construction paragraph and exact prismatic/trace-filtration contracts. Independent Nygaard descent precedes its trace comparison; Δ and its Nygaard completion remain distinct; θ/Witt map equalities are not deduced from object comparisons. |

The outgoing full framed material is recoverable from the baseline Part II
README §§3.1–3.2 and Suggested.lean `DiagonalDividedPowers`; no disposable
scratch file is needed. RT must retain the following mathematical content:

- Every étale framing in every dimension, compatible framed naturality,
  the degree-≤0 comparison map, pullback to the uncompleted pair, all four
  pair clauses and prime-two resolution agreement. The E∞ refinement is
  for the fixed framing; it does not make the coordinate differential an
  ordinary derivation.
- The q-PD diagonal with generators
  δ_q^(e)(x,y) = ∏_{i<e}(x−q^iy)/[e]_q!, its x/y q-derivatives, h and
  q-factorial localization for the λ-expression, the Pochhammer sign/factor
  correction, flatness, arithmetic intersection and base change.
- The filtered framed Čech model, its spherical inputs over each polynomial
  nerve term, the static arithmetic corners, compatibility modulo β,
  the double-complex proof, completed Poincaré lemma and row acyclicity.
- Controls in dimensions 0, 1 and 2 without small-prime inversion for the
  framed theorem; the x² q-Leibniz witness; e=0,1,2 diagonal values,
  q=1 specialization, the q-shift identity and its classical-numerator
  negative control; the sign at e=1, the p-th generator modulo [p]_q,
  and cosimplicial degree zero. These are supplier checks after relocation,
  rather than duplicate Part II targets.

Part I keeps its trace-free higher-power theorem, exponent-one failure,
finite-coefficient arithmetic pullback/rational corner, canonical smooth
construction, algebraic examples and comparison squares. Neither RT's
genuine §4.28/§5.26 inputs nor any algebraic proof is removed here.

## Supplier graph audit

Arrows in the tables are **consumer → supplier**. Let HC denote
HabiroCyclotomicCompletions, HR HabiroRings, I HabiroCohomologyFoundations,
RT RefinedTraceMethods and II this Part II. The desired supplier-first order
is **HC → HR → I → RT → II**. The issue's four-name order omits HC; ordering
I before HR would contradict I's genuine HR inputs. No numerical tier or
claim about all external packages' entire dependency graphs is invented.

| Consumer | Every direct supplier among the five after the required moves | Exact contract |
| --- | --- | --- |
| HC | None | Classical polynomial/topological completion, Taylor and rigidity toolkit. Its consumer table is not a list of construction prerequisites. |
| HR | HC | HC.1 factorial polynomials, Gaussian-factorial divisibility and cofinality; HC.3 Taylor substitution; HC.4 injectivity, cyclotomic arithmetic and rigidity; HC.5 roots and localized coefficients. HC §5.5's derived comparison belongs after HR.2. |
| I | HR; HC | HR.1 arithmetic Λ-bases, HR.2 enhanced completion/tensor, HR.3 coherent finite reconstruction, HR.4 relative q-Witt scalars, HR.5 relative Habiro rings and Taylor maps; HC.3 convergent Taylor re-expansion and Hasse coefficients. No RT or II construction input after R1. |
| RT | HR; I | HR.1, HR.2 and HR.5 scalar/coefficient contracts; I Layers 2–4, especially §4.28 pairs/descent, §4.21 étale identification and §5.26 finite-coefficient pairs. No I trace-existence input and no II prerequisite. |
| II | HR; I; RT | HR.1, HR.2, HR.5, HR.7; I §§1.14/1.16, Layers 2–5, especially §§4.1/4.8/4.21/4.28/5.15–5.26; RT §§6.1/6.9–6.14/7.6/8.8, with syntomic ownership in §8.12. HC §5.3 enters the localized Taylor example through HR.5, not as an independent trace-construction supplier. |

The baseline still has I → RT through §§6.1–6.5, §8.1 and §9.15,
and HC → HR through §5.5, scope and aggregate summaries. These produce
I ↔ RT and HC ↔ HR. The table above is conditional until the sibling
edits are merged and checked; Part II alone cannot remove those edges.

There is also an authorization gap in R2. Issue #11403 permits edits only
to HR's three package files and its handoff. It can receive the comparison
and remove HR's QSeries edge, but it cannot delete the outgoing comparison
or its HR prerequisite from HC. The current open HC jobs are red-team jobs
or their blocked reviews, not an authorized package fix. A maintainer must
assign the outgoing HC edit (README scope, §5.5, Layer 5 summaries and the
closing Lean inventory) before this five-package graph can be certified.
Neither #11401's Part I files nor this issue's Part II files can remove
that HC edge. No second job was claimed and no sibling file was edited.

Every other roadmap supplier edge identified by the independent review
was checked against the actual package contracts and retained below.
Native Mathlib/Tau Ceti declarations are separate from roadmap edges.

| Consumer | Other direct roadmap suppliers |
| --- | --- |
| HC | None. QSeries, HabiroNumberFields, HabiroNahmSeries, ArithmeticQuantumTopology, I and QWittVectors are consumers of HC's toolkit. |
| HR | QWittVectors QW.0–QW.4; PrismaticCohomology PR.0 and torsion-free Frobenius equivalence; EnhancedDerivedSheaves E0/E1/E3/E5:abstract; StableHomotopyKTheory H.5:spectra/H.5:S-delooping/H.6; DerivedDeRhamCohomology DD.1; SolidAnalyticRings SA.1's explicitly conditional full light-solid spectral contract; VStackSheavesAndLisseCategories VS2 abelian comparison; HabiroNumberFields HB.6/HB.7 scalar rings and K₃-indexed lines. The baseline QSeries QM.0 edge in HR §2.13 must be removed by #11403. |
| I | DerivedDeRhamCohomology DD.0–DD.4; EnhancedDerivedSheaves E0/E1/E2/E5 and its enhanced monoidal framework; PrismaticCohomology PR.0–PR.3/PR.6; PerfectoidQuotients Q3; AInfCohomology AI.1/AI.3–AI.5; CrystallineCohomology CR.0/CR.2/CR.4; CohomologyComparisons CP.1/CP.6; AnalyticHabiroStack HS.3 for the explicitly open analytic comparison; current upstream AlgebraicVectorBundles L0B/L2B for the finite-projective/sheaf dictionary. |
| RT | EnhancedDerivedSheaves E0/E1/E3/E5; GeneralizedCohomology G2–G3/G5.4; StableHomotopyKTheory Layer 5 and §§7.6–7.34; TopologicalKTheory T1.6/T2.1/T2.3/T2.5/T3/T4/T5.1; CharacteristicClasses C3/C5/C6.2–C6.3; DGAInfinity Layers 6/8/9; GeneralAlgebraicKTheory §§3.2/3.12–3.14, Layers 5–8, §§10.10–10.11/11.15–11.16/12.10/13.1/13.6–13.7; KTheoryLowDegrees §§3.2–3.7/13.2–13.4; K2SymbolsBrauer §§13.1/13.7/13.12/13.13; DerivedDeRhamCohomology Layers 0–5 and PD; BordismFormalGroups F6.1/F6.5; AInfCohomology AI.0/AI.0:integral/AI.1/AI.3/AI.4/AI.7.2; CrystallineCohomology CR.4; PrismaticCohomology Layer 2; PrismaticCohomologyPartII Layers 3–5; PrismaticCohomologyPartIII §§6.8–6.9/6.28/6.31/7.0; VStackSheavesAndLisseCategories VS2; CohomologyComparisons §3.7 graded Beilinson normalization, supplied through PrismaticCohomologyPartIII §7.0 and named in RT's scope. |
| II | StableHomotopyKTheory §7.32; PrismaticCohomology Layer 0; PrismaticCohomologyPartII §§3.1/3.13–3.16/3.20–3.23; PrismaticCohomologyPartIII §7.0; AInfCohomology §AI.7.2. The former direct q-PD construction input from PrismaticCohomologyPartII §§5.7–5.8 is now part of RT §6.10's proof contract. |

## Adversarial pass

This checks the mathematics and hypotheses, separately from elaboration.
Spectra and enhanced filtered carriers are absent at the pins; their
README checks are not represented by dummy Lean carriers. The three
native definitions have real bodies and their retained tests are proved.

| Statement or interface touched | Instances and negative controls tried | Result and change |
| --- | --- | --- |
| Scope and imported independent Nygaard/trace constructions | Quasiregular semiperfectoid cover versus global THH; Δ versus its Nygaard completion; degree n=0,1 and the Breuil–Kisin twist | Preserve independent Frobenius-divisibility and Postnikov-descent constructions, then compare; retain twists and completion. No θ/Witt map equality follows from the object comparison. |
| `TraceInput`, `forget`, `lifts`, branch-sensitive morphisms and their laws | R=A=ℤ; R=0; mixed E₂/E₁ branches over the same ℤ[x]; identity/composition; maps of rings without lifted diagrams | Valid with all lifted/gluing data. Identity of rings does not compare different branch choices. No new hypothesis-free ring functor is asserted. |
| `TraceInput.ofSpherical` | ℤ[1/2], ℤ[1/2][x] and sphere lifts; ℤ[x] with only an E₂ datum at 2 | First cases admitted; last case outside this constructor and supplied by `ofFramed`. Global cotangent amplitude and bounded torsion remain explicit. Added the absolute constructor and its worked check. |
| `ofEtale`, `ofFramed`, `ofIdentityCover`, `unit` | d=0,1,2; p=2 and odd p; R=0; ℚ[u,v]/(u²,uv,v²) with all p-completions zero | Framed cover at 2 and torsion-free conditions retained. The rational non-lci ring remains excluded by global amplitude; local completion tests alone would accept it. |
| Spherical versus ku/image-of-J boundary | ℤ_p{x}_∞/x, its E₁ ku-lift and failed algebraic deformation; hypothetical E₂ ku-lift or image-of-J input | Preserve only the proved E₁ obstruction. Added explicit limits on E₂ and image-of-J claims; no constructor supplied for either weakening. |
| Local E₁ even filtration and `tracePair_multiplicative` | Identity cover; nontrivial perfect-root cover of ℤ_p⟨x⟩; p=2; n=2 and n=∞ | Take the Čech limit of double-speed truncations, then even-filtered circle fixed points. E∞ on each identity-cover nerve term descends coherently. No ordinary-preimage description on R is inferred for a general cover. E₂ yields E₁, E∞ yields E∞. |
| `tracePair`, its map laws, completion and four clauses | R=A=ℤ, R=0, ℤ[x]; mod-β versus degreewise mod-h; completion of constant filtration | Retain the pullback, whose zero-ring uncompleted filtration is constant ℚ[[h]] and whose completion is zero. The unit quotient is ℤ in nonpositive degrees and zero in positive degrees. No completed object replaces the pair. |
| `E1QuotientExponent` / `quotientLift` boundary | p=2: α=0,1,2,3,4,5,6; p=3: α=0,1,2; zero-length regular sequence | Sufficient ranges unchanged: even α≥4 at 2, α≥2 at odd primes. S/8 stays an E₁ example outside this sufficient tower range. Empty tensor product is T. Existing native example retains four discriminating cases. |
| `E2QuotientExponent` and E₂⇒E₁ | p=2: α=4,6,7; p=3: α=2,3; arbitrary natural p,α for implication | Added a proved native boundary example: reject 4,7 at 2 and 2 at 3; accept 6 at 2 and 3 at 3. The arithmetic implication is valid even outside the prime-only application domain. |
| `perfectedLiftNaive` and the toric q-PD witness | Higher power x² at 2; even x⁴ at 2; odd-prime x²; exponent one; toric x−1; rational local factors | Keep the lift of the perfected base change and completed faithful-flat descent. The x²-at-2 algebraic proof stays Part I; the spherical route supplies no such lift. The x−1 witness uses the normalized q-PD input now supplied by RT §6.10. |
| Imported full framed theorem and resolution comparison | d=0,1,2, p=2, i≤0, i=1,2 and j=0,1,2 | Coordinate powers are h^{max(i−j,0)}; no small prime is inverted for the framed theorem. Require the polynomial/perfect-root resolution comparison and all pair coherences in the supplier. Delete duplicate local owners and native diagonal development. |
| `canonicalFramedTrace_pair`, `_habiro`, `_einfty` | ℤ[x], ℤ[1/2][x], d=0 étale; ℤ[x,y] versus ℤ[1/2][x,y]; Laurent ℚ-torus; arbitrary zero map versus specified counit map | Keep the full common domain. The plane over ℤ fails the canonical small-prime condition, not the framed theorem. Completeness proves equivalence only for the specified map reducing to identity. Pull back completed comparisons to qdR; keep the Laurent distinction and all four pair clauses. |
| Coordinate multiplicative normalization | x²: ∇q(x²)=(1+q)x dx; untwisted Leibniz gives 2x dx; q=1 | Preserve the two-term witness in Layer 3's examples. The E∞ enhancement is transported from RT rather than asserted from a strict product on forms. |
| `TraceInversion` | F=ℚ and Δ=6,1,0,−6; F=ℚ(i), Δ=6,12; cubic discriminant −108 | Added positivity check and proved native Δ=0,−6 exclusions alongside 6/1. Keep discriminant divisibility separate from 6-divisibility and from the localized coefficient ring. |
| `TraceInversion.isUnit_two_three` and Layer 4 imported ring comparison | F=ℚ, Δ=6; Δ=1; genuine versus homotopy finite fixed points; π₀ before versus after limit | Native theorem still uses the localization unit and divisibility product API. The arithmetic export retains periodic KU and genuine fixed points → residual homotopy fixed points → spectral limit → π₀. No higher-module or regulator comparison is inferred. |

The removed q-PD/Čech signatures and their normalization checks belong to
the supplier audit above; they are not silently replaced by weaker local
definitions. No source passage or section-by-section source summary was
added to the repository.

## Sources, existing work and validation

Read the worker rules, both protocols, PACKAGE_REVIEW, UPSTREAM_GUIDE,
the specified exemplar, existing Part II design/review/package, Part I's
outgoing clauses and the other family supplier contracts. Read the
reviewed `data/library-coverage.json`, including HQ.5-trace, RT.4:q-Hodge,
RT.4:Habiro-comparison and RT.6. Its old HR.6 attribution is historical;
the actual package owner for QH Corollary 3.13 is I §4.21.

Checked the current upstream DGAInfinity and StablePeriodicCurved
roadmaps' scope, native inventories and relevant enhanced/derived layers,
and searched current upstream roadmaps (commit
`0d144d044dacebca17b654695b6f1ad58f159b27`) and Tau Ceti (current commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) by objects as well as names for Habiro, q-Hodge, spherical lifts, THH and Nygaard. No duplicate
trace carrier or target was found. The pinned native étale/smooth,
discriminant and localization declarations were read; the Lean file uses
only Mathlib and introduces no substitute spectral or enhanced carrier.

Primary sources read directly, fixed versions accessed 2026-10-20:

- KU: Wagner, [arXiv:2510.06057v1](https://arxiv.org/pdf/2510.06057v1),
  Theorem 1.2 p.3, Paragraphs 1.9–1.11 pp.5–6, Assumptions 3.1–3.2
  p.24, Remark 3.10/Proposition 3.11 p.27, Theorem 4.8/Remark 4.9 p.39,
  Theorems 4.14/4.16 and Remark 4.15 p.43, Theorem 4.17 pp.45–46,
  4.18 p.46, 4.18a p.49, 4.26–4.28 p.50, Lemma 4.29 p.51,
  Examples 6.7–6.9 pp.82–83, Theorem 6.10 p.83, Lemmas 6.11–6.13
  pp.84–86, Remark 6.14/Corollary 6.15 p.86.
  PDF SHA-256: `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d`.
- QH: Wagner, [arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2),
  Lemma 3.3/Remark 3.6 p.22, Remark 4.4/Lemma 4.6 p.55,
  Lemma 4.7 p.56, Construction 4.21/Theorem 4.22 pp.62–63,
  Remark 4.23/Examples 4.24–4.25 pp.63–64,
  Lemmas 4.26–4.27 pp.64–65 and proof of Theorem 4.22 with
  Construction 4.28/Theorem 4.29 p.66.
  PDF SHA-256: `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b`.

Pagination is the printed page label, not the position of a form-feed in
extracted PDF text. All statements are in our own words with locators.
No restricted book was needed, no source file was copied into the
repository, and no suspicious instruction was encountered in source data.

Completed checks so far:

- `lean-check research/blueprint/packages/HabiroCohomologyFoundationsPartII/Suggested.lean`:
  exit 0, no errors or warnings, at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
  and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory was
  checked first; no parallel Lean process was started by this worker.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundationsPartII.json`:
  0 errors, 0 warnings. The unchanged packet has four nodes and three
  explicit requests; this job does not edit it or mark its stages closed.
- `git diff --check`: clean.
- Intake `check-files` on the four authorized paths: 4 files, 0 problems.

## Resume after supplier changes

Final main audit: `ee1154f0493cd8d358d33c9e4fbefc45f64fc2b8`, fetched
2026-10-20. All five family packages were unchanged from the baseline at
that commit. #11401 was still available without a claimant, #11403 was
submitted in unmerged PR #11410 (its submission checks passed), and #11406
was claimed without a PR. The obsolete #11304 is not evidence that R3/R4
have landed. No sibling PR was treated as a merged supplier contract.

The maintainer must first assign HC's outgoing R2 edit. After that edit
and #11401, #11403 and #11406 have merged, fetch main and inspect their
actual files. Reconcile every supplier contract and outgoing check in this
report. In particular, RT must retain the full framed theorem, q-PD/Čech
proof and prime-two resolution comparison, and HC must retain ordinary
polynomial-module exactness and its arbitrary-module negative example
without importing HR. Recompute the five-package graph from those files;
the intended supplier-first order is HC, HR, I, RT, II. Update the finding
table with merged commits/PRs, then set review.json to accepted only if
every residue has gone. No additional Part II mathematics is knowingly
left unfinished; do not redo the source or Lean checks unless a new edit
or supplier discrepancy warrants it.
