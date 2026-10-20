# Independent package review: Gross–Zagier formulas and arithmetic heights

Job `REV-PKG-GrossZagierAndArithmeticHeights~codex2`, issue #11407. Claude
(Opus 5.5), session `claude-pCt0iJ`, 20 October 2026. I wrote none of the
package revisions, fixes or earlier reviews of this roadmap. This review
follows the fix `FIX-PKG-GrossZagierAndArithmeticHeights~adv2` (#11400),
whose self-marked acceptance does not count.

**Verdict: accepted, with the corrections below applied in place.** The
package no longer cites HeegnerPointEulerSystems. Every former HE.0/HE.1 ask
is either re-sourced from an earlier roadmap under an exact name or owned
in the new Layer 0a, in full generality. The targets cited by
HeegnerPointEulerSystems keep their names and statements. Three
cross-roadmap ordering points are recorded at the end for the maintainer.
They are outside this package's files, and none of them is an upward
citation by this package.

## Method

Read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md §§5, 13 and 20, and
UPSTREAM_GUIDE.md. Also read the three earlier package reviews, the
~adv2 handoff and issue #11381. The named `~adv` report does not exist
on main, as the fix handoff says. Diffed the package against its state
before #11400: 68 sections changed and five were added (0a.1–0a.5). I
read every changed section and checked its mathematics.

Four Sonnet cross-checks ran in parallel and wrote scratch tables:
- supplier citations in lines 1–1345, against the atlas packages and
  packets, TauCetiRoadmap `origin/main` (14e4aedb) and the
  ComplexMultiplicationAndExplicitReciprocity port, TauCetiRoadmap #1254
  (head 8b89480);
- supplier citations in lines 1346–5922, with a packet-graph cycle check;
- Mathlib and Tau Ceti names at pinned Mathlib 082e2d3, pinned Tau Ceti
  f790474 and current Tau Ceti a91d3aaf, plus README/Lean alignment and a
  process-word scan;
- a duplication inventory against every roadmap on TauCetiRoadmap main and
  the current Tau Ceti library.

I re-read every defect they reported in the supplier text before acting on
it.

## The issue's focus items

**1. No HeegnerPointEulerSystems citation.** Confirmed. `HeegnerPointEulerSystems`, `HE.0`, `HE.1` and `HE.n`
do not occur in README.md or Suggested.lean. Heegner point Euler systems
appears only as a consumer: in the scope paragraph, the supplier-table
preamble and Downstream consumers. The packet-graph check found no
node-level cycle through any GZ node. One transitive dependency remains;
see maintainer note A.

**2. Former HE.0/HE.1 asks.** All 17 distinct HE identifiers of the
pre-fix README were traced to their new suppliers.

| Former ask | Now | Checked |
| --- | --- | --- |
| HE.0 `ring-class-tower-quotients` | GlobalNumberFields L11 `NumberFieldOrder.Hom.mapPic`; ClassFieldTheory L11–13 `ringClassField`, `ringClassArtinMap`, `gal_ringClassField_equiv_pic`; owned 0a.1 | names exist on TauCetiRoadmap main; `mapPic` exists in current Tau Ceti |
| HE.0 `dihedral-conjugation` | CM §3.1 `classPolynomial.galois`, `classPolynomial.ringClassField`; owned 0a.1 `ringClassTower_conjugation` | present in the atlas CM package and the #1254 head |
| HE.1 `cm-cyclic-isogeny-pair` | owned 0a.2 on CM §§1.1–1.2 `idealLatticeCurve`, `idealAction`, `idealAction.degree_eq_norm` | every imaginary quadratic K, every conductor c, every N with gcd(c,N)=1 admitting O_c/𝔫≅ℤ/N |
| HE.1 `optimal-embedding-cm-points` | owned 0a.3 on IntegralLattices B2/B5 and CM §1.2 `quadraticFormsCMComparison` | as 0a.2 |
| HE.1 `canonical-model-cm-descent` | owned 0a.4 on ShimuraVarieties §§4.1–4.4, §8.5 and HilbertModularVarietiesAndShimuraCurves R18.1, R18.3 | general totally real F, CM E/F |
| HE.1 `jacobian-basepoint-denominators`, `heegner-points-of-conductor-m-…` | GZ 3.2–3.3 (Hodge class, ξ-realization) with 0a.2 and EllipticCurveModularity R29.5 | |
| HE.1 `parameter-choice-and-degree` | GZ 3.5, 3.9 | |
| HE.3 Kummer and local conditions | PadicHodgeRegulators L1 `abelian-variety-logarithm`, `bloch-kato-subgroups` (9.20, now local) | |
| HE.7, HE.8b | removed: they are downstream deductions | |

The owned condition is exactly Gross's. With gcd(c,N)=1, an invertible 𝔫
with cyclic quotient of order N exists iff every ℓ|N splits or ramifies and
every ℓ with ℓ²|N splits. Gross states this in §I.3, p.89. Recomputed
locally: an inert ℓ gives quotients (ℤ/ℓ^k)², and at a ramified ℓ the
quotient O/π² ≅ O/ℓ is not cyclic. The exceptional fields D=−3 and D=−4 are
covered with their full unit stabilizers.

**3. Targets cited by HeegnerPointEulerSystems.** HE cites these GZ items:
- `GZ.0/artin-map-convention` (0.5);
- `GZ.0`, `GZ.3`, `GZ.4`, `GZ.5` and `GZ.8`;
- `GZ.8/general-quaternionic-gross-zagier-identity` (8.11);
- `GZ.9/isogeny-and-differential-compatibility` (9.10);
- `GZ.9/imprimitive-function-dictionary` (9.22);
- `GZ.9/bloch-kato-logarithm-of-heegner-class` (9.20);
- `GZ.9/bdp-square-root-comparison` (9.14).

All their anchors are present: 292 targets, including all 287 earlier ones.

How each statement changed:
- **0.5.** The convention statement is unchanged. The cyclic-pair
  construction moved to 0a.2 under the same API names.
- **0.12.** The statement is unchanged; Checks were added.
- **Layer 3.** The statements are unchanged.
- **8.11.** Only the character is relabelled as χ_T/χ_G, which I checked below.
- **9.9, 9.17 and 9.20.** The suppliers were renamed. 9.20 now takes its
  Kummer class from the local Kummer map. Its conclusion
  (log_BK∘κ_v = log_A) is unchanged.
- **9.14.** Only a downstream remark was removed.
- **9.10 and 9.22.** The statements are unchanged.

My own edits change no target statement. They touch 0.4's proof route, 3.8's
proof inputs and some Needs lists.

**4. Generality.** Layer 0a has full generality:
- 0a.1 covers all K and every conductor pair c|d, including conductors
  divisible by 2 or 3.
- 0a.2 and 0a.3 cover all K, every c, and every level with a cyclic
  ideal, including ramified ℓ‖N.
- 0a.4 covers a general totally real F, a CM extension E/F and a
  quaternion algebra split at one real place.
- 0a.5 covers a general PEL datum, with Brooks's surface as the named
  comparison.

The analytic odd-discriminant restrictions in 0.12, 6.x, 8.6 and 9.17
are the sources' own hypotheses. The general quaternionic formula 8.11
has none of them.

**5. Suggested.lean.** Applied the 19 October 2026 rule on examples. The
fix had added eight proved `example`s that compute numbers about library
objects and test no definition of the roadmap. Six are Layer 0a matrix,
ZMod and rational identities, and the Atkin–Lehner toy map on ZMod 3 × Bool.
Two are the Layer 8 vectors (1,2,4) over 𝔽₇ and (1/2,−1/2). I deleted all
eight. Their content stays as README Checks: 0a.1–0a.5, 0.12 and 8.8 keep
every one of these witnesses.

The file is now 243 lines:
- nine real-bodied light definitions;
- six sorry'd theorem statements;
- sixteen proved examples, at most two for each kept definition.

It has `import Mathlib` only, one module docstring and one namespace. It
has no `lemma`, `#print`, `#eval`, `True` placeholder or sorry'd data.

All six theorem signatures were re-read against the README:
- `unitIndex_of_imaginaryQuadratic`: hypotheses totally complex and degree 2;
- `completed_derivative_at_central_zero`: Γ_ℂ(1)=1/π, giving √N/π;
- `heegnerAverage_isotypic`: true with no invertibility hypothesis;
- `heegnerAverage_pairing`: inverse-square scaling;
- `bdpLFunction_evaluation`: true for any ring map;
- `bdpEulerFactor_ne_zero`: needs p>1 and the real Hasse bound. The example
  p=1, a=2 shows why p>1 is needed.

`lean-check` exits 0. The only warnings are the six "declaration uses
`sorry`" warnings, at lines 49, 57, 169, 174, 223 and 240.

## Standard items

1. **Form.** The shape follows upstream: summary, scope, boundaries,
   conventions, supplier contracts, how to read, layers with Checks,
   Examples and Dependencies, downstream consumers, references. The README
   is 772 KB and 5,926 lines. The issue template's 200 KB ceiling is the
   older note; PACKAGE_REVIEW's 12 October 2026 shape section overrides it,
   and the upstream tier 1–4 roadmaps run to 15,000 lines. Every target
   still has its Checks and hypotheses. Splitting into Parts remains a
   maintainer option.
2. **Fidelity.** No target was dropped. 938 internal links resolve. The 761
   Needs edges are acyclic, and none points to a later layer. Each layer's
   Dependencies paragraph agrees exactly with its Needs lines, checked by
   script.
3. **Own words.** A 9- and 14-word shingle scan against GZ86, Conrad, CST,
   Brooks, Zhang and CNS found only formulas, titles and one 19-word
   definitional clause in 6.54, taken from GZ IV (4.6) b), p.285. That clause is now
   reworded. No section-by-section summary was found.
4. **No process.** "stage R12.5" was reworded. A link to a closed
   TauCetiRoadmap pull request (#287) as an "upstream roadmap" was replaced
   (see corrections). Six anchor slugs `target-colmez-rev-…` remain. They
   are invisible in the rendered text, and renaming them would break links.
5. **Lean.** See above.
6. **metadata.toml.** `topic = "math.NT"`. Correct.

## Corrections applied

1. **Prerequisites and boundaries.**
   - EllipticCurves Layer 7 supplies the full real period Ω(E) over ℚ, not
     c_∞. The identity-component comparison is 0.6's own target.
   - `hasse_bound` and `frobeniusTrace_sq_le_four_mul_card` exist on
     current Tau Ceti main, not at the pin f790474.
   - AutomorphicSpectralTheory constructs G_{N,s} in §2.25; the citation
     now reads §§2.23–2.25.
   - The closed, unmerged TauCetiRoadmap #287 ("ArithmeticHeights", on a
     fork) was cited as an upstream roadmap. It is replaced by
     DiophantineApproximationAndTranscendence §0.2, which owns the height
     foundation on main.
2. **Duplication with ImaginaryQuadraticClassNumber**, merged on
   TauCetiRoadmap main at 04:28 UTC on 20 October 2026, after the fix's
   checkout.
   - Its H1.2 counts the units of an imaginary quadratic field (6, 4, 2).
     0.4 no longer re-proves this count: it now halves H1.2's count, and its
     Needs and the Layer 0 Dependencies were updated.
   - Added a boundary paragraph and a supplier-table row for H1.2 and H1.4.
   - 0a.1 now cites H1.4 for the conductor sequence and the class-number
     formula used in its Checks.
   - The Lean docstring of `unitIndex_of_imaginaryQuadratic` names H1.2.
3. **0.12, a source discrepancy.** Gross–Zagier II §1 (i), p.236, write
   (𝒜,𝔫)↦(𝒜[𝔫],𝔫̄) for w_N. Their p.235 indexing is
   (ℂ/𝔞→ℂ/𝔞𝔫⁻¹)↦([𝔞],𝔫). Under that indexing the dual isogeny lands on
   ℂ/𝔞𝔫⁻¹→ℂ/𝔞𝔫⁻¹𝔫̄⁻¹, so the image class is 𝒜[𝔫]⁻¹, as Gross 1984 (5.2)
   states and as 0.12 and 7.80 already use.
   - Recomputed for D=−23, N=2 with explicit lattices. The quadratic forms
     2τ²+τ+3 and 6τ²−τ+1 give (g,𝔭)↦(1,𝔭̄), not (g²,𝔭̄).
   - Added a Check recording this. The printed form is right for indexing
     by the inverse class.
4. **Layer 0a supplier sections.**
   - ModularCurves cyclic subgroups are in §3B, not §§2A–2E.
   - The IntegralLattices dictionary between ideals and forms is B2. B5 is
     reduction of forms.
   - Invariant differentials are AbelianSchemesAndArithmeticModuli A1
     `relative-invariant-forms`, not A2.
5. **Needs lists that cited suppliers supplying nothing used.** I read
   each statement before removing anything.
   - Removed 0a.4 (quaternionic points) from the purely X₀(N) targets 6.28,
     7.18, 7.57, 7.70, 7.80 and 9.17. The fix handoff claimed these
     modular targets had no quaternionic prerequisite.
   - Removed `MP.6/quadratic-quaternionic-norm-instances` from the
     order/ideal targets 7.40, 7.62, 7.75 and 7.81. That node is the
     convergence of theta integrals of norm forms.
   - Removed R18.5 (bad-prime uniformization) from 6.8, a finite orbit
     average, and from 6.21, the local test function.
   - 9.1 now cites A1 `relative-invariant-forms` for the Lie algebra,
     instead of A2, which is polarizations.
   - Updated the Dependencies paragraphs of Layers 0, 0a, 3, 7 and 9.
6. **3.1 Needs.** The integral coarse curve is ModularCurvesPartII
   R13.4a and the cusp charts are R13.3. R13.1 is generalized elliptic
   curves.
7. **3.8, a proof input with no owner.** The outline used "local Whittaker
   denominator bounds" that AL.3 does not supply. They are CNS §3,
   Theorems 3.14–3.15 (p.21), the bounds on p-adic valuations of Whittaker
   newform values. They give the cusp-expansion bound of Theorem 4.6 (p.30).
   - 3.8 now proves these on the normalized newvector of
     GL2AutomorphicRepresentationsAndTransfer R16.2.
   - Added the locators and the R16.2 node; read in arXiv v3.
8. **9.12 and Downstream consumers.**
   - 9.12 said Castella's exceptional-zero derivative formula is "owned by
     GeneralizedHeegnerCycles GH.7". GH.7 excludes exceptional primes, and
     GH's README assigns exceptional branches to GZ.9. 9.12 now says the
     formula is not a target here; see maintainer note D.
   - Downstream consumers said GH imports GZ's Layer 9 adapters, and the
     supplier table spoke of "its GZ logarithm imports". GH cites no GZ
     node; it is a supplier of 9.8 and 9.17. Both texts are corrected.
9. **Conventions.** The `canonicalHeight`/`regulator` sentence is now
   tied to current Tau Ceti main, with the f790474 reading pointed to 0.1.
10. **Suggested.lean.** Eight numeric examples removed (focus item 5).

## Sources checked

Every passage below was opened and read. Gross 1984 has no text layer, so I
rendered and read its pages visually.

| Target | Source and locator | Result |
| --- | --- | --- |
| 0a.1, 0a.2 | Gross 1984 §I.4 (4.1)–(4.2), pp.89–90 | conjugation inverts the class; σ[𝔟] sends [𝔞] to [𝔞𝔟⁻¹]; agrees |
| 0a.2 | Gross 1984 §§I.2–I.3, pp.88–89 | lattice pair, conductor prime to N, exact existence condition; agrees |
| 0a.3 | Gross 1984 p.89; GZ86 II (1.3)–(1.5), p.236 | Aτ²+Bτ+C with N∣A; agrees |
| 0.12 | Gross 1984 (5.1)–(5.2), p.90; GZ86 II §1 (i), p.236 | Gross agrees; GZ misprint or inverse indexing (correction 3) |
| 0.5 | Conrad, p.69 "Some conventions" | arithmetic Artin; [𝔞] sends ([𝔟],𝔫) to ([𝔟][𝔞]⁻¹,𝔫); agrees |
| 0a.4 | CST v2 §1.2, p.6 | fixed points X^{K×}, Galois action through Hecke reciprocity; agrees |
| 0a.5 | Brooks IMRN 2015 §§2.1–2.5, pp.4182–4188; Thm 2.2 p.4185; Prop 2.3 p.4186; §8.3 pp.4232–4235; §8.4 p.4236 | A_τ, principal polarization, isogeny with kernel A_τ[𝔞], ray-class level; agrees |
| 6.30 | GZ86 IV §1, pp.271–272 | Möbius decomposition over e|N; agrees |
| 6.35 | GZ86 IV (4.4) p.283, (4.5) p.284 | agrees |
| 6.45 | GZ86 IV (3.2), p.277 | agrees |
| 6.46 | GZ86 IV (4.6), p.285 | agrees |
| 6.69, 6.72 | GZ86 IV (5.6), p.291; constant at k=1 is 8π²/√|D| | agrees |
| 7.56 | GZ86 III (0.6)–(0.7), p.254 | agrees |
| 7.57 | GZ86 III (3.3), p.257; (0.2), p.252 | agrees |
| 3.8 | CNS arXiv v3, Thms 3.14–3.15 p.21, Thm 4.6 p.30, Thms 1.1–1.2 p.3 | added (correction 7) |

## Adversarial pass on the changed statements

| Statement | Instances tried | Result |
| --- | --- | --- |
| 0a.1 tower | K=ℚ(i), Pic(O₃): h=1·3/[4:2]·(1+1/3)=2; D=−23, ιgι⁻¹=g²; 2∈𝔽₇ has order 3 with inverse 4 | correct |
| 0a.2 pair | Gaussian 𝔫=(2+i), kernel (2−i)/5; Eisenstein 𝔫=(2−ω) of norm 7, kernel (3+ω)/7; (2) non-cyclic; inert ℓ has norm ℓ² | correct |
| 0a.3 embeddings | recomputed ι(i)=((2,−1),(5,−2)) from b₁=−1, b₂=−2+i: M²=−I, det 1, 5∣M₂₁; ι(ω)=((−3,−1),(7,2)): M²+M+I=0; τ=b₁/b₂ has Im τ>0; optimality with gcd(c,N)=1 forces both endpoint conductors to equal c | correct |
| 0a.4 reciprocity | [z,1]^{Art(r⁻¹(t⁻¹))}=[z,t] from x^{Art(s)}=[z,r(s)⁻¹g]; stabilizer of z in B^× is E^×; E_f^×∩gR̂^×g⁻¹=Ô_g^× | correct |
| 0a.5 triples | deg φ_𝔞 = (N𝔞)², from O_B as a rank-2 O_K-module; [2] has degree 16 versus 4; ω↦2ω divides a weight-two value by 4; Brooks's reciprocity ρ(τ)^{(𝔞⁻¹,H/K)}=ρ(𝔞⋆τ) | correct |
| 0.12 Atkin–Lehner | D=−23, N=2, explicit forms (correction 3); w applied twice is the identity | statement correct; source misprint recorded |
| 8.8, 8.10 χ_T/χ_G | reindexing σ↦σ_z(t)σ gives χ_T(t)⁻¹; C₃ over 𝔽₇: (1,2,4)↦(4,1,2)=4·(1,2,4); ideal-weighted versus Galois-weighted sums transform by χ versus χ⁻¹ | correct |
| 8.9 | K=ℚ(i), b=1: L(1,η)=π⁻¹·π/4=1/4; CST class-number identity gives ½=½ | correct |
| 9.9 covariance | χN^j has type (k+2j,0); differential ω↦α⁻¹ω contributes α^{k+2j}; the two cancel | correct |
| 9.20 | the global Kummer image lies in H¹_f anyway (Bloch–Kato 3.11); the local restatement is weaker but sufficient | correct |
| Random Checks | 7.11 Laurent finite part b+ca; 0.1, 37.a1 BSD regulator 0.0511 equals h_x, h_(O) is half of it; 2.4 degree-two curvature; 9.15 scaling by c² | correct |

## Duplication against TauCetiRoadmap main and current Tau Ceti

- The one removal is 0.4's unit count, now cited to
  ImaginaryQuadraticClassNumber H1.2 (correction 2).
- 0a.1's conductor towers c|d with conjugation, and 0a.2–0a.5, have no
  counterpart on main.
- 6.10's weight-one theta series θ_A is a binary-lattice case of
  ThetaSeries Layer 7. The README uses it through the Rankin series and
  does not re-prove its modularity.
- The 6.12 trace adjunction is the Γ₀(M)⊂Γ₀(N) case of current Tau Ceti
  `peterssonInnerCosets_trace_left`, on the nonholomorphic space the
  target needs.
- Nothing else needed removal.

## Notes for the maintainer

**A. A transitive route to HeegnerPointEulerSystems.** 9.8 and 9.17 import
GeneralizedHeegnerCycles `GH.1/p-adic-abel-jacobi-map`,
`GH.1/generalized-heegner-cycle` and `GH.4/bdp-special-value-formula`.
Those GH nodes reach `HeegnerPointEulerSystems:HE.1/canonical-model-cm-descent`
and `HE.0/ring-class-tower-quotients` in the packets. One packet path is
GH.1/generalized-heegner-cycle → GH.1/isogenies-of-conductor-c-prime-to-n
→ HE.1/canonical-model-cm-descent. From there HE.0 reaches
`GZ.0/artin-map-convention`. So GZ → GH → HE → GZ is a roadmap-level loop.
It is acyclic at target level, because 0.5 lies below 9.8 and 9.17.

The HE fix must repoint HE to GZ Layer 0a. The GH package should do the
same: replace its HE.0/HE.1 imports by GZ 0a.1–0a.4 or ComplexMultiplication
§§1.1–3.1. GH and GZ then form a layered two-way pair: GH needs GZ 0a, and
GZ 9 needs GH. They need a bundle, or a split of GZ Layer 9.

**B. AutomorphicPadicLFunctions.** `L3h/explicit-waldspurger` has
prerequisites GZ.4 and GZ.5, while GZ Layer 9 imports L3h. This is
layered, not a cycle, but the two roadmaps must go upstream together or
in the order L3h-after-GZ.5.

**C. ComplexMultiplication port and ImaginaryQuadraticClassNumber.** The CM
port (#1254) does not mention ImaginaryQuadraticClassNumber. Yet H3.1 on
main plans, for every imaginary quadratic order, the ideal-lattice CM
curves, the class-group action with its Artin convention and the class
polynomial, which overlaps CM §§1.1–3.1. GZ consumes the CM names. The
overlap is for the CM port to reconcile.

**D. Castella's derivative formula has no owner.** No roadmap owns the
exceptional-zero derivative formula Z′ = 𝓛_p·loc_p(κ_f) for big Heegner
points. GZ does not need it.

**E. Supplier caveats noted, not changed.**
- AnalyticNumberTheory AN.4 is cited at stage level by the counting
  targets 7.84–7.99. It supplies the counts r_A(n) but no counting lemma.
- R18.5 remains at 6.52 and at the uniformization targets.
- The #1254 head moved `relativeCMModuliOrbit`'s field-generation clause
  to CM.3.2. It also sources `supersingularLevelOrderComparison`'s
  Eichler-order claim from SerreWeightAndLevelOptimisation §2.6. GZ uses
  neither of these.

**F. YZZ proofs.** The two YZZ-book-only proof inputs recorded by the
earlier review remain explicit (Proposition 5.8, Theorem 7.8(4)). No
private copy was used.

No instruction-like text was met in issue comments, other pull requests or
fetched sources.

## Checks run

- `lean-check …/Suggested.lean`: exit 0, six `sorry` warnings, no errors
  (Mathlib 082e2d37e8, Tau Ceti f790474 build).
- Internal audit script: 292 anchors, 938 links resolved, 761 acyclic Needs
  edges, no later-layer edge, Dependencies agree with Needs in every layer.
- `python3 research/blueprint/intake.py check-files` on the five
  deliverables: 5 files, 0 problems.
