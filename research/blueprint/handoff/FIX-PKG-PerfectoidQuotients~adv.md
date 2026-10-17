# PerfectoidQuotients adversarial package fix

Completed issue #9891 by Codex (GPT-6), session `codex-yRwDfb`.
The audit and checks below were performed on 17 October 2026. The review JSON
keeps the issue's requested 16 October date field. No second job was taken.

## Finding disposition

| Finding | Change | Result |
| --- | --- | --- |
| B1: two integral-perfectoid predicates and duplicated root criteria | Deleted the local predicate, its selected-root normalization and transport declarations. README boundaries import PerfectoidSpaces P1.24's actual torsion-allowing predicate and P1.25's Tate dictionary. BMS1 and BMS2 describe one property; admissible-element divisibility is distinguished from normalized equality of principal ideals. | Resolved. No local alias or replacement predicate remains. |
| B2: two semiperfectoid perfectoidizations, surjectivity and strongly closed results | Deleted local semiperfectoid/initial-prism/perfectoidization constructions, the universal functor API, principal-quotient/flat-descent/filtered-colimit surjectivity development, and analytic quotient targets. The exact supplier section imports the single universal ring and its initial-prism description, surjectivity and analytic model from P4.15.1–P4.15.6. | Resolved against the current lower-tier contract. No new comparison between two universal objects is needed: these are descriptions of its one object. |
| Derived versus ordinary completeness in B2 | The common input is a discrete **derived** p-complete ring with an actual perfectoid surjection. The analytic input is explicitly an ordinary pseudouniformizer completion whose derived semiperfectoid presentation is part of the supplier contract. The countable-product difference criterion, separatedness and bounded-torsion comparisons are stated separately. | Resolved without identifying ordinary and derived completion by notation. |
| Shape defects in the reviewed Lean file | Removed the sorry-bodied finite Witt maps and quotient power map, local carrier/instance choices and the universal-ring construction. Their genuine target statements and APIs remain in the README where appropriate. Lean contains two light real-bodied definitions, terminal statements and examples on existing Mathlib carriers. | Resolved; 344 lines, 47 sorry warnings only. |
| Preserve the earlier review's mathematical repairs | Retained the coordinate/digit distinction, Fontaine sign, quotient-map direction, shift, ambient root closure, sharp-ideal finiteness, torsion-free decomposition, root indices, nonradical quotient witness, saturation and positive-degree monic convention. Added explicit APIs and Checks for root neighborhoods, monic-root pairs and functorial almost iteration. | Retained and rechecked. |

The earlier review correctly identified a cross-package defect in its then-current
inputs. The current [PerfectoidSpaces PR #818](https://github.com/TauCetiProject/TauCetiRoadmap/pull/818)
now gives the required lower-tier contracts in detail. This fix consumes the
[immutable README at `3a308c7ea66cce055b429c79505eb97f1f02106c`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3a308c7ea66cce055b429c79505eb97f1f02106c/TauCetiRoadmap/PerfectoidSpaces/README.md),
particularly P1.24–P1.25 and P4.15.1–P4.15.6, and its Suggested.lean.
It does not edit that package or assert that its planned interfaces are implemented.
The accepted verdict concerns a roadmap with explicit suppliers, not formal proofs.

## Ownership, library audit and scope

Read the current upstream roadmap checkout at main
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps
and Completed object matches, and the current Tau Ceti library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read relevant declarations at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The library coverage file has no
PerfectoidQuotients-specific entry. Searches used the objects (Witt coordinate
operations, inverse perfection, quotient powers, regular localization, root
closure, completion and universal quotient properties), not only proposed names.

| Object match | Disposition |
| --- | --- |
| Mathlib `Perfection.quotientMulEquiv`, `coeff_quotientMulEquiv` | Remain citations in the baseline; no replanning of the compatible-root multiplicative comparison. Normalized finite quotient calculations remain additional. |
| Mathlib `PreTilt`, sharp and `WittVector.fontaineTheta` | Existing carriers/maps imported. No local construction. Naturality on general p-complete rings and the principal-kernel algebra are additional to the Tate-plus statements. |
| Mathlib Witt completion, coordinate divisibility and regularity of p | Baseline inputs. The pinned `WittVector.isUnit_of_coeff_zero_ne_zero` has a field hypothesis; the retained unit theorem is for arbitrary perfect coefficient rings. |
| Mathlib truncated Witt carrier, truncation, infinite Frobenius | Baseline inputs; not an all-length finite Frobenius or finite Fontaine map. Their new construction is README-only. |
| Current Tau Ceti Witt `(p,[ϖ])`-adic completeness, Frobenius and Huber adapter | Cited existing modules in the baseline, not new targets. |
| Upstream AdicSpaces Layer 6.1 | Existing field/topological A_inf direction deferred. The retained integral-ring variants allow torsion and nondomains. |
| PerfectoidSpaces P1.24–P1.25 | Predicate, normalized/root criteria and Tate dictionary deleted as local targets. |
| PerfectoidSpaces P4.15.1–P4.15.6 | Generic derived/prism/Hodge–Tate/lifting/perfectoidization/reducedness/quotient-image mathematics imported, not redeveloped. |

No further exact duplicate was found in the current object matches. The retained
relative and absolute final-object covering conclusions are BS22 Examples
7.12–7.13, beyond the generic lifting/perfection contract. The modulo-p
ind-syntomic conclusion is Remark 7.15, beyond the supplier's André cover.
The fixed-field almost branch has its specified field, root ideal and saturation,
and is distinct from the p-completely faithfully flat integral cover.
The radical factorization is strengthened to arbitrary reduced targets.

All prerequisites terminate in pinned/current libraries, lower-tier
PerfectoidSpaces or CrystallineCohomology, or same-bundle PrismaticCohomology.
The latter is used only for its additional general Tor/étale interfaces; the
restricted quotient-prism machinery is obtained directly from P4.15. No
reverse dependency into PerfectoidQuotients is introduced for PerfectoidSpaces.
Later arc descent and BS22 Proposition 8.5 are not inputs to Theorem 7.4.

## Statement-by-statement adversarial pass

The rows below cover all 61 original packet targets in packet order, including
those now imported. Each row records actual test instances or the relevant
hypothesis failure, the result and the disposition. An imported row is an
ownership check of a consumed contract, not a new local theorem. Prismatic,
derived and analytic targets remain mathematical specifications on their real
supplier carriers; no unrelated Lean data is used to simulate those carriers.

| Statement | Instances tried and result | Change / final location |
| --- | --- | --- |
| Integral-perfectoid definition | Zero is admitted separately; F_p and its product are perfect; Z_p fails the admissible-element condition; F₂[T] fails Frobenius surjectivity. | Import P1.24; delete local predicate and its instances. |
| Nontrivial perfectoid criterion | In a nonzero complete ring p cannot be a unit; unit-adic completion forces zero. | Import P1.24; retain explicit zero/nonzero interface distinction. |
| Inverse-perfection unit criterion | Coordinates of 1 are units; a root-compatible inverse is coordinatewise; a nonunit constant coordinate cannot have an inverse. No surjectivity on the original ring is used. | §0.1; Lean `perfection_isUnit_iff`. |
| Perfect Witt unit criterion | p has constant coordinate zero; 1+p has coordinate one; products of perfect fields require ring, not field, generality. | §0.1; `witt_isUnit_iff`; existing field-only theorem cited. |
| Witt product coordinate one | At p=2, p has coordinates (0,1), p² has coordinate one zero; p[T] has coordinate one T² and digit one T. | §0.1; `witt_mul_coeff_one`; two computed examples retained. |
| Characteristic-p theta kernel | For F₂ the kernel is (2). For F₂[T], the inverse-perfection image is only constants; no false surjectivity of theta is inferred. | §0.1; principal-kernel premise retained, no assumed Frobenius surjectivity. |
| Characteristic-p tilt projection | The same polynomial example has injective constant inclusion, not a surjective inclusion. | §0.1; only injectivity asserted. |
| Sharp naturality | Identity and product projection commute on 0,1 and compatible roots; incompatible quotient maps are excluded by hg. | §0.2; Lean includes hg. |
| Theta naturality | Same maps; on [a] the equation is sharp naturality. Teichmüller extensionality used only modulo nilpotent p-powers. | §0.2; complete target separation retained. |
| Integral-perfectoid equivalence invariance | Zero-to-zero and product-factor swaps preserve the property; no chosen orientation is transported as part of the predicate. | Import P1.24; delete local declaration. |
| Characteristic-p perfectoid criterion | Perfect F₂ and zero pass; polynomial F₂[T] and nonreduced perfect-root quotient fail. | Common predicate contract; CharP exactness versus zero stated explicitly. |
| Quotient power surjectivity | Ideals 0 and top, p=2, and a nonradical ideal in a perfect ring; surjectivity survives all. | §2.1; even an arbitrary surjective power function suffices in Lean. |
| Perfect quotient iff radical | Ideals 0 and top pass; (T) in F₂[T^(1/2^∞)] is nonradical and leaves a square-zero class. | §2.1; zero quotient included without a CharP instance. |
| Radical quotient perfectoid | Radical of 0 in a perfect ring is 0; radical of top is top; radical of (T) kills all inverse roots. | §2.1 on the common predicate; no local perfectoid carrier. |
| Radical quotient universal | Targets any reduced ring, including zero; f killing I kills its radical; uniqueness from quotient surjectivity. | §2.1; strengthened Lean factorization removes unnecessary perfectness and CharP premises. |
| Compatible-root ideal equals radical | f=0 gives bottom, f=1 gives top; indices 0,1,2 give T,T^(1/2),T^(1/4). | §2.1; inverse-Frobenius direction retained. |
| Perfectoid quotient iff radical | Nonradical root quotient is semiperfect but nonreduced; radical quotient F₂ is perfectoid; unit ideal gives zero. | §2.1; dictionary imported, explicit criterion retained. |
| Witt p² product detection | ξ=p reduces to p² dividing pg iff p divides g; product coefficient rings allowed; ξ=p² fails the unit-coordinate premise. | §0.3; no domain hypothesis introduced. |
| Principal Witt p-saturation | ξ=p makes p²f in (p) automatic and pf in (p); cancellation uses regular p in W(k), not regular ξ. | §0.3; proof route and unit-coordinate condition retained. |
| Principal Witt quotient torsion | n=0 forces x=0; n=1 is direct; ξ=p kills all by p; W(F₂)/(4) disproves the result without the premise. | §0.3; only the terminal theorem in Lean. |
| Prism/animation contract | Trivial prism, crystalline (Z_p,(p)), nonperfect base; ordinary rings alone do not supply δ or derived completion. | Exact suppliers P4.15.1–P4.15.2, with genuine carriers. |
| Smooth Hodge–Tate contract | Relative dimension 0 has only degree zero; dimension 1 has the twisted degree-one forms; twists and completed forms retained. | Exact suppliers P4.15.3; no duplicate local comparison. |
| Semiperfectoid definition | F_p: difference operator is identity; Q: (1,p⁻¹,…) is a nonzero kernel; ordinary completion alone is not its definition. | Import P4.15.6; delete local predicate/operator. |
| Initial prism | Zero gives trivial prism; F_p gives (Z_p,(p)); perfectoid input gives its Fontaine prism; arbitrary initial prism need not be bounded. | Import P4.15.2; delete construction and its tests as local ownership. |
| Universal perfectoidization | Zero and already perfectoid inputs are identities; nonradical root quotient maps noninjectively to F₂; presentation changes give the same object by universality. | Import P4.15.2/P4.15.6; delete chosen ring and functor API. |
| Derived initiality | Zero cotangent and QRSP cases; arbitrary discrete prismatic object gives only weak initiality/retract before the QRSP argument. | Import P4.15.3; no general weak-to-actual initiality claim. |
| Quasisyntomic lifting | Identity cover and crystalline base; faithful flatness is conditional on the base reduction map. | Import P4.15.4, with perfection clause requiring a perfect base. |
| André cover | Zero and algebraically closed F_p pass; constant polynomial 1 has no root in nonzero rings; a raw single-root quotient can have nilpotents. | Import P4.15.4; positive-degree convention explicit. |
| Surjectivity of perfectoidization | Zero/identity cases and noninjective root quotient; no invertible or arbitrary ring-map converse claimed. | Import P4.15.5; delete all duplicate local reductions. |
| Completed integral closed quotient | I=0 gives original pair, I=R gives zero and empty spectrum; arbitrary nonclosed I still requires completion. | Import P4.15.6; specify ordinary ϖ completion, derived presentation and minimal plus ring. |
| Strongly Zariski closed | Same ideals; ambient ring maps to quotient; plus map is ambient-plus to quotient-plus and only almost surjective. | Import P4.15.6; no analytic theorem owned here. |
| Frobenius-surjectivity equivalences | r=0 is trivially zero target but does not replace all r≥1; r=1, p=2 over Z gives F(1,1)=3; over F₂ gives F(0,1)=0. | §0.2 retains additional all-length finite-map statements; common root criterion imported. |
| BMS normalization | π^p=pu in normalized case; arbitrary admissible ϖ need not generate (p) after taking its pth power; zero handled separately. | Import P1.24, own words and normalization hypotheses in contract. |
| Principal theta criterion | π=0 in characteristic p; regular π in the converse; mere principal kernel without the stated surjectivity is not used. | Import P1.24; explicitly include power-map surjectivity in the consumed criterion. |
| Generator iff coordinate unit | ξ and a unit multiple have the same ideal; p in characteristic p has coordinate one 1; p² is excluded. At p=2, θ([a]−2)=0 but θ([a]+2)=4. | §0.2 retains general integral-ring criterion, regularity, normal form and map compatibility. |
| Bound-one p-torsion | n=0/1, characteristic p and products; W(F₂)/(4) is excluded by generator condition. | §0.3 retains elementary Witt proof and derived/ordinary consequence. |
| Relative cotangent vanishing | Identity map has zero complex; absolute complex is shifted conormal line, not zero. Degree-zero Z shifted [1] has Z at −1 and zero at 0. | §0.3; full complex and separately named absolute target. |
| Reducedness | Perfect field and product pass; root quotient retaining square-zero T^(1/2) fails. | Import P4.15.5; delete duplicate local theorem. |
| Torsion-free perfectoid quotient | ϖ=0 in characteristic p removes the whole ring; regular ϖ removes nothing; both special fibres in the fibre product must be reduced. | §0.4; integral-perfectoid premise made explicit; actual localization kernel and tilt formula retained. |
| Normalized compatible roots | n=1/2 give R/π₁ and R/π₂ mapping by p and p² powers to R/p; characteristic-p inverse roots use the opposite Frobenius direction. | §0.4; torsion-free normalized statement retained; existing multiplicative comparison cited. |
| Ambient p-integral closure | Zero ambient ring, F₂[T], F₂[T²], F₂[T³]; exponent 1 gives identity, exponent 0 closes to the ambient ring. | §0.5; real infimum body; general natural exponent, prime for source applications. |
| Root-closedness criterion | ϖ=1 over Z is trivial; ϖ=T over F₂[T] uses target modulo T²; regularity makes localization injective. | §0.5; Lean uses equivalent divisibility condition and actual localization range. |
| Root-closure completion perfectoid | Already closed perfectoid ring remains itself; zero completion allowed; nonregular ϖ is excluded before cancellation. | §0.5; compatible tower, regularity, divisibility and quotient-surjectivity retained. |
| Complete-étale/henselian preservation | Identity étale algebra and arbitrary henselization ideal; no finite-generation premise on the latter. Noncomplete raw étale algebra must be completed. | §0.6; ALB derived-complete hypotheses and Fontaine-prism lifting retained. |
| Root polynomial completion | Empty variable set returns A; one variable gives adjacent roots; raw polynomial algebra lacks the claimed completeness. | §0.6; actual ϖ completion and tilt retained. |
| Completed tensor products | Empty family returns A, one factor returns it; multiple factors use tensor over A with its structural maps. | §0.6; tilt formula and completion retained. |
| Root-stable quotients | Empty defining set returns A; containing 1 gives zero; single compatible tower is a sufficient special case. Arbitrary unrooted set lacks the ideal-power premise. | §0.6 retains full modulo-ϖ^n ideal condition, beyond supplier's single tower. |
| Products | Empty product is zero, singleton unchanged, product of characteristic-p perfect fields; bound-one p-torsion is uniform. | §0.6; arbitrary small family and tilt product retained. |
| Finite sharp-ideal completion | Empty tuple J=0 leaves A; a sharp unit gives zero; finite tuple required for comparison. | §0.6; derived/ordinary comparison and tilt formula both retained. |
| Tate powerbounded model | p-torsion-free field model, saturation and its almost quotient; general torsion ring cannot be treated as a faithful subring of R[1/p]. | Import P1.20/P1.25; no local field/Tate construction. |
| Perfectoidization flat base change | Identity base change; derived-complete quotient; faithful flatness used to descend, not merely arbitrary map. | Import P4.15.5; delete local comparison. |
| Perfectoidization completed colimits | One-object and filtered finite-ideal systems; derived completion and weak-Serre image step kept distinct from raw ordinary quotient. | Import P4.15.1/P4.15.5; delete local colimit proof targets. |
| Principal rooted quotient formula | Constant towers 0 and 1 give R and zero; tower T^(1/p^n) gives F_p whereas raw quotient by T is nonreduced. | Import P4.15.5; no second universal quotient. |
| Relative smooth-site cover | Relative dimension zero; perfect crystalline base; test prism still needs faithfully flat refinement rather than a pre-existing map. | §1.1; full cotangent vanishing, relative perfection and final-object covering retained. |
| Frobenius-flat absolute cover | Perfect crystalline prism is an identity case; general bounded prism explicitly requires completely flat φ. | §1.1 retains only the extra final-object covering conclusion, BS22 Example 7.13. |
| André ind-syntomic refinement | Characteristic p and identity perfect cover; PD stages have g_i^p=0; polynomial 1 excluded. | §1.2 adds modulo-p conclusion only; stronger ordinary result keeps Part II owner. |
| Bhatt fixed-field comparison | Zero flat algebra; K° itself; a general torsion-allowing perfectoid ring is not automatically a flat saturated K° model. | §0.7; flatness, t-completeness, saturation, normalized norm of t and quotient Frobenius explicitly retained. |
| Rational root neighborhoods | ℓ=0 radius 1 gives Y; T=t lies in U₁ but not U₂; g=1,T=0 lies in U₀ but not U₁. | §1.3 adds named restriction/identity/composition/model API and three Checks. |
| Saturated root extension | Zero input and g=0 give zero and identity respectively; adjacent roots imply p^n-power identity; raw completion can differ from saturation. | §1.3; C_* construction and six API statements retained. |
| Almost root flatness | ℓ>0, g=0 and monic T−g; exclude ℓ=0 from the quoted intermediate theorem and constant polynomial 1 from monic cover. | §1.4; specified almost ideal and modulo-t flatness retained; monic pair supplied with API/Checks. |
| Functorial almost AIC extension | Zero; constant monic 1 nonexample; F₃ has all cube roots but no root of X²+1, whose values are 1,2,2. | §1.4; all positive-degree monics, functorial coproduct stages and ω₁ completeness retained. |

## Additional definitions, APIs and convention pass

These rows cover the newly specified interfaces and assertions beyond the
61-target crosswalk. The named definition Checks in the README remain the
primary tests; the available-carrier numerical witnesses are Lean examples.
Supplier-owned definition tests now live with their owner; they have not been
retained as duplicate local definition blocks.

| Statement / interface | Instances tried and result | Change |
| --- | --- | --- |
| Ordinary/derived completion conventions | I=0 is identity; I=top ordinary completion is zero; Q fails the derived p-complete difference test while F_p passes. | Separate three topologies and retain separatedness/finite-generation hypotheses. |
| Inverse versus direct perfection | T,T^(1/2),T^(1/4) satisfy powers 1,2,4; forward Frobenius instead gives T,T²,T⁴. | Actual `PreTilt`, `PerfectClosure` and inverse `frobeniusEquiv` retained. |
| Exact characteristic and zero | Zero has bijective pth power but no exact `CharP _ p` for prime p. | README dictionary includes zero; quotient examples do not demand that instance. |
| Orientation and generator maps | ξ to −ξ at p=2 in characteristic zero preserves the ideal but flips the expression; θ([a]+2)=4. | Orientation not part of predicate; nonzero target/source of generator theorem explicit. |
| Finite Witt Frobenius definition | Length 0 unique zero map; length 2 over Z at p=2 sends (1,1) to 3; over F₂ sends (0,1) to 0. | Heavy construction removed from Lean; full README target retained. |
| `finiteWittFrobenius_truncate` | Truncate an infinite vector (1,1,0,…) to length 2; both Frobenius routes give 3 at length 1. | Named actual truncation square. |
| `finiteWittFrobenius_restrict` | Restrict length 1 to 0 gives zero; length 3→2→1 uses only the two initial coordinates. | Named restriction compatibility, length decreases. |
| `finiteWittFrobenius_coeff_zero` | At p=2 over Z: 1²+2=3, over F₂: 0²+2=0. | Mixed-characteristic coefficient retained, not coordinatewise Frobenius. |
| Finite Fontaine definition | Length zero zero map; θ₁ is sharp reduction/Fontaine map; θ₂(2) has coordinates (0,1) over F₂. | Actual θ_r=θ̃_r φ^r convention, README-only construction. |
| `finiteFontaineTheta_teichmuller` | a♯=T gives θ₂([a])=(T,0), not a chosen inverse-limit projection. | Named sharp convention and Check. |
| `finiteFontaineTheta_restrict` | θ₂(2) restricts to θ₁(2)=0; zero length is compatible. | Restriction, not finite Frobenius, in this equality. |
| `finiteFontaineTheta_frobenius` | θ₂([a]) at a♯=T maps under F to T^p; θ₁φ([a]) also gives T^p. | F θ_(r+1)=θ_r φ direction explicit. |
| `finiteFontaineTheta_one` | For [a] the length-one value is a♯; for 2 over F₂ it is zero. | Existing Fontaine map identified, not redefined in Lean. |
| `theta_generator_nonzerodivisor` | ξ=p in W(F₂); p cancels; zero ring case separated by nonzero premise. | Named general-ring result, README-only. |
| `theta_generator_normal_form` | π²=2 and (π♭)²=a with a♯=2 gives 2−[a], not 2+[a]. | Sign and unit coefficient specified. |
| `theta_map_preserves_generator` | Identity and product projection preserve coordinate-one units and theta kernel membership. | Actual induced Witt map on tilts, not arbitrary map. |
| `perfectoid_absolute_cotangent` | Conormal line trivialized by ξ gives R[1]; shifting degree-zero Z gives Z in −1, zero in 0. | Named target, choice dependence separated from canonical conormal object. |
| `compatible_root_annihilator` | a=0 gives whole ring annihilator; a=1 gives zero; in a reduced product, support of a and each root agrees. | Named reduced-ring lemma with an actual compatible tower. |
| `compatible_root_power_torsion` | a^n x=0 implies ax=0 by reducedness; n=0 gives x=0. | Named equality with the actual localization kernel. |
| `pIntegralClosure.le` | F₂[T²] lies in F₂[T]; zero ambient unique subring. | Real infimum over subrings containing A. |
| `pIntegralClosure.isClosed` | T² in F₂[T²] forces T into its 2-root closure; exponent 1 gives identity. | Full ambient root-closedness. |
| `pIntegralClosure.minimal` | C=B is always a candidate; a root-closed source gives equality. | Premises tie C to A and root closure. |
| `pIntegralClosure.idempotent` | F₂[T²] closes to F₂[T] and stays there; F₂[T³] unchanged. | Named README API; no auxiliary Lean development. |
| `pIntegralClosure.mono` | F₂⊆F₂[T²]⊆F₂[T]; inclusion survives closure. | Same ambient ring retained. |
| `pIntegralClosure.le_integralClosure` | Prime exponent 2, T integral over F₂[T³] even though it is outside 2-root closure; exponent 0 would invalidate containment. | Prime explicitly required for this application. |
| Polynomial test fixture | n=1 gives all polynomials; n=2 closes to all; n=3 is proper and 2-root closed. | Light actual eval-map range, no new algebraic carrier. |
| `quotientPowerMap` / `_mk` | π=1 zero quotient; π=0,F₂ identity; π=T gives (1+T)²=1 modulo T². | README-only ring-map construction with π^p a=p witness. |
| `quotientPowerMap_natural` | Identity and quotient map sending π to τ; applying f to x^p gives f(x)^p. | Same divisibility assumptions and specified elements in source/target. |
| `completion_integrally_closed_perfectoid` | Already complete normalized torsion-free input; π=1 forces zero completion; missing integral closedness cannot be discarded. | Named separate Česnavičius Lemma 4.7 target. |
| `bhattRootNeighborhoods.restrict` | U₂⊆U₁, so B₁→B₂; T=t separates the radii. | Named correct contravariant map. |
| `restrict_self`, `restrict_comp` | Indices 0=0 give identity; 0≤1≤2 gives the same restriction as 0≤2. | Named functoriality API. |
| `rational_model` | U₀=Y, linear equation T−g; powerbounded/saturated integral model required. | Named actual P2 model, no arbitrary plus subring. |
| `bhattRootExtension.map` | Zero algebra and g=0 yield unique/identity maps. | Actual K°-algebra structural map retained. |
| `bhattRootExtension.root` / `root_pow` | n=0 gives image(g), n=1/2 recover g by p/p² powers. | Adjacent compatibility stronger than independent root existence. |
| `bhattRootExtension.perfectoid` | g=0 gives the complete saturated original model. | Four field-model conditions retained, not just an unqualified predicate. |
| `bhattRootExtension.raw_almost_iso` | Saturated input C=C_* is an identity; generally only an almost isomorphism. | Root ideal explicit; no asserted ordinary equality. |
| `bhattRootExtension.map_comp` | Identity and two successive maps preserving g; all induced maps preserve the chosen tower. | Named functoriality, not arbitrary chosen roots. |
| `monicRootPair` | P=T gives identity, P=T−g agrees with element construction, P=T−1 admits nontrivial next root −1 at p=2. | Explicit π-completed integral closure, three Checks. |
| `monicRootPair.map` | Identity/zero coefficient algebra and linear P; direction A→B. | Continuous map of actual affinoid pairs. |
| `root`, `root_pow`, `polynomial_root` | P=T−1 fixes h₀=1 but not all later h_n=1; P=T makes every h_n=0 by reducedness. | Named chosen tower and polynomial relation. |
| `lift`, `lift_map`, `lift_root`, `lift_unique` | P=T identity lift; two maps agreeing on base and entire tower coincide. | Universal target is complete uniform pairs; integral-closure/completion extension included, not inferred just from perfectoid targets. |
| `almostAicExtension.map`, `map_id`, `map_comp` | Identity and composite scalar maps send monic polynomial families to monic families. | Functorial successor coproduct construction required. |
| `unit`, `map_unit` | Zero model and identity maps; both structural-map routes coincide. | Natural structural transformation, not a functorial choice of individual roots. |
| `has_root` | Positive-degree X²+1 over residue F₃ requires a new root; degree-zero 1 cannot be included. | Root existence for all positive-degree monics. |
| ω₁ iteration and flatness | Finite polynomial coefficients come from an earlier stage; countably many Cauchy data occur below one stage. | Countably filtered raw colimit complete; almost flatness tracked through completed operations. |
| Root ideal checks | f=0,1 and inverse roots of T; nilpotent root survives in R/(T) but vanishes in R/√(T). | README and actual Lean quotient witnesses retained. |

README/Lean comparison read all enclosing `variable`, `include` and `omit`
blocks. In particular hg really occurs in naturality statements; exact CharP
is not silently assumed on the unit-ideal quotient; the arbitrary quotient
power theorem and reduced-target radical factorization drop unused CharP
hypotheses; root closure uses the image of the actual localization map.
The other full statements are README-only because their supplier carriers or
constructions are not at the pins. The closing comment names every such family.

## Source verification

No locator was left flagged as unverified. For the reproducible 15-target sample,
used `random.Random('codex-yRwDfb').sample(packet['nodes'], 15)` on the unchanged
61-node packet. This is its draw order; sources were read directly, not inferred
from the earlier review. All descriptions here are paraphrases, not source text.

| Sample | Exact locator checked | Result |
| --- | --- | --- |
| Quasisyntomic lifting | BS22 Proposition 7.11, p.60 | Supplied theorem, complete flatness/perfect-base clauses checked. |
| Perfectoid torsion bound | BMS2 Proposition 4.19(3), pp.22–23 | Bound one and elementary Witt proof agree. |
| Relative smooth-site cover | BS22 Example 7.12, footnote 12, p.61 | Full cotangent vanishing and final-object refinement agree. |
| Perfectoid quotient radical criterion | BMS1 Example 3.15, p.24; BS22 Theorem 7.4, pp.56,62 | Elementary consequence identified as such; nonradical raw quotient excluded. |
| Reducedness | ČS §§2.1.2–2.1.3, pp.11–12; Č §4.3, p.8 | True, but imported from P4.15.5. |
| Almost root flatness | Bhatt Theorem 2.3, pp.4–5; notes Theorem 9.4.3, pp.113–115 | ℓ>0, saturation and specified almost ideal retained. |
| Frobenius equivalences | BMS1 Lemma 3.9, p.22; DK Theorem 3.2, pp.6–11 | Additional finite all-length direction supported; not infinite Witt Frobenius. |
| Frobenius-flat prism cover | BS22 Proposition 7.11(2), Example 7.13, pp.60–61 | Kept the final-object covering conclusion with explicit flat φ hypothesis. |
| Witt p² detection | BMS2 Proposition 4.19(3), elementary proof, p.23 (published p.227) | Coordinate-one unit sufficient over perfect rings, not only fields. |
| Tate powerbounded model | Č §4.8, pp.8–9; BMS1 Lemmas 3.20–3.21, pp.26–27 | Imported dictionary; p-torsion-free and saturation scope explicit. |
| Integral predicate | BMS2 Definition 4.18, p.22; BMS1 Definition 3.5, p.21 | Equivalent normalizations of common predicate, not separate ownership. |
| Strongly closed theorem | BS22 Remark 7.5, p.56; ECD Definition 5.7/Theorem 5.8, pp.24–25 | Supplier application; plus-map direction checked against definition. |
| Witt principal saturation | BMS2 Proposition 4.19(3), elementary proof, p.23 | Uses regular p in W(k), not a domain premise. |
| Derived prismatic initiality | BS22 Construction 7.6, Lemmas 7.7–7.8, Example 7.9, Proposition 7.10, pp.56–60 | Full carriers/filtration and QRSP initiality imported; weak initiality alone not promoted. |
| Completed filtered colimits | BS22 proof of Theorem 7.4, p.62; Stacks 091P/091U | Supplier reduction with derived completion and image step. |

Additional readings checked BMS1 Lemmas 3.9–3.11 in full, BMS2 Proposition
4.19, ČS §§2.1.3, 2.1.7–2.1.8 and Proposition 2.1.11, Č §§4.2–4.8,
ALB Corollary 2.1.10, Bhatt Notation 1.4 and §2, and the notes' Theorem
9.4.3 through Corollary 9.4.7, printed pp.113–117. The original source links
and exact locators remain in the package References. The author-hosted IAS
lecture notes are the accessible version used. The source library index was
consulted; no restricted book or passage was needed or copied.

Fresh public PDF receipt hashes (SHA-256; accessed 17 October 2026):

| Version | Hash |
| --- | --- |
| BMS2 arXiv 1802.03261v2 | `b2338ef19714f39aeac2aaaa4e8d6bd708020815016bbe5541a74e4db3594038` |
| ČS arXiv 1912.10932v3 | `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` |
| Č arXiv 1711.06456v4 | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| ALB arXiv 1907.10525v4 | `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec` |
| Bhatt arXiv 1608.08882v2 | `08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430` |
| DK arXiv 1409.7530v1 | `c54d3cbe035567e4f051c6bb0c2ecd86110a1a103767049c00eed3da80c44b9d` |
| Bhatt notes, 23 April 2017 | `47aaf5ddc4ec5d6f5e8efd0ecb80ae2f0ef4999265d861393c4bda6670974048` |
| ECD author PDF | `4ce3d1232a6e9e186d1a36da5cc659616569ac8dd2bb263510247c07995a26c1` |

Stacks [091P](https://stacks.math.columbia.edu/tag/091P),
[091T](https://stacks.math.columbia.edu/tag/091T),
[091U](https://stacks.math.columbia.edu/tag/091U) and
[05GG](https://stacks.math.columbia.edu/tag/05GG) were checked afresh.
The comparison uses separatedness and finite generation where required;
no blanket arbitrary-ideal completion theorem is asserted.

## Validation and remaining work

- `lean-check research/blueprint/packages/PerfectoidQuotients/Suggested.lean`
  exited 0: 47 warnings, all `declaration uses sorry`, zero errors and no other
  warning categories. Memory available before compiling was 90 GB.
- The file has 344 lines, 16 theorem declarations, 31 examples and two
  real-bodied definitions (the root closure and its polynomial test fixture).
  No sorry-bodied data, local universal-ring choice, placeholder carrier,
  `True` conclusion or auxiliary theory development remains.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidQuotients.json`
  reports 0 errors and 0 warnings. The packet is unchanged; its historical
  ownership is accounted for in the crosswalk above.
- `python3 research/blueprint/intake.py check-files` on all four deliverables
  reports 4 files, 0 problems; `git diff --check` passes.

No unresolved finding from this fix issue remains. Future implementation is
Tau Ceti's work; the existing supplier plans and their proof obligations are
not represented as completed mathematics. Packets, ownership data and other
packages were outside this issue's allowed files and are unchanged. The
crosswalk records their current owners for the maintainer's later integration.

`upstreamNotes`: P4.15.4 abbreviates its monic-root property without the
positive-degree qualifier. This package states the qualifier explicitly;
constant polynomial 1 in a nonzero ring explains it. No edit to that upstream
roadmap was made.
