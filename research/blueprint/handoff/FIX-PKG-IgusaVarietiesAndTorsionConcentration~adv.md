# Igusa package repair

Issue #9890; session `codex-YUAI3X`; agent Codex. Completed 2026-10-17.
This is a complete repair submission, not a checkpoint. The operative findings
are B1–B5 of the round-3 review, dated 2026-10-13; there is no separate `~adv`
review file in this checkout. Only the four issue deliverables change.

## Finding dispositions

| Finding | Change and evidence |
| --- | --- |
| B1: unavailable higher-tier Fargues–Scholze suppliers | Added the owned foundational layer IG.F.1–IG.F.23, including IG.F.12a and IG.F.22a. It contains 25 mathematical targets with constructions, hypotheses, APIs, source locators and discriminating checks. Removed imports of the higher-tier bundle, Bun, v-stack coefficient, Hecke-stack and spectral-action roadmaps. The analytic curve seed is imported from current AdicSpaces Layer 6 and EndoscopicTransferAndUnitaryTraceComparison §12.1; ordinary algebraic vector bundles remain an AlgebraicVectorBundles import. |
| B2: integral PEL representatives | IG.0.18a constructs signed monomial integral Dieudonné lattices with order action, determinant ranks, self-dual pairing and a compatible slope decomposition simultaneously. Taking a common even cycle power proves complete slope divisibility, including at 2. IG.0.18b identifies the fundamental minimal class and realizes it by the polarized abelian quotient over the algebraically closed residue field. Rational Dieudonné–Manin alone is no longer credited with these assertions. |
| B2: crystalline and integral classification | IG.F.7 owns the rational crystalline comparison and tensor-compatible residue reduction; IG.F.8 owns integral Scholze–Weinstein classification, retaining the Tate lattice, effectivity and duality. T2 supplies only the Hodge–Tate sequence. IG.F.6 supplies the full G-torsor classification, with nonsplit descent, rather than treating a GL-bundle classification as a G-bundle theorem. |
| B2: nonnoetherian Witt and valuation sites | Reconstructed IG.3.11 and IG.3.15 on arbitrary perfect Witt bases, with tilting and finite-diagram continuity. Added IG.4.0a for finite-presentation valuation models over O_C and their actual nearby-cycle exchange. It imports the current ClassicalAdic valuation comparison and extends LPV's trait exactness using Hansen–Scholze's valuation result. Raw power-bounded reductions are not declared finite type over k. |
| B2: two towers and integral pushforward | IG.4.0b constructs the geometric Čech/Cartan–Leray comparisons, including both level actions, Hecke localization, boundary restriction and nearby exchange. IG.4.0c constructs the integral, possibly nonfinite pushforward and uniform cosupport continuity for these model systems. IG.4.0d separately proves the ordinary-support derived inverse-limit comparison. No general perverse heart on arbitrary nonnoetherian schemes is asserted. |
| B2: actual torsion Galois supplier | Current TC has changed since round 3: §§3b.2, 4.3 and 4.6 now supply the CM torsion GL determinant and residual representation. IG.6.6a imports them with their actual hypotheses, converts their polynomial by reverse-polynomial substitution and a cyclotomic twist, and applies the finite-level normal-cover descent. IG.6.6b owns the lower unitary residual application. IG.7.7 owns the proper-Levi boundary exclusion, instead of attributing it to the different Siegel-only ALS.4.13 statement. |
| B2: quotient geometry and coefficient generality | IG.F.9–IG.F.14 distinguish the full universal-cover automorphism group, its positive kernel, the coefficient equivalence, geometric torsor coinvariants and the equivariant orientation character. IG.F.17–IG.F.23 provide solid lisse coefficients, local realization over arbitrary finite E, geometric excursion action, reduction compatibility, Levi twists, LLC comparison and the bounded admissible support/reflexivity input. The general spectral-centre identification retains FS's very-good-prime/inverted-ell qualification; the required GL factors satisfy the applicable condition. |
| B3: compactification and affineness | IG.2.11 now exports precisely the multiplier-1 quasi-isogeny form used after IG.2.10. It constructs the boundary kernel, principally polarized middle quotient, normalized symmetric lift, independence of the clearing exponent and algebraized extension/gluing. It explicitly computes the nonidentity outer maps after clearing denominators; it does not apply the printed outer-isomorphism isogeny corollary to that cleared map. Independently, IG.0.18a–b and IG.2.14 give a fundamental EO framing which is integrally completely slope divisible. IG.2.16 separates its unramified affineness from arbitrary-frame transfer at split p. IG.2.18 and IG.4.9 use that framing. |
| B4: Drinfeld model and first-kind tower | IG.0.31 imports the already-owned strict formal O-module deformation construction from EndoscopicTransferAndUnitaryTraceComparison §10.2, and constructs the global signature-(1,n−1) PEL/height-stratum interface using Mantovan and the RSZ matching hypotheses. IG.0.33 proves reduced closure smoothness, kernel-containment direction and dimension; properness requires the compact global model. IG.1.9 retains the base q-Frobenius of exponent (n−h)m in the first-kind comparison. No Harris–Taylor book copy was obtained or used. |
| B5: unsupported integral local vanishing | Deleted the additional integral local-vanishing export at IG.7.11. Kept its mod-ell theorem and the coefficient-reduction compatibility API. Added the nonzero ell-divisible Q_ell control and the cyclic smooth representation explanation. Global integral IG.7.6 and IG.7.7 use finite-level Z_ell-finite modules and remain separate. |

## Ownership and construction order

These moves give the higher roadmaps interfaces to import when their plans are
next reconciled. No other roadmap or packet was edited.

| New owner here | Later consumers whose duplicate plans should import it |
| --- | --- |
| IG.F.1–IG.F.5: divisor parameter, analytic bundles, slopes, relative HN, section diamonds | VectorBundlesAndIsocrystals; the corresponding Fargues–Fontaine foundations |
| IG.F.6–IG.F.9: G-bundles, crystalline/integral comparison, automorphism strata | BunGAndNewtonStrata; VectorBundlesAndIsocrystals; the Igusa-specific integral PEL application stays here |
| IG.F.10, IG.F.12a–IG.F.14, IG.F.17, IG.F.23: Artin/solid coefficients, charts, smooth representations, orientation, reflexivity | VStackSheavesAndLisseCategories; BunGAndNewtonStrata |
| IG.F.11–IG.F.12, IG.F.15–IG.F.16, IG.F.18–IG.F.20: modifications, Jacobian criterion, integral Satake/fusion, Hecke functors, local shtukas | HeckeStacksAndLocalShtukas; GeometricSatakeAndTannakianDuality |
| IG.F.21–IG.F.22a: geometric excursion action, parameter compatibilities and trace/LLC comparison | ExcursionOperatorsAndSpectralAction; LocalLanglandsParameters |
| IG.4.0a–IG.4.0d: valuation-model comparison, two-tower descent, continuous cosupport and supported limits | LPV, Part II in the Igusa direction; general finite-type EDC and ClassicalAdic results remain imports |

IG.0.18a constructs the lattice before EO terminology is needed; IG.0.18b's
recognition as an EO leaf is used after IG.2.12. In IG.F, the rational comparison
precedes integral effectivity. The torsion chart argument precedes the solid
category; its integral consequence follows after IG.F.17. IG.F.22's basic
parameter compatibilities precede the trace/LLC application IG.F.22a. The
general model and continuity assertions of IG.4.0a–c precede IG.4.3; their
two-level noncompact application uses the boundary vanishing of IG.4.6.
Thus those applications are not prerequisites of their own general lemmas.

## Adversarial pass

Every changed target was checked against its complete hypotheses and API.
The table below includes supplier-only edits and the final section whose diff
contains the added References. Cases outside a target's hypotheses are negative
controls, not extra mathematical conclusions. Formal rank-zero controls do not
relax the standing n≥1 hypothesis of the Shimura datum.

| Statement | Instances/calculation tried | Result and change |
| --- | --- | --- |
| IG.0.11 | Ordinary/basic height 2; non-self-dual rational lattice | Retain rational datum; integral PEL existence now has owner IG.0.18a–b. |
| IG.0.18 | Zero group, one isoclinic block; nonconstant Newton polygon over a valuation base | Empty filtration and one-block cases work; valuation assertion retains constant-polygon hypothesis. |
| IG.0.18a | diag(1,p), signed two-cycle, p=2, exchanged coefficient embeddings, rank 0 | F²=−p and F⁴=p²; common even orbit power gives integral slope summands and complementary pairings. No division by 2. |
| IG.0.18b | Ordinary and supersingular frames; nonsplit unramified class; nonprincipal lattice | Existence, not uniqueness; principal quotient uses the prescribed Cartier annihilator over the algebraically closed field. |
| IG.0.31 | n=1, n=2; m=0; connected special fibre; unmatched CM type | Dimensions 0 and 1/0; full sections allow multiplicity. Matching and unramified-reflex hypotheses retained. |
| IG.0.33 | h=0, h=n−1, two different labels, noncompact model | Kernel ranks n and 1; specialization enlarges kernel. Reduced closures smooth; properness only in compact setting. |
| IG.1.9 | Height 2, h=1/0, m=1; h=0 trivial GL_0 group | Base Frobenius exponents 1/2, respectively; comparison is not over the identity base before perfection. |
| IG.1.10 | Compact and noncompact global models | Properness uses projective level model; no properness inferred from local smoothness. |
| IG.2.11 | Identity; φ=diag(1,4,1/4,1), p=2; a→a+1; rank-zero cusp | φᵀJφ=J, cleared ψᵀJψ=16J and outer maps [4]. Quotient/normalized lift, not unchanged outer maps, gives extension. |
| IG.2.14 | Ordinary and basic fundamental frames; nonsplit unramified datum | Minimal structured lattice, not unstructured Oort product, identifies the EO leaf. |
| IG.2.16 | Fundamental frame at unramified p; arbitrary frame at split/nonsplit p | Fundamental leaf affine generally; arbitrary-frame transfer explicitly needs split p. Both boundary squares enter transfer. |
| IG.2.18 | Basic, ordinary, zero central-leaf dimension | Chosen fundamental frame is both affine and completely slope divisible. Rank zero is only a formal control. |
| IG.2.21 | Empty boundary and positive-rank cusp | Same boundary statement; source spelling repaired without widening its hypotheses. |
| IG.F.1 | E=Q_p, unramified/ramified E, identity untilt, Frobenius translate | Imports finite-E curve seed; owns divisor parameter and Frobenius transport, not a second curve construction. |
| IG.F.2 | Zero bundle, identity cover, nonfree projective, negative twist | Descent is basis-free. For φ=diag(1,2), 1−φ=diag(0,−1) in degrees 0,1; eventual vanishing is not all-twist vanishing. |
| IG.F.3 | Rank 0/1/2; slopes −1/2 and 1/2; O⊕O(1) | Isocrystal slope sign reverses; rank-two degree-one stable block differs from the unstable sum. No exact inverse functor. |
| IG.F.4 | Trivial local system of rank 0/r; nontrivial monodromy; jumping polygon | HN filtration asserted on constant-polygon locus; local triviality is pro-étale. |
| IG.F.5 | O, O(1), O(−1), O(−1)[1], zero complex | Separates sections from shifted hypercohomology, slope zero from positive, and relative diamonds from absolute origin. |
| IG.F.6 | G=1, torus, GL_2 with degree-zero polygons (0,0)/(1,−1), nonsplit G | Torsor/tensor classification retains automorphisms and descent; rank/degree alone do not classify. |
| IG.F.7 | Étale and multiplicative groups; trivial tensors; incompatible pairing | Bundles O and O(1); tensor-compatible rational comparison, no arbitrary-characteristic-p-base claim. |
| IG.F.8 | T=0; W=0/full; different lattices in T[1/p]; Cartier dual | Zero group and étale/multiplicative extremes correct; integral lattice and annihilator condition retained. |
| IG.F.9 | Basic b, nonbasic GL_2, G=1 | Positive kernel disappears only in basic case; full automorphism quotient retained otherwise. |
| IG.F.10 | Identity map, finite quotient with ell-torsion, smooth curve, nonrepresentable quotient | Relative dim 1 gives (1)[2]; representable six operations do not silently supply an Artin-stack formalism. |
| IG.F.11 | μ=0, GL_2 μ=(1,0), opposite μ, minuscule/nonminuscule | Modification dimension 0/1 and bounded Schubert geometry distinguished from arbitrary flag varieties. |
| IG.F.12 | Rank-zero tangent, positive tangent, slope-zero tangent, missing embedding | Zero gives a point; positivity is the open smoothness criterion; embedding hypothesis retained. |
| IG.F.12a | GL_2 extension O by O(1), basic b, G=1, pro-ell K | Negative BC extension chart; partial one-end support is not ordinary compact support; exact invariants only pro-p. |
| IG.F.13 | H=1, finite H, pro-p/pro-ell H, nonbasic b | Derived invariants retained for ell-torsion groups. Positive torsor gives full faithfulness; stratum equivalence uses section too. |
| IG.F.14 | Trivial torsor, dimensions 0/1, nontrivial orientation character | Torsor (1)[2] and classifying-stratum κ⁻¹[−2] have opposite shifts; H-action retained until coinvariants. |
| IG.F.15 | Trivial representation, two weights, nonflat coefficient reduction | Uses integral flat Satake objects and ULA, not arbitrary reduction of an IC complex. |
| IG.F.16 | Tensor unit, GL_2 standard representation, simple-root sign over F_3/F_2 | δ=1 versus representation rank 2; pinning correction −1 is 2 over F_3 and 1 over F_2. |
| IG.F.17 | Zero object, Q_ell object, one/infinite strata, pro-p chart | Solid lisse category need not be derived complete; compactness requires finite stratum support and compact restrictions. |
| IG.F.18 | Tensor unit, two legs, empty leg set, compact generator | Hecke unit/adjunction and Weil/fusion compatibility; bounded legs preserve compactness. |
| IG.F.19 | E=Q_p and general finite E; μ=0; zero/one/two legs; nontrivial b | Finite-E realization and reflex fields explicit; no-leg G(E)/K assertion only for b=1. |
| IG.F.20 | GL_2 standard μ, pro-p and arbitrary K, integral coefficient order | Shift/twist uses δ=1, not rank 2; general K uses derived invariants; torsion limit precedes open-level colimit. |
| IG.F.21 | G=1; GL factors at small ell; general G without very-good condition | Integral geometric excursion action constructed; centre identification retains its prime hypotheses. |
| IG.F.22 | GL_2 Levi, q=9 in F_11, dual parameter, reduction | Chosen sqrt(q)=3, inverse 4; normalized and unnormalized Levi embeddings differ. Cartan transports duals. |
| IG.F.22a | Split GL_1; GL_2 inner form; noncompact local space; mod-ell reduction | Existing LT/Drinfeld realization imported; trace uses proper fixed-locus quotient, then lift/reduction compatibility. |
| IG.F.23 | Zero complex; two distinct central characters; arbitrary nonadmissible object | Orthogonality uses compatible central projectors on bounded admissible finite-support pieces before limits/duals. Reflexivity is not universal. |
| IG.3.3 | Étale/multiplicative, zero Tate lattice, PEL pairing | Integral classification explicitly imported from IG.F.7–8 instead of T2. |
| IG.3.4 | Ordinary/basic Newton vectors, rank 0/1 | Modification map and flag Newton stratification use the owned G-bundle and smooth-modification targets. |
| IG.3.9 | Same reduced b with different trivializations; bare GL isomorphism | Existence of structured comparison supplied by IG.F.7–8, not a canonical trivialization. |
| IG.3.11 | A=k, perfect nonnoetherian A, p=2; characteristic-p/p-adic distinction | W(A)/p=A; canonical Witt lift and henselian site comparison constructed without SF.4 noetherian overclaim. |
| IG.3.15 | Identity étale cover, finite constant A, arbitrary perfect A; tilted side | Finite-diagram continuity and tilting compare the intended sites/cohomology; equal-characteristic completion uses its own pseudouniformizer. |
| IG.3.20 | Étale/multiplicative extremes; wrong tensors; epsilon=0/positive | Small positive epsilon retained; constancy relies on tensor-compatible crystalline comparison. |
| IG.3.26 | Height 1/2; first level at p=2; étale/multiplicative H | Imported integral classification and local modification; exceptional initial transition not called nontrivial. |
| IG.3.27 | Basic/ordinary strata; d_b=0/1; nontrivial κ | Full automorphism torsor, opposite action and equivariant twist retained in Mantovan filtration. |
| IG.4.0a | Spec O_C, smooth curve, nodal curve, raw nonfinite-type reduction | Perverse shifts 0/1 use fibre dimension; nodal nearby class remains; comparison uses eligible models. |
| IG.4.0b | Trivial torsor; finite C_ell action; pro-p/pro-ell towers; empty boundary | Čech descent is geometric and derived; no underived invariants for pro-ell groups. |
| IG.4.0c | Identity/finite/infinite integral map; profinite geometric fibre; zero complex | Zero-dimensional Stone fibres and uniform strict-local bounds give the stated lower bound; no arbitrary constructible colimit claim. |
| IG.4.0d | Empty/full support; identity formal model; derived limit with nontrivial lim¹ | Supports compared at finite stages via localization triangles; right t-bound survives derived limits, no ML assumption. |
| IG.4.1 | Trivial compact action, finite formal model, raw A°/p | Small subgroup fixes finite model generators; raw reduction not declared finitely generated over F_p. |
| IG.4.3 | Ordinary/basic flag chart; integral nonfinite source | Finite-type residue target comes from chosen model, not from raw power-bounded reduction. |
| IG.4.4 | Compact zero-dimensional chart and curve; both coefficient bounds | Uses valuation nearby exactness and actual two-tower descent, not trait exactness alone. |
| IG.4.7 | Noncompact boundary; two independent levels; finite/infinite integral map | Lower bound only; boundary killed before tower passage using uniform model comparison. |
| IG.4.9 | Basic/ordinary leaf; fundamental versus arbitrary nonsplit frame | Artin vanishing uses the affine, completely slope divisible fundamental frame. |
| IG.6.6a | Rank 1/2 polynomial, zero/unit nilpotent ideal; finite normal cover | Substitute X/q: 1−6X becomes 1−2X at q=3; rank-two 1−6X+40X² becomes 1−3X+10X² at q=2. No injectivity of pullback assumed. |
| IG.6.6b | Unit rank, m=1/2, coefficient i=0/1/2 | Exponent identity i(1−2m+i)/2+i(m−1)=i(i−1)/2 pins ε^(1−m); lower unitary residual application owns its descent. |
| IG.6.7 | Length-one/two systems; CM and missing-CM hypotheses | Uses actual TC torsion construction through IG.6.6a, with field/ramification conditions retained. |
| IG.7.4 | Identity normal cover, pro-p/pro-ell levels, cohomological degrees below bound | Uniform lower bound passes through nonnegative derived invariants via IG.4.0b. |
| IG.7.7 | n=1/2; proper and Siegel Levi; reducible residual system | At n=2,r_1=1 exponents −3,0,−1 and ranks 1+1+2=4; irreducibility excludes every proper Levi, not just Siegel. |
| IG.7.10 | GL_1, split/nonsplit GL_2 inner form, repeated eigenvalues, q=1 | Nonsplit factor and twisted Levi embedding essential; parameter reduction now has an owned integral source. |
| IG.7.11 | GL_1; quaternion factor; q=1; ell=p; nonzero ell-divisible Q_ell | Mod-ell theorem retained; false integral Nakayama export removed. |
| IG.7.12 | Empty/full ordinary support; d=0/1; nontrivial derived inverse limit | Uses IG.4.0d, not a generic filtered-colimit criterion, for supported Rlim. |
| IG.7.13 | Formal rank 0, balanced n=1, basic quaternion/ordinary split, q=1 | Integer slopes in [−1,0] force ordinarity only for these split factors. Correct dualizing sign and compatible spectral projectors kill nonordinary terms. |
| IG.7.15 | F⁺=Q versus larger degree; unchanged middle-degree maps | Mathematical statement retained; audited dependency route and distinguished published ACC reference edition. |

The 17 new Lean examples prove the available matrix, exponent, polynomial,
finite-field and Q_ell controls. They introduce no geometric carriers or helper
development. They do not purport to formalize the new geometric targets.
Existing Lean variable blocks, native Hecke hypotheses and coefficient primes
were also checked; the 17 original sorry-bearing statements remain statements.

## Source and library audit

The new mathematics is organized by its constructions and consumers, not as a
summary of source sections. All exposition is in our own words. Sources read
for the repairs include FS arXiv:2102.13459v1, Chapters II–V, VII and IX;
Fargues' 30 November 2020 G-torsor manuscript, §5; Scholze–Weinstein 2013,
§§5–6; Nie Proposition 1.5 and Theorem 1.4; Viehmann–Wedhorn §§7–8;
Mantovan's public 2008 paper, §§2–4; RSZ §4.3/Theorem 4.5; the actual
Koshikawa v1 arguments in §§4,7–9; Hansen–Scholze Theorem 4.1,
Corollary 4.2 and Lemma 6.3; Bhatt–Hansen Theorem 4.2(8); and HKW
§§5.3–5.4, Theorem 6.5.2 and Theorem 6.6.1. Precise locators appear at
each target. Cleared SW, Berkeley and published ACC material was read in
place under the library index's terms. No cleared file or passage was copied
into this repository or the scratch directory; the uncleared Harris–Taylor
book was not used.

The duplication audit read `data/library-coverage.json`, current upstream at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. It included the nine newer
roadmaps and Completed roadmaps, searching by structures, operations and
hypotheses. Current AdicSpaces and ReductiveGroups README/Lean files were
read as the two upstream models, along with the designated exemplar.
The analytic curve seed is not replanned: the
existing `TauCeti.FarguesFontaine.spaY`, Frobenius and window APIs, the
AdicSpaces curve seed and the finite-E ET extension remain imports.
Algebraic finite locally free bundles, smooth representation operations,
restricted products, generic Hecke convolution/anti-involutions, ordinary
derived categories, Witt vectors and condensed modules remain deferrals.
The current upstream modular-curve Drinfeld structures are elliptic-curve
interfaces, not the global PEL deformation interface added here.

At the pins, read the native Hecke convolution/ring and fixed-double-coset
commutativity signatures. Mathlib's `WittVector.isocrystal_classification`
has a dimension-one hypothesis; it does not supply the general PEL target.
The build's two imported Tau Ceti modules and their full ten-module source
closure were compared byte for byte against
`f790474821cf4256814db967cb154e7af3d0c369`: all match. Mathlib is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`. No Lake command was run in
either read-only upstream checkout.

## Validation and remaining maintenance notes

- `lean-check research/blueprint/packages/IgusaVarietiesAndTorsionConcentration/Suggested.lean`
  exits 0: no errors, 17 warnings, all for `sorry`. Available memory exceeded
  20 GB before the check. The file has 555 lines, 33 examples (17 added),
  and no sorry-defined data.
- `scripts/check_sorry_data.py` passes; `git diff --check` passes.
- All 123 accepted-node anchors and all 234 accepted API names survive.
  The README has 162 numbered targets and 194 explicit anchors; its 305
  internal anchor links resolve. All 84 Checks blocks have at least three
  tests (319 bullet tests in total).
- The unchanged legacy packet checker reports 12 errors: four IG.4 nodes
  each reference three obsolete EDC IDs, `EDC.5/perverse-t-structure`,
  `EDC.5/affine-perverse-artin-vanishing` and `EDC.5/t-exact-functor`.
  The nodes are compact-perversity, compact-minimal-stratum-concentration,
  semiperversity and minimal-stratum-lower-bound. These are existing packet
  metadata errors, not introduced by this branch. The issue does not permit
  editing the packet, and PACKAGE_REVIEW explicitly forbids packet edits.
  The package cites the current EDC layers and supplies the extra continuous
  integral interface itself. A later packet reconciliation should update
  those twelve references; this submission does not claim that checker passes.
- `python3 research/blueprint/intake.py check-files` on all four deliverables
  reports 4 files, 0 problems. The required review date is 2026-10-16, as specified literally by the issue; the actual
  repair date is the 17th as recorded above.

For the maintainer: Koshikawa's local realization display distinguishes the
Satake representation rank from the shift δ=⟨2ρ,μ⟩; the package computes
the GL_2 standard example to prevent conflating them. His ordinary comparison
also requires the equivariant κ and the costalk functor, as preserved here.
These source-normalization notes require no edits to an upstream roadmap.

All five package findings have dispositions above; no package mathematical
residue is being deferred. Reconciliation of the unchanged packet IDs and
the later higher-roadmap ownership imports is separate maintenance. The next
step for this job is its independent fix review, not another worker repair
or an additional claim in this session.
