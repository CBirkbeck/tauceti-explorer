# PKG-K3BlochGroups~codex — handoff

Issue: #10748. Author: Codex (GPT-6), session `codex-zi0zxQ`. Date: 2026-10-19.

## Completed deliverable

The package covers the parent plan's 101 targets and all 74 refinement targets in V.1–V.6, in six layers and 61 mathematical subsections. Ten targets are cited at their existing external owners; twenty parent targets are subsumed by their precise refinements. The coverage appendix below identifies every input target. No input packet, reader, suggested file, atlas file or upstream checkout was changed. This is a completed package submission, not a checkpoint, and does not claim formalization or independent review.

The README retains the mathematical statements, hypotheses, APIs, Checks and source locators in prose, with layer examples and dependencies. The Lean file was written as a compact representative file: 26 named declarations and 36 examples, using real bodies over pinned Mathlib carriers. Its closing comment lists the unavailable carriers and constructions. In particular, no abstract K₃, Bloch, Chern, plus-space or spectral-sequence carrier is introduced with an admitted body. Metadata is `math.KT`.

The scope includes an exact, conditional comparison for the all-curve Goncharov presentation; it does not claim to prove the source's conjectural relation equality. The other convention comparisons are integral, with their precise kernels and cokernels, before coefficient changes.

## What the input could not support unchanged

- The all-curve relation equality is Goncharov's Conjecture 1.20 (printed p.225), not the generic five-term comparison. The README retains the rational kernel K_curv, its exact comparison, the F₃ counterexample to an unrestricted all-field assertion, and the conditional |F|≥4 vanishing statement. No consumer is permitted to silently replace this with a theorem or a six-torsion assertion.
- The older CGZ arXiv presentation uses the ordinary exterior square. Extended projective relations need not be exterior cycles: over ℚ, ξ(2,1) has boundary 2∧(−1)≠0. Its cycle quotient is therefore written using the intersection A∩C_ext. This is distinguished from the published 2023 negative-unit target and its Bloch kernel. The accepted input's source label “2018” is replaced by the actual arXiv v3 (2021).
- The lecture full-tensor kernel is a kernel before quotienting by five-term relations. It is not the Suslin Bloch group, even rationally. Only its quotient by the exact free-cycle kernel has a cokernel killed by six. The explicit obstruction E/L and a finite lift prove precisely that assertion.
- Weibel's printed cone P-value and Dupont–Sah formula require the convention corrections displayed in §§4.14–4.15. The former is independently checked on all 72 admissible pairs over F₁₁; the latter on 40 finite-field values. The cone differential, projection cross-ratio and norm are kept fixed while correcting the sign.
- The source's root-group notation in the Suslin kernel is an abstract model. The natural kernel is enhanced Tor with weight-two action. No natural identification with an untwisted root subgroup is used. In characteristic two its squaring map is an isomorphism, not the identity (F₄ exchanges primitive cube roots).
- Finite-field H₃(SL₂) must be localized at the characteristic. Integral characteristic-primary exceptions occur at q=2,3,4,5,8,9,27. The unmodified Suslin Bloch presentation at q=2,3 is handled separately. The finite left-arrow identification with the monomial enhanced-Tor arrow is retained as the explicit refined-chain compatibility target in §5.5; equal group orders alone are not its proof.
- A K₃ lift has ambiguity equal to the preimage of enhanced Tor under K₃→K₃^ind, an extension by the Milnor image. There is no chosen image of μ̃ in K₃. A five-term or boundary certificate does not supply a chain-synthesis algorithm.
- Genuine finite-coefficient K₃ and étale Bloch groups have an additional K₂[n] term. The final comparison is r⁻¹c and restricts with γ⁻¹, rather than the unscaled ordinary Suslin map. Its right-hand Bockstein normalization remains a separately specified comparison, not an asserted commuting square.
- Bloch's monograph is not in the cleared library and a freely readable copy was unavailable. Its Lecture 6 §6.1, p.43, (6.1.2) locator is inherited and **not independently verified**. It identifies a convention only. No theorem from the inaccessible book is an input: the lecture-kernel and six-torsion claims are derived algebraically from the displayed definitions. An independent reviewer should verify that convention locator when a cleared copy is available. The original Bass–Tate book chapter was also not read; its sign theorem is sourced instead to Weibel III, Examples 7.2(c–d), pp.61–62.

## Ownership, existing material and dependency repairs

The library audit was read before construction. The representative file uses Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The additional read-only audits used current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command was run in those checkouts.

| Object checked | Existing owner / resulting package decision |
|---|---|
| Integral bar chains, cycles, homology projection and field/group maps | Mathlib `groupHomology`, `Rep.trivial`, `cycles`, `toCycles`, `iCycles`, `π`, `chainsMap`, `map`. Read the pinned statements and use these carriers directly. The evaluator is a small composition, not a replacement homology quotient. |
| Free symbols, tensor quotients, exterior powers, matrix groups, norms, localizations | Mathlib's existing carriers. Only the light reduced-symbol map, kernel multiples, fibre and equivalence compositions enter Lean. Heavy quotients remain README targets. |
| Affine cross-ratio invariance | Current `TauCeti.crossRatio_comp_eq_of_sub_eq_div`, read in `Algebra/Field/LinearFractional.lean`. Cite it; add only the projective infinity, orbit and face calculation interface. |
| Antisymmetric tensors | Current `TauCeti.antisymmetricTensors`, read in `LinearAlgebra/TensorProduct/Symmetric.lean`, is an eigenspace, not the integral cokernel Q_s. Cite it, and compare only with two invertible. |
| General covering and Hurewicz theory | Current AlgebraicTopology Stages 2–4,8 and Completed UniversalCovers Stages 2–3 were read. Cite the existing theory. Request only the additional Hopf/Whitehead and stable-unit contracts needed for the degree-three application. |
| Steinberg group, superperfectness, central extension, Matsumoto and graded Milnor comparison | K2SymbolsBrauer T.1–T.2; do not reconstruct them. |
| Finite K-groups, arithmetic ambient K₃, ranks and analytic regulators | KTheoryFiniteLocalFields L.1; ArithmeticKTheory N.3/N.5/N.7; BorelRegulators R.3; Polylogarithms P.1–P.2; PadicHodgeRegulators D.2. The ten supplier targets in the coverage table are omitted as new constructions. |
| Newer roadmaps and completed work | Searched the current roadmap tree, including the nine newer named roadmaps and Completed. No K₃/Milnor/Bloch/Suslin construction superseding this package was found. General topology overlap is handled by the two preceding topology suppliers. |

Open Mathlib PR title/body searches on 2026-10-19 for Bloch, Milnor K, Steinberg group and hyperhomology returned no relevant implementation; the cross-ratio search returned an unrelated density PR. The public Zulip/archive searches returned no applicable design discussion. This is a search report, not a proof of absence.

Moved-down notions and contracts for the maintainer to route:

1. The DVR specialization lemma for rational weight-two boundaries is explicitly a target in §3.12. It precedes general Polylogarithms P.4 consumers and does not import their all-curve relation equality. AlgebraicCurves Layer 12A supplies only the smooth-point DVR dictionary.
2. The generic group-module hyperhomology construction is §4.1, before its frame and projective-configuration uses. Its prerequisites are projective resolutions, total complexes and coinvariants; the old configuration-dependent construction would create a cycle with the frame argument.
3. The finite Chern input belongs to the early MotivicEtaleKTheory weight-two/étale interface, before the late M.8 regulator comparisons. Hutchinson Theorem 2.10 is stated for arbitrary fields and **indecomposable finite-coefficient** K₃. For number fields at odd n the Milnor image vanishes, yielding the full finite-coefficient equivalence. This distinction is stated in the supplier contract.
4. GeneralAlgebraicKTheory's early K.2 plus model and K.7 external products precede the degree-three comparison; its later low-degree comparisons may consume it. The external K₂(A)×K₁(ℤ) product avoids imposing commutativity on A.
5. AlgebraicTopology Part II must supply the wedge-of-two-spheres calculation, Hopf operation and H-space Whitehead vanishing. StableHomotopyKTheory Part II must supply the multiplicative BPQ unit normalization η↦[−1]. The accepted refinement identified these needs; they are explicit contracts, not assumed consequences of an ordinary covering theorem.
6. ArithmeticKTheory N.8 is an example consumer. It is removed as a prerequisite for its own ambient rational/Gaussian quotient calculations.
7. The renamed quantum owner is **HabiroNumberFields**, HB.1–HB.2, not the obsolete HabiroCohomology name. The order is §§6.1–6.6 → HB.1–HB.2 → the final application §6.7. The final composition does not feed back into the proof of the Suslin sequence. Collapsing those slices to whole-roadmap arrows would manufacture a cycle.

K3BlochGroups and these K-theory suppliers are outside the numerical 94-roadmap Caraiani–Newton tiers. No invented numeric tier is assigned. The exact layer/supplier slices above replace upward consumer citations. All local prerequisites were checked after topological reordering: zero forward edges among the 61 subsections. Cross-ratio was moved before the Goncharov presentation; monomial subgroups precede stability generation; δ/θ precede the frame splitting; cyclic Chern evaluation precedes the closure detector.

## Adversarial pass

The table covers every mathematical subsection, including the statements of all its input targets and their API equations. The coverage appendix gives the exact target-to-subsection grouping. I checked each quantifier and denominator against the standing hypotheses and the Lean `variable` blocks. Every retained data definition has a real body. Generic Lean interfaces are distinguished in the README from their field/K₃ specialization; arbitrary supplied equivalences are not claimed to construct the missing topological or K-theoretic maps.

Fields are nontrivial, so q=1 and the zero ring as a field are excluded. The zero ring is allowed in Layer 1. Rank zero, trivial groups, zero modules and n=0/1 are tested where their types permit them. Odd and two-primary coefficients are separated. DVR specialization is rational; it is not a theorem about an arbitrary evaluation map on a field. Compactness, ideals and ramified coefficient rings do not occur in the asserted targets; root coefficients require only the stated commutative ring and a unit denominator. Finite checks and source arguments below are mathematical tests, not formal proofs from the admitted Lean file.

| Statement family (all associated API equations) | Instances / direction witness | Result and change |
|---|---|---|
| §1.1 | A=0; perfect/superperfect St; π₁=π₂=0 | Use the stable central extension, actual fibre/cover and plus homology contracts; no finite-stage superperfectness assumption. |
| §1.2 | Identity and zero classes; q(x)=2x on ℤ/5 | Composite is b j⁻¹ h q⁻¹; sends 1 to 3 in the nonidentity test. Actual topological maps are specified separately from this generic helper. |
| §1.3 | G=1; [1|1|1|1]; [g|1|1] for g≠1 | d₄[1|1|1|1]=[1|1|1]; evaluation is not injective on cycles. The g-chain is not a cycle. Equality means a finite four-boundary. |
| §1.4 | Zero ring; identity and composite ring maps; finite support | Tuplewise transport preserves actual boundary witnesses. A later common rank includes both cycle equations and equality witnesses; no uniform stable range. |
| §1.5 | Zero ring; identity cover; K(ℤ,2), K(ℤ,3); A=ℤ; characteristic two | Lift multiplication and unit homotopies. ℤ/48→ℤ/24 has kernel two and no section. Hopf exactness and η↦−1 require the explicit extra contracts. |
| §2.1 | Finite fields; ℚ; ℚ→ℝ; positive complex rank | Milnor-image cokernel, not torsion-free quotient. Product order is [a][b][c]. No injectivity assumed when defining the quotient. |
| §2.2 | Zero and Milnor quotient classes; char≠2 vs char2 | Edge quotient equivalence is independent of m₃ injectivity. Kill d₂ by H⁰(Z(2))/2=0 away from two, and use characteristic-p Milnor torsion-freeness at char2. Correct K₄-divisibility locator. |
| §2.3 | Empty, one and two real places; sign-isolating units | Canonical basis is inverse signature, not a chosen unit. b_v={−1,−1,u_v}; distinct signs give distinct basis classes. Minus-one product image equality is number-field only. |
| §2.4 | ℚ vs ℚ(i); zero; images of Milnor classes | All-field stable Hurewicz kernel is {−1}K₂ᴹ. Only for number fields is that the entire Milnor subgroup; totally imaginary quotient is the actual quotient equivalence. |
| §2.5 | r₂=0/1; arbitrary fields as negative control | Rational ambient K₃=indecomposable K₃ is number-field only. Do not erase rational Milnor classes over arbitrary fields. |
| §3.1 | A=0, ℤ, ℤ/n; two invertible; diagonal generator | Q_s(ℤ)=ℤ/2 and Q_s(ℤ/n)=ℤ/gcd(2,n). The diagonal map and exterior projection retain their exact two-torsion. Eigenspace identification requires 2 invertible. |
| §3.2 | (0,∞,1,x); swap first two; (x,y)=(2,3); F₂ | Normalization is x, then x⁻¹ on swapping. Face values are 1/2,3/4,3/2,3,2 over ℚ. All determinant denominators use injectivity. |
| §3.3 | 0,1, diagonal and y=1; ℚ(2,3); F₄ | Distinguish reduced and unreduced free symbols; rawSymbol(2)≠0. Reflection certificate fixes y/x and both fractional terms. Invalid pairs never enter the relation set. |
| §3.4 | F₂=0; F₃=ℤ; quotient universal property | Kill [1] explicitly in the unreduced carrier. Equality and lift API use the specified relation subgroup; no additional projective degeneracies. |
| §3.5 | [2] and [2]+[−1] over ℚ; F₅; valuation pair v₂,v₃ | ∂[3] pairs to −1. ∂[2] is nonzero two-torsion; its sum with [−1] cancels. Use Q_s, not the exterior square, for the kernel and Matsumoto sequence. |
| §3.6 | F₄,F₅,F₇,F₁₁; square roots of −1; sixth roots | Orders of c are 1,3,2,6. The inversion symbol is a homomorphism into P, not generally B; h(2) over F₅ is a negative control. 3c=h(−1), 6c=0. |
| §3.7 | q=2,3,4,5 | Unmodified P(F₃)=ℤ and B(F₃)=2ℤ. Exclude q=2,3 from the cyclic finite-field order theorem. |
| §3.8 | Cyclic unit groups; F₅ exterior target zero; ℚ diagonal | Exterior-kernel group can be larger than B. Keep its precise two-torsion discrepancy and named comparison. |
| §3.9 | F₂,F₃,F₅; Q example 4[−1] | R₅ is not contained in the full-tensor kernel. The comparison is from raw cycles; quotient its exact kernel before any rational equivalence. |
| §3.10 | E=L=0 at F₂,F₃; cycles 4[3],2[4] at F₅ | Obstruction E/L measures the cokernel. Explicit γ=3(α−σα)+2deg(α)[−1] gives 6β and is a raw cycle. Free-cycle kernel need not be torsion. |
| §3.11 | Empty generic configurations; F₃ and F₄; boundary sign | Generic Goncharov B₂ is P integrally, with opposite boundary sign. Its kernel is B; the whole group is not B. |
| §3.12 | P¹ specialization at 0,∞; DVR unit/positive/negative valuations; F₂,F₃; i over ℂ | Rational boundary specializes to zero on cycles. K_curv retained, with F₃ kernel ℚ. Source Conjecture 1.20 is not promoted to a theorem. |
| §3.13 | ξ(2,1) over ℚ; projective 0,1,∞; F₁₁ | Correct the older exterior cycle quotient by intersection. All projective divisions exclude 0/0 and ∞/∞. κ_old can have both kernel and cokernel of order two. |
| §3.14 | F₃ target ℤ/2; F₅ target 0; u=−1 vs u⁻¹ | Published Q_- is the negative-unit tensor quotient, not the exterior square; the defining sign is field multiplication by −1. |
| §3.15 | F₂ new group ℤ/3; F₃=0; F₇ new group ℤ/2 | Extended relations lie in the published boundary kernel. B_new=(B+H)/H only with |F|≥4; small fields are separate computations. |
| §3.16 | κ at F₅,F₇,F₁₁; odd vs even coefficients; extra [0]=0 | κ_new is onto, with exact B∩H kernel; injection to B_old has two-torsion cokernel. Invert 2 for CGZ, 6 for lecture correction, never for an arbitrary rational K_curv. |
| §4.1 | Zero complex, degree-zero module, G=1; finite two-point X | Generic hyperhomology constructed before applications; H₁ of two-point configuration is ℤ, so no group-homology identification without augmentation acyclicity. |
| §4.2 | n=0/1; q>n; ordered e₁,e₂; dependent distinct vectors; shear (1,0)→(1,1) | Shifted augmentation C₀=ℤ; independent projected vectors, not distinctness. Lower affine action is nontrivial and matches block multiplication. |
| §4.3 | V=0; j=0 excluded; M=0; finite fields excluded | Scalar acyclicity uses j>0 and F infinite. Block inclusion is integral in every degree; sufficient scalar containment is stated, with n,m≥1. |
| §4.4 | S₀=ℤ; S₁=Fˣ; S₂=K₂ᴹ⊕ℤ; e=⟨1,1⟩ | Generator is an alternating sum of independent n-faces, not the boundary of a nonexistent independent (n+1)-frame. Ordered product has four terms. |
| §4.5 | n=1, GL₀; δ₁([2]); Steinberg pair; real {−1,−1,−1} | Connecting sign fixes ordered θ, with no factorial. Retraction is identity before the stability induction; multiplication by two would fail the real test. |
| §4.6 | n=0,1,2; e in S₂; Milnor retraction | S_n splits into eS_{n−2} and K_nᴹ with the specified maps. Reordered after δ/θ so the splitting does not justify its own input. |
| §4.7 | n=0/1; diagonal/permutation intersection; forgetful projection | M_n=T_n⋊Σ_n with actual action. Stable maps and projection are specified; permutation and torus inclusions are not interchangeable. |
| §4.8 | n=1/2/3, stability boundary degree; torus products | Simultaneous induction uses frame filtration, affine stabilizers and prior retraction. Torus generation is modulo the actual H₃(GL₂) image; no stability-by-generation cycle. |
| §4.9 | Empty, two-point and three-point sets; infinite fresh vertex | Ordered injective tuples with alternating faces. H₁ at size two is ℤ, H₂ at size three is ℤ². Infinite contracting argument is not used for finite fields. |
| §4.10 | q=2,3; normalized quadruples | Coinvariant H₃=P; E¹ chains are not already P. Stabilizers use the stated projective coordinates and center. |
| §4.11 | (∞,0); (a,1); diagonal (a,a); mixed Künneth term | d¹=1−swap, image (a,a⁻¹); swap acts as −flip on mixed tensors. Center is diagonal, not antidiagonal. d³ has the fixed Bloch boundary. |
| §4.12 | Normalized [2] over ℚ; torus classes; zero | Rank-two edge lands in B as E∞_{3,0}=ker d³. P occurs at E², not E¹. Kernel theorem uses monomial and torus images as stated. |
| §4.13 | Collinear triple; F₂ maximum four points; two/three-point cyclic chains; norm on triple | General-position and injectivity conditions retained. Use precyclic faces/rotations without degeneracies; N=Σ((-1)^n t)^i and the displayed shifted cone differential. |
| §4.14 | All 72 admissible pairs over F₁₁; projected cr=a; [2] over ℚ | Norm sum is 2c and cone boundary forces ψ′(P)=−2c. ψ′ itself need not land in B. Naturality is for the actual embedding-induced maps. |
| §4.15 | x=0,1,−1 excluded; 40 finite x; A₃,Σ∞ images | Corrected Dupont–Sah formula verified. A₃ and stable permutation image generated by 2c. Monomial maps are (incl,proj) and (ψ,−ψι). |
| §4.16 | F₂; ℚ; η·η²=η³ | Indecomposable monomial homotopy divides products and uses ℤ/12, not ℤ/24. Unit supplies the splitting and quotient map. |
| §4.17 | C₇ power two; weights +1,−1; m=2 | H₃ power map has weight two, multiplication by four. c₂=−u²; doubling map to ordinary Tor is not an injectivity detector. |
| §4.18 | Algebraic closure; ℚ root subgroup C₂; C₇; m odd and 8|m | Detector uses torsion e-invariant only, with Tate twist, not μ⊗μ=0. Use the cited cofinal Chern product range rather than an unsupported mod4 formula. |
| §4.19 | ℚ gives ℤ/4; char2; F₄ squaring; F₅ roots μ₈; conjugation on μ₆ | Natural enhanced Tor distinguished from abstract μ̃. Square-vs-linear cyclotomic action rules out a natural identification; extension is nonsplit away from char2. |
| §4.20 | ℚ: 0→ℤ/4→ℤ/24→ℤ/6; algebraically closed; char2 | Infinite Suslin exact sequence has the enhanced kernel and actual natural map. Ordinary Tor has wrong order over ℚ. |
| §5.1 | q=2,3; degree-one extension; Frobenius and transfer composites | K₃ᴹ=0, so quotient is canonical. Restriction/transfer transported from L.1, not reconstructed by cyclic coordinates. |
| §5.2 | q=2,3,4,5,7,8,9,27; prime-to-char subgroup; zero | Localized order q²−1; list integral characteristic exceptions explicitly. Abstract cyclic equivalence is separated from the canonical stabilization map. |
| §5.3 | F₂→F₄; q=5 characteristic torsion | σ is actual stabilization, unique after localization, and bijective including q=2,3. Integral characteristic-primary classes die. |
| §5.4 | q=4,5,7; degenerate cyclic tuples | Refined β handles degeneracies. Integral kernels have orders 6,40,12, respectively. No inadmissible symbol inserted by totalized division. |
| §5.5 | q=4,5,7; q=2,3 excluded | Localized kernel orders 3,8,12; target orders 5,3,4. Finite left-arrow compatibility is a named target beyond order computations. |
| §5.6 | u=1,−1; trace; basis change; (q,n)=(5,3),(11,3),(7,3) | Multiplication matrices have determinant norm and conjugate by UιU⁻¹. Last pair fails gcd condition; Cartan H₃ is not canonically the unit group. Basis independence uses GL₂ conjugation. |
| §5.7 | ℚ unique order-two subgroup; ℚ(i) no real places | Quotient ℤ/48→ℤ/24 is nonsplit; Gaussian quotient is an isomorphism with a noncanonical free generator. Ambient computations are suppliers. |
| §5.8 | x=1/2,2,−1; c=[2]+[−1] | Rogers values −π²/12,π²/12,−π²/4 give c↦−π²/6 of order six. Bloch–Wigner vanishes on the real line and cannot give this torsion detector. |
| §6.1 | Empty certificate; ℚ(2,3); reflection; [2] negative control | Unreduced certificate keeps k[1]. Validity is decidable with field equality, but completeness is existential, not a terminating search algorithm. |
| §6.2 | Zero, [2], [2]+[−1]; F₅[3]; primitive sixth root | Coordinate diagonal mod2 and torsion/free mixed components distinguish Q_s from exterior. Soundness general; completeness requires an actual direct summand. |
| §6.3 | m=0 generic; m≥2 field root; δ:ℤ→ℤ/2,x=1,m=2; sixth root | Integral multiple is 2, not 1. Primitive-sixth symbol need not be integral: Q(√−3) fails, Q(ζ₁₂) passes via −1 square criterion. |
| §6.4 | R=ℤ/5,m=2 inverse3; R=ℤ/2 negative control; zero ring/zero x | Unit denominator, not flatness, suffices for division and independence. Nonflat kernel tensor inclusion may fail injectivity; do not infer division merely from an image equation. |
| §6.5 | ℚ fibre ℤ/24→ℤ/6 has four elements; G=1; [111] vs [g11] | Fibre is a torsor, no additive section. Actual cycles and finite-chain equation retained; equality in homology does not identify witness chains. |
| §6.6 | ℚ integral sequence; odd vs even n; missing roots | Snake sequence includes B[n]→T̃/n. Rational comparison uses K₃^ind generally, full K₃ only for number fields. Root hypothesis retained at odd n. |
| §6.7 | c=2,r=3 on ℤ/5; zero module; ℚ,n=5,[32] | Φ(1)=4; inverse scalar required. K₂ symbol {2,−31} is killed by5 and has nonzero tame residue2 of order5 at31. Genuine middle groups differ from ordinary quotients. |

## Source verification and reproducibility

All downloads below were fetched from primary public author, publisher or arXiv endpoints on **2026-10-19**. Files were read in scratch and are not submitted. The fingerprints identify exact editions, not merely a web title. Source results are stated in our own words; the repository contains no copied passage or section-by-section source summary.

| Source / direct public copy | Bytes | SHA-256 |
|---|---:|---|
| [Kbook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | 708651 | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| [Kbook.IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | 882504 | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| [Kbook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) | 853042 | `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8` |
| [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | 673944 | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| [Suslin1991](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf) | 994999 | `ef16d5d93f6f9f6509f93e9b748f5cf06bda2a2a2da852404375638bab12994c` |
| [CGZ2023](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf) | 915381 | `13d38474d6b7b6e3fc946d50cc2764094c3a25a194d873c17d9cd334c25600cf` |
| [Hutchinson2013](https://arxiv.org/pdf/1107.0264v2) | 331665 | `057ce8a6ae5548fd9f6279514adfa3afa5a6554ad1e58f9ca34bb4c62df52e94` |
| [HutchinsonChern](https://arxiv.org/pdf/2104.14413v4) | 122112 | `e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf` |
| [Goncharov1995](https://sasha-goncharov.github.io/Advances1995.pdf) | 3271376 | `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344` |
| [Zagier2007](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf) | 1277788 | `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0` |
| [Suslin1984](https://www.mathnet.ru/php/getFT.phtml?jrnid=tm&paperid=2280&what=fullt&option_lang=rus) | 2110016 | `4080b087bff4d8842995691ba23b0960c5de81b62e032aeeabe82204d765ee4d` |
| [Kbook](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | 4958181 | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [CGZv3](https://arxiv.org/pdf/1712.04887v3) | 711529 | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` |
| [Hatcher](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf) | 8121741 | `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` |

Read-and-match highlights:

- Weibel III.7.2(a,c,d), chapter pp.61–62; IV.1.10.1, combined PDF p.274; IV.1.19–1.20 and exercises cited in §1.5; V.11.3.2, chapter p.82, and V.11.13, combined PDF p.466; VI.4.3.1–4.3.2, combined PDF p.490; VI.5 definitions, configuration calculation, stability use, monomial calculation and Suslin theorem, combined PDF pp.495–509. The combined and separate-chapter page conventions are explicitly distinguished. The K₄ divisibility citation is VI.1.3.1 rather than the erroneous cross-reference in the later argument.
- Suslin 1984 §1.8–1.9, p.191; §2.1–2.7, pp.191–196; Theorem 3.4, pp.197–198. The official Russian PDF was successfully retrieved through MathNet's full-text endpoint after a direct endpoint failed. OCR was used for navigation, and the mathematical statements were read in the supplied pages.
- Suslin 1991 pp.219–220 were visually read for Lemmas 1.4–1.6 and Proposition 1.1; p.221 for Lemma 2.2 and Theorem 2.1; p.236 for the cyclic Chern calculation in the proof of Lemma 5.7. The readable scan has no useful text layer, so rendered pages were inspected rather than trusting text search.
- Published CGZ Definition 2.1 and Lemma 2.2, printed p.391, with the comments on pp.391–392; finite Cartan comparison §4.2–4.3, pp.406–407; genuine coefficient group §6, pp.414–416, equations (37)–(38). The older arXiv v3 Definition 1.1, p.2, was read directly and compared with the changed published target; its §6 pagination pp.32–33 is retained only for v3 citations.
- Hutchinson 2013 v2 Corollaries 3.6–3.9, pp.14–15, and Lemma 3.14, pp.17–18, supply the localized and exceptional integral homology statements. The refined β construction and cyclic bar formula in §§6.3–6.4, pp.30–33, and Corollary 7.5 with proof, pp.35–36, were checked for the finite map and kernel. Identifying its arrow with the package's monomial arrow remains an implementation target, rather than an inference from matching orders.
- Hutchinson 2024 Theorem 2.10, p.4, really has an indecomposable finite-coefficient source for arbitrary fields. The specialization to number fields at odd n is justified separately. The paper also proves the value γ=2 for the quantum/Chern comparison; assigning that proof to HabiroNumberFields HB.2 avoids importing its quantum argument into the earlier Suslin proof. The generic composition here retains γ⁻¹ and therefore remains correctly normalized regardless of the supplied choice.
- Goncharov §1.9, printed p.222, was visually inspected for the all-curve relation definition, and p.225 for Conjecture 1.20. No claim that the latter is a theorem was retained. Zagier Appendix II.1.A, pp.23–24, fixes the unshifted Rogers convention. Hatcher Examples 4.51–4.52, pp.380–381, and Exercise 37, p.392, fix the precise Hopf and Whitehead input.
- The inaccessible Bloch convention locator is the only citation explicitly left unverified. See the limitations above. No uncleared mirror was used.

Independent exact integer computations used Hermite normal forms of the finite five-term relation lattice, including the projective degenerate relations with 0/0 and ∞/∞ rejected. They gave:

| q | Suslin P order | Suslin B order | order of c | Older repaired B order | Published B order |
|---:|---:|---:|---:|---:|---:|
| 3 | infinite cyclic | infinite cyclic (2ℤ inside P) | size hypothesis absent | not part of this finite HNF run | not part of this finite HNF run |
| 4 | 5 | 5 | 1 | 5 | 5 |
| 5 | 6 | 3 | 3 | 3 | 3 |
| 7 | 8 | 4 | 2 | 4 | 2 |
| 11 | 12 | 6 | 6 | 6 | 3 |
| 13 | 14 | 7 | 1 | 7 | 7 |
| 17 | 18 | 9 | 3 | 9 | 9 |

The corrected Dupont–Sah relation was tested at every permitted x in the six fields q=4,5,7,11,13,17 (40 total values). In F₁₁, all 72 admissible five-tuples were rotated and projected from their last point using determinant ratios: the sum of the resulting five symbols is 2c. Both computations used the integer relation lattice, retaining two-primary information. They are evidence for the convention checks, not a substitute for the roadmap's general proof targets. The construction is reproducible from the displayed relations and the formula cr(v₀,v₁,v₂,v₃ projected from o)=det(v₀,v₃,o)det(v₁,v₂,o)/(det(v₀,v₂,o)det(v₁,v₃,o)).

## Validation

- Final `lean-check research/blueprint/packages/K3BlochGroups/Suggested.lean`: **exit 0, zero errors, 48 warnings, all `declaration uses sorry`**, at the pinned commits above, on 2026-10-19. Available memory was above 80 GB before compilation. No language server, Lake project, cache fetch or library build was started.
- `python3 scripts/check_blueprint.py` on each of the seven unchanged `K3BlochGroups*.json` input packets: **zero errors, zero warnings** for all seven. Existing packet gap/request counts are not claims of missing content hidden by this package; their convention/source/supplier resolutions and the residual conditional assertion are explained above.
- Exact finite-presentation computations: **passed** for the cases in the table, including both corrected identities.
- Coverage audit: **175/175 input targets accounted for**, **zero local forward prerequisite edges**, and every one of the 26 Lean declaration names appears in the README. No process identifiers or private paths remain in the README. Every retained light definition has explicit discriminating Checks; the main tests appear as Lean examples.
- `python3 research/blueprint/intake.py check-files` on exactly the README, Suggested.lean, metadata and this handoff: **4 files, zero problems**.
- `git diff --cached --check`: **passed**.

## Resume / review focus

No implementation work remains in this package job. Independent review should start with the conditional all-curve boundary, the two CGZ versions, the two cone/Dupont–Sah corrections, the finite enhanced-Tor arrow compatibility, the Hopf/BPQ supplier contracts, and the genuine finite-coefficient normalization. The Bloch monograph convention locator needs a cleared copy. The maintainer should route the supplier and consumer changes above without editing the upstream roadmap checkout from this job. Nothing needed by a reviewer is stored solely in scratch; downloaded papers and generation/check scripts will be deleted after the pull request is open.

## Complete input coverage

A subsection entry includes the mathematical statement and API of that target; “subsumed” means its precise refinement is in the same subsection. “Supplier” means it is cited in Scope and ownership / Exact supplier contracts rather than planned again. These identifiers are retained only in this handoff, not in the mathematical README.

| Input target | Package location / disposition |
|---|---|
| `K3BlochGroups:V.1/steinberg-superperfect` | Supplier: K2SymbolsBrauer T.1 |
| `K3BlochGroups:V.1/bst-plus` | §1.1 |
| `K3BlochGroups:V.1/k3-h3-steinberg` | §1.2 |
| `K3BlochGroups:V.1/bar-cycle-model` | §1.3 |
| `K3BlochGroups:V.1/k3-naturality` | §1.4 |
| `K3BlochGroups:V.1/k2-to-k3-h3-e` | §1.5 |
| `K3BlochGroups:V.1/uce-plus-fibration` | Supplier: StableHomotopyKTheory H.3 |
| `K3BlochGroups:V.1/bst-plus-two-connected` | §1.1 |
| `K3BlochGroups:V.1/bst-plus-connected-cover` | §1.1 |
| `K3BlochGroups:V.1/steinberg-homology-colimit` | §1.4 |
| `K3BlochGroups:V.1/eta-hurewicz-sequence` | §1.5 |
| `K3BlochGroups:V.2/milnor-to-quillen-degree-three` | §2.1 |
| `K3BlochGroups:V.2/k3-indecomposable` | §2.1 |
| `K3BlochGroups:V.2/decomposable-exactness` | §2.1 |
| `K3BlochGroups:V.2/milnor-k3-injective` | §2.2 |
| `K3BlochGroups:V.2/milnor-k3-number-field` | §2.3 |
| `K3BlochGroups:V.2/k3-rank-borel` | Supplier: BorelRegulators R.3 |
| `K3BlochGroups:V.2/rationalisation-loss` | §2.5 |
| `K3BlochGroups:V.2/k3-to-h3-sl-field` | §2.4 |
| `K3BlochGroups:V.2/motivic-low-degree-sequence` | §2.2 |
| `K3BlochGroups:V.2/milnor-k3-kernel-exponent-two` | §2.2 |
| `K3BlochGroups:V.3/antisymmetric-tensor-quotient` | §3.1 |
| `K3BlochGroups:V.3/antisym-exterior-comparison` | §3.1 |
| `K3BlochGroups:V.3/five-term-relation` | §3.3 |
| `K3BlochGroups:V.3/pre-bloch-group` | §3.4 |
| `K3BlochGroups:V.3/bloch-boundary` | §3.5 |
| `K3BlochGroups:V.3/bloch-group` | §3.5 |
| `K3BlochGroups:V.3/bloch-four-term-exact` | §3.5 |
| `K3BlochGroups:V.3/element-c` | §3.6 |
| `K3BlochGroups:V.3/angle-bracket-homomorphism` | §3.6 |
| `K3BlochGroups:V.3/c-characteristic-torsion` | §3.6 |
| `K3BlochGroups:V.3/bloch-wigner-dilogarithm` | Supplier: Polylogarithms P.1 |
| `K3BlochGroups:V.3/bloch-wigner-five-term` | Supplier: Polylogarithms P.2 |
| `K3BlochGroups:V.3/cgz-convention-comparison` | §3.13 |
| `K3BlochGroups:V.3/small-field-conventions` | §3.7 |
| `K3BlochGroups:V.3/angle-bracket-two-torsion` | §3.6 |
| `K3BlochGroups:V.3/three-c-angle-minus-one` | §3.6 |
| `K3BlochGroups:V.3/exterior-kernel-bloch-group` | §3.8 |
| `K3BlochGroups:V.3/exterior-kernel-discrepancy` | §3.8 |
| `K3BlochGroups:V.3/cgz-bloch-group` | §3.13 |
| `K3BlochGroups:V.3/cgz-degenerate-relations` | §3.13 |
| `K3BlochGroups:V.4/configuration-complex` | §4.9 |
| `K3BlochGroups:V.4/configuration-acyclicity` | §4.9 |
| `K3BlochGroups:V.4/hyperhomology-map` | §4.1 |
| `K3BlochGroups:V.4/coinvariants-p1-homology` | §4.10 |
| `K3BlochGroups:V.4/gl2-spectral-sequence` | §4.11 |
| `K3BlochGroups:V.4/psi-gl2` | §4.12 |
| `K3BlochGroups:V.4/cyclic-complex-d` | §4.13 |
| `K3BlochGroups:V.4/psi-gl3` | §4.14 |
| `K3BlochGroups:V.4/psi-compatibility` | §4.14 |
| `K3BlochGroups:V.4/homological-stability` | §4.8 |
| `K3BlochGroups:V.4/symmetric-group-image` | §4.15 |
| `K3BlochGroups:V.4/monomial-sequence` | §4.15 |
| `K3BlochGroups:V.4/pi3-bm-plus` | §4.15 |
| `K3BlochGroups:V.4/enhanced-mu` | §4.19 |
| `K3BlochGroups:V.4/pi3ind-bm-plus` | §4.19 |
| `K3BlochGroups:V.4/suslin-exact-sequence` | §4.20 |
| `K3BlochGroups:V.4/tor-form-comparison` | §4.19 |
| `K3BlochGroups:V.4/suslin-functoriality` | §4.20 |
| `K3BlochGroups:V.4/cross-ratio` | §3.2 |
| `K3BlochGroups:V.4/monomial-subgroups` | §4.7 |
| `K3BlochGroups:V.4/psi-map` | §4.12 |
| `K3BlochGroups:V.4/torus-borel-homology` | §4.11 |
| `K3BlochGroups:V.4/gl2-d1-involution` | §4.11 |
| `K3BlochGroups:V.4/gl2-d3-boundary` | §4.11 |
| `K3BlochGroups:V.4/general-position-complex` | §4.13 |
| `K3BlochGroups:V.4/psi3-map` | §4.14 |
| `K3BlochGroups:V.4/psi3-torus-vanishing` | §4.14 |
| `K3BlochGroups:V.4/h3-gl3-generation` | §4.8 |
| `K3BlochGroups:V.4/dupont-sah-identity` | §4.15 |
| `K3BlochGroups:V.4/alternating-group-image` | §4.15 |
| `K3BlochGroups:V.4/pi3ind-definition` | §4.16 |
| `K3BlochGroups:V.4/pi3ind-sequence` | §4.16 |
| `K3BlochGroups:V.4/pi3ind-ahss` | §4.16 |
| `K3BlochGroups:V.4/delta-squaring` | §4.17 |
| `K3BlochGroups:V.4/e-invariant-detection` | §4.18 |
| `K3BlochGroups:V.4/enhanced-tor` | §4.19 |
| `K3BlochGroups:V.5/k3-finite-field` | Supplier: KTheoryFiniteLocalFields L.1 |
| `K3BlochGroups:V.5/finite-field-transfer` | §5.1 |
| `K3BlochGroups:V.5/bloch-group-finite-field` | §5.5 |
| `K3BlochGroups:V.5/k3-Z-and-Q` | Supplier: ArithmeticKTheory N.5/N.7 |
| `K3BlochGroups:V.5/k3-Q-splitting` | §5.7 |
| `K3BlochGroups:V.5/k3-number-field` | Supplier: ArithmeticKTheory N.5/N.7 |
| `K3BlochGroups:V.5/k3-gaussian` | §5.7 |
| `K3BlochGroups:V.5/milnor-k3-finite-field` | §5.1 |
| `K3BlochGroups:V.5/element-c-order-six` | §5.8 |
| `K3BlochGroups:V.5/bloch-finite-field-mod-n` | §5.6 |
| `K3BlochGroups:V.6/five-term-certificate` | §6.1 |
| `K3BlochGroups:V.6/bloch-element-constructor` | §6.2 |
| `K3BlochGroups:V.6/certificate-soundness` | §6.1 |
| `K3BlochGroups:V.6/certificate-to-bar-cycle` | §6.5 |
| `K3BlochGroups:V.6/root-of-unity-symbol` | §6.3 |
| `K3BlochGroups:V.6/comparison-rational` | §6.6 |
| `K3BlochGroups:V.6/comparison-integral` | §6.6 |
| `K3BlochGroups:V.6/comparison-finite-coefficients` | §6.6 |
| `K3BlochGroups:V.6/regulator-agreement` | Suppliers: Polylogarithms P.2, BorelRegulators R.7 |
| `K3BlochGroups:V.6/boundary-certificate` | §6.2 |
| `K3BlochGroups:V.6/root-of-unity-class` | §6.4 |
| `K3BlochGroups:V.6/regulator-agreement-padic` | Supplier: PadicHodgeRegulators D.2 |
| `K3BlochGroups:V.5/finite-field-bloch-comparison` | §5.5 |
| `K3BlochGroups:V.5/nonsplit-cartan-mod-n` | §5.6 |
| `K3BlochGroups:V.1/two-connected-hurewicz-input` | §1.1 |
| `K3BlochGroups:V.1/cover-and-fibre-interface` | §1.1 |
| `K3BlochGroups:V.1/canonical-comparison-interface` | §1.2 |
| `K3BlochGroups:V.1/cycle-certificate-evaluator` | §1.3 |
| `K3BlochGroups:V.1/ring-map-comparison-square` | §1.4 |
| `K3BlochGroups:V.1/finite-stage-cycle-certificates` | §1.4 |
| `K3BlochGroups:V.1/elementary-cover-hspace` | §1.5 |
| `K3BlochGroups:V.1/hspace-hopf-kernel-refinement` | §1.5 |
| `K3BlochGroups:V.1/hopf-minus-one-product-refinement` | §1.5 |
| `K3BlochGroups:V.1/elementary-homology-exact-sequence-refinement` | §1.5 |
| `K3BlochGroups:V.2/real-place-basis` | §2.3 |
| `K3BlochGroups:V.2/real-basis-symbol-representatives` | §2.3 |
| `K3BlochGroups:V.2/minus-one-product-surjective` | §2.3 |
| `K3BlochGroups:V.2/decomposable-signature` | §2.3 |
| `K3BlochGroups:V.2/totally-imaginary-quotient-equivalence` | §2.4 |
| `K3BlochGroups:V.2/number-field-stable-hurewicz-equivalence` | §2.4 |
| `K3BlochGroups:V.2/weight-two-mod-two-obstruction-zero` | §2.2 |
| `K3BlochGroups:V.2/indecomposable-motivic-edge-equivalence` | §2.2 |
| `K3BlochGroups:V.3/bloch-lecture-kernel` | §3.9 |
| `K3BlochGroups:V.3/bloch-lecture-comparison` | §3.9 |
| `K3BlochGroups:V.3/bloch-lecture-obstruction` | §3.10 |
| `K3BlochGroups:V.3/bloch-lecture-six-torsion` | §3.10 |
| `K3BlochGroups:V.3/goncharov-generic-b2` | §3.11 |
| `K3BlochGroups:V.3/goncharov-generic-comparison` | §3.11 |
| `K3BlochGroups:V.3/goncharov-curve-b2` | §3.12 |
| `K3BlochGroups:V.3/goncharov-curve-boundary` | §3.12 |
| `K3BlochGroups:V.3/goncharov-curve-comparison` | §3.12 |
| `K3BlochGroups:V.3/cgz-published-negative-tensor` | §3.14 |
| `K3BlochGroups:V.3/cgz-published-target-kernel` | §3.14 |
| `K3BlochGroups:V.3/cgz-published-boundary` | §3.15 |
| `K3BlochGroups:V.3/cgz-published-bloch-group` | §3.15 |
| `K3BlochGroups:V.3/cgz-published-comparison-map` | §3.16 |
| `K3BlochGroups:V.3/cgz-published-lemma-two-two` | §3.16 |
| `K3BlochGroups:V.3/cgz-published-to-older` | §3.16 |
| `K3BlochGroups:V.3/convention-coefficient-exports` | §3.16 |
| `K3BlochGroups:V.4/scalar-homology-vanishing` | §4.3 |
| `K3BlochGroups:V.4/affine-block-homology` | §4.3 |
| `K3BlochGroups:V.4/unimodular-vector-chains` | §4.2 |
| `K3BlochGroups:V.4/unimodular-acyclic-range` | §4.2 |
| `K3BlochGroups:V.4/stability-coinvariants` | §4.4 |
| `K3BlochGroups:V.4/frame-connecting-map` | §4.5 |
| `K3BlochGroups:V.4/frame-algebra-splitting` | §4.6 |
| `K3BlochGroups:V.4/frame-spectral-sequence-collapse` | §4.8 |
| `K3BlochGroups:V.4/normalized-milnor-homology-map` | §4.5 |
| `K3BlochGroups:V.4/cross-ratio-coefficient-change` | §4.14 |
| `K3BlochGroups:V.4/milnor-frame-retraction` | §4.5 |
| `K3BlochGroups:V.4/degree-three-torus-quotient` | §4.8 |
| `K3BlochGroups:V.4/closure-torsion-detector` | §4.18 |
| `K3BlochGroups:V.4/cyclic-chern-evaluation` | §4.17 |
| `K3BlochGroups:V.4/chern-bockstein-square` | §4.18 |
| `K3BlochGroups:V.4/closure-detector-injectivity` | §4.18 |
| `K3BlochGroups:V.5/finite-indecomposable-specialization` | §5.1 |
| `K3BlochGroups:V.5/transfer-on-indecomposables` | §5.1 |
| `K3BlochGroups:V.5/localized-sl2-homology` | §5.2 |
| `K3BlochGroups:V.5/sl2-characteristic-exceptions` | §5.2 |
| `K3BlochGroups:V.5/finite-stabilization-map` | §5.3 |
| `K3BlochGroups:V.5/finite-stabilization-equivalence` | §5.3 |
| `K3BlochGroups:V.5/finite-cross-ratio-map` | §5.4 |
| `K3BlochGroups:V.5/finite-bloch-orders` | §5.5 |
| `K3BlochGroups:V.5/finite-k3-bloch-map` | §5.5 |
| `K3BlochGroups:V.5/finite-enhanced-torsion-sequence` | §5.5 |
| `K3BlochGroups:V.5/odd-coefficient-finite-comparison` | §5.6 |
| `K3BlochGroups:V.5/norm-one-cartan-embedding` | §5.6 |
| `K3BlochGroups:V.5/cartan-homology-modulo-n` | §5.6 |
| `K3BlochGroups:V.5/number-field-product-image` | §5.7 |
| `K3BlochGroups:V.5/rational-decomposable-subgroup` | §5.7 |
| `K3BlochGroups:V.5/gaussian-decomposable-vanishing` | §5.7 |
| `K3BlochGroups:V.5/real-rogers-detector` | §5.8 |
| `K3BlochGroups:V.5/universal-class-order-six` | §5.8 |
| `K3BlochGroups:V.6/integral-root-multiple` | §6.3 |
| `K3BlochGroups:V.6/root-coefficient-class` | §6.4 |
| `K3BlochGroups:V.6/suslin-lift-fibre` | §6.5 |
| `K3BlochGroups:V.6/bar-lift-witness` | §6.5 |
| `K3BlochGroups:V.6/finite-coefficient-identification` | §6.7 |
