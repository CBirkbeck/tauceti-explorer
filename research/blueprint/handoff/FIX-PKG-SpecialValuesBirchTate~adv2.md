# Checkpoint: FIX-PKG-SpecialValuesBirchTate~adv2

Codex, session `codex-BKopsN`, 2026-10-20. Issue #11394. The claim bot confirmed comment 6290945751. This is one package-fix job, not an independent review.

**Status: needs_changes; blocked on F4's maintainer order/ownership decision.** F1 is handled in the parked form the issue requires. F2 and F3 now have owned mathematical targets and proof decompositions. Their global placement is not certified while F4 remains open. The package still covers all totally real fields, every prime including two, all stated higher weights, S-integers and general equivariant coefficients. Nothing is claimed formalised.

## Finding-by-finding disposition

| Finding | Change | Disposition |
|---|---|---|
| F1: normalized adelic volume | Scope states a single open premise (V), using exactly the multiplicative Tamagawa and quotient measure of AdelicAlgebraicGroups §2.4 and BorelRegulators §6.2. Every rational representative, rational regulator quotient and descendant carries it, including APIs and applications. Local annotations refer to the same premise. The analytic, algebraic, independent numerical, localization and Iwasawa-module statements do not consume it. | Parked as instructed; no Tate's-thesis theorem or alternative owner invented. |
| F2: independent all-length Pfister/pure-symbol comparison | New Layer 0 owns the isometry/equality equivalence, algebraic chain steps, hyperbolicity criterion, naturality and Pfister-neighbor splitting criterion. Uses Elman–Lam's algebraic argument and the independent Arason–Pfister dimension bound. Imports the already planned algebraic `milnor-witt-map`, rather than reconstructing it or using its cohomological inverse. Current Tau Ceti's Pfister carriers and base-change formula are cited. | Mathematical prerequisite supplied at proof-plan level. Placement of its early export is part of F4. Tate's degree-two route remains independent. |
| F3: normalized integral regulator lattice | §8.2 now constructs the Dedekind-base K/cycle tower; proves arithmetic motivic amplitude and its odd edge away from two; identifies that specific edge with the normalized Chern character; compares actual integral images; proves both intersection indices are two-primary; and computes the odd valuations of the integral Chern-class index including primes dividing `(n−1)!`. The covolume argument uses the existing Mathlib index law with its correct direction. | Mathematical repair supplied at proof-plan level, independent of (V) and special values. No appeal to the conditional index formula as if it proved its own hypotheses. |
| F4: upstream family order and Deligne–Ribet owner | Removed citations treating AutomorphicPadicLFunctions L3 as an ordered supplier. The exact supplier section records named smoothed congruence/moment targets, the dyadic parity restriction and the extra exceptional-field requirement, with original locators and numerical controls. It explicitly remains unassigned. Audited the maintainer order and PadicFamilies' actual L5 contract. | **Unresolved.** The order excludes the arithmetic K-theory family and drops AutomorphicPadicLFunctions. PadicFamilies does not presently supply the all-prime contract. An order/bundle assignment and an actual analytic owner are required. |

The five preceding repairs were retained: the finite-rank monomial K₂(ℤ) upper bound, the independent norm-33 golden-field certificate, the exact dyadic Kummer dictionary with finite Tor terms, the bounded perfect ordinary-global Burns–Flach cone, and the independent all-prime Sinnott μ-vanishing route. This run did not repeat the previous review's 173-relation/23-minor computation; those untouched data and its report remain the evidence. The new algebraic layer supplies none of its own numerical certificates.

Suggested.lean now has one module docstring, two light real-bodied definitions, twelve theorem signatures and four independently proved examples, two per definition. Removed its trailing catalogue, extra module docstrings and diagnostic `#check`s. No mathematical signature was weakened. The new Pfister, higher K and motivic objects are absent at the pins, so their exact statements, proof plans and numerical checks belong in the README; they are not represented by admitted data, arbitrary carriers or added generic arithmetic examples. Two obsolete README claims that heavy-module checks appeared in Lean were corrected; the checks themselves remain.

## Exact F4 decision and restart

The opening “Needed”, “Moves down” and “Order” paragraphs of `upstream/CaraianiNewton.md` are decisive. The 88 retained units have 28 tiers; the extra K-theory citations are explicitly outside that programme's needs. `focus.json` is priority, not an order. AutomorphicPadicLFunctions is expressly dropped, and only its ordinary totally-real L3 input is moved toward PadicFamilies L5. The issue permits changes to these four deliverables only, so this run has not edited the maintainer's order or another owner's package.

Simply changing the supplier's name to PadicFamilies would be false. Its actual L5 develops an ordinary Hilbert-family setting with an odd prime and additional field/weight hypotheses; it does not export the all-totally-real, all-prime smoothed measure and the dyadic pole-cleared normalization required here. The README's contract identifies the missing mathematical exports rather than silently narrowing this roadmap.

The minimum layer constraints to preserve in an assignment are:

| Earlier export | Later consumer | Required action |
|---|---|---|
| QuadraticFormInvariantsPartII Q2.1–Q2.2 and the algebraic Q2.3/milnor-witt-map | This package Layer 0 | Retain independent algebraic prerequisites; do not import the norm-residue-dependent Pfister cohomological invariant. |
| This package Layer 0 | MotivicEtaleKTheory §6.4, then norm residue §§6–7, then §§10–11 | Move the early export into the earlier quadratic owner, or put the relevant owners in an approved bundle. A package citation SpecialValues→Motivic→Arithmetic→SpecialValues otherwise returns. |
| GeneralAlgebraicKTheory's finite-field calculation and early étale Chern interfaces | KTheoryFiniteLocalFields' rigidity and MotivicEtaleKTheory's later dyadic comparisons | Keep the early/later separation; finite-field and henselian inputs must not be proved from the comparisons that use them. |
| Borel's early arithmetic homology/ranks; arithmetic-ring finite generation | Borel's full regulator lattice and universal factor-two comparison | Separate the early exports from the full lattice: the latter cannot provide its own arithmetic finite-generation premise. |
| MotivicEtaleKTheory's normalized rational character and arithmetic coefficient comparison | This package §8.2's Dedekind edge and actual lattice image | The new integral-image proof is downstream of norm residue and upstream of this package's regulator quotient. It supplies no input to its own norm-residue proof. |
| Full Deligne–Ribet measure, partial-zeta rationality, Hilbert q-expansion congruences and dyadic refinement | IntegralIwasawaTheory §6 dictionary and §§10–12 main-conjecture endpoints | Assign an actual earlier owner with all-prime scope; a dictionary of power-series coordinates does not construct this input. |
| IntegralIwasawaTheory's independent main conjecture and μ input | EulerSystemsCyclotomicMainConjecture's abelian comparison; this package Layers 5–7 | Retain the direction; the special-value conclusions do not prove their analytic suppliers. |

A concrete proposed ownership move is to place the algebraic Layer 0 export with QuadraticFormInvariantsPartII's existing algebraic Pfister/Milnor development, and the full analytic Deligne–Ribet construction with the owner's expanded totally-real input at PadicFamilies L5, before the Iwasawa consumer. That is a proposal for the maintainer, not an assertion that either package already contains the export. It requires reconciling the family with the tier-16 unit and assigning the K-theory units outside the current 88. If the maintainer instead keeps either export here, the corresponding return must be removed by approved earlier moves or a bundle. A bundle may contain at most four roadmaps: naming the whole cyclic family a bundle is not a solution. The table is a set of necessary layer constraints, **not a certified global topological order**.

Resume by obtaining the family order/bundles and the two early-export ownership choices, then updating the permitted supplier contracts to actual earlier targets. Recheck the resulting package graph, including Borel/Arithmetic finite-generation and Motivic/local-K rigidity returns and IntegralIwasawaTheory's early cyclotomic inputs to ArithmeticKTheory. If another package needs a move, have its authorized job apply it; no such package was changed here. Then finish the full Deligne–Ribet prerequisite decomposition at that owner and change the review verdict only once those assignments and mathematical exports exist. The normalized-volume ownership remains parked separately under (V).

For the analytic restart, read Deligne–Ribet (0.1)–(0.5), pp.230–231, (8.2)–(8.4), pp.278–279, and (8.9)–(8.12), pp.281–284, at the author-hosted link in the README. Their partial-zeta rationality is a genuine input and does not follow just from rationality of the full Dedekind value. In (8.11), the test is odd under every real conjugation. In the exceptional-field case the stronger divisibility also depends on the mod-two boundary invariant and the action of c on the quadratic extension generated by square roots of totally positive units, as in (8.12). The required passage to Kolster's pole-cleared G/2^[F:ℚ] must account for these terms, not infer a uniform extra factor two from (8.11) alone. This full analytic supplier is deliberately not marked complete here.

## Adversarial pass on changed contracts and statements

Entries below test mathematical statements, not successful Lean elaboration of their eventual proofs. Heavy carriers are README targets. The standing hypotheses are explicit: characteristic different from two for Pfister forms; number fields and regular rings of S-integers, finite S and n≥2 for the lattice; positive prime p, totally real F and k≥1 for Deligne–Ribet. Thus characteristic-p global fields, a nonregular base, arbitrary nonflat pullback, noncompact measure spaces, q=1 as a residue-field size, and n=0 are outside the relevant contracts. Each exclusion was checked rather than used as an implicit global variable. The twelve Lean statements were also re-read against their actual section variables; they are unchanged, but included below because the module contract changed.

| Statement / interface | Instances or negative controls | Result and change |
|---|---|---|
| (V) and Borel §7.2 use | F=ℚ; r₂=0; compact quotient with an unspecified rescaling of Haar measure | Compactness does not fix volume. One normalized open premise, never inferred from compactness/residue. |
| §2.5 rational representative and uniqueness API | ℚ,n=2: −1/12; ℚ(√5),n=2: 1/30; n=0,1 and a complex place | Even n≥2 and total reality retained; (V) is an argument of the rational construction. |
| §2.7 primewise equivalence | ℚ at 2: 1=3−2; at 3: 0=1−1; q=0 and sign reversal | Carries (V); nonzero rational and analytic sign still required. Absolute-value equivalence remains independent. |
| §2.8 integrality and its APIs | w₂(ℚ)ζ(−1)=−2; deleting the dyadic Euler factor; k=1 vanishing | Rational notation carries (V); all-prime analytic supplier remains open under F4. |
| §2.9 denominator consequence | denominator 12 divides 24; replacing w₂ by w₁=2 fails | Carries (V) through the specified rational representative, not through the conditional Birch–Tate predicate itself. |
| §5.2 étale valuation endpoint | ℚ,n=2,ℓ=3 gives −1=0−1; n=6,ℓ=7 gives −1; ℓ=2 excluded here | Added (V); odd-prime scope and all even weights retained. |
| §5.3 odd-primary K₂ endpoint | ℚ,ℓ=3: 0=1−1; golden field at 3 and 5; degree-two route | Added (V); Tate K₂ does not consume the new all-length layer. |
| §6.1 zeta series, interpolation and Federer predicate | ℚ,u=5 gives G(−4/5)=−2/5; ℚ(√2),u=9 gives valuation 2; s=1 pole | Replaced nonexistent ordered supplier with explicit unassigned contract; kept pole and 2^degree normalization. |
| §6.4 Federer⇒dyadic value | ℚ: v₂K₂=1=3−2; 2^degree omitted | Added (V) for rational value. Characteristic-ideal implication and pole/unit conventions retained. |
| §6.5 abelian Federer route | ℚ has ideals (2); ℚ(√2) has (4); using meromorphic 𝒢₂ as integral numerator | Supplier reference corrected. Removed false claim of a Lean power-series check; P₂/2 and independent μ argument retained. |
| §6.6 abelian Birch–Tate | ℚ gives −1/12; golden field gives 1/30; complex fields excluded | Added (V); combines independent odd and dyadic identities. |
| §7.2 all even-weight dyadic endpoint | ℚ,n=2: 1−3=−2; n=6: 1−3=−2 | Added (V); no prime or totally-real field removed. |
| §7.3 all-totally-real dyadic K₂ | ℚ: 1=3−2; golden field: 2=3−1; dyadic residue orders odd | Added (V) only to value-dependent conclusion. Independent K₂/H² comparison retained. |
| §7.4 Birch–Tate end theorem | ℚ and ℚ(√5), including signs; no r₁=0 number field | Added (V); no abelian restriction. |
| §7.5 module/series dictionary and Federer endpoint | u=5,γ=25: uγ⁻¹−1=−4/5; E=ℤ/2 has kernel/cokernel 2; Λ/(2,T) | Kept exact finite terms and full characteristic series. Replaced its backwards §7.3 comparison citation with independent Tate/Arithmetic comparisons, so the dictionary does not use (V). Removed false claim that the heavy-module test was in Lean. |
| §8.2 rational-quotient predicates and APIs | Rank zero regulator 1; n=2 Birch–Tate specialization; arbitrary nonzero real scalar | Rational quotient carries (V). Arbitrary scalar data cannot substitute for the specified regulator lattice. |
| §8.3 odd Lichtenbaum and cohomological value | n=2 recovers Tate K₂; n≥4 uses norm residue; rank r₂=0 | Added (V); algebraic all-weight prerequisite explicit. |
| §8.5 full higher theorem | ℚ,n=2 gives −2·2/48=−1/12; n=4 gives 2·1/240=1/120 | Added (V); sign, real factor and both K-orders retained. |
| §8.6 equivariant rationality boundary | Trivial G; C₂ with component orders (0,1); rational lattice section 2e | No new consequence from (V). Rationality of corrected ETNC remains a separate conjectural predicate. |
| `pfister_twoSlot_symbol` | n=2 Hamilton form over ℝ; split quaternion; Steinberg {a,1−a}=0 | Algebraic quaternion/Steinberg route; no étale invariant used. |
| `pfister_chain_isometry` | n=2 single replacement; n=3 fixed extra slot; already hyperbolic factor | All n≥2, retaining other slots and represented nonzero values. No assertion of reflection under base change. |
| `pureSymbol_eq_pfister_congruent` | Degree one square class; zero symbol; degree zero excluded | Imports existing algebraic Milnor–Witt map, without injectivity or norm residue. |
| `pfister_congruent_isometry` | Equal form; hyperbolic pair; rank 2^n | Common represented 1 gives strict anisotropic dimension <2^(n+1); independent Arason–Pfister bound then cancellation. |
| `pfister_isometry_iff_pureSymbol_eq` | ℝ slots −1 versus 1; two-fold positive-definite form; n=1,2; char 2 | Sign fixed as 〈1,−a〉; n≥1 and char≠2 explicit. Pure-symbol equality only, not injectivity on every Milnor class. |
| `pfister_hyperbolic_iff_pureSymbol_zero` | Tuple with slot 1; ℝ all −1; 𝔽₃ two-fold; 𝔽₂ excluded; n=0 empty form/symbol | n=0 would give form 〈1〉 and symbol 1, so is excluded. |
| `pfisterSymbol_baseChange` | ℝ→ℂ kills {−1}; identity embedding; algebraically closed target | Only preservation and commuting maps; reflection is false. Existing Witt-class base change cited. |
| `pfisterNeighbor_point_iff_pureSymbol_zero` | n=2 conic, projective dimension 1; isotropic first factor; n=1 square slot | Both isotropic-factor and anisotropic-roundness branches explicit; n=1 is a split quadratic étale algebra when square, not always a field. |
| `numberRing_motivicTower` | Spec F, semilocal DVR, global Dedekind scheme; identity localization | Supported K→G and cycle-layer equivalence include augmentation; strong convergence from support connectivity. No general mixed-characteristic pullback/Gersten assertion. |
| `numberRing_tower_genericSquare` | R→F, S=T, S⊆T⊆U | Same field tower and generic-length normalization. Not merely an abstract isomorphism of abutments. |
| `numberRing_motivicAmplitude` | n=2; real field at p=2; weight 0/1 | Rational and finite-coefficient vanishing separated; real finite two-primary correction retained. Single-term diagonal assertion restricted to positive K-degree≥2. |
| `numberRing_oddEdge` | n=2: K₃→H¹(Z(2)); n=3: K₅→H¹(Z(3)); d₂ and higher | At (a,b)=(1−n,−n), incoming motivic degree ≤−2 and outgoing ≥4. Actual filtration gives K→H¹; H² belongs to the even diagonal. |
| `numberRing_edge_eq_normalizedCh` | n=2 factor −1; n=3 factor 1/2; n=4 factor −1/6 | Generic restriction and the normalized rational edge are compared before lattice indices. No arbitrary rational isomorphism. |
| `numberRing_ch_regulator` | Universal point class; sign convention; Borel versus Beilinson | Exact universal class and fixed coordinate measure used; Borel factor 2 per real coordinate retained. No geometric logarithmic comparison imported. |
| `numberRing_chImage_awayTwo` | Finite S=∅ and enlargement by one prime; n=2 finite-field weight one; residue field 𝔽₂ has q−1=1 | Uses equality of actual maps and vanishing adjoining H^−1/H⁰ finite-field terms. Both images are full lattices, not assumed discrete by definition. |
| `numberRing_chImage_twoPrimary` | Rank 0; rank 1 with L_ch=2I and with L_ch=I/2 | Intersection indices a,b finite powers of two; no false containment at two. |
| `chernImage_oddIndex` | n=3,f=2,e=2; forbidden e=3; n=4,f=6,p=3; rank 0 | v_p(e)=r v_p(f) when containment holds, also at small odd p. Arbitrary index 3/2 control is rejected. |
| Regulator definition; positivity/rank-zero/basis/localization API | Empty determinant 1; v↦2; v↦−v; 2ℤv; S⊆T | Named localization target added. Existing Mathlib covolume laws cited; only the arithmetic specialization is new. |
| `borelCovolume_div_motivicCovolume_eq_two_pow` | a=2,b=1 gives 2; a=1,b=2 gives 1/2; rank 0 | covol(J)=aR_M=bR_ch, hence R_ch/R_M=a/b. Exponent is an integer, not required nonnegative. |
| `deligneRibet_smoothedCongruences` | c=1; k=1; integral finite sum of tests | Explicitly unassigned. p-deletion, finite support in weights and norm exponent k−1 fixed; partial-zeta rationality/Hilbert congruences not hidden. |
| `deligneRibet_smoothedMoments` | ℚ,p=2,k=2,c=Artin(3): −2/3; k=1 gives 0; c=1 gives zero measure | Exact arithmetic recomputed. Sign would flip if p-deletion were omitted. All p and k≥1 retained. |
| `deligneRibet_twoAdicIntegrality` and pole-clearing | r=1 baseline 1, nonexceptional extra 2; exceptional field; ε parity | Added explicit ε(j_vg)=(−1)^kε(g). Uniform full 2^r assertion is not inferred from (8.11); exceptional transport remains in F4. |

## Retained Lean signatures and definitions

| Statement | Instances / variables checked | Result |
|---|---|---|
| `gammaℝ_neg_one` | Γ(−1/2)=−2√π | −2π, regular value; sign agrees with README. |
| `gammaℝ_two` | Γ(1)=1 | 1/π. |
| `gammaℝ_one_sub_two_mul` | k=1 gives −2π; k=2 gives 4π²/3; k=0 | hk excludes 0, no hidden number-field variable. |
| `gammaℝ_two_mul_pos` | k=1 gives 1/π; k=2 gives 1/π² | k≥1 retained; no pole of totalized gamma used. |
| `one_le_dedekindZeta_ofReal` | F=ℚ,σ=2; σ=1 excluded; unit ideal norm 1 | NumberField assumptions explicit; raw L-series only on σ>1. Current positivity theorem is weaker. |
| `rat_eq_iff_forall_padicValRat_eq` | q=r=1; 2 versus 1/2; −q and 0 | Positivity excludes the sign/zero counterexamples; all primes, not p=1. |
| `abs_eq_natCast_div_iff_forall_padicVal` | q=−1/12,k=2,w=24 at 2 and 3; q=0,k=0,w=0 | Nonzero/positive hypotheses explicit. Nat valuations cast to ℤ, so no truncated subtraction. |
| `chiFive` and both examples | 0,2,1,−1 map to 0,−1,1,1 | Two proved examples independent of the admitted L-value theorem; principal/odd character rejected. |
| `LFunction_chiFive_neg_one` | B₂,χ=4/5 | −2/5, matching Hurwitz normalization. No arbitrary character parameter. |
| `sEulerFactor` and both examples | S=∅ gives 1; singleton at −1 gives 1−Nv; nonempty S at 0 gives 0 | Proved from the real definition, not an admitted local theorem. Number-field finite-prime carrier ensures Nv≥2. |
| `differentiable_sEulerFactor` | Empty product; one prime Nv=2 | Positive nonzero bases give entire complex powers; no zero norm. |
| `sEulerFactor_one_sub_natCast` | n=1 gives 0 for nonempty S; n=2 gives ∏(1−Nv) | hn prevents natural subtraction at n=0 from corrupting the exponent. |
| `sEulerFactor_neg_one` | Empty, singleton, two primes 2 and 3 | Product 2 for two primes; sign (−1)^#S and deletion direction correct. |
| `sEulerFactor_one_sub_ne_zero` | n=2 and S=∅; n=1 nonempty is zero | hn≥2 necessary, retained in both README and Lean. |

## Source and library evidence

All new mathematical prose is in this worker's own words, with locators. No source passage or book file was put in the repository. Public papers were read in scratch; no fetched code was run. The cleared library index was consulted; no uncleared copy of Milnor or Cohen was used. No suspicious instruction was encountered in the untrusted material read for this job.

- Elman–Lam, *Pfister forms and K-theory of fields*, Bull. AMS 77 (1971), **971–974**: Theorem 1 p.971, Theorem 2 and Corollary 1 p.972, Proposition/chain argument pp.972–973. The author-uploaded text was read. The 1972 expanded J. Algebra article was not obtained or claimed read. The algebraic map already owned by Q2.3 was checked against its actual prerequisites.
- Levine, *K-theory and motivic cohomology of schemes I*: §§2.2–2.6, equations (2.5)–(2.9), pp.8–10; Lemma 3.3 and Proposition 3.5, pp.13–14. Read the supported tower, layer equivalence, regular K/G comparison and convergence; did not import the conjectural extra mixed-characteristic moving/functoriality.
- Geisser, *Motivic cohomology over Dedekind rings*, Theorem 3.2 and Corollary 3.3, pp.779–780: DVR/global sheaf localization and hypercohomology comparison.
- Kahn, *Algebraic K-theory, algebraic cycles and arithmetic geometry*, §4.3.2 pp.360–361, Theorem 40/Lemma 41 pp.388–389: arithmetic amplitude, finite generation and the finite real two-primary exception. The norm-residue/Beilinson–Lichtenbaum premise is explicit.
- Burgos, *The regulators of Beilinson and Borel*, Definitions 10.7–10.8 and Theorem 10.9 pp.94–97: actual point regulator and universal factor-two normalization. No unrelated rational isomorphism used.
- Deligne–Ribet, the source locations listed above: read the original scan, including the distinction between exceptional signatures and cyclotomic exceptional fields. F4 remains open; source access is not a substitute for the missing owner and decomposition.

Reviewed `data/library-coverage.json`'s complete SpecialValuesBirchTate B.1–B.8 audit. Searched by Pfister forms, symbols, higher Chern operations, motivic complexes, regulators and smoothed p-adic measures, not just target names. At the pins no all-length Milnor comparison, motivic number-ring tower or higher regulator lattice was found. Read the actual Mathlib Gamma, Hurwitz negative-value, zeta coefficient/summability and lattice-covolume declarations before citing them. In particular `ZLattice.covolume_div_covolume_eq_relIndex`, `covolume_pos` and `covolume_eq_det_mul_measureReal` already provide generic lattice laws and are imported, not replanned.

Current read-only upstream audit: TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked the nine post-snapshot roadmaps and Completed material; IntegralLattices' generic covolume/Gram result is not the missing arithmetic-image theorem. Current Pfister Basic/BaseChange/Round/Hyperbolic and quaternion NormForm statements were read; the README now cites their carriers, fundamental-ideal membership, base change and low-length results. No existing upstream roadmap was edited and no Lake command was run there. Lean signatures continue to use only the pinned build, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474`.

## Validation

- `lean-check research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean`: exit 0; exactly twelve `sorry` warnings, no other warnings/errors. Available memory before compiling: 78 GiB. No background compile remains.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/SpecialValuesBirchTate/Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/SpecialValuesBirchTate.json`: 0 errors, 0 warnings, unchanged 54-node packet. This does not certify F4 or require changing that packet outside the allowed deliverables.
- Exact rational arithmetic independently checked the smoothed −2/3 moment, spectral-sequence bidegrees for small n and differentials, intersection/covolume directions and factorial controls.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. `git diff --check`: exit 0.

The only residual finding is F4, with the analytic supplier and global early-export placement explicitly incomplete. This checkpoint preserves the mathematical repairs and gives the next worker the precise maintainer decision to obtain; it is not a claim that the complete package is ready for upstream.
