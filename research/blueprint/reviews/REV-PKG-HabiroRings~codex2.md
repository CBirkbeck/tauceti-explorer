# Independent review: relative Habiro rings

**Verdict: needs_changes.** Codex, session `codex-4UOOxp`, independently
reviewed issue #11380 on 2026-10-20. The local corrections below are complete.
The remaining blocker is the reverse construction dependency in
HabiroCyclotomicCompletions (HC): its package still imports HabiroRings (HR)
for the derived comparison now owned by HR §2.4, while HR legitimately needs
HC's earlier ordinary completion results. Removing the donor copy requires
editing another job's files. This completed review is not a checkpoint.

The reviewed baseline is `4b18c1d29c8e6b0a3f14b82a0abce44e245327cf`.
The issue's copied Mordell description does not describe these files. The
requested `REV-PKG-HabiroRings~codex.md` and the adversarial `~adv` report are
absent at that baseline. I read the available original independent package
review, the six plan reviews and the `FIX-PKG-HabiroRings~adv` and `~adv3`
handoffs, then checked the mathematics directly. Neither a fix worker's
accepted status nor an unavailable report is independent evidence.

## Corrections in this review

| Defect | Applied correction |
| --- | --- |
| The 217,709-byte README exceeded the issue's 200 KB limit. | Reused source/local reference links, shortened repeated supplier labels and exposition, and retained the mathematical specifications. Final size: **199,855 UTF-8 bytes**. No target anchor, original API name, original named Check, qualified library name, hypothesis or worked computation was removed. |
| The downstream étale comparison was assigned to a hypothetical HabiroRingsPartII although an actual owner exists. | Scope, reading order and downstream contract now name **HabiroCohomologyFoundations §4.21**, with its multiplicative and filtration upgrades. The full comparison, naturality, empty-framing filtration, quotient/completion compatibilities, source and Checks remain. It is not a construction input to HR. |
| §4.6 described a nonzero derived obstruction without excluding the zero quotient. | Added `B/f≠0` to that obstruction. Added explicit Checks for `(B,f,D)=(ℤ,2,𝔽₂)`, a unit f, and the excluded nonregular f=0. The general theorem still allows every commutative B and every regular f, without a Noetherian hypothesis. |
| The pooled Witt comultiplication zero Check did not test a nonzero coordinate. | Retained its name and torsion-ring zero case; added the outer-coordinate computation `Δ(2)_2=−1` for `2∈W(ℤ)`. Since Δ is a ring map, Δ(2) has first outer coordinate 2 and second coordinate `(2−2²)/2=−1` in the torsion-free ring W(ℤ). Coordinatewise repetition fails this Check. |
| The compact Lean file did not enumerate its omitted definitions. | Added a closing comment covering the imported Witt interfaces and every layer's heavy objects, using the README's names, including `RelHabiroStage`. No executable declaration was changed or heavy carrier encoded. |
| review.json was a fix worker's self-assessment. | Replaced it with this independent job's correctly named reviewer and the remaining blocker. |

Metadata remains exactly `topic = "math.NT"` followed by a newline.

## Remaining dependency repairs

**R1 — blocking HC → HR → HC construction cycle.** HR §2.4 correctly owns
`ordinaryDerivedComparison` after its completion adjunction. Its HC inputs
are ordinary: Layer 1's factorial/divisibility topology, Layer 2 §2.3's
polynomial/Laurent comparison and Layer 5 §5.1's polynomial-coefficient
completion/exactness. HC nevertheless still owns the derived comparison in
its [§5.5](../packages/HabiroCyclotomicCompletions/README.md), explicitly
requiring HR Layer 2. The reverse edge also occurs in HC Scope and ownership
(lines 57–58 and its table), Layer 5 Dependencies, §6.4 and the closing
Suggested.lean comment. These are actual construction references, not merely
a list of consumers.

The authorized HC repair must remove that derived target, its derived Checks
and these HR construction inputs. Point consumers of the comparison to
[HR §2.4](../packages/HabiroRings/README.md#hr-2-ordinary-derived-comparison).
Keep HC's ordinary coefficient-module theorem and arbitrary-module boundary.
Deleting HR's legitimate ordinary input, duplicating HC's toolkit or merely
renaming the circular edge would not resolve this defect. No HC file is
authorized in #11380, so none is changed here.

**R1a — donor example also needs repair.** HC §5.5 claims that the family
`((q−1)^k)_k` belongs to the completed middle direct sum for the full Habiro
topology. Modulo Φ₂=q+1 its entries are `(−2)^k`, all nonzero, so this is not
a decaying family. Replace the diagonal factors and family by
`P_k=∏_{i=1}^k(1−q^i)`. This family decays modulo every fixed P_n, lies in
the coordinatewise kernel, and its unique possible preimage has constant
coordinates one, which fail finite support modulo P₁. Coordinatewise
cancellation over the integral classical Habiro ring justifies uniqueness.
This gives the intended ordinary nonexactness example without using HR.
HR's own arbitrary-module Check uses the explicit derived cofiber on 𝔽₂
with q acting as one and does not repeat the faulty HC example.

**R2 — stale external consumer.** RefinedTraceMethods (RT) still describes
the étale Habiro–Hodge comparison as HR.6 material in its scope, exact supplier
list and §6.14 (notably lines 3360 and 3366). Retarget those uses to
**HabiroCohomologyFoundations §4.21** and the subsequent cohomological
upgrades actually required. That target already states the comparison with
HR.5 and imports HR.4/HR.5; it is not supplied by a new scalar HR Part II.
The downstream specification in HR now points to this actual owner. RT files
are outside this job. This stale consumer does not introduce an input to HR,
but must be reconciled before claiming consistent family ownership.

HR has no cohomological or trace construction input after these corrections.
HB.6's ring construction is earlier classical work, and HB.7's actual global
line, inverse pairing, integral linear-jet and supported naturality contracts
remain explicit conditional inputs. HC → HR → cohomology Part I → RT →
cohomology Part II is only a conditional order after the separate family
repairs; this review does not certify all five packages acyclic. No Habiro
tier number is assigned in the Caraiani–Newton order, and none is invented.

## Prior findings and fidelity

| Previously recorded point | Independent disposition |
| --- | --- |
| Perfect versus perfectly covered | Correct implication retained: every perfect Λ-ring is perfectly covered. Faithful flatness, not injectivity, defines the latter criterion. |
| Scalar exports from FIX~adv | The downstream contract explicitly exports the perfect-cover criteria, nonsolid and spectral completed tensor, conditional solid idempotence/monoidality, ring base change and arbitrary-pair scalar extension, actual K₃ lines and completed triviality. Their hypotheses remain present. |
| Solid spectral gap | The full SA.1 product/tower/tensor/resolution contract remains a hypothesis. VS2's abelian theorem and a compact-generator statement do not discharge it. Both tensor factors must be bounded below where claimed. |
| Generality and base change | Completed derived coefficient change is retained even for flat changes; arbitrary pair morphisms have their own completed scalar functor. The number-field ring needs discriminant support inversion; the GSWZ line applications additionally invert 6. |
| Descent and fracture fixes | §3.5 explicitly assumes the coherent overlap identity and §3.7 proves it by finite Koszul towers. §3.12 retains completion after arithmetic localization. |
| FIX~adv3 receiving comparison | HR §2.4 has the actual ordinary/derived comparison, finite projections and coefficient-map naturality for every commutative B and B-module M, including integer torsion. Receiver is correct; donor removal remains R1. |
| Higher QSeries factorial input | No QM.0 construction input remains. HC §1.1 supplies integral `qBinomial_factorial` and `qFactorial_pochhammer`. All coefficient rings and zero indices remain allowed. |
| Lean shape | Only native carriers, one light evaluator definition, a real scalar instance, six theorem targets and proved controls remain. No admitted data, surrogate enhanced proposition, axiomatized carrier or developed theory. |

I compared the complete statements and hypotheses of the parent and all five
accepted parts against the README. Their remaining gaps remain qualifications,
not silently completed prerequisites.

| Plan input | Targets | Original API items | Original named Checks |
| --- | ---: | ---: | ---: |
| HabiroRings | 50 | 164 | 81 |
| HabiroRings--HR.1 | 17 | 42 | 16 |
| HabiroRings--HR.2 | 5 | 36 | 11 |
| HabiroRings--HR.3 | 7 | 22 | 12 |
| HabiroRings--HR.4 | 7 | 24 | 7 |
| HabiroRings--HR.6 | 3 | 6 | 4 |
| Total | **89** | **294** | **131** |

All original API and named Check strings remain. All 90 baseline anchors
remain unique: the 89 accepted targets plus the subsequent receiving
ordinary/derived target. Imported Witt definitions retain their supplier
ownership. Pooled Checks explicitly exercise their component definitions:
arithmetic Adams, Witt comonad, coalgebra, section, exterior and free Λ-ring
interfaces; truncated/absolute/relative q-Witt interfaces; and the owned
relative constructions each retain at least three discriminating cases.
The strengthened comultiplication and new principal-deformation cases close
the weaknesses identified in this pass.

Polynomial brackets in ℤ[T] are escaped so that the new shorthand thesis
reference does not turn the polynomial variable into a link.
The local Needs graph has 90 vertices and 244 resolved edges and is acyclic.
That local result does not erase the cross-package cycle R1. Seven numbered
layers retain Examples and Dependencies. There is no `UPSTREAM:` or
FoundationsAndLibraryIntegration supplier, process narrative or removed-target
stub in the README. The presentation was compared with current AdicSpaces
and DGAInfinity, and the scope/conventions of LocalGaloisGroups.

## Source verification

I read public primary sources directly; no restricted book was needed.
There were no author-flagged unverified locators. The random sample used
`random.Random(11380).sample` on the 89 sourced accepted-target anchors in
README order, excluding the later receiving addition. The following are the
15 selected anchors, locators actually opened and conclusions. Source keys
refer to the fixed versions linked in the package References.

| Selected target | Locator read | Result |
| --- | --- | --- |
| Solid complete objects, §2.11 | Q, B.6–B.7, p.79 | Ambient solid comparison; the stronger tower/resolution input remains conditional. |
| Completion adjunction, §2.3 | Q, B.1 and Lemma B.2(c), p.77 | Correct factorial-tower completion and localization kernel. |
| Dwork criterion | H, Lemma 1.1, pp.6–7 | Prime-power divisibility and independent chosen Frobenius lifts agree. |
| Reduced-index height, §3.3 | Q, proof of Corollary 2.4, p.15 | Maximal prime-power subsets give a height-one inclusion index. |
| Static inverse limit, §4.11 | Q, Theorem 2.9 and proof, pp.16–17; B.4, p.78 | Uses detection and stabilized derived quotients, not just static stages. |
| Exterior operations | H, Remark 1.22, p.18; Proposition 1.14, p.14 | Exterior series differs from Witt coordinates by the stated signs. |
| Reconstruction, §3.8 | Q, proof of Lemma 2.2, p.14; Corollary 2.4, p.15 | Coherent reconstruction, including mapping data, is the required interface. |
| Perfectly covered, §1.2 | Q, 1.22(e), p.12 and 2.7, pp.15–16; W, Remark 2.47/footnote (2.3), p.32 | Faithfully flat Adams/perfection criterion, not perfectness. |
| Completed tensor, §2.8 | Q, B.1, p.77 and Setup 2.1(c), p.13; HA, Proposition 2.2.1.9, p.197 | Monoidal localization gives completed tensor and completed unit. |
| Untwisting, §5.5 | Q, Remark 2.8, p.16 and 1.22(e), p.12 | Needs actual global Adams maps with invertible linearizations. |
| Scalar extension, §6.1 | Q, B.1, p.77 | Formal application of monoidal completion; no claim of a separately stated source theorem. |
| Completed countable sums, §2.13 | Q, proof of B.8, p.80; Bosco, Lemma A.4/proof, p.93 | Null-family formula and reverse pointwise weight order agree; abelian model is not the full spectral theorem. |
| Solid unit idempotence, §2.12 | Q, proof of B.8, pp.79–80; T, §5.3, printed p.86/PDF p.90 | Correct Null and product argument, subject to the full spectral supplier contract. |
| Maps s_m and c_m | W, 2.31, p.26; Lemma 2.34, p.27; Corollaries 2.35/2.37, pp.28–29 | Distinguishes Witt coordinates, toric section and arbitrary-ring coalgebra comparison. |
| Taylor equalizer, §5.4 | Q, Lemma 2.12/proof, p.18 | Full root coefficient algebra and the Frobenius-twisted second arrow are required. |

Additional direct reading covered Q pp.12–19, 25–27 and 77–80; W §§2.4–2.6,
pp.26–35; Borger §§1.17–1.18, pp.12–13; GSWZ pp.10–11 and 43–45;
Habiro §7.1, pp.1141–1142 and §7.3, p.1144; Meyer–Wagner §4.1, pp.41–42;
and HA pp.358–359 on algebra-object limits. The Stacks statements/proofs
[04D1](https://stacks.math.columbia.edu/tag/04D1),
[0ALI](https://stacks.math.columbia.edu/tag/0ALI),
[0920](https://stacks.math.columbia.edu/tag/0920) and
[0EBS](https://stacks.math.columbia.edu/tag/0EBS) were checked separately.
These distinguish arbitrary-ideal object lifting from nilpotent full
faithfulness, verify the finite-Koszul overlap calculation, and supply
relative étale Frobenius. No new locator error was found. The already explicit
corrections to Q's resolution, Φ₅ splitting, Corollary 3.13's use of
Theorem 3.11(b), and W Proposition 2.48's divisor-indexed target are retained.

Fixed public source receipts, accessed 2026-10-20:

| Source | PDF SHA-256 |
| --- | --- |
| [Q, v2](https://arxiv.org/pdf/2510.04782v2) | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [W, v5](https://arxiv.org/pdf/2410.23078v5) | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| [H, v3](https://arxiv.org/pdf/1006.3125v3) | `1b21e5adf08ea73ea1aac471100d6b191d57d47d95ff27ae0f25ee5e1d9f2973` |
| [Borger, v6](https://arxiv.org/pdf/0801.1691v6) | `d8d7c8f62311b4b60cf4d298af4e8519460e33b69ce9a34da4641488e6766019` |
| [GSWZ, v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Bosco, v1](https://arxiv.org/pdf/2306.06100v1) | `a142fc46709b8a54ef552a052f8a0c96006b578ef2565bbe4bcea6100505c7e9` |
| [Habiro, published](https://ems.press/content/serial-article-files/40881) | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| [Wagner thesis](https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf) | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |
| [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf) | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf) | `58855f3a0ad6d9c470ded74a38938b9468927592e9ae1209bab6a068e67ede6e` |
| [Meyer–Wagner, 5 February 2026](https://ferdinand-wagner.github.io/papers/q-Hodge.pdf) | `74b8a5c122cc54f5b347a49c895fdafc12e36f376fdd7165036b0c80277b3538` |

## Adversarial mathematics pass

This pass covers every target, its API identities, standing conventions and
repetitions in scope/Examples/dependencies. Rows group statements sharing the
same mathematical input; source-supplier interfaces are included, not treated
as proved merely because they are imported. Computed cases test the stated
conventions; they do not prove the general targets.

| Statements/definitions checked | Instances and calculation | Disposition |
| --- | --- | --- |
| Rings, positive indices, twists and pair maps | Zero ring; p=2; m=1; R^(m)=R⊗_(A,ψᵐ)A uses the right A-factor | No implicit nontriviality or global Adams structure on R. |
| Derived quotient, P_n and Laurent localization conventions | P₀=1 gives zero quotient; q=1 on 𝔽₂ gives cofiber 𝔽₂⊕Σ𝔽₂; R_r inverts qᵐ−1, m>0 | Ordinary quotient cannot replace a cofiber; n=0 is handled separately. |
| Torsion-free Adams data and δ | Toric ψ²(x²+3x)=x⁴+3x²; identity on ℤ[x] fails mod 2; δ₂(3)=−3; ℚ is perfect | Congruence is against pth power. Division by p uses torsion-freeness and divisibility. |
| Dwork ghosts and universal Frobenius polynomials | On ℤ, ghost pair (1,3) is integral, (1,2) is not; higher p-powers require their full valuation | No weakened mod-p condition or division on torsion rings. Universal polynomial identities supply the arbitrary-ring operations. |
| Frobenius congruence in W(A) | p=2 and A with 2-torsion; torsion-free universal polynomial ring for checking identities | Congruence is in the Witt ring, not coordinatewise; ghost injectivity is not asserted on arbitrary A. |
| Witt comultiplication, counits and coassociativity | Δ([a])=[[a]]; zero over ℤ/4; Δ(2)_2=−1 over W(ℤ); gh₂gh₃Δ=gh₆ | Strengthened nonzero coordinate Check. Both literal counit laws and associativity are retained. |
| Arithmetic coalgebras and their Adams maps | ψ¹=id, ψ²(a)=a₁²+2a₂; coordinate maps need not be ring maps | Arbitrary-ring structure is the coalgebra, not insufficient Adams-only data. Morphisms preserve its full structure. |
| Adams section, ghost laws and torsion-free equivalence | s(2) has c₁=2,c₂=−1,c₃=−2; zero and identity/composition maps | Recursion denominators are justified by integrality, uniqueness by torsion-freeness. |
| Cofree adjunction and Witt addition series | Zero source; identity ghost-one counit; addition of two Teichmüller integer units | Ring addition corresponds to multiplication of the Witt product series. Counit selects the first coordinate. |
| Exterior operations | λ⁰=1, λⁿ(0)=0 for n>0; λ²(2)=1, λ³(2)=0; λ²=−c₂ and λ³=c₃−c₁c₂ | Sign and index conventions exclude identifying λⁿ with c_n. |
| Free Λ-ring, its adjunction and presentations | Arbitrary I, including ∅ giving ℤ; ψ²(x)=x²+2c₂≠x²; Newton cubic identity | Free arithmetic Λ-ring is not the toric polynomial Λ-ring. Universal evaluation applies to torsion-ring coalgebras too. |
| Prime-local Adams freeness and perfect covering of free Λ-rings | Empty generators; weighted presentation with unit determinant after p-localization | Freeness/flatness is not inferred from injectivity. Localization and faithfully flat descent remain prerequisites. |
| Truncated big Witt interface | m=1 identity; Div(4) has three coordinates, unlike the four coordinates of W_{Div(6)}; p-typical length n+1 | No identification with the wrong Mathlib truncation length. F, V and restriction retain different types. |
| Absolute q-Witt quotient and operations | q-W₂(ℤ)=ℤ[q]/(q²−1), V(1)=1+q; τ₂(2)=3+q has ghosts 2 at −1 and 4 at 1 | Values distinguish Teichmüller from additive insertion. FV=n does not imply VF=n. |
| q-Witt ghost and truncation boundaries | W_{Div(4)}(ℤ) has rank three versus q-W₄(ℤ)'s rank four; q-W₂(𝔽₂)=ℤ/4 has nonzero ghost kernel | No unconditional ghost injectivity or surjective comparison. |
| s_m, c_m and relative q-Witt | Toric image misses a free Witt coordinate; c₂s₂(T)=T²; self-pair relative quotient is the full polynomial quotient | Relative tensor/Verschiebung quotient is retained, rather than an absolute q-Witt shortcut. |
| Étale pushouts and relative ghosts | m=d=1; R=A; zero R; F₂V₂(1)=2 whereas ordinary restriction of that vector is zero | Étaleness and divisor-indexed Frobenius target remain; source's target typo is not propagated. |
| Restriction obstruction and forced global Frobenius | p·1≠0 is the obstruction's hypothesis; characteristic p removes that particular contradiction; m divisible by 5 in the cubic example | Nonexistence concerns the specified commuting diagram and marked algebra isomorphism, not every unmarked ring map. |
| §1.1 perfection | Toric colimit ℤ[x^a : a∈ℚ≥0]; x at stage m maps to x^(1/m); perfect and zero rings fixed | Transition direction and universal property agree. |
| §1.2 perfect covers | ℤ, ℚ and toric ℤ[x]; basis 1,x over ψ²; ℤ[x,y]/(xy) has injective but nonflat Adams maps | All three faithful-flatness criteria retained; no false automatic cover. |
| §1.3 relative étale Frobenius | Characteristic p, p=2, split étale algebra and zero ring | Relative map includes its base twist and is an isomorphism. |
| §1.4 completed Frobenius | p a unit gives zero completion; self-pair toric base; cubic algebra at 5 has a moving unramified quadratic factor | Semilinear endomorphism need not be invertible; completed linearization is invertible. No global lift on R inferred. |
| §1.5 input category | Identity, composition, zero R and localized étale R | Pair maps preserve base Λ-operations and the algebra square; étale is not replaced by finite étale. |
| §2.1 complete objects | Zero, R_r-module and ordinary ℤ[q±1]; ℤ[[q−1]] is only one cyclotomic completion | Localization kernel criterion uses all cyclotomic factors, not just q−1. |
| §2.2 localization resolution | d(e₀)=e₀−(1−q)e₁ augments to zero; e₁ uses 1−q² | The opposite sign gives 2, and shifting the factor breaks augmentation. Existing correction retained. |
| §2.3 completion adjunction | Zero object, localization and unbounded complexes | Adjunction is on the enhanced derived category, not only static modules; unit is completed base. |
| §2.4 ordinary/derived comparison | M=0, ℤ, ℤ/2; positive Laurent order has an uncancelled highest coefficient; m=0 is the zero operator | All modules allowed without flatness. P₁/P₂ quotient ranks 1/3, surjective tower kills lim¹; arbitrary-module Tor boundary retained. |
| §§2.5–2.7 homotopy completeness, Nakayama and bounds | Zero complex; shifts of complete modules; all factorial quotients versus a single root | Two-term Ext and all-factor detection justify homotopy statements. A single cyclotomic quotient is not conservative. |
| §2.8 completed tensor | q²−1 and q³−1 have a common q−1 factor and Tor; zero factors | Derived tensor is completed; Tor is not discarded; H is its unit, not R_r. |
| §§2.9–2.10 spherical construction and comparison | Sphere coefficient retains positive stable homotopy; compare Hℤ; zero module | 𝕊[ℤ] is not Hℤ[ℤ]. HR-relative comparison is monoidal; restriction to the spherical base is only lax monoidal. |
| §2.11 solid embedding | Zero and discrete spectra; Null/shift model | Full SA.1 spectral contract is explicit, beyond VS2 abelian solid modules. |
| §2.12 solid idempotence | Empty, one-block and countable product generator cases | Product tensor and split-tower comparison are actual hypotheses, not consequences of an abelian compact generator. |
| §2.13 completed sums/null families | Empty blocks, singleton blocks, finitely supported coordinates, increasingly large weights | Reverse pointwise order and eventual finite support at every quotient retained. Ordinary spectral product completion is not silently identified with solid product. |
| §2.14 countable tensor weights | a=0 or b=0; a=b=1 gives P₂=P₁²(1+q); at q=−1 P₂=0, P₁²=4 | Correct divisibility direction. At q=1 Gaussian factor is 2 over ℤ and 0 over 𝔽₂; no 0/0 quotient. Proved Lean controls retained. |
| §2.15 bounded-below solid monoidality | Zero and shifted connective factors; both factors bounded below | Bounded-below resolution/realization input stays explicit on both arguments. No all-spectra promotion. |
| §3.1 cyclotomic intersections | Orders 1/2 give radical (2,q−1); 1/6 give the unit ideal; equal orders excluded | Prime-power ratio exception and arbitrary coefficients retained. |
| §§3.2–3.4 prime-chain/reduced index and edge factorization | m=1; m=4 chain {1,2,4}; m=6 edges {1,2},{1,3},{2,6},{3,6}; m=12,p=2 two chains | Index uses actual subsets, not duplicate path strings. Height one concerns inclusions in the reduced index, not number of members of a chain. |
| §3.5 general monoidal descent | Identity cover; disjoint product summands; false diagram D on two opens and zero on their intersection yields D×D | Explicit coherent overlap condition excludes the counterexample. Conservativity and nesting alone are insufficient. |
| §§3.6–3.7 coherent completion diagram and overlap verification | m=1; redundant subsets at m=4; overlaps {1,2} and {1,6} | Unit-compatible finite Koszul double tower gives completion at ideal sum; finite dualizability and a cofinal diagonal justify the interchange. |
| §§3.8–3.9 reconstruction and mapping spaces | m=1 identity; m=6 four edge paths; zero algebra | Homotopy equalizer retains specified paths; ordinary equality of component maps is insufficient. |
| §§3.10–3.11 descent equivalence and algebra gluing | Zero category, singleton index, unit algebra and marked identity transitions | Enhanced equivalence includes mapping spaces; marked solution space is contractible, not just nonempty. |
| §3.12 arithmetic fracture | m=1, m=12,p=2; inverting 2 on ℤ[q]̂_(q²−1) versus further completion | A series with unbounded powers of 2 in denominators exists only after the further completion. The hat after localization is retained. |
| §4.1 marked deformation | D=0, unit base, two split factors with swapped marking, ℤ[1/2] | Marking is data; étale does not imply module finite. |
| §§4.2–4.3 object lifting and nilpotent invariance | Unit and zero ideals; square-zero ideal; arbitrary ideal versus nilpotent ideal | Existence lifts across any quotient ideal; uniqueness/full faithfulness uses nilpotence. Distinct statements kept. |
| §§4.4–4.5 completed marked lift and maps | Finitely generated I=0; nilpotent I; ℤ[1/2][[t]] has unbounded denominator series absent from ℤ[[t]][1/2] | F.g. completion and actual marking hypotheses retained. Ordinary tensor is not moved through completion. |
| §4.6 principal deformation | f=2 in ℤ with D=𝔽₂; unit f gives all zero; f=0 in ℤ is not regular | Corrected nonzero-π₁ obstruction and added all three Checks. No extra Noetherian or proper-ideal hypothesis on the theorem. |
| §§4.7–4.8 finite stage and coherent ghost lifts | m=1 gives R[[q−1]]; R=0; self-pair; R=ℤ[1/2],m=2 splits two factors | Frobenius-twisted completions and coherent marked lifts determine the stage. Self-pair untwisting does not require perfect A. |
| §§4.9–4.10 q-Witt comparison and transitions | m=d=1; self-pair; F₂V₂(1)=2 versus restriction 0 | Étale finite-stage comparison retained, and transitions deform Frobenius, not Witt restriction. |
| §4.11 static limit | Zero tower; cofinal indices divisible by n; stabilized derived qⁿ−1 cofibers | Finite cofibers commute with limits and all-factor detection proves staticity. Static stages alone are not the argument. |
| §5.1 relative ring | Zero, self-pair, ℤ and ℤ[1/2]; factorial versus single-root topology | Limit is the full relative Habiro ring, not one formal power-series ring. Functoriality is in pairs. |
| §5.2 roots and Taylor arrows | Orders 6→3 show standard exponential choices incompatible; order 4 over ℤ[i][1/2] has two factors | Coprime multiplicative root choices and all root-adjoining coefficient factors retained. p-adic translation needs topologically nilpotent displacement. |
| §§5.3–5.4 Taylor comparison/equalizer | ℓ∤m; Φ₅ over 𝔽₁₁; zero R and p inverted | Finite étale root algebra need not be irreducible; can_m keeps variable, second arrow applies Frobenius and re-expands order pm. |
| §5.5 untwisting | R=A toric but nonperfect; cubic R has no global nonidentity field map | Actual global ψ and invertible linearization suffice; perfectly coveredness alone does not supply ψ on arbitrary R. |
| §5.6 base change | Identity and zero; adjoining t produces ∑P_n t^n with unbounded t-degree | Derived tensor remains Habiro-completed, even for flat polynomial extension. Pair maps and Cartesian coefficient changes are distinguished. |
| §5.7 classical comparison | A=R=ℤ, m=1 and all root orders | Full integral classical completion recovered, including all Taylor factors. |
| §5.8 discriminant-localized étaleness | Δ=0 excluded; prime support weaker than full discriminant divisibility; ℤ_(p) is not a finitely presented étale localization | General radical criterion retained. Ring theorem does not import inversion of 6 from line applications. |
| §5.9 GSWZ ring | F=ℚ; cubic discriminant −108; zero/unit local factors | Uses earlier HB.6's independent ring construction, not HB.7 lines or trace input. |
| §6.1 completed scalar extension | Identity/composition and zero; actual base-changed R; perfect module then completion | All pair morphisms allowed; completed tensor, not ordinary uncompleted scalar extension. |
| §6.2 K₃ lines and pairings | ξ=0 gives unit; ξ and −ξ pair to unit | Actual invertible HB.7 modules and inverse tensor certificates are hypotheses. Formal K₃ labels/local rank one do not create global lines. |
| §6.3 order-one completion | p inverted gives nonzero higher-order components killed by root-one map | Map need not be injective over localized coefficients. Integral classical injectivity is not overgeneralized. |
| §6.4 integral first fiber | Evaluator has preimage of 1; zero evaluator fails; negated evaluator sends coordinate 3 to −3 | Actual R-linear evaluator determines normalization and surjectivity. No invented R→H constant embedding. Proved Lean controls retained. |
| §§6.5–6.6 completed line and Picard vanishing | Arbitrary R, including ℤ×ℤ and zero; X lies in Jacobson radical | Finite Nakayama and invertibility give trivial completed line without locality or Noetherianity. No global freeness over H asserted. |
| §6.7 supported field maps | Identity/composition; common positive Δ supports both discriminants and 6 | Actual HB.7 supported-field naturality remains a hypothesis; completed scalar/Picard square uses existing library functor laws. |
| §7.1 finite-field factors | Φ₅=(q−3)(q−4)(q−5)(q−9) mod 11 | All four factors multiply to coefficients (1,1,1,1,1); lifts 2786,7825,1963,2066 modulo 11⁴ have the indicated residues and satisfy Φ₅=0 and q⁵=1. |
| §7.2 p-inverted components | Root order's p-valuation 0 versus positive; root-one map | Idempotent factors with positive valuation survive in H but map to zero in the first Taylor factor. |
| §7.3 cubic constants | x³−2=(x−3)(x²+3x+4) mod 5; quadratic values 4,3,4,2,2 | No quadratic root. Completion has ℤ₅×ℤ₂₅ factors; Frobenius moves the quadratic conjugate, while the global cubic field has no such automorphism. |
| §7.4 finite-stage obstruction | Marked ℤ[q]-algebra comparison, m divisible by 5 | Would force the nonexistent global Frobenius; no claim about arbitrary unmarked ring isomorphisms. |
| Downstream étale Habiro–Hodge contract | Self-pair ℤ, zero R, localized ℤ[1/2]; empty framing | Owner corrected to cohomology §4.21. Smooth derived forms, multiplicative upgrades and canonical filtration remain necessary before applying dimension zero. |

The finite-field factorization, all four lifted-root congruences, cubic
factorization/absence of quadratic roots and the q=−1 divisibility witness
were independently recomputed with integer polynomial arithmetic. The Lean
controls independently prove the expressible regularity, divisibility and
normalization witnesses. No general theorem is accepted from numerical tests.

## Libraries and current-upstream duplication

Read the reviewed HR audit in `data/library-coverage.json`. Pinned source
statements were inspected at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Object/operator/hypothesis
searches also covered current upstream roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer
roadmaps and the four named Completed additions. No Lake command was run
in either current checkout.

| Nearest existing material inspected | Boundary checked |
| --- | --- |
| Mathlib p-typical `WittVector`, truncated Witt and ordinary `DerivedCategory`/`LightCondMod` | These do not provide big Witt coalgebras, q-Witt or the enhanced/solid spectral categories. The supplier contracts remain additional mathematics. |
| Mathlib `AdicCompletion` and finite-generation/kernel/completeness API | Reused for ordinary completions and marked lifts. Does not supply the all-cyclotomic enhanced comparison or tensor/descent theory. |
| Mathlib formal smooth lifting, unramified uniqueness and étale base-change/localization | Actual arbitrary-ideal/nilpotent/complete hypotheses checked; no finite-module strengthening. |
| Mathlib invertible-module, quotient/base-change, Picard, power-series and Jacobson APIs | Already-existing general bijectivity and functor laws are cited; the additional completed-line statement has its actual integral quotient hypothesis. |
| Tau Ceti `RingTheory/AdicCompletion/Finite.lean` and `Idempotent.lean` | Finite-module completeness requires Noetherian hypotheses; idempotent lifting is not relative Habiro descent or general completed-line triviality. |
| Tau Ceti `RingTheory/PowerSeries/Substitution.lean` | Zero-constant formal substitution does not replace p-adic translation at nonzero root displacement. |
| Tau Ceti `RingTheory/Cyclotomic/Lift.lean` | All-conjugate residues/lifting are already consumed by §7.1. Read the pinned `conjugateResiduesRingHom` and `conjugateResidues_lift` signatures; no duplicate construction was added. |
| Current AlgebraicVectorBundles L0B/L2B and their suggested statements | Scheme vector bundles and rank-one/Picard equivalences do not state the arbitrary-ring affine completed-first-fiber theorem. |
| Current AdicSpaces, DGAInfinity, ProfiniteArithmetic and Completed/RestrictedProducts | Ordinary adic geometry, enhanced DG categories, profinite group completion and restricted products have distinct carriers/contracts. They do not already own the relative arithmetic targets here. |

No new duplicate target requiring deletion was found. Existing ordinary
library results stay cited as prerequisites; the lightweight evaluator wraps
the native invertible-module criterion rather than proposing a new general
Picard theory. This is a source-level duplication audit, not a claim that
native Tau Ceti integration was compiled.

## Lean signatures and verification

Ten signature/body checks against the README:

| Lean item | Mathematical agreement |
| --- | --- |
| `frobLift_existsUnique` | Arbitrary commutative A,R and étale A-algebra R; prime p, actual base Frobenius congruence, semilinearity and uniqueness on ordinary p-completion. Stronger generality than the relative perfectly-covered application is intentional and valid. |
| `OrdinaryDerivedComparison.laurent_regular` | Every coefficient module, including torsion; positive m essential; no flatness hypothesis. |
| `CountableSolidHabiroTensor.factorial_mul_dvd` | Every commutative coefficient ring, both natural indices including zero, correct product-divides-larger-factorial direction. |
| `etale_localization_away_discr` | Number field, nonzero Δ, actual discriminant divisibility, arbitrary Away realization; no 6 hypothesis. |
| `etale_localization_away_of_prime_dvd` | Radical support form, with nonzero Δ and all prime divisors of the discriminant accounted for. |
| `OrderOneFibre.trivialization` | Actual evaluator on R⊗_H M, invertibility and a preimage of 1; real body uses the native surjectivity/bijectivity theorem. |
| `OrderOneFibre.zeroEvaluation` | Proved nonexistence of a unit preimage under the zero evaluator on the nonzero trivial line. |
| Tensor-unit evaluator example | Proves that the constructed equivalence is the actual normalized evaluator on 1⊗r. |
| Negated evaluator example | Proves the sign-sensitive value −3, excluding a normalization-independent chosen equivalence. |
| `completedRegulatorTriviality` and its scalar instance | Arbitrary commutative R; actual invertible P over R[[X]]; quotient by XP is equivalent to R via constant-coefficient scalars. No local or Noetherian hypothesis, no hidden R→H map. Scalar instance has a real body. |

Final executable Lean content passed
`lean-check research/blueprint/packages/HabiroRings/Suggested.lean`:
**exit 0, zero errors, exactly six warnings, all `declaration uses sorry`**.
The file has 210 lines, seven proved examples, one proved negative-control
theorem, no admitted data and only `import Mathlib`. Only omitted-name comment
spelling was adjusted after this run; executable content did not change.
The checked build reports pinned Mathlib 082e2d37e8. Available memory exceeded
20 GB. No language server, Lake build/update/cache fetch or concurrent own
Lean process was used. Elaboration of admitted milestones is not a proof of
the roadmap or a compiled native Tau Ceti integration check.

All six packets passed `scripts/check_blueprint.py` with **zero errors and
zero warnings** each. They are unchanged. Final structural checks verify
all original names and anchors, valid local reference links and the acyclic
local Needs graph. A 16-consecutive-alphabetic-word comparison of the README
against the eleven public PDF texts found no matching passage; direct reading
also found no source synopsis. This screening supplements the own-words
review rather than proving authorship. No source file or passage is committed.

`research/blueprint/intake.py check-files` on the package files, independent
report and handoff, and `git diff --check` pass. The independent review is
complete; before upstream submission the maintainer must coordinate R1/R1a
and reconcile R2 in their authorized packages.
