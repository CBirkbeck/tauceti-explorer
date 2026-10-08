# GL₂ Modularity Lifting, Part 2: de Rham lifting and transfer

This part plans R32.3–R32.6 at target level. It builds on the statement table and odd-prime lifting theorem of part R22.1, and on the accepted RS-08 ownership arrangement. Its endpoint is the collection of modularity-transfer theorems used by ClassicalSerreModularity R33.1. The characteristic-zero representation is kept irreducible in every residually reducible branch. All four stages are **planned**, with two explicit gaps: certification that the auxiliary source inputs are independent of full Serre modularity, and the absence of the arithmetic carriers needed to elaborate the complete theorem signatures. These are planning and supplier obligations; no implementation is asserted.

The generic deformation rings, determinants, local blocks, completed homology and ordinary families belong to their existing owners. This part constructs the arithmetic passage through components and specializes the supplied lifting results to congruences. It does not reconstruct a universal pseudo-character or a reducibility ideal. In particular, a local scalar residual pair cannot be put into a multiplicity-free generalized matrix algebra by treating its two occurrences as distinct characters. The global odd pair 1,χ̄ at an odd prime is distinct, and its generic algebraic treatment can use the multiplicity-free supplier.

## Conventions and imported objects

Let p be a rational prime, E/ℚ_p a finite extension, 𝒪 its integers, ϖ a uniformizer and k its residue field. Every representation has a specified continuous action and coefficient topology. The general geometric hypotheses mean continuous, irreducible, odd, unramified outside finitely many primes, and de Rham at p with distinct Hodge–Tate weights. Over a totally real field, oddness is checked at every real place. The monodromy theorem, imported from PadicHodgeTheory R06.3, turns de Rham into potentially semistable; it does not turn it into crystalline.

The atlas uses HT(ε)=+1 and normalized weights {0,k−1}. Pan's ordinary stable-character ordering and his algebraic-vector conventions are retained inside his ordinary theorem interface, then translated by the supplier into this convention. Twisting by a geometric character shifts both Hodge–Tate weights by the same integer. Twisting by a finite-order character shifts neither. A normalized regular representation has a classical form of weight equal to the difference of the two weights plus one. The source conclusions stated up to twist are interpreted through the global geometric-character and modular-twist comparison from ArithmeticGaloisRepresentations R01.2. A weight gap greater than one cannot be turned into a Barsotti–Tate weight gap by a uniform shift.

Residual representations are reductions of stable lattices followed by semisimplification when the branch requires it. Independence of the lattice and coefficient extension come from ArithmeticGaloisRepresentations R01.1. Congruence is an isomorphism of those residual representations after passage to a common residue field; it is not equality of arbitrary matrix presentations. For a residually absolutely irreducible branch, semisimplification loses no constituent data needed by the lifting theorem. Nonsolvable residual image at 2 likewise forces characteristic-zero irreducibility. The residual modularity hypothesis in the odd irreducible and dyadic theorems is retained and supplied by a known modular member in a congruence argument.

For Pan, fix a totally real abelian F/ℚ in which p splits completely, S containing the p-places and all finite ramification, and an odd residual ratio extending to G_ℚ. The initial finite-order twist makes the residual trace 1+χ̄. Let χ be the determinant of the resulting characteristic-zero representation. R^{ps} represents continuous two-dimensional pseudo-representations lifting 1+χ̄ with determinant χ. The tame variants impose T|I_v=ξ_v+ξ_v⁻¹ for p-power order ξ_v; the auxiliary field is of even degree, and the norm and determinant restrictions of §4.1 are part of the patching setup. The representability, pointwise semisimple reconstruction and trace comparison are requested from GlobalGaloisDeformations R04.1–R04.3 and IntegralHeckeAndGaloisDeterminants IHG.1. A representation deformation ring at a reducible residual point is not identified with this pseudo-ring without the precise comparison theorem.

The reducibility ideal is the universal ideal through which the pseudo-representation becomes a sum of two characters. Its off-diagonal generalized-matrix-algebra description, reconstruction, completion comparisons and height bounds are imported from IHG.1 and R04.2. No duplicate algebraic definition appears here. Locally, the generic ordinary quotient has a principal ideal; the scalar case needs a chosen-character cover; and the p≥5 cyclotomic case initially has a two-generator ideal. The actual local rings and their comparisons are requested from LocalGaloisDeformationRings R08.6 and the ordinary owner R21.3. The coefficient extension used to make components geometric is part of the hypotheses, not a silent simplification.

The completed Hecke quotient R^{ps,{ξ_v}}↠T_m and Pan’s §4.1.3 pro-modularity interface are requested from R31.3. A pseudo-ring prime q is pro-modular when q lies in the image of Spec T_m, equivalently when q contains the kernel of this surjection. The image is closed under specialization. Pan §4.1.2 assumes that the ideal generated by ϖ and T_v−1−χ(Frob_v), for v∉S, is an actual maximal Eisenstein ideal m. This setup and its central character ψ=χε are retained. The R21.4 ordinary representation-deformation predicate has a different carrier and does not supply this pseudo-ring interface. Pan’s bridge uses the localized nilpotent-kernel statement at a nice prime. Corollary 3.5.10 supplies a finite faithful block multiplicity module, with the finite-generation hypotheses needed for support and Nakayama.

## Library baseline and ownership

The pinned source check uses Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed library coverage contains no direct R32.3–R32.6 entry. Therefore an absence claim here rests on a source search, not on an unrecorded audit verdict. Searching both pinned source trees for modularity lifting, pseudo-representations/pseudo-characters, reducibility ideals and completed homology/cohomology found no corresponding arithmetic interfaces. The unrelated matrix Cayley–Hamilton material is not the determinant deformation theory used by Pan.

Six actual Mathlib declarations are reused. `Relation.ReflTransGen`, its `trans` theorem and `Relation.reflTransGen_iff_eq` describe finite component-chain reachability. `PrimeSpectrum.comap` and `minimalPrimes` give the spectrum incidence construction. `minimalPrimes.equivIrreducibleComponents` identifies those generic points with irreducible components. Their actual statements were read at the pin. The suggested file imports those modules individually. It does not introduce another theory of graph reachability, spectra or minimal primes.

The supplied DeformationAndDerivedPatchingAlgebra R03.6 packet is used through `nearly-faithful-iff-support-eq-univ` and `nearly-faithful-quotient`, with finite modules in their stated generality. Its P7 packet has been inspected as well: derived residual Nakayama for pseudo-coherent complexes is not a finite-generation theorem for raw completed homology. The connectedness-dimension statement required by Pan is not supplied by either packet in the precise form needed, so it is requested from R03.6. Pan's ordinary refinements of Skinner–Wiles are requested from R21.3–R21.5; the existing 1999 nice-prime and ordinary lifting definitions are not silently widened to those refinements.

The upstream Multiquadratic and SemisimpleAlgebras roadmaps provide the style and density model. All link maps have been screened for the four scope stages; none contains a touching entry. The atlas's recorded stage chain R32.3→R32.4→R32.5→R32.6 and its R33.1 consumer remain intact. Dependencies below use finer supplier identifiers whenever a sufficient node exists.

## R32.3 — Dyadic de Rham lifting

The dyadic proof has two independent tasks: establish support on every typed component, then specialize a finite algebraic module to the prescribed global lift. The raw patched completed module is not finite over the patched ring. Tung first applies Colmez's functor; §§6.3.2–6.3.6 give finite generation and nearly faithful action on the resulting module. The nonordinary local fibre comparison in Theorem 6.3.7 gives positive multiplicity for absolutely irreducible local Galois representations. It does not cover ordinary local components. Those use Theorem 7.3.1's partial ordinary automorphic lift. Theorem 8.0.1 combines the two cases, replacing one p-place's component at a time.

Those constructions belong to R30/R31. The precise requested R31.5 export includes the determinant, type and auxiliary-place hypotheses and Tung Lemma 5.3.2's finite unpatched module. Only then is near faithfulness converted to full support and a nonzero fibre. Finite-generation cannot be dropped from that argument: a faithful nonfinite module can have a zero fibre. For the global theorem, the solvable extension preserves the nonsolvable residual image and p splitting, fixes the parity needed for the definite quaternion algebra, and makes away-p inertia unipotent. It uses an already modular residual representation. The final eigenform descends through solvable base change.

Paškūnas' preceding theorem excludes local residual extensions of χ by χ at 2. Tung removes that condition. Kisin's dyadic potentially Barsotti–Tate theorem is a separate older input in part R22.1; its stronger local hypothesis cannot be replaced by regular de Rham behavior. The three declarations below specify specialization, the totally real theorem and its ℚ consequence.

### The 2-adic de Rham modularity lifting theorem (Kisin, Paškūnas, Tung)

Declaration: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting` (theorem).

Atlas planet: **2-adic de Rham modularity lifting**.

Let p = 2, E/ℚ₂ finite with ring 𝒪 and residue field k, and ρ : G_ℚ → GL₂(𝒪) continuous, irreducible, odd, unramified outside finitely many primes, with ρ|_{G_{ℚ₂}} de Rham of distinct Hodge–Tate weights. If ρ̄ is modular and has non-solvable image, then ρ is modular: up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for ρ|_{G_{F_v}} potentially semistable with distinct Hodge–Tate weights and det ρ totally odd, under the extra local hypothesis (iv) ρ̄|_{G_{F_v}} ≇ (χ ∗; 0 χ) for every v | 2 (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at p = 2 (ω = 1 there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

Hypotheses and conventions:

- this is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting), and a regular de Rham representation is not Barsotti–Tate after renaming its weights
- residual modularity is a hypothesis; Tung notes that over ℚ it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see R32.6/globalisation-dependency-audit)
- non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p
- The dyadic statement is specified here; the current R32.1/lifting-statement-table defines only the odd-prime statement. The totally-real theorem uses the requested general-field nonsolvable-image preservation, rather than the Q-only R32.1 lemma.
- Tung Theorem 8.0.1 combines an ordinary and a nonordinary component argument; Colmez finiteness and near faithfulness alone do not replace the ordinary input.

Proof or construction:

1. Apply p-adic monodromy to the de Rham regular local representation, preserving the Hodge–Tate weights.
2. Apply totally-real-dyadic-lifting with F=ℚ. Its residual modularity remains an explicit hypothesis, not a use of the general Serre endpoint.
3. For normalized weights {0,k−1}, translate the classical form’s weight through the imported global-character twist and algebraic-vector convention; do not identify this theorem with the weight-two potentially Barsotti–Tate theorem.

Direct inputs: `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `PadicHodgeTheory:R06.3`, `ArithmeticGaloisRepresentations:R01.2`.

Sources: [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), Introduction, Theorem A, p. 2 (arXiv v3); [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), Introduction, p. 3 (arXiv v3); [PASKUNAS-2016](https://arxiv.org/pdf/1509.00332v2), §1, Theorem 1.1, pp.1–2 (arXiv v2; hypothesis (iv) and conclusion on p.2).

Uses:

- GL2ModularityLifting:R32.6/transfer-dyadic: the p = 2 modularity transfer
- ClassicalSerreModularity R33.1: Dieulefait–Pacetti Theorem 1.5

Acceptance:

- A ρ with ρ̄|_{G_{ℚ₂}} ≅ (χ ∗; 0 χ) (for instance ρ̄ unipotent at 2) is covered by Tung's Theorem A but not by Paškūnas' Theorem 1.1.
- A potentially Barsotti–Tate ρ is the case already covered by Kisin's (0.1), used in the classical proof through Hypothesis (H).

### Automorphy from typed dyadic component support

Declaration: `GL2ModularityLifting:R32.3/typed-component-specialisation` (theorem).

In Tung §§4–5, with a modular nonsolvable residual representation over a totally real F in which 2 splits completely, fixed determinant ψε totally odd, odd deformation conditions at every real place, the specified Steinberg conditions away from 2, auxiliary place v₁, and a product σ of locally algebraic types, suppose the imported Theorem 8.0.1 gives support containing every irreducible component of R∞(σ)[1/2]. Then Rˢ_ψ(σ) is finite over 𝒪 and M(σ)[1/2] is faithful over Rˢ_ψ(σ)[1/2]. Every characteristic-zero point of this global deformation problem, including the point of a prescribed lift of type σ, therefore occurs in algebraic quaternionic forms and is automorphic after Jacquet–Langlands.

Hypotheses and conventions:

- The characteristic-zero deformation points satisfy det ρ(c_v)=−1 at every real place. Residual oddness in characteristic two cannot replace these odd local deformation conditions (Tung §3.2.5, Proposition 3.2.7, p.15).
- Full component support is required: the type-specialized patched module is supported on the union of all irreducible components. A nonempty intersection with each component alone is not a general algebraic full-support criterion.

Proof or construction:

1. Use R31.5 for Tung Theorem 8.0.1, including both Theorem 6.3.7 (nonordinary components) and Theorem 7.3.1 (ordinary components); no finiteness assertion about the raw completed module is substituted.
2. Apply Tung Lemma 5.3.2 (1)–(3), with its local–global type comparison and patching/augmentation comparison. The finite module, reduced generic fibre and faithful action imply nonzero fibre at every characteristic-zero point by localization and Nakayama.
3. Identify that fibre with the finite-level algebraic σ-space using R31.2. Transfer the definite quaternionic eigenform to GL₂/F using R17.3.

Direct inputs: `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.2`, `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ`, `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

Sources: [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), §3.2.5, Proposition 3.2.7, p.15; §5.2, Proposition 5.2.2(3), p.28; §5.3, Lemma 5.3.2, p.28; §8, Theorems 8.0.1 and 8.0.3 with proof, pp.38–39 (arXiv v3).

Acceptance:

- Faithfulness of a nonfinite completed module alone is insufficient to justify nonzero fibres; the imported type-specialized finite-module argument must be used.
- Both ordinary and nonordinary components occur, including residual self-extensions at 2.

### Tung’s totally real dyadic lifting theorem

Declaration: `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting` (theorem).

Atlas planet: **Dyadic Hilbert modularity lifting**.

Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, totally odd and finitely ramified, with modular residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

Hypotheses and conventions:

- Total oddness means det ρ(c_v)=−1 for every real place v. The bar on ρ in arXiv v3 Theorem 8.0.3(3) is recorded as source issue GL2ModularityLifting/E11; use the odd characteristic-zero local deformation condition from §3.2.5, not residual determinant parity at two.

Proof or construction:

1. Choose a totally real solvable extension F′/F, disjoint from the residual fixed field with ζ₂, of even degree, split at 2, killing residual ramification away from 2 and making the remaining lift inertia unipotent. Preserve nonsolvable residual image using the general-field restriction export requested from R04.4.
2. Choose the definite quaternion algebra ramified at the real places and the even set Σ of remaining ramified finite places, an auxiliary v₁ with distinct residual Frobenius eigenvalues, and the level of Tung §8. Total oddness of ρ puts its real-place points in D_v^odd (Proposition 3.2.7). The determinant, types and Steinberg local conditions put ρ|G_F′ in the situation of typed-component-specialisation.
3. Apply that theorem and descend using solvable base change, with irreducibility guaranteed by nonsolvable residual image.

Direct inputs: `GL2ModularityLifting:R32.3/typed-component-specialisation`, `GlobalGaloisDeformations:R04.4`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

Sources: [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), §3.2.5, Proposition 3.2.7, p.15; §8, Theorem 8.0.3 and proof, pp.38–39 (arXiv v3).

Acceptance:

- Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, totally odd and finitely ramified, with modular residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).
- The local characteristic-two reductions of I₂ and diag(1,−1) coincide, although their characteristic-zero determinants are +1 and −1. Thus residual determinant data alone does not verify the total-oddness premise.

## R32.4 — Pan's residually reducible theorem

The ordinary and nonordinary characteristic-zero local branches are treated separately. The ordinary branch imports Pan's Theorem 5.1.2 when the residual local characters are distinct and Theorem 6.1.2 when their ratio is trivial. The latter retains a chosen ordinary character and its orientation. It is not a consequence of the original distinguished Skinner–Wiles theorem.

For the nonordinary branch, retain the §7.1 setup: the determinant is de Rham at p, the odd residual ratio extends to G_ℚ, and solvable field enlargement gives d=[F:ℚ]>|S\Σ_p|+2. The global trace point then lies on a large component by the Euler characteristic calculation. A dense ordinary modular locus supplies a seed, a characteristic-p dimension-one prime supplies a patching location, and the localized nilpotent-kernel theorem transports Hecke occurrence through a component. The classicality conclusion requires local absolute irreducibility and regular de Rham behavior at every p-place. The R06.2 coefficient/weight comparison upgrades irreducibility over F_v=ℚ_p: character constituents conjugate under a coefficient extension would have equal Hodge–Tate weights, contradicting regularity. An ordinary characteristic-zero point cannot be sent through that particular classicality theorem.

There are three residual local shapes. In the generic case the local reducibility ideal is principal, so the ordinary intersection loses at most one dimension per p-place. In the scalar case the cover adds two local character parameters and imposes three equations. In the cyclotomic case at p≥5, two equations initially leave only a dimension-one ordinary intersection; Pan connects components using extension deformation rings and their reducible-locus dimension bounds. The good-component definition records precisely the finite seeded chain this argument requires. At p=3, ω=ω⁻¹ and Pan excludes that cyclotomic shape. The following declarations and their supplier requests implement each route independently.

### Pan's theorem: the Fontaine–Mazur conjecture in the residually reducible case

Declaration: `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur` (theorem).

Atlas planet: **Pan's residually reducible Fontaine–Mazur theorem**.

Let p be odd and ρ : G_ℚ → GL₂(E), E/ℚ_p finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights. Suppose ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂ is a sum of two characters, and if p = 3 that χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω (the mod-3 cyclotomic character). Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When ρ|_{G_{ℚ_p}} is reducible (ordinary) and χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1 this is Skinner–Wiles; Pan supplies the missing ordinary case χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1 (his §6) and the non-ordinary case (his Theorem 7.1.1).

Hypotheses and conventions:

- irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters
- no residual modularity is assumed: residually reducible representations are handled with pseudo-representations
- at p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5
- For p≥5 this is the residually reducible lifting form used by transfer-residually-reducible; it does not need the current odd-only R32.1 statement table.

Proof or construction:

1. Split by whether the local characteristic-zero representation at p is reducible.
2. In the reducible local case apply the exact ordinary theorems of Pan 5.1.2 (distinguished) or 6.1.2 (scalar residual local ratio), supplied by R21.5. These include their finite Λ-algebra inputs from R21.4.
3. In the irreducible local case apply nonordinary-hilbert-modularity with F=ℚ; the generic, scalar and cyclotomic components have separate proof paths.
4. Untwist using the global geometric-character convention. At p=3, ω=ω^{−1}, so swapping residual characters leaves the excluded case unchanged.

Direct inputs: `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`, `ArithmeticGaloisRepresentations:R01.2`, `PadicHodgeTheory:R06.3`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), Introduction, Theorem 1.0.2, p. 3 (arXiv v2); [PAN-2022](https://arxiv.org/pdf/1901.07166v2), Introduction, after Theorem 1.0.2, p. 3 (arXiv v2).

Uses:

- GL2ModularityLifting:R32.6/transfer-residually-reducible: residually reducible modularity without a residual modularity hypothesis
- ClassicalSerreModularity R33.1: Dieulefait–Pacetti Theorem 1.6 (p ≥ 5)

Acceptance:

- ρ̄^{ss} ≅ 1 ⊕ χ̄₅ at p = 5 with ρ|_{G_{ℚ₅}} irreducible and de Rham of distinct weights: covered (non-ordinary case).
- p = 3 with ρ̄^{ss} ≅ 1 ⊕ χ̄₃: excluded (χ̄₃|_{G_{ℚ₃}} = ω); this is Dieulefait–Pacetti's p = 3 branch, R32.5/p-three-residually-reducible-branch.

### Pan’s residually irreducible lifting theorem with residual modularity

Declaration: `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur` (theorem).

The usable lifting form is Pan Theorem 8.0.1 at F=ℚ: p odd, ρ continuous irreducible odd finitely ramified, ρ̄|G_ℚ(ζ_p) absolutely irreducible and modular, and ρ|G_ℚp absolutely irreducible regular de Rham. At p=3 exclude residual local extensions η by ηω in either orientation. Then ρ is modular. Pan Theorem 1.0.4 is a broader source consequence, combining earlier ordinary and residually dihedral cases and invoking full Serre modularity over ℚ through Remark 8.0.4; that unconditional consequence is not an input to the independent R33 proof.

Hypotheses and conventions:

- Residual modularity is kept in the lifting statement.
- This comparison node is outside the dependency cone of the modern residually reducible transfer; the source’s unconditional Theorem 1.0.4 is not exported as an independent Serre input.

Proof or construction:

1. Apply the exact completed-homology patching theorem of Pan §8 with its specified residual-modularity hypothesis and local exclusions; this is requested from R31.5.
2. Use the local block compatibility and nonordinary classicality from R31.4.
3. Record Remark 8.0.4 separately: replacing residual modularity by the already proved full Serre theorem proves the unconditional source consequence, but would be circular in an independent proof of Serre.

Direct inputs: `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §8, Theorem 8.0.1 and Remark 8.0.4, pp.124–125.

Uses:

- GL2ModularityLifting:R32.6/globalisation-dependency-audit: the one read result whose proof invokes the general Serre theorem

Acceptance:

- A merely residually irreducible representation is not admitted unless its cyclotomic restriction and residual modularity satisfy the theorem.
- R33 uses the source-faithful residually reducible theorem, never the unconditional Theorem 1.0.4.

### Pan’s nice Hecke prime

Declaration: `GL2ModularityLifting:R32.4/nice-prime` (definition).

Atlas planet: **Nice primes**.

Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

Hypotheses and conventions:

- Retain Pan §4.1.2 Assumption 1: the ideal generated by ϖ and T_v−1−χ(Frob_v), v∉S, is an actual maximal ideal m of the completed Hecke algebra. Its central character is ψ=χε and the quaternion algebra is ramified exactly at the infinite places.

Proof or construction:

1. Use R04.1–R04.2 for the determinant-fixed pseudodeformation problem and R31.3 for the Hecke quotient; use IHG.1/R01.1 for reconstruction and lattices.
2. Define the predicate by the existence of the lattice with these four properties, keeping the characteristic-p dimension-one condition and the cyclotomic intersection condition. Record the contraction separately from a prime satisfying only the Galois properties.

Direct inputs: `GlobalGaloisDeformations:R04.1`, `GlobalGaloisDeformations:R04.2`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`, `ArithmeticGaloisRepresentations:R01.1`, `IntegralHeckeAndGaloisDeterminants:IHG.1`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §4.1, Definition 4.1.4 and Remarks 4.1.5–4.1.6, p.39.

Uses:

- Pan Theorem 4.1.7: Specifies the primes at which localized pseudodeformation patching has nilpotent kernel.
- Pan §7.2.5 and Lemma 7.4.2: Identifies the primes produced after solvable base change; the definition differs from Skinner–Wiles nice primes.

Planning API:

- `TauCeti.GL2Lifting.PanNicePrime.char_p_dimension` (projection): A nice Hecke prime contains p and has quotient dimension one.
- `TauCeti.GL2Lifting.PanNicePrime.lattice` (data): Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions.
- `TauCeti.GL2Lifting.PanNicePrime.is_proModular` (compatibility): The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient from R31.3, equivalently its prime contains the kernel of that quotient.
- `TauCeti.GL2Lifting.PanNicePrime.dihedral_disjoint` (projection): If the associated representation is induced from a quadratic L, then L∩F(ζ_p)=F.
- `TauCeti.GL2Lifting.PanNicePrime.mk` (constructor): In the stated setup, p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality.
- `TauCeti.GL2Lifting.PanNicePrime.iff` (characterisation): The predicate is equivalent to p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness.

Unit tests:

- `nice_prime_characteristic_zero_rejected` (non-example): A prime not containing p is not nice, even if it is a classical automorphic point.
- `nice_prime_split_lattice_rejected` (non-example): A proposed witness lattice with split residual reduction does not satisfy PanNicePrime.lattice; irreducible generic fibre alone does not validate that witness.
- `nice_prime_constant_away_p` (characterisation): With all other clauses satisfied, the away-p clause is equivalent to equality of ρ(q)°|G_Fv with the constant residual lift for every v∈S\Σ_p; finite image alone does not suffice.

Acceptance:

- Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

### Potentially nice pseudodeformation primes

Declaration: `GL2ModularityLifting:R32.4/potentially-nice-prime` (definition).

For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

Proof or construction:

1. Import the pseudodeformation ring and pointwise semisimple representation from R04.2 and IHG.1.
2. Conjoin the four stated properties; keep the passage from potentially nice to nice as the separate arithmetic theorem potentially-nice-base-change.

Direct inputs: `GlobalGaloisDeformations:R04.2`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `ArithmeticGaloisRepresentations:R01.1`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.2.4, p.114.

Uses:

- Pan §7.2.4–7.2.5: Supplies a characteristic-p intersection point whose away-p finite images can be killed.
- Pan Definition 7.4.1: Labels intersection points in chains of components.

Planning API:

- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.char_p_dimension` (projection): Extract p∈q and dim R^{ps}/q=1.
- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.finite_away` (projection): Each away-p local restriction has finite image.
- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.of_nice` (compatibility): A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice.
- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.coefficient_extension` (functoriality): For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible.
- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.mk` (constructor): In the stated setup, p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate.
- `TauCeti.GL2Lifting.PanPotentiallyNicePrime.iff` (characterisation): The predicate is equivalent to p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added.

Unit tests:

- `potentially_nice_reducible_rejected` (non-example): A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.
- `potentially_nice_no_away_places` (degenerate): When S=Σ_p, the finite-away-p clause is vacuous; the other three clauses remain necessary.
- `potentially_nice_not_proModular_by_definition` (characterisation): For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

Acceptance:

- For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

### Modularity along a component through a nice prime

Declaration: `GL2ModularityLifting:R32.4/nice-prime-component-bridge` (theorem).

Atlas planet: **Modularity through nice primes**.

In Pan §4.1’s setup, let x be a maximal ideal of R^{ps,{ξ_v}}[1/p] such that ρ(x)|G_Fv is irreducible and de Rham with distinct Hodge–Tate weights for every v|p. If an irreducible component contains x and a nice prime q, and if p=3 the local residual ratio is not ω^{±1}, then ρ(x) is regular algebraic cuspidal automorphic over F (Corollary 4.1.8).

Proof or construction:

1. Import Theorem 4.1.7’s surjection (R^{ps,{ξ_v}})_q→T_q with nilpotent kernel from R31.5. A minimal prime on a component through q contains the kernel, so the component is in the closed Hecke image.
2. The point x is therefore pro-modular. Over F_v=Q_p, an irreducible two-dimensional de Rham representation with distinct Hodge–Tate weights is absolutely irreducible: otherwise its character constituents after finite coefficient extension are conjugate and have equal integer weights. Use the requested R06.2 coefficient/weight comparison, then R31.4’s Pan Corollary 3.5.12 with its absolutely irreducible local hypothesis and Jacquet–Langlands.

Direct inputs: `GL2ModularityLifting:R32.4/nice-prime`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`, `PadicHodgeTheory:R06.2`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §4.1, Corollary 4.1.8, pp.39–40.

Acceptance:

- The conclusion uses a common component, not just arbitrary connectedness of Spec R.
- Nilpotent kernel is sufficient; a literal global integral R=T assertion is not assumed.

### The large component through the geometric point

Declaration: `GL2ModularityLifting:R32.4/large-component-at-regular-point` (theorem).

In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

Hypotheses and conventions:

- For the component used in this proof, retain Pan §7.1.1–7.1.2: χ is de Rham at the p-places, the odd residual ratio χ̄ extends to G_Q, and the solvable field/coefficient enlargement has been performed with d=[F:Q]>|S\Σ_p|+2. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

Proof or construction:

1. Use the characteristic-zero trace/deformation comparison of Pan Corollary 2.2.3, requested from R04.2, to present the completed local ring by h¹ variables and h² relations.
2. Apply the global Euler characteristic formula to ad⁰ρ: irreducibility gives h⁰=0 and total oddness gives one real-place invariant, hence h¹−h²=2[F:ℚ]. Use the dimension comparison to the integral component.
3. Use Pan Lemma 5.7.3’s finite inertia characters at the generic point, supplied by R04.3’s away-p deformation analysis.

Direct inputs: `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `ArithmeticGaloisDuality:R02.6`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.1, Lemma 7.1.3 and §7.1.4, p.112.

Acceptance:

- In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

### The generic ordinary intersection

Declaration: `GL2ModularityLifting:R32.4/generic-ordinary-intersection` (theorem).

With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

Hypotheses and conventions:

- The degree enlargement of §7.1.2 ensures [F:ℚ]>|S\Σ_p|+2.
- The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

Proof or construction:

1. The generic local reducibility ideal is principal (Paškūnas Appendix B, Corollary B.20; request R08.6), so imposing ordinarity loses at most [F:ℚ] dimensions.
2. Pan Theorem 5.1.2, requested from R21.4–R21.5, gives finiteness over Λ_F. Equal dimension and the domain property give surjectivity on a chosen component.
3. Leopoldt for the abelian F bounds the global reducible locus by dimension two; since [F:ℚ]>2 after the stated base change, it does not fill the component. Arithmetic weights with the appropriate local character ordering give the dense regular de Rham subset, and Theorem 5.1.2 makes it modular.

Direct inputs: `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `LocalGaloisDeformationRings:R08.6`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.2, Lemma 7.2.1, Corollary 7.2.3 and proof, pp.113–114.

Acceptance:

- With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

### The scalar local ordinary cover

Declaration: `GL2ModularityLifting:R32.4/scalar-ordinary-intersection` (theorem).

With the same global C, if χ̄|G_Fv=1 at every v|p, use R₁^{ps,ord}, which remembers a chosen lifting ψ_{v,1} of the trivial local character with T|G_Fv=ψ_{v,1}+χψ_{v,1}^{−1} and ψ_{v,1}-ordinarity. Its pullback C^{ord,1} has dimension at least 1+[F:ℚ], and a component finite surjective over Λ_F with dense modular regular de Rham points, as in Pan Lemma 7.3.1 and Corollary 7.3.2.

Proof or construction:

1. Import the chosen-character ordinary cover from R21.3, including Pan §6.1.1 and its distinction from the unordered reducible pseudodeformation locus.
2. The local pseudo ring is 𝒪[[t₁,t₂,t₃]], the chosen-character ring 𝒪[[x₁,x₂]], and the comparison after adjoining the latter has a three-generator kernel. Thus the dimension estimate is 1+2d+2d−3d=1+d, not the generic principal-ideal estimate.
3. Use Pan Theorem 6.1.2’s finiteness and modularity, requested from R21.4–R21.5, to obtain the dense arithmetic points on the cover; project to the global component.

Direct inputs: `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`, `LocalGaloisDeformationRings:R08.6`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.3, Lemma 7.3.1 and Corollary 7.3.2, pp.115–116.

Acceptance:

- The scalar local case is covered although the original Skinner–Wiles distinguished-character theorem does not cover it.

### Producing a nice prime after solvable base change

Declaration: `GL2ModularityLifting:R32.4/potentially-nice-base-change` (theorem).

In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

Proof or construction:

1. Impose p and the away-p Frobenius trace conditions on C₁. The dimension bound and Leopoldt exclude the reducible locus and leave a dimension-one irreducible prime. The local away-p deformation analysis proves finite local images, giving potentially-nice-prime.
2. Apply Taylor’s solvable field selection (Pan cites Taylor 2003 Lemma 2.2) to kill these finite images, force N(w)≡1 mod p and trivialize the generic inertia characters; request the exact deformation-problem restriction from R04.4.
3. Use the dense ordinary modular points and solvable automorphic base change to produce the Hecke maximal ideal and make the image of C₁ pro-modular. The nonsplit-lattice and dihedral-disjointness checks are Pan §5.7.9’s argument, included in the R04.4 request.
4. Contract along R^{ps,1}_{F₁}→R^{ps}/P. Since x and q lie on C, their images lie on one component; q′ satisfies all clauses of nice-prime.

Direct inputs: `GL2ModularityLifting:R32.4/potentially-nice-prime`, `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GlobalGaloisDeformations:R04.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`, `GlobalGaloisDeformations:R04.3`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.2.4–7.2.5, pp.114–115; §7.3 after Corollary 7.3.2, p.116.

Acceptance:

- In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

### Good components of the pseudodeformation space

Declaration: `GL2ModularityLifting:R32.4/good-component` (definition).

Atlas planet: **Good components**.

Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

Proof or construction:

1. Import potentially-nice-prime and the ordinary arithmetic locus from R21.4; goodness is an incidence predicate, with modularity of that locus used in the separate good-component-to-automorphy argument.
2. Use Mathlib Relation.ReflTransGen for finite reachability. A starting component contains a point in the intersection of the potentially-nice and seed sets; adjacency requires a potentially nice point in both components. The reflexive case encodes t=1, not an empty unseeded chain.

Direct inputs: `GL2ModularityLifting:R32.4/potentially-nice-prime`, `mathlib:Relation.ReflTransGen`, `mathlib:Relation.ReflTransGen.trans`, `mathlib:Relation.reflTransGen_iff_eq`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.4, Definition 7.4.1, p.116.

Uses:

- Pan Lemma 7.4.2: Propagates pro-modularity through finitely many components after one solvable extension.
- Pan Proposition 7.4.3 and Corollary 7.4.22: Expresses the component connectivity required in the cyclotomic local branch.

Planning API:

- `TauCeti.GL2Lifting.panGoodComponent_iff` (characterisation): Goodness is equivalent to a seeded component followed by Relation.ReflTransGen of potentially-nice-point adjacency.
- `TauCeti.GL2Lifting.panGoodComponent_seed` (constructor): A component containing a potentially nice seed point is good by a length-one chain.
- `TauCeti.GL2Lifting.panGoodComponent_step` (relation): If C is good and C,C′ contain a common potentially nice point, then C′ is good.
- `TauCeti.GL2Lifting.panGoodComponent_mono` (functoriality): Enlarging the potentially-nice point set and the seed-point set preserves goodness.
- `TauCeti.GL2Lifting.panGoodComponent_congr` (extensionality): Pointwise equality of component subsets and equality of the nice and seed sets give equivalent goodness predicates.

Unit tests:

- `good_component_single_seed` (degenerate): For a one-component, one-point incidence system with the point in both sets, the component is good.
- `good_component_empty_seed` (non-example): With empty seed-point set, no component is good, even when every pair is adjacent.
- `good_component_two_step_chain` (computation): For components {0}, {0,1}, {1,2}, nice points {0,1}, and seed points {0}, all three are good; the third is reached through the middle component.
- `good_component_non_nice_intersection` (non-example): For components {0,1} and {1,2}, nice points {0}, seed points {0}, only the first is good: the common point 1 is not potentially nice.

Acceptance:

- Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

### Components detected by an extension deformation

Declaration: `GL2ModularityLifting:R32.4/extension-components` (construction).

Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

Proof or construction:

1. Use the imported characteristic-zero deformation ring and trace map, not a new representation deformation functor.
2. Identify components with minimal prime ideals using the pinned Mathlib order equivalence. Intersect those generic points with the image of PrimeSpectrum.comap f_B.

Direct inputs: `GlobalGaloisDeformations:R04.2`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `mathlib:PrimeSpectrum.comap`, `mathlib:minimalPrimes`, `mathlib:minimalPrimes.equivIrreducibleComponents`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.4, Definition 7.4.21, p.121.

Uses:

- Pan Corollary 7.4.22: Collects the components between which extension-ring connectedness propagates goodness.
- Proof of Proposition 7.4.3, non-generic reducible case: Connects Z_B₀ and Z_B₁ through a common potentially nice point.

Planning API:

- `TauCeti.GL2Lifting.panExtensionComponents_mem_iff` (characterisation): P lies in the set iff P is a minimal prime point of A and P=comap f Q for some Q in Spec B.
- `TauCeti.GL2Lifting.panExtensionComponents_minimal` (projection): Every member indexes an actual irreducible component of Spec A.
- `TauCeti.GL2Lifting.panExtensionComponents_id` (compatibility): For the identity map, this set is exactly the minimal-prime points of A.
- `TauCeti.GL2Lifting.panExtensionComponents_kernel_le` (projection): The kernel of f is contained in every member P.asIdeal.
- `TauCeti.GL2Lifting.panExtensionComponents_comp_subset` (functoriality): For ring maps f:A→B and g:B→C, panExtensionComponents (g.comp f) is a subset of panExtensionComponents f, by composition of spectrum comaps.

Unit tests:

- `extension_components_identity` (compatibility): For f=id_A the result equals {P∈Spec A | P.asIdeal∈minimalPrimes A}, via Mathlib’s component correspondence.
- `extension_components_zero_target` (degenerate): If B is the zero ring, Spec B is empty and the component set is empty.
- `extension_components_kernel_obstruction` (non-example): If ker f is not contained in a minimal P, then P is not detected, so using all minimal primes instead of the image intersection fails.

Acceptance:

- Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

### Geometry of nonsplit extension deformations

Declaration: `GL2ModularityLifting:R32.4/extension-component-control` (theorem).

In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

Proof or construction:

1. Request from R02.6 the exact cohomological calculation of Pan Lemma 7.4.15: restriction H¹(G_F,S,E(ψ₂/ψ₁))→⊕_{v|p}H¹(G_Fv,E(ψ₂/ψ₁)) is an isomorphism of dimension d, using Poitou–Tate and the stated Lichtenbaum vanishing with extra S-places accounted for.
2. Use R04.2–R04.3 for Pan Lemmas 7.4.17–7.4.19: reducible-locus dimension, comparison of R_B with the completed integral deformation ring of a nonsplit residual lattice, and its Euler-characteristic presentation.
3. Apply the requested connectedness-dimension algebra and Pan Corollary 2.3.7’s trace comparison to obtain all four conclusions of Corollary 7.4.20.

Direct inputs: `GL2ModularityLifting:R32.4/extension-components`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `ArithmeticGaloisDuality:R02.6`, `DeformationAndDerivedPatchingAlgebra:R03.6`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.4, Lemmas 7.4.15–7.4.19 and Corollary 7.4.20, pp.119–121.

Acceptance:

- In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

### Goodness within the extension component set

Declaration: `GL2ModularityLifting:R32.4/extension-component-propagation` (theorem).

Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

Hypotheses and conventions:

- The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for d=1.

Proof or construction:

1. Partition the union of components in Z_B into nonempty unions Z₁,Z₂ and pull the partition back to Spec R_B. Connectedness dimension ≥2d−1 gives an intersection point Q of that dimension.
2. Since 2d−1>d+1 in the degree-enlarged setting, Q is outside the reducible locus. The trace-map dimension gain gives an intersection in the pseudodeformation space of dimension at least 2d.
3. Use the R04.3 trace-cut prime-selection export on this intersection, with the |S\Σ_p| equations, reducible-locus bound and finite-away-p-image check, to obtain a potentially nice common point. The step API of good-component propagates across the partition, ruling out a good/bad partition.

Direct inputs: `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/potentially-nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GlobalGaloisDeformations:R04.3`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.4, Corollary 7.4.22 and proof, p.121.

Acceptance:

- Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

### Goodness in the cyclotomic residual branch

Declaration: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness` (theorem).

Atlas planet: **Cyclotomic component connectedness**.

In Pan §7.4, p≥5 and after the coefficient, twist and degree enlargement of §7.1.2, suppose χ̄|G_Fv=ω at every v|p, with C the large component through the given irreducible regular de Rham point. Then C is good (Proposition 7.4.3). The inverse-cyclotomic orientation is obtained by relabelling and twisting; the p=3 cyclotomic case is excluded.

Proof or construction:

1. Use the local ring R_v^{ps}≅𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀), with ordinary quotient by (x₀,x₁), from R08.6. This initially gives only dim C^{ord}≥1. Choose a dimension-one ordinary q.
2. If ρ(q) is irreducible, Pan Lemmas 7.4.8–7.4.10 use a deformation presentation to bound connectedness by 2d−1; the correctly oriented ordinary deformation component supplies a seed. A hypothetical good/bad partition then contains a potentially nice intersection point.
3. If ρ(q)=ψ₁⊕ψ₂ with ratio not ε^{±1} times finite order, Lemma 7.4.12 makes the local ordinary ideal principal after localization away from the singular cyclotomic point. The dimension and ordinary-density argument gives a seed component.
4. In the remaining ratio ψ₁/ψ₂=εθ case, use extension-component-control and extension-component-propagation. Choose B₀ supported at one p-place via the cohomological restriction isomorphism, find a good component in Z_B₀, and realize C in Z_B₁ via a normalized one-dimensional deformation lattice.
5. Pan Lemma 7.4.23’s height-at-most-one off-diagonal ideal yields an intersection of a component of Z_B₀ with one of Z_B₁ of dimension at least d+2. Choose a potentially nice point there and propagate goodness. The GMA and height calculation are precise IHG.1/R04.2 requests.

Direct inputs: `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/extension-components`, `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/extension-component-propagation`, `LocalGaloisDeformationRings:R08.6`, `GlobalGaloisDeformations:R04.2`, `GlobalGaloisDeformations:R04.3`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`, `DeformationAndDerivedPatchingAlgebra:R03.6`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.4, Proposition 7.4.3 and proof, Lemmas 7.4.4–7.4.23, pp.117–124.

Acceptance:

- The local ordinary ideal has two generators globally in this branch; treating it as principal globally fails.
- The exceptional p=3 branch is not included.

### Pan’s nonordinary Hilbert modularity theorem

Declaration: `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity` (theorem).

Atlas planet: **Nonordinary Hilbert modularity**.

Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

Proof or construction:

1. Normalize χ̄₁=1 by its finite-order lift. Use the solvable field and coefficient enlargements of §7.1.2, keeping total reality, p splitting and characteristic-zero irreducibility, then find the large component at ρ. The residual representation remains reducible.
2. In the generic ratio branch use generic-ordinary-intersection; in the scalar branch use scalar-ordinary-intersection. Produce a nice prime after base change and apply nice-prime-component-bridge.
3. For the cyclotomic branch at p≥5 use cyclotomic-component-connectedness. Lemma 7.4.2 chooses one solvable extension simultaneously for the finite component chain, starts from the ordinary modular seed, and repeatedly applies the nilpotent-kernel bridge.
4. Apply nonordinary classicality and Jacquet–Langlands over the auxiliary field, then descend by solvable base change and untwist. No global residual modularity assumption is introduced.

Direct inputs: `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`, `ArithmeticGaloisRepresentations:R01.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GlobalGaloisDeformations:R04.4`.

Sources: [PAN-2022](https://arxiv.org/pdf/1901.07166v2), §7.1, Theorem 7.1.1; §7.4, Lemma 7.4.2, pp.111–116.

Acceptance:

- Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

## R32.5 — Small-prime ordinary completion

The source-faithful p=3 theorem is the existing Skinner–Wiles specialization. Its residual ratio 1/ω₃ is ω₃ because ω₃ has order two. It therefore sits exactly in Pan's excluded p=3 branch. Coverage comes from the ordinary quotient condition and the crystalline calculation, not from relaxing Pan's local block hypothesis.

For a crystalline member with weights {0,1} or {0,3}, the existing R21.5 calculation applies within 2≤k≤p+1. Reducible residual semisimplification forces ordinarity, and the residual characters on inertia are distinct since k−1 is odd. The character selected for normalization is the global constituent whose local restriction is the actual unramified ordinary quotient. Its Teichmüller lift is also unramified at 3. Twisting by its inverse consequently preserves the inertia quotient and does not change the weight. An arbitrary choice of constituent does not have that property. The level-one application identifies the normalized global ratio with ω₃; outside level one the general distinguished Skinner–Wiles theorem needs only the nontrivial local ratio.

The published DP Theorem 1.7 is checked against Skinner–Wiles' printed theorem. The separate supplier finding E9 addresses DP's redundant nontriviality bullet. This packet records E10 for the finite-order qualification on ψ that DP does not repeat. Every statement here keeps ψ finite order. The completion in weights two and four does not assert ordinarity at all crystalline weights or for every regular de Rham lift.

### The p = 3 residually reducible branch: Skinner–Wiles, and why Pan's theorem does not cover it

Declaration: `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch` (theorem).

Atlas planet: **The p = 3 ordinary branch**.

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified with ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k (Dieulefait–Pacetti Theorem 1.7 = Skinner–Wiles at p = 3, OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three). This branch is not a consequence of Pan's theorem: Dieulefait–Pacetti quote Pan only for p ≥ 5, and Pan's Theorem 1.0.2 at p = 3 excludes exactly the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, which is this one (χ̄₃|_{G_{ℚ₃}} = ω). Normalisation after twisting: if ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂, choose β̄ among χ̄₁,χ̄₂ by the actual unramified ordinary quotient and twist ρ by its inverse Teichmüller lift so that ρ̄^{ss} ≅ 1 ⊕ χ with the trivial character on the unramified quotient; hypothesis (ii) is then read for the twisted ρ.

Hypotheses and conventions:

- Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9)
- The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion.
- Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately.
- ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; source issue E10 records it.
- The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

Hypotheses and conventions:

- Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9)
- The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion.
- Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately.
- ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; source issue E10 records it.
- The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

Proof or construction:

1. Import R21.5/theorem-a-at-three, proved from Skinner–Wiles’ introduction theorem with finite-order ψ and nontrivial residual ratio on the decomposition group.
2. The ratio of 1 and ω₃ is ω₃ in either order because it has order two. Thus Pan Theorem 1.0.2’s p=3 exclusion applies exactly here, even though Skinner–Wiles covers the ordinary lift.
3. Use ordinary-character-normalisation only for the explicit extension to other globally labelled character pairs; its finite-order twist preserves the inertia quotient and the weight.

Direct inputs: `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`, `GL2ModularityLifting:R32.5/ordinary-character-normalisation`.

Sources: [SKINNER-WILES-1999](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, the Theorem, printed p. 6 (on the page image); [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), Theorem 1.7 and its proof, pp. 4–5 (arXiv v2).

Uses:

- ClassicalSerreModularity R33.4: Paso 6, the terminal case at p = 3
- GL2ModularityLifting:R32.6/globalisation-dependency-audit: the Skinner–Wiles branch uses no residual modularity

Acceptance:

- ρ̄^{ss} ≅ 1 ⊕ χ̄₃ with ρ crystalline of Hodge–Tate weights {0, 1} at 3: ordinary by the local calculation, hence modular by this branch; Pan's theorem does not apply.
- The same residual sum written χ̄₃⊕1 is covered by relabelling its two summands. Relabelling does not twist the characteristic-zero representation; an inverse 3-adic cyclotomic twist would change the weights and can destroy the trivial inertia quotient.

### Normalization by the ordinary quotient character

Declaration: `GL2ModularityLifting:R32.5/ordinary-character-normalisation` (theorem).

Let ρ be a continuous irreducible odd finitely ramified 3-adic representation with an ordinary local quotient β unramified at 3, residual characters ᾱ,β̄ globally with β̄ restricting to the reduction of that quotient, and determinant ψε^{k−1} with ψ finite order and integer k≥2. Let η be the Teichmüller lift of the global character β̄ and twist by η^{−1}. Then the residual characters become ᾱβ̄^{−1},1, the local quotient remains unramified (hence trivial on inertia), det(ρ⊗η^{−1})=(ψη^{−2})ε^{k−1}, and the Hodge–Tate weights and oddness are unchanged. If ᾱβ̄^{−1}=ω₃ globally, this is exactly the imported Skinner–Wiles p=3 interface; otherwise a nontrivial local ratio is sufficient for its more general distinguished theorem.

Proof or construction:

1. Import finite-order character lifts, twists, determinant and weight formulas from R01.1–R01.2.
2. Choose β̄ by the actual local ordinary quotient, rather than an arbitrary labelling of the two residual characters. Since β is unramified at 3, its reduction and Teichmüller lift are trivial on inertia; this preserves the quotient condition.
3. Apply the imported distinguished Skinner–Wiles theorem. The source residual 1⊕ω₃ specialization requires the ratio globally, while the theorem over ℚ needs only its nontrivial local restriction.

Direct inputs: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`.

Sources: [SKINNER-WILES-1999](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, Theorem, printed p.6 (Numdam page image); [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), §1.2, Theorem 1.7, arXiv p.4; publisher PDF p.5.

Acceptance:

- A finite-order twist preserves weight k; an inverse cyclotomic twist generally shifts both weights and cannot be silently substituted.
- After twisting an arbitrarily chosen residual character, the inertia quotient need not be trivial.

### The crystalline p=3 completion in weights two and four

Declaration: `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion` (theorem).

Atlas planet: **Crystalline ordinary completion at three**.

Let ρ:G_ℚ→GL₂(E), E/ℚ₃ finite, be irreducible, odd, continuous, finitely ramified and crystalline at 3 with Hodge–Tate weights {0,k−1}, k∈{2,4}. If its residual semisimplification is a sum of two global characters, then ρ is modular of weight k. In the level-one branch of DP, normalization has residual characters 1,ω₃; without level one the general distinguished Skinner–Wiles theorem still applies after quotient-character normalization.

Proof or construction:

1. Use the existing R21.5/crystalline-reducible-reduction-is-ordinary calculation in the precise interval 2≤k≤p+1. Its two local characters are unramified times ε^{k−1} and an unramified quotient.
2. At p=3 and k=2 or 4, k−1 is odd, so the residual ratio on inertia is ω₃≠1. Thus this is the distinguished ordinary case. The determinant of a global geometric character is finite order times ε^{k−1}, supplied by R01.2.
3. Apply ordinary-character-normalisation and the general Skinner–Wiles theorem. In DP’s level-one specialization, the normalized residual global ratio is ω₃, so apply p-three-residually-reducible-branch.

Direct inputs: `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`, `ArithmeticGaloisRepresentations:R01.2`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), §2, Paso 6, arXiv p.14 / publisher PDF p.14; §1.2, Theorem 1.7, arXiv p.4 / publisher PDF p.5.

Acceptance:

- Weights 2 and 4 at 3 are covered even though they lie in Pan’s excluded local ω branch.
- The statement does not cover arbitrary crystalline weights, nor arbitrary noncrystalline de Rham representations with residual 1⊕ω₃.

## R32.6 — Modularity transfer for congruence arguments

Transfer at a fixed coefficient prime and recognition between members of a compatible system are different operations. For the irreducible residual branches, one known modular lift supplies residual modularity and the modern theorem applies to the other lift. For the residually reducible branch at p≥5, Pan gives modularity directly, with no residual modularity hypothesis. At p=3 one must select either his nonexceptional ratio or the precisely normalized ordinary theorem. The finite weights and local types of the two lifts may differ; each must independently meet the chosen theorem's hypotheses.

DP Definition 1.10 explicitly imposes de Rham behavior at every coefficient prime and the common weights {0,k−1}. Its almost-strict variant weakens the coefficient-prime Weil–Deligne comparison when the residual representation is reducible, but retains the de Rham premise. The historical KW almost-strict carrier requires these geometric premises as extra data. The precise R24.5 comparison request keeps the common good Frobenius polynomials and weakened WD clause while adding the all-member de Rham and common regular weights. Oddness and characteristic-zero irreducibility are checked separately; the supplied independence-of-reducibility result can transport irreducibility from a known member.

At a ramified coefficient prime with reducible reduction, the modern lifting theorem needs only the supplied geometric hypotheses. It does not need the missing local Weil–Deligne equality. Once one member is modular, compare good Frobenius characteristic polynomials with the modular-form system and use the R01.5 recognition theorem after common coefficient extension. No local compatibility at the bad coefficient prime enters that comparison.

This stage is the sole owner of that ramified reducible modern transfer, resolving RT-AREA-langlands-2/21. R24.6 keeps its reduction, specialization and local-compatibility-hypothesis lemmas. Its present bundled transfer node already imports the exact transfer nodes here. This packet uses the early compatible-system carrier and R01.5 recognition rather than importing the bundled R24.6 node back. Thus the dependency graph does not acquire a cycle. The ownership proposal asks the maintainer to align the base description with this arrangement; only this job's deliverables are changed.

### Modularity transfer along a congruence at an odd prime with cyclotomically irreducible residual representation

Declaration: `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd` (theorem).

Atlas planet: **Modularity transfer along congruences**.

Let p be odd and ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) continuous, odd, finitely ramified, with ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible, and ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}} de Rham with Hodge–Tate weights {0, k − 1}, {0, k′ − 1} (k, k′ > 1). Then ρ is modular if and only if ρ′ is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if ρ is modular then ρ̄ = ρ̄′ is modular and Theorem 1.4 applies to ρ′. Its proof is R32.2/odd-prime-statement-over-q, for every odd p, 3 included: Kisin's Theorem (2.2.17), with Emerton's Theorem 3.3.22 removing his abelian hypothesis, and the Breuil–Mézard results of Paškūnas, Hu–Tan (p ≥ 5) and Tung (every p > 2) removing the local exclusion.

Hypotheses and conventions:

- absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13, R32.1/quadratic-cyclotomic-irreducibility); it is the hypothesis in the combined theorem as Tung states it
- residual modularity is the only global modularity input; no Serre conjecture is used (R32.6/globalisation-dependency-audit)
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Proof or construction:

1. Theorem 1.4 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung) applied to ρ′, whose residual representation is that of the modular ρ.

Direct inputs: `GL2ModularityLifting:R32.2/odd-prime-statement-over-q`, `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `PadicHodgeTheory:R06.3`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), Theorem 1.4 and its proof, p. 4 (arXiv v2); [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), Introduction, the theorem of Kisin, Paškūnas, Hu–Tan and Tung, pp. 1–2 (arXiv v3); [TUNG-2021-P3](https://arxiv.org/pdf/1803.07451v4), Theorem 4.7, p. 15 (arXiv v4).

Uses:

- ClassicalSerreModularity R33.1–R33.3: Dieulefait–Pacetti Theorem 1.4 at every congruence at an odd prime

Acceptance:

- A newform f and a congruent de Rham lift ρ′ of ρ̄_f of a different Hodge–Tate weight: ρ′ is modular.
- Non-example: ρ̄ bad dihedral (ρ̄|_{G_{ℚ(√p*)}} reducible) is excluded; Dieulefait–Pacetti avoid it by the Fontaine–Laffaille lemma (ClassicalSerreModularity R33.1).
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### Modularity transfer along a congruence at 2 with non-solvable residual image

Declaration: `GL2ModularityLifting:R32.6/transfer-dyadic` (theorem).

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂) be continuous, odd, finitely ramified, de Rham at 2 with distinct Hodge–Tate weights, with ρ̄ ≅ ρ̄′ of non-solvable image. Then ρ is modular if and only if ρ′ is (Dieulefait–Pacetti Theorem 1.5, from R32.3/dyadic-de-rham-modularity-lifting).

Hypotheses and conventions:

- non-solvable residual image is needed at p = 2
- irreducibility of ρ, ρ′ follows from that of ρ̄
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Proof or construction:

1. R32.3/dyadic-de-rham-modularity-lifting applied to ρ′ with ρ̄′ = ρ̄ modular.

Direct inputs: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `PadicHodgeTheory:R06.3`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), Theorem 1.5 and its proof, p. 4 (arXiv v2).

Uses:

- ClassicalSerreModularity R33.5: the characteristic-two closure

Acceptance:

- Dieulefait–Pacetti §3: a weight-2 system through a dyadic lift of a non-solvable ρ̄ transfers modularity from an odd member back to the 2-adic one.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### Modularity of residually reducible representations at a ramified coefficient prime

Declaration: `GL2ModularityLifting:R32.6/transfer-residually-reducible` (theorem).

Let p ≥ 5 (or p = 3 outside Pan's exclusion) and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights, with ρ̄^{ss} a sum of two characters. Then ρ is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and R32.4/pan-residually-reducible-fontaine-mazur). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

Hypotheses and conventions:

- Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is R32.5/p-three-residually-reducible-branch
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Proof or construction:

1. Ordinary case: Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q) and Pan §6; non-ordinary case: Pan's Theorem 7.1.1.

Direct inputs: `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`, `PadicHodgeTheory:R06.3`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), Theorem 1.6 and its proof, p. 4 (arXiv v2).

Uses:

- ClassicalSerreModularity R33.1: the reducible branch of every congruence in Pasos 1–6

Acceptance:

- A member ρ_ℓ of a compatible system with ρ̄_ℓ reducible at a prime ℓ ≥ 5 of the ramification set: modular without any local comparison at ℓ.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

### Why de Rham lifting suffices when an almost strictly compatible system lacks the Weil–Deligne comparison at the coefficient prime

Declaration: `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems` (theorem).

For a DP-style rank-two almost strictly compatible system, with odd irreducible characteristic-zero members, all-member de Rham behavior and common weights {0,k−1}, k>1 explicitly supplied, the characteristic-p lifting step can use the modern de Rham transfer statements even when the system’s coefficient-prime WD comparison is absent. Select the branch by residual data: nonsolvable at p=2; absolutely irreducible cyclotomic restriction plus a known modular congruent lift at odd p; reducible at p≥5 (or nonexceptional Pan p=3); normalized ordinary p=3 under its exact extra conditions. Once a member is modular, good Frobenius polynomials identify all semisimple members with the modular-form system. A plain or historical KW almost-strict system alone does not supply the all-member de Rham premise.

Hypotheses and conventions:

- DP Definition 1.10 clauses (4)–(5), not the bare historical KW almost-strict label, supply de Rham behavior at every coefficient prime.
- The coefficient-change theorem consumes a system; it does not prove existence of a system through every regular de Rham lift. The supplier has recorded a gap in DP Theorem 1.11’s claimed general existence.

Proof or construction:

1. Use the R24.5/compatible-system carrier for common good Frobenius polynomials and finite ramification. Retain the separate DP all-member de Rham and common regular weight hypotheses via the requested R24.5 extension; they are not projections of the historical KW almost-strict carrier. Check oddness and characteristic-zero irreducibility separately; R24.5/rank-two-reducibility-independent-of-lambda transports irreducibility from an irreducible member.
2. Apply the branch-appropriate transfer lemma, using ramified-reducible-coefficient-prime for that exceptional compatibility situation.
3. Build the eigenform system with R19.3 and use R01.5’s characteristic-polynomial recognition on the common good Frobenius set. This does not import R24.6/linked-systems-modularity-transfer, which already consumes our transfer nodes and would create a cycle.

Direct inputs: `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`, `PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.6/transfer-ordinary-three`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.3`, `PotentialModularityAndCompatibleSystems:R24.5`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), §1.4, Definition 1.10 and the definition of almost strictly compatible systems, pp. 6–7 (arXiv v2); [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), Remark 4, p. 7 (arXiv v2).

Uses:

- ClassicalSerreModularity R33: every change of coefficient prime in Pasos 1–6

Acceptance:

- At ramified p≥5 and reducible residual representation, use de Rham plus Pan, without a WD equality.
- A KW almost-strict system missing de Rham at that member fails the premise.
- Good-prime recognition compares characteristic polynomials after common coefficient extension and semisimplification.

### Dependency audit: which globalisations in the lifting theorems use the general Serre theorem

Declaration: `GL2ModularityLifting:R32.6/globalisation-dependency-audit` (comparison).

Source-independence comparison for the transfer dependency cone: use the Q lifting forms with residual modularity explicitly retained, and Pan’s residually reducible theorem with no residual modularity. Do not use Pan 1.0.4’s unconditional residually irreducible consequence (Remark 8.0.4 invokes full Serre), or Emerton §7.3’s unconditional promodularity argument. Tung’s local Breuil–Mézard proof does additionally use suitable auxiliary globalizations: §4.3 Lemma 4.3.3 cites Calegari 3.2, Snowden 8.2.1, and the dyadic HBAV construction in KW II Theorem 6.1; Lemma 4.3.4 cites Paškūnas 3.29 and KW II Lemma 3.5. These have distinct roles from the global lift’s assumed residual modularity. The exact independent supplier proofs, including part 1’s Emerton–Paškūnas/BLGG and Gee inputs, remain the named requests and gap; this comparison is not a certificate that those uninspected proofs are independent.

Hypotheses and conventions:

- not audited here: the global inputs of Tung's Breuil–Mézard theorem (the patched modules of [CEG+16], Emerton–Paškūnas' faithfulness and Barnet-Lamb–Gee–Geraghty's Theorem A.4.1), and Gee's Theorem 4.4.12 of 'Automorphic lifts of prescribed types', which Kisin's proof of (2.2.17) uses. These are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5–R31.6 and SerreWeightAndLevelOptimisation R20.6
- The exact KW II local and patching inputs are named in the R31.6 request. Their independence from the full Serre endpoint remains an audit obligation in the first gap; this packet does not certify their uninspected proofs.

Proof or construction:

1. Classify each assertion in the dependency cone as a theorem with assumed residual modularity, a residually reducible theorem, or an auxiliary globalisation/weight-change input.
2. Read Tung §4.3’s exact references and separate local BM globalisation from Theorem 8.0.3’s given modular residual representation. The suitable-globalisation existence is required even when the final lifting theorem starts with a modular residual representation.
3. Retain the restricted CM-induced construction of Emerton Theorem 3.3.22 and its weight-part proof as the R31.6/R20.6 request; exclude the full-Serre promodularity corollary.
4. Attach unresolved source-independence obligations to the exact requested inputs, rather than infer independence merely from a theorem’s displayed residual-modularity assumption.

Direct inputs: `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`, `SerreWeightAndLevelOptimisation:R20.6`.

Sources: [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), Introduction, p. 2 (arXiv v3); [PASKUNAS-2016](https://arxiv.org/pdf/1509.00332v2), §1.1.2 'Global part', p. 5 (arXiv v2); [PAN-2022](https://arxiv.org/pdf/1901.07166v2), Remark 8.0.4, p. 125 (arXiv v2); [EMERTON-LGC-2011](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §7.3, proof of Theorem 1.2.3, p. 96; [EMERTON-LGC-2011](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §7.4, completion of the proof of Theorem 3.3.22, p. 97; [HU-TAN-2015](https://arxiv.org/pdf/1309.1658v2), Proof of Theorem 6.3, p. 35 (arXiv v2); [TUNG-2021-DYADIC](https://arxiv.org/pdf/1908.06174v3), §4.3, Lemmas 4.3.3–4.3.4, pp.20–21.

Uses:

- ClassicalSerreModularity:R33.5/globalisation-dependency-check: the independence audit that node requests from R32.6

Acceptance:

- An unresolved source-independence request prevents certification of an independent Serre proof, while leaving the target-level lifting plan usable conditionally.
- No R33 stage is made an ancestor of the transfer lemmas.

### Transfer at a ramified reducible coefficient prime

Declaration: `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime` (theorem).

Atlas planet: **Ramified reducible coefficient-prime transfer**.

Let R be a rank-two system over ℚ in the DP Definition 1.10 sense, weight k>1, whose members are odd, semisimple and finitely ramified. Let λ|p with p in the ramification set S, p≥5, and suppose ρ_λ is irreducible in characteristic zero while ρ̄_λ^{ss} is a sum of two characters. Then ρ_λ is modular by Pan, without any comparison of WD(ρ_λ|G_ℚp) with the system parameter at p, and its good Frobenius polynomials identify the system with the modular system of that eigenform. The same conclusion at p=3 requires the nonexceptional Pan ratio, or the explicitly normalized ordinary hypotheses of R32.5. Irreducibility and oddness are checked hypotheses, not consequences of bare weak compatibility.

Hypotheses and conventions:

- The all-member de Rham and common regular Hodge–Tate-weight clauses of DP Definition 1.10 are explicit extra data on the R24.5 compatible-system carrier. The historical KW almost-strict definition alone does not contain them.

Proof or construction:

1. Use the explicit DP all-member de Rham and fixed-weight clauses (4)–(5), through the requested R24.5 comparison/extension of its compatible-system carrier. They are extra premises, not projections of the historical KW almost-strict definition. The weakened clause (6) need not impose coefficient-prime WD compatibility in this residually reducible ramified case.
2. Use PadicHodgeTheory R06.3 to pass from de Rham to potentially semistable where Pan’s stated hypothesis uses that word. Apply transfer-residually-reducible at p≥5, or the exact p=3 branch under its extra hypotheses.
3. Use the modular-form compatible system from R19.3 and good-prime characteristic-polynomial recognition from R01.5 to identify every semisimple member after common coefficient extension. This step uses only good primes, not the missing local WD comparison.

Direct inputs: `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`, `PadicHodgeTheory:R06.3`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.3`, `PotentialModularityAndCompatibleSystems:R24.5`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), §1.4, Definition 1.10 and Remark 4, arXiv pp.6–7 / publisher PDF p.7.

Acceptance:

- A p∈S member with reducible residual representation is covered at p≥5 without assuming it is crystalline.
- For a historical KW almost-strict carrier lacking an all-member de Rham assertion, this application requires an explicit additional de Rham hypothesis.

### Ordinary congruence transfer at three

Declaration: `GL2ModularityLifting:R32.6/transfer-ordinary-three` (theorem).

Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

Proof or construction:

1. Apply ordinary-character-normalisation to each lift with its own designated quotient.
2. Apply p-three-residually-reducible-branch to each normalized lift and untwist; both conclusions give the equivalence.

Direct inputs: `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`, `ArithmeticGaloisRepresentations:R01.1`.

Sources: [DIEULEFAIT-PACETTI](https://arxiv.org/pdf/2108.07577v2), §1.2, Theorem 1.7, arXiv pp.4–5 / published p.5.

Acceptance:

- Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

## Exact supplier handoffs

There are 26 precise stage requests. Each consumer listed below has a direct prerequisite edge to that supplier. Existing supplier nodes are reused when their statements suffice; these requests describe the additional exports needed for this part.

- **`CompletedCohomologyAndLocalGlobalCompatibility:R31.5`**: Tung §5 Lemma 5.3.2 and §8 Theorem 8.0.1, with the totally odd fixed determinant and real-place odd deformation conditions, full support on every patched irreducible component, and finite type-specialized modules and the ordinary §7.3.1 plus nonordinary §6.3.7 component cases. For Pan, Theorem 4.1.7: localized pseudo-ring→Hecke surjection has nilpotent kernel at Definition 4.1.4 nice primes, including the local p=3 exclusion; §§4.2–4.8 construct the one-dimensional-prime patching and finite faithful multiplicity module. Keep the raw completed homology nonfinite and use Corollary 3.5.10 to justify finite-module support. Supply Pan §8 only with its explicit residual-modularity hypothesis. Consumers: `GL2ModularityLifting:R32.3/typed-component-specialisation`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

- **`CompletedCohomologyAndLocalGlobalCompatibility:R31.4`**: Pan Theorem 3.5.5: equality of Galois and spectral local pseudo-ring actions; Corollary 3.5.10: the block multiplicity module is finite faithful over completed Hecke and Hecke is finite over the local pseudo ring; Corollary 3.5.12: regular de Rham points locally absolutely irreducible at every p-place are classical. Preserve residual block restrictions and determinant/central-character normalization. Consumers: `GL2ModularityLifting:R32.4/nice-prime-component-bridge`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

- **`CompletedCohomologyAndLocalGlobalCompatibility:R31.3`**: Pan §§3.3,3.7,4.1 completed Hecke quotient, determinant-fixed pseudo-character, p-power tame characters and the nonzero Eisenstein localization after ordinary modular seed points. Tung §4.2 Hecke Galois representation with fixed ψε determinant. Export Pan §4.1.3 pro-modularity for q in Spec R^{ps,{ξ_v}} as occurrence in the image of Spec T_m, equivalently ker(R^{ps,{ξ_v}}→T_m)⊆q; include specialization closure of this closed image. This does not identify it with SW R21.4/pro-modular-prime, whose carrier is a different ordinary representation-deformation problem. Consumers: `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

- **`CompletedCohomologyAndLocalGlobalCompatibility:R31.2`**: Tung Lemma 5.3.2’s type-specialization/finite-level comparison and faithful algebraic quaternionic module; Pan’s classicality comparison with the actual regular algebraic eigenform objects. Consumers: `GL2ModularityLifting:R32.3/typed-component-specialisation`.

- **`CompletedCohomologyAndLocalGlobalCompatibility:R31.6`**: Source-independence audit of Tung suitable globalizations: Lemma 4.3.3→Calegari Prop.3.2, Snowden Prop.8.2.1 and KW II Thm.6.1 (dyadic local HBAV construction); Lemma 4.3.4→Paškūnas Lemma 3.29 and KW II Lemma 3.5. Also certify the CEG+16/Emerton–Paškūnas patching and BLGG13 A.4.1 inputs of part 1, and Emerton Thm.3.3.22’s restricted CM-induced globalisation. Record full-Serre uses in Pan Remark 8.0.4 and Emerton §7.3 as excluded paths, not independent inputs. Consumers: `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

- **`GlobalGaloisDeformations:R04.1`**: The actual Pan determinant-fixed continuous two-dimensional pseudodeformation functor lifting 1+χ̄, with the tame inertia trace condition ξ_v+ξ_v^{-1}; do not identify it with unframed representation deformations at a reducible residual point. Consumers: `GL2ModularityLifting:R32.4/nice-prime`.

- **`GlobalGaloisDeformations:R04.2`**: Representability of that global pseudo functor; Pan §2 Corollaries 2.2.3 and 2.3.7: comparison at irreducible characteristic-zero points and at one-dimensional nonsplit-lattice primes, completions, dimension and minimal-prime contraction. Supply characteristic-zero extension deformation R_B and its trace map, plus the height ≤1 comparison for Pan Remark 2.4.3/Lemma 7.4.23. Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/extension-components`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-prime`.

- **`GlobalGaloisDeformations:R04.3`**: Euler-characteristic presentations and local-problem comparisons at Pan §§7.1,7.4 nonsplit extension points; exact reducible-locus bound dim R_B^{red}≤1+δ_F+dim H¹, and finite-order away-p inertia characters in Lemma 5.7.3. Here the reducible locus is not the ring’s nilradical reduction. Supply the trace-cut prime selection used in Pan §7.2.4 and the proof of Corollary 7.4.22: in the indicated component or component intersection, impose ϖ and the |S\Σ_p| away-p Frobenius-trace equations, track their dimension loss, exclude the reducible locus using d>|S\Σ_p|+2, and find a dimension-one characteristic-p prime with irreducible associated representation and finite local images away from p. The proof in an intersection of dimension at least 2d does not require that intersection to be an ordinary component finite over Λ_F. Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/extension-component-propagation`.

- **`GlobalGaloisDeformations:R04.4`**: Solvable field selection/restriction in Tung Theorem 8.0.3 and Pan §§7.1.2,7.2.5,7.4.2: preserve p splitting and total reality, attain even degree, kill designated finite away-p images, keep generic irreducibility and the dihedral cyclotomic disjointness used in Pan §5.7.9; allow one extension for a finite component chain. Supply nonsolvable residual-image preservation for an arbitrary totally real base field F and finite solvable Galois F′/F: the restricted image is normal with solvable quotient, so a solvable restricted image would force the original image solvable. The existing R32.1/non-solvable-residual-image statement over Q does not supply this generality. Consumers: `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`.

- **`IntegralHeckeAndGaloisDeterminants:IHG.1`**: Generic two-dimensional determinant/pseudo-character equivalence for p odd, semisimple reconstruction at residue fields, GMA for the globally multiplicity-free odd residual characters 1,χ̄, reducibility ideal generated by off-diagonal products, and normalized nonsplit lattices. Existing cayley-hamilton nodes cover the algebra but do not yet give Pan §2’s full reducibility ideal/completion/height ≤1 export. Scalar LOCAL pairs require the separate local pseudo-ring treatment, not a multiplicity-free GMA assumption. Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/extension-components`, `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-prime`.

- **`LocalGaloisDeformationRings:R08.6`**: Exact Pan local pseudo-ring case table: generic ordinary ideal principal (Paškūnas B.20); scalar ring 𝒪[[t₁,t₂,t₃]] and finite chosen-character ordinary cover 𝒪[[x₁,x₂]] with three-generator comparison kernel; cyclotomic p≥5 node 𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀), ordinary ideal (x₀,x₁), and localized principality away from the ε^{±1} singular point (Pan 7.4.4,7.4.12). Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

- **`OrdinaryAutomorphicFormsAndModularityLifting:R21.3`**: Pan §5.1.1 reducible local pseudo quotient and Λ_F-character map; §6.1.1 chosen-character ψ₁-ordinary cover for scalar local residual ratio, keeping the chosen character and ordinary orientation. Import generic pseudo/reducibility objects from their owners. Consumers: `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

- **`OrdinaryAutomorphicFormsAndModularityLifting:R21.4`**: Pan Theorems 5.1.2(1),6.1.2(1): finite Λ_F-algebra ordinary pseudo rings, including the scalar chosen-character cover; arithmetic-point density with degree enlargement and Leopoldt for abelian F; the ordinary orientation and connectedness used in §7.4. Existing SW99 finite/support nodes do not supply these exact scalar and arbitrary-orientation extensions. Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

- **`OrdinaryAutomorphicFormsAndModularityLifting:R21.5`**: Pan Theorems 5.1.2(2),6.1.2(2) over abelian totally real F with p unramified, χ̄ extending to G_Q, χ totally odd de Rham, global irreducibility and local de Rham stable character strictly below the quotient in Pan’s convention. Export both distinguished and scalar local residual cases; the scalar theorem requires the chosen-character cover. Consumers: `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

- **`ArithmeticGaloisDuality:R02.6`**: Global Euler characteristic for ad⁰ρ and nonsplit extensions; Pan Lemma 7.4.15’s exact H¹ restriction isomorphism of dimension [F:Q] for ψ₁/ψ₂=εθ, including Poitou–Tate, Lichtenbaum H²(E/O(2)) vanishing and passage from p-places to finite S. The extra-S deduction must be proved, not assumed. Consumers: `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`.

- **`DeformationAndDerivedPatchingAlgebra:R03.6`**: Pan Proposition 5.4.7’s connectedness-dimension bound for completed local rings presented with g variables and r relations, including localization/completion comparison and the bound c≥2[F:Q]−1 used in §7.4. Read the supplied R03.6/P7 packets: ordinary finite-support/near-faithful quotient nodes are reused, while no matching connectedness theorem is present. P7’s derived residual Nakayama concerns pseudo-coherent complexes and is not a substitute for a nonfinite completed module. The same presentation/connectedness export is also needed for Pan Lemma 7.4.8 at the irreducible ordinary prime, not only for the extension-ring case. Consumers: `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`.

- **`SerreWeightAndLevelOptimisation:R20.6`**: Source-independence/weight-change export for Gee Theorem 4.4.12 used in Kisin’s proof and Emerton §7.4’s restricted CM-induced residual representation; distinguish the weight part for an already modular representation from full Serre modularity. Consumers: `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

- **`ArithmeticGaloisRepresentations:R01.1`**: Continuous finite-coefficient characters and Teichmüller lifts, invariant lattices and residual semisimplification, restrictions, finite-order twists and coefficient extension, with determinant formulas and generic irreducibility checks. Consumers: `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`, `GL2ModularityLifting:R32.4/potentially-nice-prime`, `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.6/transfer-ordinary-three`.

- **`ArithmeticGaloisRepresentations:R01.2`**: Geometric G_Q characters finitely ramified and de Rham are finite-order times cyclotomic powers; twist shifts Hodge–Tate weights uniformly and gives the normalized modular weight. A finite-order quotient-character normalization has weight zero and preserves oddness. Consumers: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`, `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

- **`ArithmeticGaloisRepresentations:R01.5`**: Good Frobenius characteristic-polynomial recognition for semisimple members after common coefficient extension; use it separately from the R24.6 transfer node that already consumes this packet, so the graph is acyclic. Consumers: `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

- **`PadicHodgeTheory:R06.3`**: p-adic monodromy: a de Rham representation over a finite p-adic coefficient field is potentially semistable, preserving its Hodge–Tate weights; this permits the de Rham forms of Tung/Pan. No crystalline conclusion is inferred. Consumers: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

- **`AutomorphicGaloisRepresentations:R19.3`**: The characteristic-zero compatible system attached to a cuspidal newform with common coefficient field, good Frobenius polynomials, oddness and the regular weight/twist convention. Memberwise recognition comes from R01.5. Consumers: `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

- **`GL2AutomorphicRepresentationsAndTransfer:R17.3`**: Jacquet–Langlands from the definite quaternionic eigenforms at the specified local types to regular algebraic cuspidal GL2/F forms. Consumers: `GL2ModularityLifting:R32.3/typed-component-specialisation`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

- **`GL2AutomorphicRepresentationsAndTransfer:R17.4`**: Solvable automorphic base change and descent for these irreducible GL2 representations, including the coefficient/twist convention; used to descend the exact auxiliary-field forms in Tung/Pan. Consumers: `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`.

- **`PadicHodgeTheory:R06.2`**: Coefficient-extension and Hodge–Tate-weight comparison for Pan Corollary 4.1.8→3.5.12 over F_v=Q_p: an irreducible two-dimensional de Rham representation of G_Qp with distinct Hodge–Tate weights is absolutely irreducible. If it split after finite coefficient extension, irreducibility over the original field would make its two characters conjugate, hence of equal integer Hodge–Tate weight. Preserve the exact weights and coefficient descent; do not silently replace irreducible by absolutely irreducible. Consumers: `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

- **`PotentialModularityAndCompatibleSystems:R24.5`**: An explicit comparison/extension of the existing historical KW compatible-system carrier by DP Definition 1.10 clauses (4)–(5): every coefficient-prime member is de Rham with the common regular weights {0,k−1}, k>1. Keep the weakened clause (6) at a ramified residually reducible coefficient prime. Export the extra hypotheses as data or separately assumed predicates; do not infer them from the KW almost-strict label and do not assert general system existence from the disputed DP Theorem 1.11. Consumers: `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

## Source independence, source versions and coverage

The source-independence comparison keeps residual modularity explicit in the odd irreducible and dyadic lifting statements, and uses Pan’s residually reducible theorem without that premise. Tung §4.3 still needs suitable auxiliary globalizations and weight change. The R31.6 and R20.6 requests identify their exact proofs for independent audit; the displayed lifting hypotheses alone do not certify independence. Pan Remark 8.0.4 and Emerton §7.3 invoke full Serre modularity and are excluded from the independent transfer dependency cone.

The compatible-system existence theorem DP 1.11 is outside this part’s endpoint. Its supplier records a gap between the cited theorem and the claimed general regular de Rham existence. This part consumes a system with the stated geometric data. The added BCDT wild 3-adic source belongs to R22.5 in part R22.1: its extended-type lifting theorems and CDT corrections are routed there.

The suggested Lean file contains two concrete incidence definitions, ten API lemma signatures and seven examples. The remaining two arithmetic predicates have twelve API items and six tests in the indexed omission manifest, together with every named arithmetic theorem. The prototypes require the specified arithmetic point sets and trace map for specialization to Pan’s spectrum. The omission manifest records the unavailable interfaces explicitly. All arithmetic declarations retain unchecked implementation status.

- **Source-independence certification of the auxiliary globalisations**: The read theorem statements and Tung §4.3 identify the exact potential-modularity/globalisation and weight-change leaves. Their independent proofs (Calegari 3.2, Snowden 8.2.1, KW II 6.1, Paškūnas 3.29, CEG+16/Emerton–Paškūnas/BLGG13, and Gee 4.4.12) have not all been read here. The R31.6 and R20.6 requests must supply a restricted independent construction or explicitly expose any full-Serre dependence. This plan does not certify the independent R33 proof until those exports are established. Consumers: `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`.

- **Absent arithmetic carriers prevent full suggested signatures**: At the pinned baseline the exact global/local Galois representations, determinant-fixed pseudodeformation rings, Hecke-point reconstruction, local Hodge predicates and modular-form attachment interfaces required by the named lifting theorems are not available together. The suggested file gives actual spectrum/finite-chain definitions, their full APIs/tests, and a complete indexed omission manifest for the remaining signatures, rather than arbitrary proposition parameters. Implement the listed R01/R04/IHG/R06/R21/R30/R31 exports to elaborate those arithmetic signatures. The indexed omission manifest covers every arithmetic node/API/test; the two geometric definitions elaborate only as incidence prototypes and still need the named arithmetic sets/maps for their source specialization. This gap applies to the full named consumer list, not just the five examples previously listed. Consumers: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`, `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.3/typed-component-specialisation`, `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`, `GL2ModularityLifting:R32.4/nice-prime`, `GL2ModularityLifting:R32.4/potentially-nice-prime`, `GL2ModularityLifting:R32.4/nice-prime-component-bridge`, `GL2ModularityLifting:R32.4/large-component-at-regular-point`, `GL2ModularityLifting:R32.4/generic-ordinary-intersection`, `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`, `GL2ModularityLifting:R32.4/potentially-nice-base-change`, `GL2ModularityLifting:R32.4/good-component`, `GL2ModularityLifting:R32.4/extension-components`, `GL2ModularityLifting:R32.4/extension-component-control`, `GL2ModularityLifting:R32.4/extension-component-propagation`, `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`, `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`, `GL2ModularityLifting:R32.5/ordinary-character-normalisation`, `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`, `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`, `GL2ModularityLifting:R32.6/transfer-ordinary-three`.

| Stage | Coverage | Remaining |
| --- | --- | --- |
| GL2ModularityLifting:R32.3 | planned | Supply and independently audit the exact R31.5/R31.6 component-support/globalisation exports; complete arithmetic signatures once those carriers exist. |
| GL2ModularityLifting:R32.4 | planned | Supply the requested pseudo/reducibility, one-dimensional-prime patching, Pan ordinary extensions and cohomological/connectedness inputs; elaborate the arithmetic nice-prime interfaces. |
| GL2ModularityLifting:R32.5 | planned | Elaborate the finite-order normalization and small-prime lifting signatures once the R01/R21 arithmetic carriers and exports exist; no further target-level local splitting is required. |
| GL2ModularityLifting:R32.6 | planned | Finish the source-independence supplier audit before certifying the independent Serre route; elaborate lifting/compatible-system signatures against the requested arithmetic carriers. Supply the DP all-member de Rham/common-weight extra-data comparison from R24.5, with the coefficient-prime WD exception retained. |

The packet is complete at target level, with 28 declarations (23 theorems, three definitions, one construction and one comparison), 22 API items, 13 unit tests, 12 planets, six baseline references and 26 supplier requests. All four stages are planned. The two recorded gaps and requested supplier exports remain before proof closure.

Source records below preserve the historical reading information and exact file hashes. The passages rechecked for this revision are dated 2026-10-08; the bibliographic entries are not a claim to have audited the unresolved supplier proofs.

- [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2). Luis Victor Dieulefait and Ariel Martín Pacetti. arXiv:2108.07577v2 (3 May 2022); printed page = PDF page. The same file as ClassicalSerreModularity and OrdinaryAutomorphicFormsAndModularityLifting. Historical read: 2026-10-06. Historical passages: §1.2, Theorems 1.4–1.7 with their proofs (pp. 4–5); §1.4, Definition 1.10, Theorem 1.11 and Remark 4 (pp. 6–7); §3 (p. 15); Definition 1.10 clauses (4)–(6) compared with published version; Paso 6 crystalline weight-two/four ordinary application, p.14. Revision recheck (2026-10-08): Theorems 1.4–1.7, pp.4–5; Definition 1.10 and Remark 4, pp.6–7; Paso 6, p.14. SHA-256: `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6`.

- [Residually reducible representations and modular forms](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). C. M. Skinner and A. J. Wiles. Publ. Math. IHÉS 89 (1999), 5–126; Numdam scan (OCR text layer poor; the main theorem was read on the page image; printed page = PDF page + 3). The same file as OrdinaryAutomorphicFormsAndModularityLifting and AutomorphicGaloisRepresentations. Historical read: 2026-10-06. Historical passages: Introduction: the Theorem (printed p. 6) and the outline (pp. 7–8). Revision recheck (2026-10-08): Introduction theorem, printed p.6 (PDF p.3), page image. SHA-256: `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3`.

- [The Fontaine–Mazur conjecture in the residually reducible case](https://arxiv.org/pdf/1901.07166v2). Lue Pan. J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2. The arXiv version was read; locators give its PDF pages. Historical read: 2026-10-06. Historical passages: Introduction: Conjecture 1.0.1, Theorems 1.0.2 and 1.0.4, Remark 1.0.5 and the strategy (pp. 2–5); Remark 8.0.4 (p. 125); §2.2–2.4 comparison statements, pp.9–16; §3.5 Theorem 3.5.5 and Corollaries 3.5.10–3.5.12, pp.28–34; §4.1 complete setup, Definition 4.1.4 and Theorem 4.1.7/Corollary 4.1.8, pp.38–40; §5.1 and §6.1 exact ordinary theorem statements, pp.71,95–96; §7.1–7.4, statements and all three branch proofs, pp.111–124; §8 Theorem 8.0.1 and Remark 8.0.4, pp.124–125. Revision recheck (2026-10-08): Theorem 1.0.2, p.3; Corollaries 3.5.10–3.5.12, pp.31–34; §4.1, pp.38–40; Theorems 5.1.2 and 6.1.2, pp.71,95–96; §§7.1–7.4, pp.111–124; Theorem 8.0.1 and Remark 8.0.4, pp.124–125. SHA-256: `590171129d28a65749cf92b1f6099dbacaa90cc6698828f0a4dfd3da943f4824`.

- [On 2-dimensional 2-adic Galois representations of local and global fields](https://arxiv.org/pdf/1509.00332v2). Vytautas Paškūnas. Algebra Number Theory 10 (2016), no. 6, 1301–1358; arXiv:1509.00332v2, dated 25 April 2016 on its first page and version record. The arXiv version was read; printed page = PDF page. Historical read: 2026-10-06. Historical passages: §1: Theorem 1.1 and §1.1.2 'Global part' (pp. 1–6). Revision recheck (2026-10-08): Theorem 1.1, pp.1–2; §1.1.2, p.5. SHA-256: `727addeb49ee302052a493cf097a868a70c340286981598b5e7382fcd8f86749`.

- [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/pdf/1908.06174v3). Shen-Ning Tung. Math. Z. 298 (2021), 107–159; arXiv:1908.06174v3. The arXiv version was read. Historical read: 2026-10-06. Historical passages: Introduction: the combined theorem (Kisin, Paškūnas, Hu–Tan, Tung), Theorems A, B and C and the strategy (pp. 1–3); §4.3 suitable globalization, pp.20–21; §5.3 typed support/finiteness equivalence, pp.28–29; §6.3 Colmez finiteness, near faithfulness and nonordinary components, pp.32–33; §7.2–7.3 ordinary support/lifts, pp.36–37; §8 all-component support and global lifting proof, pp.38–39. Revision recheck (2026-10-08): Introduction, pp.2–3; §4.3, pp.20–21; Lemma 5.3.2, pp.28–29; §6.3, pp.32–33; §§7.2–7.3, pp.36–37; §8, pp.38–39; independent review also checked §3.2.5 Proposition 3.2.7, p.15, and Proposition 5.2.2(3), p.28. SHA-256: `a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8`.

- [On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_{Q_p}](https://arxiv.org/pdf/1803.07451v4). Shen-Ning Tung. Algebra Number Theory 15 (2021), no. 9, 2173–2194; arXiv:1803.07451v4 (21 March 2021). The arXiv version was read; printed page = PDF page. Historical read: 2026-09-29. Historical passages: Abstract and introduction, with the Fontaine–Mazur theorem (pp. 1–2); Theorem 1.2, p.4; Proposition 4.4, Remark 4.5, the proof of Theorem 1.2, Corollary 4.6, Theorem 4.7 and Remark 4.8 (pp. 14–15). Revision recheck (2026-10-08): Theorem 4.7 and Remark 4.8, p.15. SHA-256: `22017bc9beb585c2aae5421d2fe1a8a9049d8a93e4f8bb8cf684149616db1ba2`.

- [Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf). Matthew Emerton. Preprint, draft of 23 March 2011, 119 pages, on Emerton's University of Chicago page; not published in a journal. Printed page = PDF page. The same file as GL2ModularityLifting part R22.1. Historical read: 2026-09-29. Historical passages: §1.2: Theorems 1.2.1, 1.2.3, 1.2.4, Corollary 1.2.2 and Remark 1.2.5 (pp. 3–5); Theorem 3.3.22 (p. 28); §§7.3–7.4 (pp. 95–98). Revision recheck (2026-10-08): Theorem 3.3.22, p.28; §§7.3–7.4, pp.96–97. SHA-256: `bf4f8556ef04be02daed0b1dba35c91ce4a7b2f4cbbf28d0d8351b1fc369eb13`.

- [The Breuil–Mézard conjecture for non-scalar split residual representations](https://arxiv.org/pdf/1309.1658v2). Yongquan Hu and Fucheng Tan. Ann. Sci. Éc. Norm. Supér. (4) 48 (2015), no. 6, 1383–1421; arXiv:1309.1658v2 (13 November 2014). The arXiv version was read; printed page = PDF page. The same file as GL2ModularityLifting part R22.1. Historical read: 2026-09-29. Historical passages: Abstract and introduction, Theorem 1.4 (pp. 1–5); §6: Proposition 6.2, Theorem 6.3 and its proof (pp. 33–35). Revision recheck (2026-10-08): Theorem 6.3 and proof, p.35. SHA-256: `d36f237d7269e9dac7d32d80f1e4d6fe5c20b210ae067075b2dedb51e73d9bb2`.

- [A simplified proof of Serre’s conjecture](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf). Luis Victor Dieulefait and Ariel Martín Pacetti. Rev. R. Acad. Cienc. Exactas Fís. Nat. Ser. A Mat. 117, article 153 (2023); publisher PDF, 17 pages. Locators use the PDF section numbering, which agrees with arXiv v2 (the publisher HTML increments the section numbers). Historical read: 2026-10-06. Historical passages: §1.2 Theorems 1.4–1.7, pp.4–5; §1.4 Definition 1.10, Theorem 1.11 and Remark 4, p.7; §2 Paso 6, p.14. Revision recheck (2026-10-08): Theorems 1.4–1.7, pp.4–5; Definition 1.10 and Remark 4, p.7; Paso 6, p.14. SHA-256: `2a133808911a1819ea9480bea0bfc18846035f961e866ddec4d05d69b093e0f8`.

Source issue `GL2ModularityLifting/E10`: The determinant condition is det ρ=ψχ₃^{k−1} for an integer k≥2, without a stated finite-order restriction on ψ (paraphrase of the fourth hypothesis). Require ψ to be a finite-order character in det ρ=ψε^{k−1}, as in the Skinner–Wiles theorem cited in its proof. The lifting and transfer nodes in this packet retain this qualification. Skinner–Wiles, printed p.6, explicitly assumes finite-order ψ. Without it, det ρ=ψε^{k−1} is satisfied tautologically by defining ψ from any ordinary representation and does not force a classical integral weight. The cited theorem therefore does not prove the unrestricted wording. The surrounding geometric use has finite-order ψ, so the DP application is unchanged. The independent confirmation is preserved in the packet. Its accessible publisher/arXiv/author records and correction searches are recorded there, including the unsuccessful Pacetti-homepage read; no clearance of that inaccessible page is claimed.

Source issue `GL2ModularityLifting/E11`: In arXiv v3 Theorem 8.0.3(3), p.38, the displayed total-oddness condition is placed on the residual representation. The lifting theorem here instead requires det ρ(c_v)=−1 at every real place, as the odd characteristic-zero deformation quotient requires in Proposition 3.2.7, p.15. At two, residual determinant parity cannot establish this: I₂ and diag(1,−1) reduce to the same matrix. The proof’s odd deformation setup and Paškūnas Theorem 1.1, p.1, identify the intended hypothesis. The reviewer confirms this preprint misprint; the publisher PDF endpoint returned an HTML access page, so the finding does not claim that the version of record contains it. The packet records the version, hash, access attempt and correction search.

The DP finding formerly called E1 in this part is E10: part R22.1 already assigns E1 to a different Kisin finding. This avoids conflating the two records. All 28 declaration identifiers are preserved.
