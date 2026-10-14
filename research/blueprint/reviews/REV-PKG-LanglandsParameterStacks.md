# Independent package review: LanglandsParameterStacks

**Verdict: accepted with the corrections in this review.** Reviewed by Codex, session
`codex-thuzdQ`, for issue #7937, on 2026-10-14. The package author was another worker;
I did not write or review the input package before this job.

## Scope, fidelity and form

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md and the expansion
protocol. Read the current LocalGaloisGroups and ProfiniteArithmetic roadmaps as
quality models. Read all 78 target subsections and their checks against the accepted
79-node packet. The difference in counts is accounted for by the two previously
folded SR.6 discretization/comparison nodes and the added highest-weight foundation
LP3.0; the package author's handoff records the node correspondence. No packet was
edited. The seven layers retain their build order, API outlines, exact hypotheses,
source locators, examples and dependencies. Every target now has at least three
separate Check bullets. The README remains below the issue's 200 KB limit.

The distinction between all-prime coarse classification, rational ring comparison
and good-prime integral categorical comparison is retained. Heavy constructions
remain README targets; the Suggested file has real-bodied light definitions, target
statements and discriminating examples, without sorry'd data. `metadata.toml`
remains the single line `topic = "math.NT"`. No source passages or source-by-source
summaries were added.

## Corrections and ownership

- Replaced the false claim that the cyclotomic character has infinite local inertia
  image for `ℓ ≠ p` by the tame unipotent `GL₂` example. Corrected the discrete
  `𝔽_ℓ` coefficient test and removed fictitious arbitrary torus inertia characters
  from the continuity checks; unramified characters and the tame relation supply
  the intended examples.
- Corrected `tateCharacter` to `q^{-deg_geo}` in both documents. Arithmetic
  Frobenius has Tate value `q` and geometric Frobenius value `q⁻¹`. The two
  computed Lean examples and the `GL₂` matrix example pin this convention.
- Added continuity to the compact-wild finite-image/open-kernel equivalence and
  identified its `T₁` hypothesis. The normal cutoff uses the section homomorphism,
  not a kernel of an arbitrary crossed map.
- Scoped disconnected unipotent-class finiteness to the `𝔽̄_ℓ` groups actually
  used, which descend to a finite-field model. Fulman–Guralnick Corollary 2.6
  requires that model. Its printed locator is pp.3028–3029.
- Made LP1.7 own the animated mapping functor, enhanced module descent,
  quotient-stack `QCoh` and chartwise `Perf`, including presentation independence.
  E0/E3 supply coherent diagrams and Kan extensions; E5, SF.1 and S.1 do not
  already supply these stack enhancements. Added these interfaces to their first
  consumers' prerequisites and added discriminating affine/free-quotient/descent
  checks.
- Made the cotangent-to-Hochschild map and self-Ext action explicit named
  constructions of LP1.14, using DGAInfinity layers 5 and 8. The package correctly
  retains a map into `HH²`, rather than identifying all of `HH²` with cotangent
  deformation classes; the smooth two-variable counterexample remains.
- Distinguished the algebraic `GL_n` Weil–Deligne prototype from the full
  scheme-theoretic nilpotent cone and discrete-inertia conditions. Over dual
  numbers, a nilpotent scalar need not belong to the torus nilpotent cone. Added
  the `GL₃(ℤ₂)` logarithm denominator counterexample and a derived zero-locus
  counterexample to classicality without the finite-wild hypotheses.
- Corrected excursion reindexing: the pullback of `V` along the map from the
  `J`-tuple indexed by the larger set is evaluated there, and agrees with `V`
  evaluated on the reindexed tuple. Fixed the displayed product notation.
- Removed the artificial finite-multiplicity condition from the general
  good-filtration criterion. Jantzen II.4.16, Remark 1 permits direct sums of
  induced modules; coordinate rings already require infinite multiplicity.
- Made LP3.12 own `IndProPerf(BG)`, the equivariant completion/tensor bridge and
  the faithful-`GL_n` boundedness reduction. Ordinary formal completion from SF.4
  alone does not give that category. Added completion and noninvertible-root
  controls.
- Corrected the small `Perf` versus presentable `Ind Perf` checks in LP3.18 and
  the circle diagram in LP3.19 to the homotopy pushout
  `* ← (* ⊔ *) → *`. Restricted the torus tensor-connectivity check to its
  stated connective inputs.
- Made LP3.23 own the intermediate integral-closure étaleness criterion, with
  excellent normal domain, finite Galois extension, intermediate subgroup and
  geometric point specified. Its stabilizer is inertia. A ramified quadratic
  power-series cover and an unramified residue extension distinguish it from
  the decomposition group. SF.0/SF.4 provide excellency and normalization.
- Corrected the stable-lattice citation in LP3.25 to Jantzen I.10.4, Lemma,
  p.143, directly used in the proof of BHKT Proposition 8.3.
- Expanded the closing Lean comment to account for the README definitions whose
  carriers are unavailable at the pins. Added light examples for prescribed
  projection, wild extension and non-extension, centralizers, zero monodromy,
  trivial coaction, affine quotients, ordered free generators and rank-two trace.

Checked every target by mathematical object against current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps and
Completed material, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The current LocalGaloisGroups/ProfiniteArithmetic cohomology targets concern
ordinary Galois coefficients, not the condensed Weil interface; AlgebraicVectorBundles
supplies ordinary bundles, not the stable quotient-stack enhancements.

The additional duplicate removed by this review is LP0.1's demand to prove the
crossed-cocycle unit and inverse identities: these are already SR.6.1. The
restriction/section/orbit/continuity variant remains. The author's earlier folds
into SR.6.1 and SR.6.3, and imports from IHG and RG2, remain correct. No further
current-library duplicate was found. Pinned declarations inspected include
`AlgHom.equalizer`, flat tensor exactness/injectivity, semidirect products, free
lifting, tensor-dual evaluation, trace, `Spec`'s algebra-map direction and
`PrimeSpectrum.isHomeomorph_comap`; Tau Ceti's points functor, pointwise algebra
maps, special-linear coordinate algebra/point equivalence, abstract fixed subgroup
and ordinary continuous cohomology functor. Their enhanced variants are targets,
not claimed to exist in the libraries.

## Source audit

Opened and read the mathematical statements, not just search snippets. The author
had not reverified BHKT, Lafforgue, Zhu, DHKM, KSS or the two unipotent finiteness
references. The first five are now directly checked. Fulman–Guralnick is directly
checked in the published author-hosted PDF. The connected finiteness input is
explicitly sourced through the proof of FS VIII.1.4, p.281, which states and uses
it; Lusztig's bibliographic data were checked against the author's archive and
publisher, but the subscription article itself was not accessible. Its direct
page claim has therefore not been invented or certified.

| Source/version | Locators checked, in printed pages | Outcome |
| --- | --- | --- |
| FS, author PDF dated 2024-11-27 | VIII.1, pp.278–281; VIII.2, pp.281–285; VIII.3–5, pp.286–315; X introduction, p.340; X.3 setup, pp.348–349 | Convention, deformation, invariant and categorical statements checked; existing HH² overstatement was already avoided by the package. |
| BHKT, Acta Math. 223 (2019) | 3.2–3.13, pp.11–19; 4.1/4.3/4.5, pp.19–20; 4.7, pp.23–24; 8.3, p.53 | Hypotheses and field/DVR distinctions confirmed; geometric stabilizer criterion made explicit. |
| Lafforgue, 1209.5352v10 | 10.1, pp.133–135; 10.8, pp.138–139; 11.7, statement p.143 and proof pp.144–147; Remark 11.8, pp.143–144 | Corrected the continuity locator to include the statement page. |
| Zhu, 2008.02998v3 | 3.7, p.34; 3.9, pp.34–35; 3.10, pp.35–36; 3.12, p.36 | Revised numbering retained; old FS reference 3.1.8 is explained. |
| DHKM, 2009.06708v3 | §1.2, pp.4–6; 4.1, pp.29–30; 4.2, pp.30–31 | Arithmetic Frobenius and absolute/relative dimensions distinguished. |
| KSS, 1611.02667v3 | §§1.20–1.21, pp.8–9 | Odd-residue-characteristic complex classical-group scope confirmed. |
| Quast, author PDF dated 2023-10-23 | Definition 2.3, p.6; Definition 3.1, p.11; Lemmas 3.4–3.6, pp.12–13; Theorem 3.7/Claims A–C, pp.13–15; Theorem 3.8, p.15 | Finite-component reconstruction and continuity hypotheses confirmed. |
| Touzé–van der Kallen, 0809.1014v3 | Theorem 1.5, p.3 | Noetherian algebra and finite-module hypotheses confirmed. |
| Jantzen, cleared second edition | I.10.4 Lemma, p.143; II.4.16 Proposition/Remark 1, pp.210–211; II.4.17, p.212 | Read only the cleared copy; corrected lattice locator and removed finite-multiplicity restriction. No files or passages copied. |
| Fulman–Guralnick, published author PDF | Corollary 2.6 and proof, pp.3028–3029 | Finite-field hypothesis restored to the use in LP1.4. |

For the required random sample of 15 other targets, used Python's
`random.Random(7937).sample(pool, 15)`, where `pool` is the 53 packet nodes whose
source list consists solely of `FS-geometrization`, in packet order. This excludes
the author's unverified BHKT/Lafforgue/Zhu/DHKM/KSS locators. An initial unfiltered
15-node sample was also checked. The required other-target sample is:

| Sampled target | Source locator checked |
| --- | --- |
| LP2e.6 parameter closed orbits | FS VIII.3.2–3.3, pp.286–287 |
| LP3.10 surface/tame relations | FS end of §VIII.5.2, p.301; tame reduction, p.312 |
| LP1.13 singularities/support | FS VIII.2.6/2.8, pp.282–285 |
| LP3.15 fixed restriction generation | FS VIII.5.17(v)–(vi), pp.307–310 |
| LP1.2 decomposition by wild kernel | FS proof of VIII.1.3, pp.279–280 |
| LP3.5 bar criterion | FS VIII.5.8–5.9, p.296; subsequent tensor criterion, p.297 |
| LP0.4 discretization/extension | FS proof of VIII.1.3, pp.279–280 |
| LP3.3 free-cocycle good filtration | FS VIII.5.6–5.7, p.295 |
| LP3.2 good-filtration separatedness | FS VIII.5.5 and proof, p.295 |
| LP2e.7 free-cocycle index | FS §VIII.3.2, p.287 |
| LP2c.5 character bijection | FS VIII.3.8 and proof, p.290 |
| LP1.11 Weil–Deligne parameters | FS VIII.2.4, p.282 |
| LP4.1 representation action on Perf | FS X introduction, p.340 |
| LP1.14 Hochschild support | FS VIII.2.7/2.9/2.10, pp.283–284 |
| LP3.12 cyclic fixed-locus resolution | FS VIII.5.16 and proof, pp.304–307 |

The references now pin the four arXiv versions whose page numbering is used. The
FS PDF SHA-256 is `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`;
Quast's is `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.

## Adversarial mathematics pass

All subsection targets, identities and conventions are covered below. These are
mathematical instance checks; the Lean elaboration does not certify the unproved
targets. Existing accurate negative controls were retained as well as the new ones.

| Statements | Instances and computed boundaries | Result/change |
| --- | --- | --- |
| LP0.1 | Trivial action gives homomorphisms; inversion action on `ℚˣ`, unit cocycle gauged by `2`, gives `4`; the second coordinate is prescribed. | Gauge side/inverse pinned; supplier unit/inverse duplication removed. |
| LP0.2 | Discrete characteristic-ℓ coefficients give finite inertia image; tame `GL₂` unipotents give infinite `ℚ_ℓ` inertia image with `Fr = diag(q,1)`. | Replaced false cyclotomic example and topology contrast. |
| LP0.3 | Trivial wild restriction; compact continuous finite image into a `T₁` group; a kernel on which the action is not trivial does not support quotient cocycles. | Continuity restored; descent and normal-cutoff hypotheses retained. |
| LP0.4 | Arithmetic/geometric generators at `q=3` give degrees `−1/1` and Tate values `3/1/3`; inversion twice is identity, kernels agree; at the algebraic specialization `q=1` the character is trivial. | Corrected Tate exponent; `q` is a unit, so inverses are defined. |
| LP0.5–LP0.6 | Identity section extends its restriction; constant homomorphism fails prescribed projection for nontrivial `W`; trivial wild image has full twisted centralizer; extending section satisfies the backwards-conjugation formula. | Abstract predicate explicitly distinguished from admissible classical parameters. |
| LP0.7–LP0.8 | Trivial wild restriction in a torus gives trivial enhancement quotient; noncentral Frobenius acts on the centralizer centre; restrictions of irreducible enhancements may decompose. | Twisted centre retained; no component-group substitution or wild correspondence promised. |
| LP1.1–LP1.2 | Zero wild depth; tame torus `G_m × μ_{q−1}`; nested cutoffs inflate injectively and components are clopen. | Single framed scheme imported; condensed interpretation retained. |
| LP1.3, LP1.9 | Trivial rank-one `ℚ_ℓ` module has `H⁰=H¹=ℚ_ℓ`, `H²=0`; Tate twist exchanges the dual positions; zero coefficients give zero; duality shift is `[2]`. | Condensed Weil cochains distinguished from abstract/group and Galois cochains. |
| LP1.4–LP1.6 | Torus dimension is 1; trivial tame image stratum has dimension `dim H`; finite `H` gives dimension 0; characteristic dividing `q−1` gives nonreduced finite-flat `μ_{q−1}`. | Finite-field finiteness scope fixed; relative dimension, absolute dimension and stack dimension kept separate. |
| LP1.7–LP1.8 | `W=1` gives `BĤ`, free rank zero gives a point framed; `F_n` gives `[Ĥⁿ/Ĥ]`; free quotient gives base modules; derived zero locus of zero on a point has degree `−1` homology. | Enhanced descent owned; classicality restricted to the parameter situation. |
| LP1.10 | Trivial torus tangent has one deformation and no obstruction; `W=1` tangent is `Lie(Ĥ)[1]`; dual Lie module requires a pairing for self-duality. | Existing shifts and dual-module scope confirmed. |
| LP1.11–LP1.12 | Zero monodromy; rank-zero matrix; `diag(1/3,1)` scales `E₁₂` by `1/3` and reciprocal fails; nilpotent dual-number scalar; `GL₃(ℤ₂)` logarithm has coefficient `−1/2`. | Prototype scope, sign and nonintegral denominators made explicit. |
| LP1.13–LP1.15 | Smooth chart has zero singularities; trivial characteristic-zero torus has zero fibre; characteristic-ℓ torus when `ℓ | q−1` has nonzero fibre but zero nilpotent cone; hypersurface residue field is nonperfect. | Kept inclusion, excluded primes and non-surjective cotangent-to-HH map; named its construction. |
| LP2e.1–LP2e.2 | Trivial coaction gives all `A`; `Spec` reverses algebra-map direction; flat tensor preserves the equalizer, reduction modulo `ℓ` is not flat; affine zero ring gives the empty scheme. | Flat base change retained; all-coefficient base change reserved for LP2i. |
| LP2e.3–LP2e.6 | Trivial subgroup is completely reducible; regular unipotent in `SL₂` has a nonclosed orbit; diagonal semisimple tuples have closed orbits; torus characters are semisimple. | Levi, strong-reductivity and closed-orbit distinctions confirmed. |
| LP2e.7–LP2e.8 | `F₀` has unique word map out; two generators evaluate to ordered `a*b`; word maps lie over `Γ`; the derived free-group colimit does not assert equivariant generation. | Added generator-order and identity-map examples. |
| LP2e.9–LP2e.11 | Rank zero gives the coefficient ring; trivial group gives only constant coefficients; bad-prime universal homeomorphism does not imply ring isomorphism; torsion-free quotient differs from full excursion algebra. | Existing open independence boundary retained. |
| LP2e.12–LP2e.15 | Empty index gives the unit; trivial representation coefficient is 1; zero creation vector gives 0; tensor coefficients multiply; reindexing a two-entry tuple uses the pullback representation. | Reindex direction fixed; map to centre retains its action hypotheses. |
| LP2c.1–LP2c.2 | Finite-component indicator idempotents survive when `ℓ | |Q|`; wrong prescribed projection fails; connected case recovers ordinary reductive pseudocharacters. | No spurious prime-to-component restriction; identity-component conjugation retained. |
| LP2c.3–LP2c.5 | Tame torus character satisfies `χ(τ)^{q−1}=1`; unramified `Fr↦q` character is finite-type continuous; `GL₂` infinite unipotent inertia is not semisimple but has the trivial semisimplified inertia character. | Removed fictitious arbitrary inertia witnesses; separated continuity hypotheses. |
| LP2c.6–LP2c.7 | Trivial rank-two representation has trace 2; zero rank has trace 0; linear extension with constant value 2 has `T(1*1)=2` versus `T(1)^2=4`; characteristic-zero comparison requires rational coefficients. | Linear, not multiplicative, adapter confirmed; rank witness added. |
| LP2c.8 | Schur condition is a specified field-valued endomorphism algebra; direct sums need not be Schur; zero object over a nonzero field is not Schur. | Centre evaluation/reconstruction hypotheses retained. |
| LP3.0–LP3.3 | Torus modules decompose by weights and have filtration dimension 0; `O(G_m)` has infinite trivial-weight multiplicity under conjugation; `SL₂` in characteristic 2 has a good induced module with a nongood submodule; `V[-1]` has degree 1. | Removed finite multiplicity, retained good-filtration connective convention/separatedness. |
| LP3.4–LP3.6 | `G=1` gives all `Perf(A)`; unit satisfies bar criterion; `PGL_ℓ` unit skyscraper fails induced perfectness; torus tensor test needs both inputs connective. | Explicit enhancement prerequisite and tensor hypothesis. |
| LP3.7–LP3.10 | Torus and `SL_n` have no fundamental-group torsion, even if `ℓ | n`; `PGL_ℓ` fails; rank-zero free group gives `BG`; torus commutator zero fibre remains derived. | Centre order not confused with `π₁` torsion; connectivity not confused with classicality. |
| LP3.11–LP3.12 | Inversion on `G_m` gives `μ₂`, smooth when `ℓ≠2`; at `ℓ=2` it is nonsmooth; formal `r`-power map has tangent multiplication by `r`; zero/unit completion ideals give identity/zero. | Replaced ownership-only Check; root denominator and completion bridge tested. |
| LP3.13–LP3.15 | Trivial solvable group gives identity restriction/induction; factor swap gives diagonal subgroup; torus fixed points give character restriction; good-filtration counit kernel is additional data. | Solvability and prime-to-order hypotheses retained; no arbitrary finite-group claim. |
| LP3.16–LP3.17 | Characteristic-2 factor-swap counterexample has excluded order 2; its central-character summand obstructs generation; trivial action preserves `π₁`; torus fixed identity component has torsion-free `π₁`. | Negative example explicitly remains outside prime-to-order theorems. |
| LP3.18–LP3.21 | Point base gives `Ind Perf` in the presentable construction; `F₀` comparison is identity; `PGL_ℓ,F₁` is fully faithful but not surjective; no wild section gives empty stack; torus/good-prime tame reductions are equivalences. | Small/presentable distinction and homotopy circle diagram fixed. |
| LP3.22–LP3.24 | Very-good exclusions include characteristic 2; reductive Lie algebra retains central torus; trivial quotient map is étale; `u²=t` is ramified for subgroup 1; unramified residue extension has trivial geometric inertia; nontrivial scheme stabilizer defeats slice hypothesis. | Exact geometric-point criterion owned; no inertia/decomposition substitution. |
| LP3.25 | Torus restriction is identity; `GL₂` invariants are trace/determinant with inverted determinant; `SL₂` gives `ℤ[t+t⁻¹]` even at bad primes. | Group restriction distinguished from Lie algebra restriction; stable-lattice source corrected. |
| LP2i.1–LP2i.3 | Rational semisimplicity and characteristic-ℓ good filtrations detect the comparison; base change to `𝔽_ℓ` requires the new theorem, not flatness; bad primes retain only coarse/rational assertions. | Three strengths and categorical versus ordinary colimits retained. |
| LP4.1–LP4.3 | Unit bundle is `O`; zero representation gives zero; tensor/reindex/base change preserve the universal action; `G=1` yields `Perf(A)`/modules; bad-prime `PGL_ℓ` generation fails. | Generation remains a theorem, with its prime hypothesis, before Barr–Beck comparison. |

## Lean signature audit and verification

Spot-checked the following against the prose: prescribed projection in
`ParameterLift`; the crossed multiplication law; gauge conjugation side and
multiplication order; geometric degree kernel; Tate exponent; continuous finite
wild image with compactness and `T₁`; wild extension/projection and conjugation in
`ker π`; backwards conjugation in `twistedWildCentralizer`; the `GL_n` monodromy
predicate and reduced coefficient ring in the rank-one zero theorem; equalizer
coaction and affine quotient; direction of `FreeCocycleIndex.Hom`; tensor-dual
excursion coefficient and its left/right invariant-vector hypotheses; linear
trace extension; and the finite free/nontrivial coefficient hypotheses of
`traceFunction_one`. That is more than the required ten signatures. The narrowed
prototypes are labelled as such in the README; no theorem is obtained by putting
its conclusion in a hypothesis.

Final checks: `lean-check` exits 0, with 18 warnings, all `declaration uses sorry`,
no errors or other warnings. The file stays below 5,000 lines and
`check_sorry_data.py` passes. `check_blueprint.py` reports 0 errors and 0 warnings
for the unchanged accepted packet. `intake.py check-files` reports 0 problems for
all submitted deliverables. All 78 subsection references resolve, every target
has a locator and prerequisites, and `git diff --check` passes.

No unfinished review fixes remain. The full excursion-algebra independence
question at bad primes remains an explicitly excluded source question, not a
promised target. This acceptance concerns a roadmap package, not completed Lean
proofs or an implemented Langlands correspondence.
