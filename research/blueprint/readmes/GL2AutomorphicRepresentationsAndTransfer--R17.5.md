# Modular forms — Hecke theory, newforms, and L-functions, Part II: GL₂ automorphic representations and transfer

Part R17.5 (follow-up): layer R17.5, *Automorphic induction and Langlands–Tunnell*. Agent: Claude (session claude-Y032f1). Issue: [#9414](https://github.com/CBirkbeck/tauceti-explorer/issues/9414).

This part continues the plan of layer R17.5 begun in the [R17.3 part](GL2AutomorphicRepresentationsAndTransfer--R17.3.md), whose fifteen R17.5 declarations (quadratic induction, dihedral, tetrahedral and octahedral Artin automorphy, the Langlands–Tunnell theorem, Tate's lifting theorem, the weight-one comparisons, Tunnell's globalisation, Carayol's prescribed induction and the mod-3 application) it cites and does not repeat. That part left two steps without a proof that the sources supply: matching at **every** place for tetrahedral and octahedral representations, and a characteristic-zero lift of a residual representation with solvable image whose reduction is the residual representation itself. This part plans both, and the residual modularity statements that rest on them. It has 15 declarations (2 applications, 1 construction, 2 lemmas, 10 theorems), 10 API items, 4 unit tests and one planet; the layer is **planned**, with no gaps of its own, and every implementation remains unchecked.

The machine-readable plan is the [packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.5.json); the [suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.5.lean) states the modular-character and lifting results on Mathlib's carriers and lists the automorphic declarations whose carriers are not at the pins. The roadmap extends `tauceti:TauCetiRoadmap/ModularForms`, following the accepted RS-21 restructuring.

## Conventions

F is a number field, A_F its adele ring, C_F = F^×\A_F^× its idele class group, G_F an absolute Galois group and W_F the global Weil group, with W_F^{ab} ≅ C_F by global reciprocity in the normalisation of ArithmeticGaloisRepresentations R01.2 (uniformisers to geometric Frobenius). A continuous ρ: G_F → GL₂(C) has finite image and is viewed on W_F; ρ_v is its restriction to W_{F_v}. For a quasi-character χ of a local field, c(χ) is its conductor exponent.

For each place v, π(ρ_v) is the irreducible generic representation of GL₂(F_v) whose parameter, in the arithmetic Tate–unitary normalisation of R16.3, is ρ_v (AF.1 at archimedean places). A cuspidal π *matches ρ almost everywhere* if π_v ≅ π(ρ_v) outside a finite set of places, and *matches ρ at every place* if π_v ≅ π(ρ_v) for all v; the second is Langlands's first definition of π(ρ), the first is Tunnell's. Local factors L, ε and γ(s, χ⊗π, ψ) = ε(s, χ⊗π, ψ)L(1−s, χ⁻¹⊗π̃)/L(s, χ⊗π) are those of Jacquet–Langlands, with a fixed additive character ψ = ⊗ψ_v of A_F/F. At a real place, π(1, sgn) is the weight-one limit of discrete series, Rogawski–Tunnell's π₁; a cuspidal π over a totally real field is *holomorphic of parallel weight one* when every real component is π(1, sgn).

For a finite group Γ, a prime p and an algebraically closed field k of characteristic p, an element is p-regular if its order is prime to p. Brauer characters are taken with respect to a fixed isomorphism τ: μ_m(k) ≅ μ_m(C), m prime to p and divisible by the orders of the p-regular elements. A residual representation r̄: G_F → GL_n(F̄_p) is continuous for the discrete topology; a lift consists of a number field E, a prime λ of E above p, the localisation R = (O_E)_λ, a ring map f: R → F̄_p with kernel λR, a representation ρ: G_F → GL_n(R) and P ∈ GL_n(F̄_p) with r̄ = P·(f∘ρ)·P⁻¹. Here the reduction is r̄ itself, not only its semisimplification. Frobenius elements are arithmetic, as in Deligne–Serre. A two-dimensional representation is odd at a real place v if det of the image of complex conjugation c_v is −1, and totally odd if it is odd at every real place.

## Pinned-library boundary

The reviewed library audit (AUDIT-14 in `data/library-coverage.json`) classifies layer R17.5 as not built: the pinned libraries have no Artin representations of number fields, no automorphic representations or local factors of GL₂, no weight-one forms and no modular characters. The following declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` contributes none here):

- `mathlib:Group.IsSolvable` — The class of solvable groups (Group.IsSolvable; the root alias IsSolvable is deprecated at the pin); finite solvable groups are p-solvable for every p. Module: `Mathlib/GroupTheory/Solvable.lean`.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` — Nonzero prime ideals of a Dedekind domain, used for the prime λ of O_E above p. Module: `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`.
- `mathlib:Localization.AtPrime` — The localisation of a commutative ring at a prime ideal; (O_E)_λ, a discrete valuation ring since O_E is Dedekind. Module: `Mathlib/RingTheory/Localization/AtPrime/Basic.lean`.
- `mathlib:Matrix.GeneralLinearGroup` — GL(n, R) as the unit group of n×n matrices over a semiring; the carrier of every matrix representation here. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.det` — The determinant as a group homomorphism GL(n, R) → Rˣ for commutative R. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.GeneralLinearGroup.map` — A ring homomorphism R → S induces the group homomorphism GL(n, R) → GL(n, S); used for reduction of integral representations. Module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Matrix.charpoly` — The characteristic polynomial det(X·1 − M) of a square matrix; its roots with multiplicity are the eigenvalues summed in the Brauer character. Module: `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`.
- `mathlib:Representation.IsIrreducible` — Irreducibility of a representation as simplicity of its lattice of subrepresentations; applied to the k-linear representation of Γ on kⁿ. Module: `Mathlib/RepresentationTheory/Irreducible.lean`.
- `mathlib:rootsOfUnity` — The subgroup of units ζ with ζ^m = 1 of a commutative monoid; μ_m(k) and μ_m(C) in the Brauer character. Module: `Mathlib/RingTheory/RootsOfUnity/Basic.lean`.

The suggested file also uses Mathlib's `NumberField.IdeleClassGroup` with `IdeleClassGroup.ofAdicCompletion`, `IsDedekindDomain.HeightOneSpectrum.adicCompletion` with its valuation, `restrictRootsOfUnity`, `rootsOfUnity.mkOfPowEq` and `Field.absoluteGaloisGroup` with its Krull topology, all present at the pin.

## R17.5 — Langlands–Tunnell at every place, and lifts of residual representations

**Matching at every place.** Langlands and Tunnell prove that the cuspidal representation they construct for a tetrahedral or octahedral ρ matches ρ at almost all places. Langlands asserts that this implies matching everywhere, citing Callahan and a Lemma 3.2 he does not prove. The plan here follows Jacquet–Langlands's isolation argument from the proof of their Theorem 12.2 instead. Divide the functional equation of L(s, π⊗ω) by that of the Artin L-function L(s, ρ⊗ω). What is left is a product of γ-factors at the finitely many unknown finite places. A global twist ω with prescribed component at one of them and high ramification at the others (their Lemma 12.5) isolates a single place, because highly ramified γ-factors depend only on the central character (their Proposition 3.8). The local converse theorem (their Corollary 2.19) then identifies the local component. The twist cannot control the archimedean factors, so archimedean matching is a hypothesis of the upgrade; for tetrahedral and octahedral ρ it is proved separately, through cyclic base change, since every archimedean place splits in the cyclic cubic field of the tetrahedral case, and at a real place that is complex in the quadratic field of the octahedral case the determinant forces the weight-one limit.

**Lifting residual representations.** Boxer–Calegari–Gee–Pilloni and Dieulefait–Pacetti obtain a characteristic-zero lift of a residual representation with solvable image from Tate's lifting theorem, which does not control the reduction. The plan here lifts the finite image directly. The Fong–Swan theorem gives an ordinary character agreeing with the Brauer character, and a lattice in its realisation over a cyclotomic field reduces to the residual representation, because Brauer characters determine composition factors. The lift has the same kernel as the residual representation, so it cuts out the same field, and for p odd it inherits oddness. Langlands–Tunnell at every place then gives a cuspidal representation of weight one (Rogawski–Tunnell's sense) over any totally real field, and over Q a weight-one newform (Deligne–Serre).

<a id="r17-5-gl2-local-converse"></a>

### The GL₂ local converse theorem

**Declaration:** `TauCeti.GL2Transfer.gl2_local_converse`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-local-converse`.

Let F be a nonarchimedean local field of characteristic zero and ψ a nontrivial additive character. Let π and π′ be irreducible infinite-dimensional admissible representations of GL₂(F) with the same central character. Then π ≅ π′ if and only if γ(s, χ⊗π, ψ) = γ(s, χ⊗π′, ψ) for every quasi-character χ of F^×. Equivalently, without the central-character hypothesis, π ≅ π′ as soon as L(s, χ⊗π) = L(s, χ⊗π′) and ε(s, χ⊗π, ψ) = ε(s, χ⊗π′, ψ) for every character χ of F^× (Bushnell–Henniart's form, which also covers one-dimensional representations). It suffices to test χ of finite order with χ(ϖ) = 1 for a fixed uniformiser ϖ: every quasi-character is such a χ times |·|^t, and twisting by |·|^t replaces s by s + t in all three factors.

**Hypotheses.**

- F is a finite extension of Q_p, ψ a nontrivial additive character, ϖ a uniformiser.
- π, π′ are irreducible admissible infinite-dimensional (equivalently generic, R16.2/local-classification) representations of GL₂(F) with ω_π = ω_{π′}.
- γ(s, χ⊗π, ψ) = ε(s, χ⊗π, ψ)L(1−s, χ⁻¹⊗π̃)/L(s, χ⊗π) with the Jacquet–Langlands factors.

**Construction or proof.**

1. The implication from isomorphism to equality of factors is immediate.
2. Converse (JL70 Theorem 2.18 and Corollary 2.19): in the Kirillov model both representations are realised on spaces containing C_c^∞(F^×); the local functional equation of Theorem 2.18(iv) expresses the action of the Weyl element on C_c^∞(F^×) through the twisted γ-factors, by Mellin inversion over the characters of O_F^× and the variable s. Equal γ-factors and equal central characters therefore give the same action of the Borel subgroup and of the Weyl element on the common subspace, which generates; so π ≅ π′.
3. Reduction to finite-order twists with χ(ϖ) = 1: a quasi-character χ equals χ₀|·|^t with χ₀(ϖ) = 1 and χ₀ of finite order on O_F^× (it is continuous on a profinite group), and γ(s, χ₀|·|^t⊗π, ψ) = γ(s + t, χ₀⊗π, ψ).
4. Bushnell–Henniart prove the version with L and ε (27.1): by 27.2 a representation is cuspidal exactly when all its twisted L-factors are 1, so equal twisted factors separate cuspidal from non-cuspidal representations; non-cuspidal ones are then recovered from their principal-series parameters, and cuspidal ones from their types through Gauss sums (27.8).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For π = π(μ₁, μ₂) and π′ = π(μ₁′, μ₂′) irreducible principal series with equal central characters, equal twisted γ-factors force {μ₁, μ₂} = {μ₁′, μ₂′}: twist by χ = μ₁⁻¹ and compare the zero of 1/L(s, χ⊗π) at s = 0.
- For η the unramified quadratic character, π and π⊗η have the same central character and γ(s, χ⊗π⊗η, ψ) = γ(s + πi/log q, χ⊗π, ψ); the criterion says π ≅ π⊗η exactly when every twisted γ-factor is invariant under this shift of s, which holds for the supercuspidal representations induced from the unramified quadratic extension and fails for unramified principal series π(μ, ν) with {μη, νη} ≠ {μ, ν}.
- A one-dimensional representation χ∘det is excluded from the γ-form (not generic), but is covered by Bushnell–Henniart's L-and-ε form.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §2, Corollary 2.19, printed pp. 39–40 (PDF pp. 45–46). Jacquet and Langlands prove that, for infinite-dimensional irreducible representations sharing a central character, agreement of all character twists of the γ-factor forces equivalence; this node is that corollary.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §2, Theorem 2.18, printed p. 37 (PDF p. 43). The local functional equation in the Kirillov model on which the corollary rests.
- [Colin J. Bushnell and Guy Henniart, The Local Langlands Conjecture for GL(2)](https://doi.org/10.1007/3-540-31511-X), §27.1, Converse Theorem, printed p. 170; §27.2 Proposition, p. 170; §27.8, pp. 175–176. Bushnell and Henniart's converse theorem: irreducible smooth representations of GL₂(F) with the same twisted L- and ε-factors for every character are isomorphic; 27.2 identifies cuspidal representations as those all of whose twisted L-factors are trivial.

**Implementation status:** `unchecked`.

<a id="r17-5-gl2-twist-stability"></a>

### Stability of GL₂ factors under highly ramified twists

**Declaration:** `TauCeti.GL2Transfer.gl2_twist_stability`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-twist-stability`.

Let F be a nonarchimedean local field of characteristic zero, ψ a nontrivial additive character of F, and π an irreducible admissible representation of GL₂(F) with central character ω_π. For a quasi-character χ of F^× write c(χ) for its conductor exponent. (i) There is an integer m(π) such that L(s, χ⊗π) = L(s, χ⁻¹⊗π̃) = 1 whenever c(χ) > m(π). (ii) If π₁ and π₂ are irreducible admissible representations with the same central character, there is an integer m such that ε(s, χ⊗π₁, ψ) = ε(s, χ⊗π₂, ψ) whenever c(χ) > m; with (i) this gives γ(s, χ⊗π₁, ψ) = γ(s, χ⊗π₂, ψ) for such χ, where γ(s, χ⊗π, ψ) = ε(s, χ⊗π, ψ)L(1−s, χ⁻¹⊗π̃)/L(s, χ⊗π). (iii) More precisely, for any factorisation ω_π = μ₁μ₂ into quasi-characters, ε(s, χ⊗π, ψ) = ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) once c(χ) is large compared with c(μ₁) and c(μ₂); the right side is a product of Tate's GL₁ constants and depends on π only through ω_π. The bound m depends on π₁, π₂ and ψ, not on χ.

**Hypotheses.**

- F is a finite extension of Q_p; ψ: F → C^× is a nontrivial continuous additive character.
- π, π₁, π₂ are irreducible admissible representations of GL₂(F); in (ii) ω_{π₁} = ω_{π₂}.
- The local factors L, ε and γ are those of Jacquet–Langlands §2–§3 (equivalently Godement–Jacquet for n = 2), in the normalisation fixed by R16.3.
- c(χ) is the conductor exponent of AL.1/local-quasicharacter-conductor; 'sufficiently ramified' means c(χ) larger than an explicit bound depending on π (and on ψ through its conductor).

**Construction or proof.**

1. One-dimensional and principal-series representations: L(s, χ⊗π(μ₁, μ₂)) = L(s, χμ₁)L(s, χμ₂) and ε(s, χ⊗π(μ₁, μ₂), ψ) = ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) (R16.3/principal-series-parameter and the Jacquet–Langlands product formula); once c(χ) exceeds c(μ₁) and c(μ₂), both χμᵢ are ramified, so the L-factors are 1 (AL.1/ramified-local-theory) and the ε-factor is the stated product. Twists of Steinberg are constituents of a reducible principal series and have the same twisted factors as it for highly ramified χ (JL70 p. 58, reduction step).
2. Supercuspidal π: L(s, χ⊗π) = 1 for every χ (R16.2/local-classification and R16.3/supercuspidal-parameter). For the ε-factor, JL70 compute ε(s, χ⊗π, ψ) through the Kirillov model (R16.2/supercuspidal-kirillov): for c(χ) large the Mellin transform of a vector supported near 1 only sees the central character, which yields the product ε(s, χμ₁, ψ)ε(s, χμ₂, ψ) for any μ₁μ₂ = ω_π (JL70 Proposition 3.8, proof).
3. (ii) follows from (iii) applied to π₁ and π₂ with the same factorisation of the common central character, and (i).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R16.2/local-classification`, `GL2AutomorphicRepresentationsAndTransfer:R16.2/supercuspidal-kirillov`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors`, `AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For π = π(μ₁, μ₂) a ramified principal series and χ with c(χ) > max(c(μ₁), c(μ₂)), the twisted L-factor is 1 and ε(s, χ⊗π, ψ) is the product of the two Tate constants.
- Two supercuspidal representations with the same central character have equal twisted γ-factors for all sufficiently ramified χ, although they need not be isomorphic: stability alone never distinguishes them (non-example for using stability as a converse theorem).
- The hypothesis on central characters is necessary in (ii): for π an unramified principal series and η an unramified character with η² ≠ 1, the highly ramified ε-factors of χ⊗(π⊗η) and χ⊗π differ by the factor η²(ϖ)^{c(χ)+n(ψ)} (n(ψ) the conductor exponent of ψ), which is not 1 for suitable large c(χ).

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §3, Proposition 3.8 (i)–(iii), printed pp. 57–58 (PDF pp. 63–64 of the IAS edition). Jacquet–Langlands prove that for every irreducible π the twisted L-factors are 1 once the order of χ is large, that two representations with the same central character have equal twisted ε-factors for such χ, and the product formula for ε in terms of any factorisation of the central character; the statement here is theirs in the γ-factor form used by the isolation argument.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2, printed p. 211 (PDF p. 217). The isolation argument invokes Proposition 3.8 exactly in this way: at the auxiliary places the highly ramified twist makes the L-factors trivial and the ε-factor depend only on the central character.

**Implementation status:** `unchecked`.

<a id="r17-5-isolating-twist-character"></a>

### A global twist with one prescribed component and high ramification elsewhere

**Declaration:** `TauCeti.GL2Transfer.isolating_twist_character`; lemma; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`.

Let F be a number field, S a finite set of finite places, v₀ ∈ S, χ₀ a quasi-character of F_{v₀}^×, and (m_v)_{v ∈ S∖{v₀}} nonnegative integers. There is a quasi-character ω of the idele class group C_F = F^×\A_F^× whose component at v₀ is χ₀ and whose component ω_v at each v ∈ S∖{v₀} is nontrivial on the principal units 1 + 𝔭_v^{m_v}, so that c(ω_v) > m_v. Nothing is imposed at the other places; ω has finite order on the units at every finite place but need not have finite order globally. This is Jacquet–Langlands's Lemma 12.5, which is the only global character input of the all-place upgrade; the finite-order prescription at several places (Chevalley's congruence theorem) is not needed for it.

**Hypotheses.**

- F is a number field; S is a finite set of finite places; v₀ ∈ S.
- χ₀: F_{v₀}^× → C^× is a continuous quasi-character; m_v ≥ 0 are integers for v ∈ S∖{v₀}.
- c(·) and 1 + 𝔭_v^m are as in AL.1/local-quasicharacter-conductor.

**Construction or proof.**

1. Reduce to a unitary χ₀: write χ₀ = |·|^r χ₀′ with χ₀′ unitary and multiply the character obtained for χ₀′ by |·|_A^r.
2. Let A ⊂ A_F^× be the subgroup of ideles with component 1 outside S, component in 1 + 𝔭_v^{m_v} at v ∈ S∖{v₀}, and arbitrary component at v₀. Then F^× ∩ A = {1}, and F^×A is closed in A_F^× (on any compact set of ideles the norm is bounded above and below, and F^× is discrete) (JL70 p. 210).
3. Choose a unitary character of A equal to χ₀ at v₀ and nontrivial on 1 + 𝔭_v^{m_v} at each v ∈ S∖{v₀} (the principal units are nontrivial profinite groups, so such characters exist). Extend it by 1 on F^× to the closed subgroup F^×A, then to a unitary character of A_F^× by Pontryagin duality for locally compact abelian groups; it is trivial on F^× and so is a character of C_F (JL70 p. 211).

**Direct prerequisites.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- With S = {v₀} the lemma only asks for a Hecke character with prescribed component at one place.
- For F = Q, S = {p} and χ₀ unramified with χ₀(p) = −1, the unitary unramified character ω = |·|_A^{iπ/log p} is admissible; it has infinite order, so the lemma is not a statement about finite-order characters.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Lemma 12.5 and its proof, printed pp. 210–211 (PDF pp. 216–217). Jacquet and Langlands construct a quasi-character of C_F with prescribed component at one place of S and conductor exponent greater than m_v at each of the others, by extending a character from the closed subgroup F^×A.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3, Lemma 3.2, DMA text p. 15 (PDF p. 18). Langlands records a variant prescribing approximate archimedean components as well, without proof; the archimedean variant is not used here because the all-place upgrade assumes archimedean matching.

**Implementation status:** `unchecked`.

<a id="r17-5-artin-twisted-functional-equation"></a>

### Functional equation of twisted Artin L-functions

**Declaration:** `TauCeti.GL2Transfer.artin_twisted_functional_equation`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`.

Let F be a number field, ψ = ⊗ψ_v a nontrivial character of A_F/F and dx = ∏dx_v the Tamagawa measure. Let ρ: G_F → GL_n(C) be continuous (so of finite image) and ω a quasi-character of C_F, viewed as a character of W_F through global reciprocity; put V = ρ⊗ω, a representation of the global Weil group W_F. Its completed L-function Λ(s, V) = ∏_v L(s, V_v), the product over all places with the archimedean Γ-factors, converges in a half-plane Re s > σ₀, extends meromorphically to C, and satisfies Λ(s, V) = ε(s, V)Λ(1 − s, V^∨) with ε(s, V) = ∏_v ε(s, V_v, ψ_v, dx_v), the product of the Langlands–Deligne local constants (almost all equal to 1); ε(s, V) does not depend on ψ. Here V_v is the restriction to W_{F_v} and the local factors are those of R01.2 at finite places and of AL.1/AF.1 at archimedean places. No holomorphy of Λ(s, V) is asserted.

**Hypotheses.**

- F is a number field; ρ: G_F → GL_n(C) is a continuous homomorphism; ω: A_F^×/F^× → C^× is a continuous quasi-character.
- Global reciprocity identifies W_F^{ab} with C_F in the normalisation of R01.2/local-epsilon-factor (uniformisers to geometric Frobenius), and V = ρ⊗ω is a continuous representation of W_F.
- Local constants: Deligne's ε(V_v, ψ_v, dx_v) at finite places (R01.2/local-epsilon-factor) and the archimedean constants of AL.1 and R16.3/archimedean-factor-comparison.

**Construction or proof.**

1. ρ factors through G = Gal(L/F) for a finite Galois L/F (R01.1/finite-galois-factorisation). By Brauer's induction theorem (Tau Ceti InductionRestriction, Layer 6) the character of ρ is an integral combination Σ nᵢ Ind_{Hᵢ}^{G} θᵢ of characters induced from linear characters θᵢ of subgroups Hᵢ = Gal(L/Kᵢ).
2. By the projection formula, V = ρ⊗ω is the corresponding virtual combination Σ nᵢ Ind_{W_{Kᵢ}}^{W_F}(θᵢ·(ω∘N_{Kᵢ/F})). Global reciprocity turns θᵢ·(ω∘N_{Kᵢ/F}) into a quasi-character of C_{Kᵢ}.
3. Local L-factors are additive and inductive (R01.2/local-factor-of-induced-representation at finite places, the Γ-factor identities of AL.1 at archimedean ones), so Λ(s, V) = ∏ᵢ Λ_{Kᵢ}(s, θᵢ ω_{Kᵢ})^{nᵢ}; each factor is a completed Hecke L-function, meromorphic with Hecke–Tate functional equation (AL.1/hecke-l-functional-equation).
4. Local constants are additive and inductive in degree zero (Deligne Théorème 4.1 (1)–(4)); comparing the induced permutation representations with Dedekind zeta functions shows that the product over all places of the inductivity constants λ(Kᵢ/F) is 1, so ∏_v ε(s, V_v) = ∏ᵢ ε_{Kᵢ}(s, θᵢω_{Kᵢ})^{nᵢ} (Deligne 5.11). Dividing the functional equations gives the claim; independence of ψ follows from the product formula for ε under ψ ↦ ψ(a·) with a ∈ F^×.

**Direct prerequisites.** `ArithmeticGaloisRepresentations:R01.1/finite-galois-factorisation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `ArithmeticGaloisRepresentations:R01.2/local-factor-of-induced-representation`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For ρ trivial of dimension one the statement is Hecke–Tate's functional equation for Λ(s, ω).
- For ρ = Ind_{G_K}^{G_F} 1 the left side is the completed Dedekind zeta function of K twisted by ω∘N_{K/F}; a pole occurs exactly when ω∘N_{K/F} = |·|^{iu}, and then at s = 1 − iu, showing that holomorphy is not part of the statement.
- For a two-dimensional dihedral ρ = Ind θ the equation coincides with that of the Hecke L-function of θ·(ω∘N), consistent with JL70 Proposition 12.1.

**Sources.**

- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §4, Théorème 4.1 (1)–(4), printed p. 535 (PDF p. 35). Existence and uniqueness of local constants that are multiplicative in exact sequences, scale with the measure, are inductive in degree zero and equal Tate's constants for characters.
- [Pierre Deligne, Les constantes des équations fonctionnelles des fonctions L](https://publications.ias.edu/sites/default/files/Number20.pdf), §5, 5.11 (5.11.1)–(5.11.3), printed p. 551 (PDF p. 51). For a representation of the global Weil group, the global L-function and the product of local constants satisfy the functional equation; Deligne derives it from the preceding local results and the classical arguments (Brauer induction, Hecke).
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2, printed pp. 208–210 (PDF pp. 214–216). Jacquet and Langlands use this functional equation for ω⊗σ with σ a two-dimensional Weil-group representation, with ε given by the product of local constants, in the isolation argument.

**Implementation status:** `unchecked`.

<a id="r17-5-artin-all-place-upgrade"></a>

### From weak Artin matching to matching at every place

**Declaration:** `TauCeti.GL2Transfer.artin_all_place_upgrade`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`.

Let F be a number field, ρ: G_F → GL₂(C) continuous, viewed on W_F, and π a cuspidal automorphic representation of GL₂(A_F). For each place v let π(ρ_v) be the irreducible generic representation of GL₂(F_v) whose arithmetic-normalised R16.3 parameter (AF.1 at archimedean v) is ρ|_{W_{F_v}}. Suppose there is a finite set T of finite places such that π_v ≅ π(ρ_v) for every finite v ∉ T and for every archimedean v. Then π_v ≅ π(ρ_v) for every place v. In particular the central character of π is det ρ (read through global reciprocity), and for every quasi-character χ of C_F and every place v the local factors agree: L(s, π_v⊗χ_v) = L(s, ρ_v⊗χ_v) and ε(s, π_v⊗χ_v, ψ_v) = ε(s, ρ_v⊗χ_v, ψ_v); in particular L(s, π⊗χ) = L(s, ρ⊗χ) for the completed L-functions, which are therefore entire when ρ is irreducible. The archimedean hypothesis cannot be dropped from this argument: it is what lets the archimedean factors cancel (Langlands's unproved Lemma 3.2 would be needed otherwise).

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous (finite image); π is cuspidal automorphic on GL₂(A_F).
- π(ρ_v) is defined through the rank-two local Langlands correspondence of R16.3 (finite v) and AF.1/archimedean-llc-gln (archimedean v), with the Tate–unitary normalisation of R16.3/tate-unitary-normalization; since ρ_v has bounded image and N = 0, π(ρ_v) is tempered and generic.
- T is a finite set of finite places; π_v ≅ π(ρ_v) for all finite v ∉ T and all archimedean v.

**Construction or proof.**

1. Central characters. ω_π and det ρ (a quasi-character of C_F by reciprocity) agree at every v ∉ T, because the correspondence matches central characters with determinants. Their quotient is a Hecke character trivial on F_v^× for all v ∉ T; as F^× is dense in ∏_{v ∈ T}F_v^× (weak approximation), it is trivial. Hence ω_{π_v} = det ρ_v for every v, including v ∈ T.
2. Fix v₀ ∈ T and a quasi-character χ₀ of F_{v₀}^×. For each v ∈ T∖{v₀}, gl2-twist-stability applied to π_v and π(ρ_v), which have the same central character by the first step, gives a bound m_v. isolating-twist-character supplies ω on C_F with ω_{v₀} = χ₀ and c(ω_v) > m_v for v ∈ T∖{v₀}.
3. π⊗ω is cuspidal, so its completed L-function satisfies the functional equation of R16.5/global-epsilon-normalization with ε the product of local ε-factors (JL70 Theorem 11.1, p. 179); ρ⊗ω satisfies artin-twisted-functional-equation with the same additive character ψ. At every v ∉ T the local L- and ε-factors of π_v⊗ω_v and ρ_v⊗ω_v coincide (hypothesis and the factor compatibilities of R16.3, including R16.3/archimedean-factor-comparison at infinity). Dividing the two functional equations by the common partial L-functions gives ∏_{v ∈ T} γ(s, π_v⊗ω_v, ψ_v) = ∏_{v ∈ T} γ(s, ρ_v⊗ω_v, ψ_v) as meromorphic functions (JL70 p. 210).
4. For v ∈ T∖{v₀}, γ(s, ρ_v⊗ω_v, ψ_v) = γ(s, π(ρ_v)⊗ω_v, ψ_v) by R16.3, and this equals γ(s, π_v⊗ω_v, ψ_v) by gl2-twist-stability. Cancelling leaves γ(s, π_{v₀}⊗χ₀, ψ_{v₀}) = γ(s, π(ρ_{v₀})⊗χ₀, ψ_{v₀}) for the arbitrary χ₀.
5. π_{v₀} is infinite-dimensional (local components of cuspidal representations are generic: R16.4/global-whittaker-expansion), as is π(ρ_{v₀}); their central characters agree; gl2-local-converse gives π_{v₀} ≅ π(ρ_{v₀}). The factor identities follow from R16.3; the global identity follows, and for irreducible ρ the twisted L-functions are entire because L(s, π⊗χ) is the standard L-function of a cuspidal representation of GL₂ (AL.2/global-godement-jacquet).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/isolating-twist-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-twist-stability`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/gl2-local-converse`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-twisted-functional-equation`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/steinberg-monodromy`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tate-unitary-normalization`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/conductor-epsilon-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/archimedean-factor-comparison`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-whittaker-expansion`, `GL2AutomorphicRepresentationsAndTransfer:R16.5/global-epsilon-normalization`, `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For a dihedral ρ = Ind_{G_K}^{G_F} θ the conclusion recovers the all-place local components of quadratic automorphic induction (JL70 Proposition 12.1), where T can be taken empty.
- With T = {v₀} the stability step is vacuous and the conclusion is the local converse theorem applied to the single quotient of functional equations.
- If the archimedean components were not known to match, the quotient of functional equations would contain archimedean γ-factors that highly ramified finite twists do not control; the hypothesis is used, not decorative.
- Weak matching at almost all places with π not cuspidal (π = π(μ, ν) isobaric, ρ = μ⊕ν) is outside the statement; that case is settled directly by Hecke characters.

**Sources.**

- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, proof of Theorem 12.2 from the quotient of the two functional equations to (12.5.1), printed pp. 210–212 (PDF pp. 216–218). Jacquet and Langlands isolate the places of a finite set S one at a time by a twist with prescribed component at one place and high ramification at the others, use Proposition 3.8 and the corresponding Galois-side stability to cancel the other places, and conclude from the resulting identity of local factors; here the cuspidal representation is given and the Galois side is compared through the local correspondence, so only GL₂ stability is needed.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3 opening, DMA text pp. 15–16 (PDF pp. 18–19). Langlands states the two definitions of π(ρ) (matching everywhere, or isobaric and matching almost everywhere), asserts their equivalence using Callahan's results, an archimedean analogue of the local converse and his Lemma 3.2, whose proof he does not give.
- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 173, second paragraph. Tunnell defines π = π(ρ) by matching at almost all places, which is the weak form this theorem upgrades.

**Implementation status:** `unchecked`.

<a id="r17-5-tetrahedral-artin-all-places"></a>

### Tetrahedral Artin automorphy at every place

**Declaration:** `TauCeti.GL2Transfer.tetrahedral_artin_all_places`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`.

Let F be a number field and ρ: G_F → GL₂(C) continuous, irreducible, with projective image A₄, and let π be the cuspidal representation of R17.5/tetrahedral-artin (the cubic descent of the dihedral π(ρ_E), with ω_π = det ρ). Then π_v ≅ π(ρ_v) at every place v of F, including the archimedean ones and the places dividing 2 where ρ_v may be primitive. In particular all twisted L- and ε-factors of π and ρ agree at every place. At an archimedean v the component is π(1, 1) if ρ(c_v) = 1, π(sgn, sgn) if ρ(c_v) = −1 and the weight-one limit π(1, sgn) if ρ(c_v) is a non-scalar involution; at a complex v it is π(1, 1).

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous and irreducible with projective image A₄.
- E/F is the cyclic cubic extension cut out by the preimage of the normal subgroup V₄ ⊂ A₄; P = ρ|_{W_E} is dihedral, and π(P) is its quadratic automorphic induction (R17.5/dihedral-artin).
- π is the cyclic descent of π(P) to F with ω_π = det ρ constructed in R17.5/tetrahedral-artin; it satisfies π_v ≅ π(ρ_v) for almost all v.

**Construction or proof.**

1. Archimedean places. Every archimedean v of F splits completely in E: the decomposition group at v has order at most 2 inside Gal(E/F) ≅ Z/3. For w | v, E_w = F_v, and R17.4/cyclic-base-change gives BC_{E/F}(π)_w ≅ π_v at the split place. By construction BC_{E/F}(π) ≅ π(P) (R17.4/cyclic-descent), and π(P)_w ≅ π(P_w) at every place by quadratic induction (R17.5/quadratic-induction, JL70 Proposition 12.1). As P_w = ρ|_{W_{E_w}} = ρ_v, π_v ≅ π(ρ_v).
2. The explicit archimedean components: ρ(W_C) is trivial (a connected group maps trivially to the profinite G_F), so ρ_v is a sum of characters of W_R/C^× ≅ {±1} determined by ρ(c_v), and AF.1/archimedean-llc-gln gives the listed principal series.
3. Finite places. R17.5/tetrahedral-artin gives π_v ≅ π(ρ_v) outside a finite set T of finite places. artin-all-place-upgrade, with the archimedean matching just proved, extends this to every place.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/quadratic-induction`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- If the image of ρ is the binary tetrahedral group, whose only involution is −1, then ρ(c_v) is scalar at every real v and π_v is π(1, 1) or π(sgn, sgn); an odd tetrahedral ρ over Q (det ρ(c) = −1) has a non-scalar involution in its image and π_∞ is the weight-one limit π(1, sgn).
- At an unramified place inert in E, R17.5/tetrahedral-artin removes a cube-root-of-unity ambiguity in the Satake class by a group-theoretic argument; at the finitely many places that argument does not reach (places ramified for ρ, in particular those over 2 where ρ_v can be primitive) only artin-all-place-upgrade identifies π_v.
- Replacing π by π⊗η with η the cubic character of E/F gives a representation with the same base change to E but different central character; it is not π(ρ), so the determinant normalisation of R17.5/tetrahedral-artin is essential.

**Sources.**

- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(i), tetrahedral type, DMA text pp. 16–19 (PDF pp. 19–22), Theorem 3.3. Langlands constructs the cubic descent of π(P) with the right central character and proves matching at almost all places; Theorem 3.3 records the consequence for the Artin L-function.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, properties A)–C) of global liftings, DMA text p. 14 (PDF p. 17). Langlands's global base change is a lifting at every place, so at a split place the local component of the lift is the local component of π.
- [Hervé Jacquet and Robert P. Langlands, Automorphic forms on GL(2)](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), §12, Proposition 12.1, printed p. 206 (PDF p. 212). Quadratic automorphic induction has local components π(σ_v) at every place.

**Implementation status:** `unchecked`.

<a id="r17-5-octahedral-artin-all-places"></a>

### Octahedral Artin automorphy at every place

**Declaration:** `TauCeti.GL2Transfer.octahedral_artin_all_places`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`.

Let F be a number field and ρ: G_F → GL₂(C) continuous, irreducible, with projective image S₄, and let π be the cuspidal representation of R17.5/octahedral-artin (Tunnell's choice among the two quadratic descents of the tetrahedral representation of ρ|_{G_E}, E/F the quadratic field of the preimage of A₄). Then π_v ≅ π(ρ_v) at every place v of F. At a real place v that is complex in E, ρ(c_v) is a non-scalar involution (its projective image is a transposition), ρ_v = 1⊕sgn and π_v is the weight-one limit π(1, sgn); at real places split in E and at complex places the component is read off from the tetrahedral representation over E.

**Hypotheses.**

- F is a number field; ρ: G_F → GL₂(C) is continuous and irreducible with projective image S₄.
- E/F is the quadratic extension cut out by the preimage of A₄; ρ_E = ρ|_{G_E} has projective image A₄; π_E is its tetrahedral cuspidal representation (tetrahedral-artin-all-places over E).
- π is the quadratic descent of π_E singled out by Tunnell's lemma in R17.5/octahedral-artin, with π_v ≅ π(ρ_v) for almost all v.

**Construction or proof.**

1. Central character. As in artin-all-place-upgrade, ω_π = det ρ, since both agree at almost all places.
2. Archimedean v split in E, and complex v: for w | v, E_w = F_v and BC_{E/F}(π)_w ≅ π_v (R17.4/cyclic-base-change); BC_{E/F}(π) ≅ π_E because π is a quadratic descent of π_E, which matches ρ_E at every place of E by tetrahedral-artin-all-places applied over E; so π_v ≅ π(ρ_v).
3. Real v with E_w = C: ρ(c_v) lies outside the preimage of A₄, so its projective image is an odd involution of S₄, a transposition; hence ρ(c_v) is a non-scalar involution, det ρ(c_v) = −1 and ρ_v = 1⊕sgn. By R17.4/local-compatibility the parameter φ of π_v restricts to W_C as the parameter of BC_{E/F}(π)_w = π_{E,w} = π(1, 1), so φ is trivial on C^× and φ ∈ {1⊕1, 1⊕sgn, sgn⊕sgn}. Its determinant is ω_{π_v} = det ρ_v, which is sgn; only 1⊕sgn has determinant sgn, so π_v ≅ π(1, sgn) = π(ρ_v).
4. Finite places: artin-all-place-upgrade with the archimedean matching just proved.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/cyclic-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4/local-compatibility`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/artin-all-place-upgrade`, `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For F = Q and ρ = s∘r̄ with r̄: G_Q → GL₂(F₃) odd and surjective (R17.5/octahedral-mod-three-application), E is the quadratic field cut out by det r̄, which is imaginary because det r̄(c) = −1; the real place is complex in E and π_∞ is the weight-one limit π(1, sgn).
- The two descents π₁ and π₂ = π₁⊗ω_{E/F} have the same central character and the same base change to E; at a real place complex in E they have the same archimedean component as well (twisting by ω_{E/F} sends π(1, sgn) to π(sgn, 1) ≅ π(1, sgn)), so archimedean matching does not choose between them: Tunnell's cubic comparison does.
- The archimedean step uses only the quadratic descent and the central character; Tunnell's cubic comparison and the upgrade are still needed at the finite places.

**Sources.**

- [Jerrold Tunnell, Artin's conjecture for representations of octahedral type](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), p. 174, Lemma and Theorem with their proofs; p. 175. Tunnell chooses one of the two descents of the tetrahedral representation by comparing cubic base changes and proves matching at almost all places.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §3(ii), octahedral type, DMA text p. 19 (PDF p. 22). Langlands sets up the two candidates as quadratic descents of the tetrahedral representation over E.
- [Robert P. Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), §2, properties A)–C) of global liftings, DMA text p. 14 (PDF p. 17). Base change is a lifting at every place, including archimedean ones, which is the input of the archimedean comparison.

**Implementation status:** `unchecked`.

<a id="r17-5-brauer-character"></a>

### The Brauer character of a modular representation

**Declaration:** `TauCeti.GL2Transfer.brauerCharacter`; construction; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`.

Let Γ be a finite group, p a prime, k an algebraically closed field of characteristic p, m ≥ 1 an integer prime to p that is divisible by the order of every p-regular element of Γ (for instance the prime-to-p part of the exponent of Γ), and τ: μ_m(k) → μ_m(C) a group isomorphism. For a representation r: Γ → GL_n(k) and a p-regular g ∈ Γ (order prime to p), r(g) is diagonalisable and its eigenvalues λ₁, …, λ_n, counted with algebraic multiplicity, lie in μ_m(k). The Brauer character of r is the complex-valued function on the p-regular elements φ_r(g) = τ(λ₁) + … + τ(λ_n). It depends on τ, is defined only on p-regular elements, and is not a lift of the trace of r(g) ∈ k (Webb's Example 10.1.2 has trace 1 and Brauer character −1). For a representation over a subfield k₀ ⊂ k (for example a finite field) one takes the Brauer character of its extension of scalars to k.

**Hypotheses.**

- Γ is a finite group and p is prime; k is algebraically closed of characteristic p.
- m is prime to p and divisible by the order of every p-regular element of Γ; τ: μ_m(k) ≅ μ_m(C) is an isomorphism of cyclic groups of order m.
- r: Γ → GL_n(k) is a group homomorphism (equivalently a finite-dimensional kΓ-module with a basis); φ_r is defined on {g ∈ Γ : gcd(ord g, p) = 1}.

**Construction or proof.**

1. For g p-regular, r(g)^{ord g} = 1 and ord g is prime to p, so X^{ord g} − 1 is separable over k; r(g) is diagonalisable with eigenvalues in μ_{ord g}(k) ⊂ μ_m(k) (Webb §10.1, before Example 10.1.2).
2. Define φ_r(g) as the sum of τ over the roots of the characteristic polynomial of r(g), with multiplicity; this is independent of any ordering and of the basis.
3. For a p-modular system (F, R, k) with F of characteristic zero containing μ_m, reduction modulo the maximal ideal is an isomorphism μ_m(R) → μ_m(k) (Webb Lemma 10.1.1; R01.1/reduction-of-roots-of-unity proves it for the algebraic closure of Q_p); choosing τ as the composite of its inverse with an embedding F → C makes the Brauer character of a reduced lattice equal to the ordinary character (API brauerCharacter_reduction).

**Consumers determining the API.**

- Isaacs, Lifting Brauer characters of p-solvable groups, §1 and Theorem 5.4: the Fong–Swan theorem is a statement about lifting irreducible Brauer characters to ordinary characters, χ* = φ.
- Webb, §10.2, Theorem 10.2.2 and Corollary 10.2.3: simple Brauer characters are linearly independent, and equal Brauer characters mean equal composition factors.
- R17.5/solvable-integral-lift and R17.5/odd-solvable-residual-lift: the reduction of a lattice in a lift of φ is identified with the residual representation by comparing Brauer characters.
- KTheoryFiniteLocalFields:L.1/brauer-character (Quillen's Brauer lift): the same notion over finite fields; that roadmap is not in the upstream chain of this one, so the definition moves down to here and that layer imports it.

**API.**

- `TauCeti.GL2Transfer.brauerCharacter` (data): The function on p-regular elements g ↦ Σ τ(λᵢ), the sum over the eigenvalues of r(g) with algebraic multiplicity, for fixed p, m, τ.
- `TauCeti.GL2Transfer.brauerCharacter_spectrum` (characterisation): If the characteristic polynomial of r(g) is ∏ᵢ (X − aᵢ) with aᵢ ∈ μ_m(k), then φ_r(g) = Σᵢ τ(aᵢ).
- `TauCeti.GL2Transfer.brauerCharacter_one` (simp): φ_r(1) = n, the dimension, as a complex number (Webb 10.1.3(1)).
- `TauCeti.GL2Transfer.brauerCharacter_conjugate` (structure): φ_r(xgx⁻¹) = φ_r(g) for all x ∈ Γ: a class function on p-regular classes (Webb 10.1.3(2)).
- `TauCeti.GL2Transfer.brauerCharacter_conj_equiv` (characterisation): If r′(g) = P r(g) P⁻¹ for a fixed P ∈ GL_n(k), then φ_{r′} = φ_r: the Brauer character depends only on the isomorphism class.
- `TauCeti.GL2Transfer.brauerCharacter_inv` (relation): φ_r(g⁻¹) is the complex conjugate of φ_r(g) and equals the Brauer character of the dual representation at g (Webb 10.1.3(3)).
- `TauCeti.GL2Transfer.brauerCharacter_tensor` (relation): The Brauer character of the tensor product (Kronecker product of matrices) is the product φ_r·φ_{r′} (Webb 10.1.3(4)).
- `TauCeti.GL2Transfer.brauerCharacter_blockTriangular` (relation): If r is block upper triangular with diagonal blocks r₁ and r₂, then φ_r = φ_{r₁} + φ_{r₂}; hence φ is additive in short exact sequences and depends only on composition factors with multiplicity (Webb 10.1.3(5)).
- `TauCeti.GL2Transfer.brauerCharacter_reduction` (compatibility): Let R be a domain, f: R → k a ring map and σ: R → C an injective ring map with τ(f(ζ)) = σ(ζ) for every ζ ∈ μ_m(R). For ρ: Γ → GL_n(R) and p-regular g, the Brauer character of f∘ρ at g equals σ(tr ρ(g)), the ordinary character (Webb 10.1.3(6)).
- `TauCeti.GL2Transfer.brauerCharacter_mapField` (compatibility): For an embedding of algebraically closed fields k → k′ and τ′ restricting to τ, the Brauer character of the extended representation equals φ_r.

**Unit tests.**

- `TauCeti.GL2Transfer.brauerCharacter_rank_one_test` (computation): For n = 1 and r(g) = a ∈ μ_m(k), φ_r(g) = τ(a).
- `TauCeti.GL2Transfer.brauerCharacter_cube_root_test` (non-example): For g of order 3 acting with eigenvalues a and a² where τ(a) is a primitive cube root of unity (for instance the F₂-matrix with rows (0, 1) and (1, 1)), φ_r(g) = −1, although the trace of r(g) in characteristic 2 is 1; lifting the trace would give the wrong value.
- `TauCeti.GL2Transfer.brauerCharacter_identity_rank_p_test` (degenerate): The trivial representation of rank p has φ(1) = p ≠ 0 in C, although its trace in k is 0: the Brauer character remembers the dimension.
- `TauCeti.GL2Transfer.brauerCharacter_sign_reduction_test` (compatibility): For Γ of order 2, p = 3 and the sign representation over Z reduced to F₃, the Brauer character at the generator is −1, the value of the ordinary character.

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.charpoly`, `mathlib:rootsOfUnity`, `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The listed tests hold, and the API items listed above are consistent with Webb Proposition 10.1.3 (1)–(6).
- brauerCharacter agrees with the ordinary character of any integral lift on p-regular elements, which is the property used by brauer-character-recognition and fong-swan.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, definition of φ_U after Lemma 10.1.1, and Example 10.1.2, printed p. 170 (PDF p. 177). Webb defines the Brauer character by lifting the eigenvalues of a p-regular element through the reduction isomorphism of prime-to-p roots of unity and summing; his example over F₂ with a matrix of order 3 has trace 1 but Brauer character −1.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, Lemma 10.1.1, printed p. 170 (PDF p. 177). Reduction modulo the maximal ideal of a p-modular system is an isomorphism on prime-to-p roots of unity.
- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §1, introduction and Definition 1.1, printed p. 171 (PDF p. 2). Isaacs's IBr(G) is the set of irreducible Brauer characters, defined after fixing a lift of the characteristic-p roots of unity of order prime to p to complex roots of unity; χ* denotes an ordinary character restricted to the p-regular elements.

**Implementation status:** `unchecked`.

<a id="r17-5-brauer-character-recognition"></a>

### Brauer characters determine composition factors

**Declaration:** `TauCeti.GL2Transfer.brauerCharacter_recognition`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`.

Let Γ be finite, k algebraically closed of characteristic p, and φ the Brauer character for a fixed τ. (a) The Brauer characters of the simple kΓ-modules S₁, …, S_r are linearly independent over C and form a basis of the class functions on p-regular conjugacy classes; the Brauer characters of their projective covers P_{S₁}, …, P_{S_r} form the dual basis for the pairing ⟨α, β⟩ = |Γ|⁻¹ Σ_{g p-regular} α(g⁻¹)β(g), with ⟨φ_{P_{S_i}}, φ_{S_j}⟩ = δ_{ij}. (b) Two finite-dimensional kΓ-modules have the same Brauer character if and only if they have the same composition factors with the same multiplicities; in particular a module whose Brauer character equals that of a simple module S is isomorphic to S. (c) Let (F, R, k₀) be a p-modular system with F of characteristic zero containing the m-th roots of unity, uniformiser ϖ, k₀ ⊂ k, and τ compatible with reduction of roots of unity and an embedding F → C. For a full RΓ-lattice L in an FΓ-module V, the Brauer character of (L/ϖL) ⊗_{k₀} k is the ordinary character of V restricted to p-regular elements; different full lattices give reductions with the same composition factors (Brauer–Nesbitt).

**Hypotheses.**

- Γ finite; k algebraically closed of characteristic p (a splitting field for Γ); τ as in R17.5/brauer-character.
- In (c): R is a discrete valuation ring with uniformiser ϖ, fraction field F of characteristic zero containing μ_m, and residue field k₀ ⊂ k; τ(ζ mod ϖ) = σ(ζ) for ζ ∈ μ_m(R) and a fixed embedding σ: F → C.

**Construction or proof.**

1. (c) For p-regular g, the eigenvalues of g on V lie in μ_m(F) ⊂ R and reduce to the eigenvalues on L/ϖL, so the two sums agree under τ (Webb Proposition 10.1.3(6) with Lemma 10.1.1). Brauer–Nesbitt for lattices (Webb Theorem 9.4.8; R01.1/brauer-nesbitt for the characteristic-polynomial form) gives the independence of the lattice.
2. (a) Each P_{S_i} has S_i as unique simple quotient, so dim Hom_{kΓ}(P_{S_i}, S_j) = δ_{ij} since k is a splitting field; this Hom dimension is computed by the pairing of Brauer characters (Webb Proposition 10.2.1, p. 174). The number of simple modules equals the number of p-regular classes (Brauer), so the two families are dual bases (Webb Theorem 10.2.2). Projective covers of finite-dimensional algebras and the Cartan map come from Tau Ceti's GrothendieckEulerForms, Layer 4.
3. (b) Brauer characters are additive in short exact sequences (R17.5/brauer-character, API brauerCharacter_blockTriangular), so φ_U = Σ_S [U : S] φ_S; by (a) the multiplicities [U : S] are determined by φ_U (Webb Corollary 10.2.3(3)). If φ_U = φ_S for simple S, U has a single composition factor S and so U ≅ S.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`, `ArithmeticGaloisRepresentations:R01.1/reduction-of-roots-of-unity`, `ArithmeticGaloisRepresentations:R01.1/semisimplification`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Webb's Example 10.1.2: the two-dimensional F₂C₃-module U (simple over F₂) becomes, over k, the sum of the two nontrivial characters; its Brauer character at the generator is −1, while two trivial factors give 2 and a trivial plus a nontrivial factor give 1 + ζ with ζ a primitive cube root of unity, so the composition factors are read off from the value.
- In characteristic p, the regular representation of a cyclic p-group has the same Brauer character (|Γ| at 1) as |Γ| copies of the trivial module but is not semisimple: (b) determines composition factors, not the module.
- (c) for Γ of order prime to p recovers the bijection between simple modules in characteristic zero and in characteristic p (Webb Theorem 9.4.11, p. 155).

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.1, Proposition 10.1.3 (5)–(6), printed pp. 170–171 (PDF pp. 177–178). Brauer characters are additive in short exact sequences, depend only on composition factors, and equal the ordinary character of a lift on p-regular elements.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.2, Theorem 10.2.2, printed p. 176 (PDF p. 183). With k a splitting field, the Brauer characters of the simple modules and of their projective covers form dual bases of the p-regular class functions.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §10.2, Corollary 10.2.3 (3), printed p. 177 (PDF p. 184). Two modules have the same composition factors exactly when their Brauer characters are equal.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.8 (Brauer–Nesbitt), printed p. 153 (PDF p. 160). Reductions of two full lattices in the same FG-module have the same composition factors.

**Implementation status:** `unchecked`.

<a id="r17-5-fong-swan"></a>

### The Fong–Swan theorem

**Declaration:** `TauCeti.GL2Transfer.fong_swan`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/fong-swan`.

Let Γ be a finite p-solvable group (in particular any finite solvable group), k an algebraically closed field of characteristic p, and τ as in R17.5/brauer-character. Every irreducible Brauer character φ of Γ is the restriction to p-regular elements of an irreducible ordinary character: there is a complex irreducible representation with character χ such that χ(g) = φ(g) for every p-regular g. Equivalently (module form): for any splitting p-modular system (F, R, k₀) for Γ, every simple k₀Γ-module is the reduction modulo π of an RΓ-lattice. Isaacs's proof gives a p-rational χ (values in a cyclotomic field of conductor prime to p); for p odd this p-rational lift is unique. The theorem fails for groups that are not p-solvable (it is a property of p-solvable groups, not of all finite groups).

**Hypotheses.**

- Γ is finite and p-solvable: it has a normal series whose factors are p-groups or p′-groups; finite solvable groups qualify.
- k is algebraically closed of characteristic p; Brauer characters are taken with respect to τ.
- Module form: (F, R, k₀) is a p-modular system in which F and k₀ are splitting fields for Γ (Webb §9.4).

**Construction or proof.**

1. Character form, by induction on |Γ| (Isaacs Theorem 5.4). Case 1: some characteristic subgroup N has a number of distinct irreducible Brauer constituents of φ_N divisible by p. For such a constituent μ the inertia group T is proper; Clifford theory for Brauer characters (Isaacs Lemma 5.1) gives ϑ ∈ IBr(T) whose induced Brauer character is φ; the induction hypothesis lifts ϑ to an ordinary character η of T, and the character induced from η is an irreducible lift of φ.
2. Case 2: no such N. For a proper characteristic M and a constituent μ of φ_M, induction gives a p-rational lift θ of μ with p ∤ θ(1), whose number of Γ-conjugates is prime to p. If O^p(Γ) is proper, take M = O^p(Γ): θ is Γ-invariant, Gallagher's theorem (Isaacs Theorem 4.2) extends it uniquely to χ with p ∤ o(χ), and Isaacs Lemma 4.1 gives χ* = φ. If O^p(Γ) = Γ, then M = O^{p′}(Γ) is proper with Γ/M a p′-group, and Isaacs Theorem 3.1 gives a unique constituent χ of the induced character of θ with χ* = φ. p-solvability guarantees that one of O^p(Γ), O^{p′}(Γ) is proper.
3. Module form from the character form: realise χ over F (a splitting field), take a full RΓ-lattice L in the realisation (Webb Corollary 9.4.7: span of the Γ-translates of a basis); by brauer-character-recognition (c) the Brauer character of L/πL is χ* = φ, and by (b) L/πL ≅ S.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/clifford-isotypic-decomposition`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup`, `mathlib:Group.IsSolvable`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- The two-dimensional simple module of S₃ in characteristic 2 lifts to the reflection representation of S₃, although 2 divides |S₃|.
- For Γ of order prime to p the theorem is the classical bijection between simple modules in characteristic zero and characteristic p (Webb Theorem 9.4.11, p. 155), and every lift is unique.
- For a cyclic p-group the only irreducible Brauer character is trivial, and its lifts are all p-power-order characters; for p odd the p-rational one is the trivial character, illustrating Isaacs's uniqueness.
- p-solvability cannot be dropped: A₅ ≅ SL₂(F₄) has a two-dimensional irreducible Brauer character at p = 2 (its natural representation), but no irreducible complex character of degree 2.

**Sources.**

- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §5, Theorem 5.4 and its proof, printed pp. 179–180 (PDF pp. 10–11); §6, printed pp. 180–181. Isaacs proves by induction on the group order that every irreducible Brauer character of a p-solvable group has a p-rational ordinary lift, giving a proof of the Fong–Swan theorem valid for every prime, using his Lemma 5.1, Theorem 3.1, Lemma 4.1 and Gallagher's Theorem 4.2.
- [I. M. Isaacs, Lifting Brauer characters of p-solvable groups](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), §1, Theorem 1.2, printed p. 171 (PDF p. 2). For p ≠ 2 the p-rational lift is unique; Isaacs quotes the Fong–Swan theorem itself from Curtis–Reiner's book (their Theorem 72.1).
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12 (Fong, Swan, Rukolaine), printed p. 156 (PDF p. 163). Webb states the module form for a splitting p-modular system and a p-solvable group, without proof.

**Atlas planet:** Fong–Swan theorem.

**Implementation status:** `unchecked`.

<a id="r17-5-solvable-integral-lift"></a>

### Integral lifts of representations of finite solvable groups

**Declaration:** `TauCeti.GL2Transfer.solvable_finite_image_integral_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-integral-lift`.

Let p be prime, Γ a finite solvable group, k an algebraically closed field of characteristic p and r: Γ → GL_n(k) an irreducible representation. There exist a number field E, a height-one prime λ of O_E above p, the localisation R = (O_E)_λ (a discrete valuation ring), a ring homomorphism f: R → k with kernel λR, a group homomorphism ρ: Γ → GL_n(R) and P ∈ GL_n(k) such that r(g) = P·f(ρ(g))·P⁻¹ for every g ∈ Γ. One may take E to contain the e-th roots of unity, e the exponent of Γ. If r is injective so is ρ, and in general ker ρ = ker r. The reduction is isomorphic to r itself, not only after semisimplification; neither p ∤ |Γ| nor n = 2 is assumed.

**Hypotheses.**

- p is prime; Γ is a finite solvable group; k is algebraically closed of characteristic p.
- r: Γ → GL_n(k) is a homomorphism whose representation on kⁿ is irreducible (equivalently absolutely irreducible, as k is algebraically closed).

**Construction or proof.**

1. Descend r to a finite field: its finitely many matrix entries generate a finite subfield k₀ ⊂ k (R01.1/residual-descent-to-a-finite-field); enlarge k₀ = F_q so that it contains the prime-to-p roots of unity of order dividing e, making it a splitting field for Γ in characteristic p (Brauer; Webb Theorem 9.2.7, read with the prime-to-p part of e, see E18). The k₀Γ-module S₀ = k₀ⁿ is simple and S₀ ⊗ k ≅ r.
2. Take E = Q(ζ_{e(q−1)}) and λ a prime above p. E contains μ_e, so it is a splitting field for Γ in characteristic zero (Webb Theorem 9.2.7); the residue field κ(λ) contains F_p(ζ_{q−1}) = F_q, and contains the unique copy of k₀. R = (O_E)_λ is a discrete valuation ring, so (E, R, κ(λ)) is a splitting p-modular system.
3. fong-swan (module form) gives an RΓ-lattice L with L/λL ≅ S₀ ⊗_{k₀} κ(λ). L is finitely generated and torsion-free over the discrete valuation ring R, hence free of rank n (Webb Lemma 9.4.6, Corollary 9.4.7); a basis gives ρ: Γ → GL_n(R).
4. Choose f: R → κ(λ) → k extending the given inclusion k₀ ⊂ k (possible since k is algebraically closed and κ(λ) is a finite extension of k₀). Then f∘ρ ≅ S₀ ⊗ k ≅ r, which gives P. If ρ(g) = 1 then r(g) = P·P⁻¹ = 1, so ker ρ ⊂ ker r. Running the construction for the faithful representation of the solvable quotient Γ/ker r and composing with the quotient map gives ρ with ker ρ = ker r; in particular ρ is injective when r is.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/fong-swan`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/residual-descent-to-a-finite-field`, `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Localization.AtPrime`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Representation.IsIrreducible`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Γ = S₃, p = 2, r the two-dimensional simple module: the lift is the reflection representation over Z[ζ₃] localised at 2, whose reduction is r.
- Γ = GL₂(F₃), p = 3, r the identity representation over F₃ ⊂ F̄₃: a lift is the section into GL₂(Z[√−2]) of R17.5/octahedral-mod-three-application, with λ = (1 + √−2).
- For Γ of order prime to p and n = 1 the lift is the Teichmüller lift of a character (R01.1/teichmuller-lift-of-a-residual-character).
- Changing the basis of L changes P; entrywise equality r(g) = f(ρ(g)) is not part of the statement.

**Sources.**

- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.2, Theorem 9.2.7 (Brauer), printed p. 144 (PDF p. 151). A field containing enough roots of unity is a splitting field; Webb applies it to Q(ζ_m) and to the corresponding extension of F_p.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Lemma 9.4.6 and Corollary 9.4.7, printed pp. 152–153 (PDF pp. 159–160). A finitely generated R-submodule containing a basis is a full lattice, and every FG-module over a principal ideal domain has an RG-lattice that is an R-form.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12, printed p. 156 (PDF p. 163). Simple modules of p-solvable groups over a splitting p-modular system are reductions of lattices.
- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Boxer–Calegari–Gee–Pilloni need a characteristic-zero lift with finite solvable image of a mod-p representation with solvable image; this theorem supplies it with a lattice and the actual reduction.

**Implementation status:** `unchecked`.

<a id="r17-5-involution-oddness-under-reduction"></a>

### Reduction at an odd prime detects the determinant of an involution

**Declaration:** `TauCeti.GL2Transfer.involution_odd_of_residual_conjugacy`; lemma; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/involution-oddness-under-reduction`.

Let R be a commutative ring without zero divisors, k a field in which 2 ≠ 0, f: R → k a ring homomorphism and A ∈ GL₂(R) with A² = 1. If det f(A) = −1 then det A = −1. The same holds if only B = P·f(A)·P⁻¹ with det B = −1 is known, for some P ∈ GL₂(k). Consequently, for a homomorphism ρ: G → GL₂(R), an element c ∈ G with c² = 1 and a residual representation r̄ = P·(f∘ρ)·P⁻¹ with det r̄(c) = −1, one has det ρ(c) = −1. The hypothesis 2 ≠ 0 in k is necessary: in characteristic 2 the identity matrix has residual determinant 1 = −1 but integral determinant 1.

**Hypotheses.**

- R is a commutative ring with no zero divisors; k is a field with 2 ≠ 0; f: R → k is a ring homomorphism.
- A ∈ GL₂(R) satisfies A² = 1; P ∈ GL₂(k).

**Construction or proof.**

1. det(A)² = det(A²) = 1, so det A = ±1 in the domain R.
2. If det A = 1 then det f(A) = f(1) = 1, and 1 = −1 in k would force 2 = 0; hence det A = −1.
3. Conjugation by P does not change the determinant, which gives the residual-conjugacy form and the statement for ρ(c).

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`, `mathlib:Matrix.GeneralLinearGroup.map`, `mathlib:Matrix.GeneralLinearGroup.det`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- Over Z, diag(1, −1) reduced modulo 3 is odd, and the lemma recovers that its determinant is −1.
- The scalar matrix −I has determinant +1 in rank two, so a scalar involution is never odd.
- Modulo 2 the identity matrix has residual determinant −1 = 1 while its determinant over Z is 1: the lemma fails without 2 ≠ 0.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). The proof requires the characteristic-zero lift of a totally odd residual representation to be totally odd; for p > 2 this is the present lemma at each complex conjugation.
- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, proof of Theorem 1.3, p. 3. Dieulefait and Pacetti need the lift of an odd mod-p representation (p odd) to be odd.

**Implementation status:** `unchecked`.

<a id="r17-5-odd-solvable-residual-lift"></a>

### Characteristic-zero lifts of residual representations with solvable image

**Declaration:** `TauCeti.GL2Transfer.odd_solvable_residual_lift`; theorem; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`.

Let F be a number field, p a prime, k = F̄_p (or any algebraically closed field of characteristic p, with the discrete topology) and r̄: G_F → GL_n(k) a continuous absolutely irreducible representation whose image is solvable. There exist a number field E, a prime λ of E above p, R = (O_E)_λ, f: R → k with kernel λR, a homomorphism ρ: G_F → GL_n(R) with open kernel (so continuous for the discrete and for the λ-adic topology on GL_n(R)) and P ∈ GL_n(k) with r̄(g) = P·f(ρ(g))·P⁻¹ for all g ∈ G_F, such that: ker ρ = ker r̄ (so ρ has finite image isomorphic to that of r̄, cuts out the same field, and is unramified at every place where r̄ is); for every embedding E → C, ρ is irreducible over C; its image, and so its projective image, is solvable. If n = 2, p > 2 and r̄ is totally odd (det r̄(c_v) = −1 for every complex conjugation c_v at a real place v), then ρ is totally odd. This strengthens R17.5/odd-residual-lift: the reduction is r̄ itself, not only its semisimplification; F need not be totally real for the lifting part; and no projective lifting, Tate vanishing or Teichmüller twist is used. For p = 2 the oddness clause fails; the characteristic-two case is planned in layer R17.6 of this roadmap.

**Hypotheses.**

- F is a number field; p is prime; k is algebraically closed of characteristic p, with the discrete topology.
- r̄: G_F → GL_n(k) is continuous, absolutely irreducible, and r̄(G_F) is a solvable group.
- Oddness clause: n = 2, p > 2, and det r̄(c_v) = −1 for the complex conjugations c_v at all real places v.

**Construction or proof.**

1. Continuity with discrete coefficients means ker r̄ is open and Γ = r̄(G_F) is finite (R01.1/finite-coefficients-and-finite-quotients).
2. Apply solvable-integral-lift to the inclusion Γ ⊂ GL_n(k), irreducible because r̄ is: this gives E, λ, R, f, an injective ρ_Γ: Γ → GL_n(R) and P. Put ρ = ρ_Γ ∘ r̄; then ker ρ = ker r̄ is open, so ρ is continuous, and r̄ = P·(f∘ρ)·P⁻¹.
3. Irreducibility over C: if ρ ⊗ C had a proper invariant subspace W, its character would be χ_W + χ_{W′} with both summands characters of nonzero representations; realising them over a finite extension of E and reducing lattices, brauer-character-recognition (c) would give r̄ at least two composition factors, contradicting (b) and the simplicity of r̄.
4. Oddness: for each real v, c_v² = 1; involution-oddness-under-reduction with the residual comparison P gives det ρ(c_v) = −1.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-integral-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/involution-oddness-under-reduction`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/brauer-character-recognition`, `ArithmeticGaloisRepresentations:R01.1/finite-coefficients-and-finite-quotients`, `ArithmeticGaloisRepresentations:R01.1/absolutely-irreducible`, `ArithmeticGaloisRepresentations:R01.1/artin-representations-have-finite-image`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For p = 3 and r̄: G_Q → GL₂(F₃) surjective and odd, one admissible lift is s∘r̄ with the section s of R17.5/octahedral-mod-three-application; the theorem produces some lift with the same kernel, not necessarily that one.
- For p = 2 and r̄ with dihedral image the lifting part holds but the oddness clause does not: every characteristic-two residual representation has det r̄(c) = 1 = −1.
- A residual representation with nonsolvable image, for example r̄ onto GL₂(F₅) ⊃ SL₂(F₅), is outside the statement; its finite lifts need not exist with the same kernel.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). The proof asserts the existence of a totally odd characteristic-zero lift with finite solvable image of a totally odd mod-p representation with solvable image, citing only the classification of finite subgroups and Tate's lifting theorem; see sourceIssues E16.
- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, Theorem 1.3 and its proof, p. 3. Dieulefait and Pacetti state that an odd irreducible mod-p representation of G_Q with solvable image (p odd) lifts to an odd representation into GL₂(C); see sourceIssues E17.
- [Peter Webb, A Course in Finite Group Representation Theory](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), §9.4, Theorem 9.4.12, printed p. 156 (PDF p. 163). The lattice form of Fong–Swan used for the lift.

**Implementation status:** `unchecked`.

<a id="r17-5-solvable-residual-modularity"></a>

### Residual representations with solvable image are automorphic of weight one

**Declaration:** `TauCeti.GL2Transfer.solvable_residual_modularity`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-residual-modularity`.

Let F be a number field, p an odd prime and r̄: G_F → GL₂(F̄_p) continuous and absolutely irreducible with solvable image, and let ρ, λ, f, P be the lift of R17.5/odd-solvable-residual-lift. There is a unique cuspidal automorphic representation π of GL₂(A_F) with π_v ≅ π(ρ_v) at every place v; it is unramified at every finite place where r̄ is unramified, its central character is det ρ, and the reduction of ρ along the lattice R² is r̄ (after conjugation by P). If F is totally real and r̄ is totally odd, then π is holomorphic of parallel weight one in Rogawski–Tunnell's sense: π_v is the weight-one limit π(1, sgn) at every real place. This is the residual modularity input of the solvable case of Boxer–Calegari–Gee–Pilloni, Proposition 10.1.3; it is R17.5/residual-lt-application with its lifting step proved. No statement about the level, ordinarity or a weight-two form is made here.

**Hypotheses.**

- F is a number field; p is an odd prime.
- r̄: G_F → GL₂(F̄_p) is continuous, absolutely irreducible, with solvable image; ρ, E, λ, R, f, P are as produced by odd-solvable-residual-lift.
- Weight-one clause: F totally real and det r̄(c_v) = −1 at every real place v; 'holomorphic of parallel weight one' is Rogawski–Tunnell's definition (R17.5/tr-weight-one).

**Construction or proof.**

1. ρ is irreducible with finite solvable image (odd-solvable-residual-lift), so R17.5/solvable-artin gives a cuspidal π matching ρ: in the dihedral case at every place (R17.5/dihedral-artin), in the tetrahedral and octahedral cases at every place by tetrahedral-artin-all-places and octahedral-artin-all-places. Uniqueness is strong multiplicity one (R16.4/strong-multiplicity-one).
2. Since ker ρ = ker r̄, ρ_v is unramified wherever r̄ is, so π_v is an unramified principal series there (R16.3/principal-series-parameter).
3. Weight one: at a real v, ρ(c_v) is an involution with det ρ(c_v) = −1 (oddness clause), hence non-scalar, ρ_v = 1⊕sgn and π_v ≅ π(1, sgn), which is Rogawski–Tunnell's π₁ (R17.5/tr-weight-one).

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/dihedral-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tr-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.4/strong-multiplicity-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- In BCGP's situation (p = 3 or 5, F a totally real quadratic extension of the base field, r̄ = ϱ with determinant the inverse cyclotomic character, solvable image), the output is a parallel weight one cuspidal π with r̄ as residual representation; their subsequent passage to an ordinary weight-two form, which they take from Barnet-Lamb–Gee–Geraghty, is a separate input not supplied here.
- If r̄ is even at some real place, the construction still gives π but its component there is π(1, 1) or π(sgn, sgn), not of weight one.
- For p = 2 the theorem is not stated: the oddness clause fails, and the characteristic-two case is planned in layer R17.6 of this roadmap.

**Sources.**

- [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 10.1.3, proof, solvable case, printed p. 474 (PDF p. 322). Boxer–Calegari–Gee–Pilloni deduce the modularity of a totally odd residual representation with solvable image over a totally real field from a finite odd lift and the theorems of Langlands and Tunnell.
- [J. D. Rogawski and J. B. Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), §1, definition (ii) of π₁ and Definition of 'holomorphic of weight k', printed p. 4 (PDF p. 5). Rogawski and Tunnell's notion of weight one: at the real places (all of them, for GL₂) the local components are the induced representation π₁ attached to the sign of the upper-left entry; that is the notion used here.

**Implementation status:** `unchecked`.

<a id="r17-5-q-solvable-residual-weight-one"></a>

### Odd residual representations of G_Q with solvable image come from weight-one newforms

**Declaration:** `TauCeti.GL2Transfer.q_solvable_residual_weight_one`; application; node `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-solvable-residual-weight-one`.

Let p be an odd prime and r̄: G_Q → GL₂(F̄_p) continuous, irreducible and odd (det r̄(c) = −1), with solvable image. Let ρ, λ, f, P be the lift of R17.5/odd-solvable-residual-lift (n = 2, F = Q). Then there is a normalised cuspidal newform g of weight one, level N = the Artin conductor of ρ and nebentypus det ρ (an odd Dirichlet character under reciprocity), with Galois representation ρ_g ≅ ρ; consequently the reduction of ρ_g along the lattice R² is isomorphic to r̄, and for every prime ℓ ∤ N, f(a_ℓ(g)) = tr r̄(Frob_ℓ) and f(det ρ(Frob_ℓ)) = det r̄(Frob_ℓ) (arithmetic Frobenius). The prime divisors of N are exactly the primes at which r̄ is ramified, p included when r̄ is ramified at p. This is Dieulefait–Pacetti's Theorem 1.3 (Langlands–Tunnell in odd characteristic), with the lifting step written out; N can exceed Serre's conductor of r̄, and no weight-two form is constructed here.

**Hypotheses.**

- p is an odd prime; r̄: G_Q → GL₂(F̄_p) is continuous and irreducible (hence absolutely irreducible, F̄_p being algebraically closed), odd, with solvable image.
- Frobenius elements are arithmetic, as in Deligne–Serre; det ρ is read as a Dirichlet character by class field theory.

**Construction or proof.**

1. odd-solvable-residual-lift gives ρ: G_Q → GL₂(R) ⊂ GL₂(C), irreducible, odd, with finite solvable image and ker ρ = ker r̄.
2. R17.5/solvable-artin with tetrahedral-artin-all-places and octahedral-artin-all-places gives a cuspidal π with π_v ≅ π(ρ_v) at every place; π_∞ is the weight-one limit because ρ is odd.
3. R17.5/q-weight-one (Weil–Langlands, Deligne–Serre Théorème 4.10) and R16.6/weight-one-classical-comparison give the normalised weight-one newform g of level N(ρ) and nebentypus det ρ with ρ_g ≅ ρ (Deligne–Serre Théorème 4.1 for the attached representation).
4. Reduction: ρ_g ≅ ρ and r̄ = P·(f∘ρ)·P⁻¹ give the trace and determinant congruences; as r̄ is absolutely irreducible, every stable lattice of ρ_g has reduction isomorphic to r̄ (R01.1/brauer-nesbitt). Ramification: ker ρ = ker r̄, and the Artin conductor exponent at ℓ is positive exactly when ρ is ramified at ℓ.

**Direct prerequisites.** `GL2AutomorphicRepresentationsAndTransfer:R17.5/odd-solvable-residual-lift`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/tetrahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/octahedral-artin-all-places`, `GL2AutomorphicRepresentationsAndTransfer:R17.5/q-weight-one`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/weight-one-classical-comparison`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`, `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

**Proposed library location.** `TauCeti/NumberTheory/Automorphic/GL2/Transfer`, namespace `TauCeti.GL2Transfer`.

**Acceptance checks.**

- For p = 3 and r̄ surjective onto GL₂(F₃), the theorem specialises to R17.5/octahedral-mod-three-application with some lift, not necessarily the section s used there.
- For a dihedral r̄ induced from a character of an imaginary quadratic field, g is a theta series of that field.
- An even r̄ (det r̄(c) = 1) is excluded: its lifts are even and do not come from holomorphic weight-one forms.

**Sources.**

- [Luis Dieulefait and Ariel Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), §1.1, Theorem 1.3 and its proof, p. 3. Dieulefait and Pacetti state that an odd irreducible mod-p representation of G_Q with solvable image, p odd, is modular, by lifting to an odd complex representation and applying Hecke, Langlands and Tunnell, which provide a weight-one form.
- [Pierre Deligne and Jean-Pierre Serre, Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), §4, Théorème 4.1, printed pp. 513–514, and Théorème 4.10 (Weil–Langlands), printed p. 516. Deligne and Serre attach an odd two-dimensional Artin representation to a weight-one eigenform and, conversely, show that an odd irreducible representation with entire twisted L-functions comes from a primitive weight-one form of level its conductor and nebentypus its determinant.

**Implementation status:** `unchecked`.

## Dependencies

Inside the roadmap, this part rests on R16.3 (the rank-two local correspondence and its twisted factors), R16.4 (generic local components and strong multiplicity one), R16.5 (functional equations and analytic properties of cuspidal L-functions), R16.6 (the weight-one dictionary over Q), R17.4 (cyclic base change at every place, and through the R17.3 part the GL₃ inputs proposed for R17.4a), and the R17.5 declarations of the R17.3 part. Across roadmaps it uses ArithmeticGaloisRepresentations R01.1 (finite images, descent to finite fields, absolute irreducibility, Brauer–Nesbitt, reduction of roots of unity, Clifford decomposition), R01.2 (local constants and local factors of induced representations) and R01.4 (Dickson's classification), AutomorphicLFunctionsAndLocalFactors AL.1 (Tate's local and global theory, Hecke's functional equation) and AutomorphicFormsOnReductiveGroups AF.1 (the archimedean correspondence). All of these sit below this roadmap in the upstream order.

Tau Ceti layers, each with a request in the packet:

- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters` — Hecke quasi-characters as continuous characters of the idele class group C_F, their local components at finite places, conductor exponents, and extension of a character from a closed subgroup of the idele group (Pontryagin duality for the locally compact abelian group A_F^×), as used in Jacquet–Langlands Lemma 12.5. Needed by: `R17.5/isolating-twist-character`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-7-congruence-subgroups-and-the-ray-class-dictionary` — The principal unit subgroups 1 + 𝔭_v^m of F_v^× and the open subgroups of the idele group they generate, with the closedness of F^×A for A a product of such subgroups outside a finite set. Needed by: `R17.5/isolating-twist-character`.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences` — Density of F^× in ∏_{v ∈ T} F_v^× for a finite set T of places, so that a Hecke character trivial on F_v^× for all v ∉ T is trivial. Needed by: `R17.5/artin-all-place-upgrade`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction` — Brauer's induction theorem: every complex character of a finite group is a Z-linear combination of characters induced from linear characters of (elementary) subgroups, with the projection formula for induction and twisting. Needed by: `R17.5/artin-twisted-functional-equation`.
- `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup` — Clifford theory over a normal subgroup (restriction to N is a sum of conjugates, inertia groups, induction from the inertia group), in the form Isaacs adapts to Brauer characters in his Lemma 5.1. Needed by: `R17.5/fong-swan`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` — Global reciprocity C_F ≅ W_F^{ab}, compatible with local reciprocity at every place and with norms, to view quasi-characters of C_F as characters of W_F and θ·(ω∘N) as Hecke characters of the intermediate fields. Needed by: `R17.5/artin-twisted-functional-equation`.
- `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-4-finite-dimensional-algebras-and-the-cartan-map` — Projective covers of the simple modules of a finite-dimensional algebra over a splitting field, uniqueness of projective covers, dim Hom(P_S, T) = δ_{ST}, and the Cartan map, applied to group algebras kΓ. Needed by: `R17.5/brauer-character-recognition`.
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor` — Classical newform theory over Q in weight one: primitive forms, their level and nebentypus, normalised Hecke eigenvalues. Needed by: `R17.5/q-solvable-residual-weight-one`.

Same-roadmap stage edges declared for the maintainer (promotion draws only cross-roadmap edges):

- `R16.3` → `R17.5`: R17.5/artin-all-place-upgrade compares local components through the rank-two local correspondence and its twisted factors (principal series, Steinberg, supercuspidal, archimedean).
- `R16.4` → `R17.5`: Generic local components of cuspidal representations and strong multiplicity one (R16.4/global-whittaker-expansion, R16.4/strong-multiplicity-one).
- `R16.5` → `R17.5`: RT-AREA-automorphic-1/11: the functional equation of twisted cuspidal L-functions in the global normalisation (R16.5/global-epsilon-normalization).
- `R16.6` → `R17.5`: RT-AREA-automorphic-1/11: the weight-one classical dictionary over Q (R16.6/weight-one-classical-comparison).

## Gaps of the R17.3 part closed here

- *All-place upgrade of tetrahedral and octahedral Artin automorphy* (packet `GL2AutomorphicRepresentationsAndTransfer--R17.3`): closed by `R17.5/artin-all-place-upgrade`, `R17.5/tetrahedral-artin-all-places`, `R17.5/octahedral-artin-all-places`.
- *Reduction-compatible lift of a finite solvable projective image (p>2)* (packet `GL2AutomorphicRepresentationsAndTransfer--R17.3`): closed by `R17.5/fong-swan`, `R17.5/solvable-integral-lift`, `R17.5/odd-solvable-residual-lift`.

Two declarations of the R17.3 part are superseded:

- `R17.5/odd-residual-lift` → `R17.5/odd-solvable-residual-lift`. Weaker hypotheses (F need not be totally real; any rank and any p for the lifting part, p > 2 only for oddness) and a stronger conclusion (reduction isomorphic to r̄, same kernel), proved by Fong–Swan without the unproved reduction-compatible lift of the projective image.
- `R17.5/residual-lt-application` → `R17.5/solvable-residual-modularity`. Same conclusion for totally real F and p > 2, now with a closed lifting step and all-place matching.

## Mistakes found in the sources

- **GL2AutomorphicRepresentationsAndTransfer/E16** (gap; George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, Proposition 10.1.3, proof, second paragraph (solvable case), printed p. 474 of the published IHÉS version). In the solvable case the proof obtains a totally odd lift to characteristic zero with finite solvable image of the representation ϱ of G_E (E a totally real quadratic extension of the base field), using only the list of finite subgroups of GL₂ over finite fields and Tate's projective lifting theorem (their reference Ser77, Theorem 4), and then invokes Langlands and Tunnell. Correction: Tate's theorem lifts a projective representation into PGL₂(C) to GL₂(C) but says nothing about reduction modulo a prime above p; the argument needs a lift whose reduction is ϱ itself. The Fong–Swan theorem for the finite solvable image of ϱ provides such a lift over the localisation of a number field at a prime above p, with the same kernel as ϱ, and total oddness follows because p > 2 (R17.5/solvable-integral-lift, R17.5/odd-solvable-residual-lift). Reason: Reduction of the Tate lift is defined only after embedding the finite projective image into PGL₂ of a p-adic ring compatibly with reduction, which the proof does not construct; for p dividing the order of the image (p = 3 with image A₄ or S₄, the case of the proposition with p = 3) no prime-to-p averaging argument is available. The conclusion of the proposition is correct. Affects: the proof. Known: new.
- **GL2AutomorphicRepresentationsAndTransfer/E17** (gap; Luis Dieulefait and Ariel Pacetti, *A simplified proof of Serre's conjecture*, §1.1, proof of Theorem 1.3, p. 3 of arXiv:2108.07577v2). After the subgroup classification, the proof asserts without argument the existence of an odd complex lift of the residual representation in each solvable case, then appeals to Hecke, Langlands and Tunnell for a weight-one form. Correction: To conclude that the residual representation is modular one needs an odd complex lift whose reduction at a prime above p is the given residual representation; this is supplied by the Fong–Swan theorem (R17.5/odd-solvable-residual-lift), not by an arbitrary lift. Reason: A complex lift of the projective representation can have a reduction that differs from the residual representation, or no natural reduction at all, unless it is built from an integral model reducing to it. Affects: the proof. Known: new.
- **GL2AutomorphicRepresentationsAndTransfer/E18** (error; Peter Webb, *A Course in Finite Group Representation Theory*, §9.2, remarks after Theorem 9.2.7, printed p. 144, and the paragraph introducing p-modular systems in §9.4, printed p. 148 (prepublication version of 23 February 2016)). With m the exponent of G, the remarks treat the extension of F_p by a primitive m-th root of unity as a splitting field and require primitive n-th roots of unity in any splitting field of a cyclic group of order n; the p. 148 paragraph transfers primitive m-th roots of unity from F to the residue field. Correction: In characteristic p the exponent m must be replaced by its prime-to-p part m′ (and n by its prime-to-p part): F_p(ζ_{m′}) is a splitting field, the residue field contains the primitive m′-th roots of unity, and a cyclic p-group has the prime field as splitting field. Reason: In characteristic p, x^{p^a b} − 1 = (x^b − 1)^{p^a}, so every root of unity has order prime to p and no primitive m-th root exists when p divides m; the only simple module of a p-group in characteristic p is trivial. Theorem 9.2.7 itself is correct, its hypothesis being unsatisfiable in characteristic p when p divides the exponent. Affects: nothing. Known: new.

## Restructuring and ownership

- **split** (GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors). RT-AREA-automorphic-1/1 (handed to this job): the tetrahedral and octahedral cases rest on GL₃ inputs (adjoint lift, cyclic cubic induction, GL₃ recognition, non-normal cubic base change) that R17.4's cyclic base change does not supply. R17.3's packet already proposes R17.4a for them and AL.3b for the GL_n converse; the R17.5 nodes of this packet add no GL₃ input: the all-place upgrade uses only GL₂ local theory, Hecke–Artin functional equations and Jacquet–Langlands's isolating twist. Proposal: Keep R17.3's proposal: R17.4a 'Non-normal cubic base change and the Gelbart–Jacquet lift' between R17.4 and R17.5, holding R17.4/adjoint-lift, cubic-character-induction, gl3-recognition and nonnormal-cubic-base-change, requiring R17.4, AutomorphicLFunctionsAndLocalFactors:AL.3 and AL.3b, consumed by R17.5 (through R17.5/tetrahedral-artin and R17.5/octahedral-artin, hence through tetrahedral-artin-all-places and octahedral-artin-all-places here).
- **rescope** (GL2AutomorphicRepresentationsAndTransfer). R17.5/gl2-local-converse and R17.5/gl2-twist-stability are statements of local GL₂ theory (Jacquet–Langlands §§2–3). No packet plans them; R17.5 is their first consumer, so they are planned here. R17.4/adjoint-lift uses a GL₃ local converse theorem that no packet plans either. Proposal: When the R16.1 packet (stage R16.3) is next revised, move both nodes to R16.3 unchanged and repoint R17.5/artin-all-place-upgrade; R16.3 is upstream of R17.5, so no cycle arises.
- **rescope** (GL2AutomorphicRepresentationsAndTransfer, ArithmeticGaloisRepresentations). R17.5/artin-twisted-functional-equation (continuation and functional equation of Artin L-functions twisted by Hecke quasi-characters, with Langlands–Deligne constants) is Galois-side L-function theory. ArithmeticGaloisRepresentations R01.2 (upstream tier 7) owns Deligne's local constants and the inductivity of local factors but no global functional equation. Proposal: ArithmeticGaloisRepresentations R01.2 adopts the node as its global functional equation; GL2AutomorphicRepresentationsAndTransfer:R17.5 then cites it. Until then this packet owns it.
- **merge** (GL2AutomorphicRepresentationsAndTransfer, KTheoryFiniteLocalFields). Brauer characters are planned twice: KTheoryFiniteLocalFields:L.1/brauer-character (for Quillen's Brauer lift) and R17.5/brauer-character (for the Fong–Swan lift). KTheoryFiniteLocalFields is not among the roadmaps the upstream order places below this one (research/blueprint/upstream/CaraianiNewton.md), so the notion moves down here rather than being imported from there. Proposal: KTheoryFiniteLocalFields:L.1 imports R17.5/brauer-character (finite-field coefficients by extension of scalars to an algebraic closure) and keeps its Green virtual-character and Brauer-lift ring homomorphism nodes.

## Red-team findings handed to this part

- **RT-AREA-automorphic-1/1.** No new GL₃ input enters R17.5 here: the tetrahedral and octahedral nodes of this packet build on R17.3's R17.5/tetrahedral-artin and R17.5/octahedral-artin, which take the GL₃ inputs from the R17.4 nodes that R17.3's restructure proposal moves to R17.4a; the all-place upgrade uses GL₂ local theory only. The R17.4a/AL.3b proposal is restated in `restructure` with the R17.5 consumers named.
- **RT-AREA-automorphic-1/11.** The new nodes cite R16.5 (R16.5/global-epsilon-normalization) and R16.6 (R16.6/weight-one-classical-comparison) directly, together with R16.3 and R16.4; `links` declares R16.3, R16.4, R16.5, R16.6 → R17.5. Promotion draws no same-roadmap stage edges, so these four are listed for the maintainer.

## Consumers

These consumer declarations cite the bare layer R17.5 or the superseded R17.3-part declarations; the declarations of this part state exactly what they use:

- `R17.5/q-solvable-residual-weight-one` for `ClassicalSerreModularity:R33.1/dp-target-and-the-weight-at-least-two-convention`, `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`, `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`, `ClassicalSerreModularity:R26.6/corollary-1-2-proof`, `EllipticCurveModularityWild3Adic:W3.6/wild-lifting-application`. Odd residual representations of G_Q with solvable image, p odd, come from weight-one newforms with the lift written out.
- `R17.5/solvable-residual-modularity` for `PotentialModularityAndCompatibleSystems:R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`, `PotentialModularityAndCompatibleSystems:R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`, `ModularityAndLanglandsExtensions:ML.1/totally-real-odd-artin`. Residual modularity in weight one over number fields and totally real fields.
- `R17.5/tetrahedral-artin-all-places` for `AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary`, `AutomorphicGaloisRepresentations:R19.2/carayol-ordinary-cuspidal-places`. Carayol's §12.2 needs tetrahedral and octahedral automorphy at the dyadic place itself, which is the all-place statement (also R17.5/octahedral-artin-all-places).

## Coverage

Layer `R17.5` is **planned**. This follow-up closes the two source-proof gaps that R17.3's coverage record left for R17.5 (all-place matching for tetrahedral and octahedral Artin representations; the reduction-compatible residual lift), and adds the residual Langlands–Tunnell statement over Q that ClassicalSerreModularity and EllipticCurveModularityWild3Adic request. Every new node's prerequisite chain ends in a library declaration, an existing node, or a Tau Ceti layer with a request.

Remaining:

- In the R17.3 part (GL2AutomorphicRepresentationsAndTransfer--R17.3), at its next revision: add R17.5/tetrahedral-artin-all-places and R17.5/octahedral-artin-all-places to the prerequisites of R17.5/solvable-artin and retire its gap 'All-place upgrade of tetrahedral and octahedral Artin automorphy'; mark R17.5/odd-residual-lift and R17.5/residual-lt-application as superseded by R17.5/odd-solvable-residual-lift and R17.5/solvable-residual-modularity (see `supersedes`) and retire the gap 'Reduction-compatible lift of a finite solvable projective image (p>2)'.
- Classical Hilbert modular forms of parallel weight one over a totally real field are not planned anywhere; R17.3's R17.5/tr-weight-one still carries its R16.6 request (b). The new nodes use only Rogawski–Tunnell's adelic notion, which is what BCGP Proposition 10.1.3 and the R23.3 consumers use; a consumer that needs classical Hilbert forms of weight one needs R16.6 to plan that dictionary.
- The finite-order prescription of local characters at several places (Chevalley's congruence theorem), which R17.3's R17.5/tunnell-primitive-globalization and R17.5/prescribed-local-induction still list as a gap, has no packet node; the accepted package places it at R16.1 (target full-local-character-prescription). The all-place upgrade here needs only Jacquet–Langlands Lemma 12.5 (R17.5/isolating-twist-character).
- Ownership moves proposed in `restructure`: gl2-local-converse and gl2-twist-stability to R16.3; artin-twisted-functional-equation to ArithmeticGaloisRepresentations R01.2; KTheoryFiniteLocalFields:L.1/brauer-character to import R17.5/brauer-character; R17.5/quadratic-induction to R17.4 as the package records.

## Sources

- `jl70`: [Hervé Jacquet and Robert P. Langlands, *Automorphic forms on GL(2)*](https://publications.ias.edu/sites/default/files/automorphic-forms-on-gl2_rpl.pdf), Lecture Notes in Mathematics 114 (1970); IAS retypeset edition, whose printed page numbers are cited (PDF page = printed page + 6). Read: §2, Theorem 2.18 and Corollary 2.19, pp. 37–40; §3, Proposition 3.8, pp. 57–58; §11, statement of Theorem 11.1, p. 179; §12, Proposition 12.1 through the end of the proof of Theorem 12.2 (Lemmas 12.3–12.5), pp. 206–212.
- `langlands80`: [Robert P. Langlands, *Base change for GL(2)*](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf), Annals of Mathematics Studies 96 (1980); author's version at the Digital Mathematics Archive, cited by its own page numbers (PDF page = page + 3). Read: §2, properties A)–F) of global liftings, p. 14; §3 opening, Lemmas 3.1–3.2 and property G), pp. 15–16; §3(i) tetrahedral type, pp. 16–19; §3(ii) octahedral type, p. 19.
- `deligne73`: [Pierre Deligne, *Les constantes des équations fonctionnelles des fonctions L*](https://publications.ias.edu/sites/default/files/Number20.pdf), Modular Functions of One Variable II, Lecture Notes in Mathematics 349 (1973), 501–597; IAS copy (PDF page = printed page − 500). Read: §4, Théorème 4.1, p. 535; §5, 5.11 and the demonstrations paragraph, p. 551.
- `webb16`: [Peter Webb, *A Course in Finite Group Representation Theory*](https://www-users.cse.umn.edu/~webb/RepBook/RepBookLatex.pdf), Cambridge Studies in Advanced Mathematics 161 (2016); the author's prepublication version of 23 February 2016, which he states has the same mathematical content (printed page = PDF page − 7). Read: §9.2, Theorem 9.2.7 and the following remarks, p. 144; §9.4, pp. 148–156 (Lemma 9.4.6 through Theorem 9.4.12, including 9.4.11); §10.2, Proposition 10.2.1, p. 174; §10.1, Lemma 10.1.1, Example 10.1.2 and Proposition 10.1.3, pp. 170–171; §10.2, Theorem 10.2.2 and Corollary 10.2.3, pp. 176–177.
- `isaacs74`: [I. M. Isaacs, *Lifting Brauer characters of p-solvable groups*](https://msp.org/pjm/1974/53-1/pjm-v53-n1-p15-s.pdf), Pacific Journal of Mathematics 53 (1974), no. 1, 171–188 (printed page = PDF page + 169). Read: §1, Definition 1.1, Theorems 1.2 and 1.4, pp. 171–172; statements of Theorem 3.1, Lemma 4.1, Theorem 4.2 and Lemma 5.1, pp. 174–179; §5, Theorem 5.4 and its proof, pp. 179–180.
- `bh06`: [Colin J. Bushnell and Guy Henniart, *The Local Langlands Conjecture for GL(2)*](https://doi.org/10.1007/3-540-31511-X), Grundlehren der mathematischen Wissenschaften 335, Springer (2006); cited by printed page. Read: §27.1–27.2, p. 170; §27.8, pp. 175–176.
- `bcgp21`: [George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Publications mathématiques de l'IHÉS 134 (2021), 153–501; published version. Read: §10.1, Proposition 10.1.3 and its proof, pp. 473–474.
- `ds74`: [Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Annales scientifiques de l'ÉNS (4) 7 (1974), 507–530; Numdam. Read: §4, Théorème 4.1 and Corollaire 4.2, pp. 513–514; §4, 4.9–4.11 (Théorème 4.10, Weil–Langlands), pp. 516–517.
- `tunnell81`: [Jerrold Tunnell, *Artin's conjecture for representations of octahedral type*](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf), Bulletin of the AMS (N.S.) 5 (1981), no. 2, 173–175; AMS PDF. Read: pp. 173–175 (whole note).
- `dp21`: [Luis Dieulefait and Ariel Pacetti, *A simplified proof of Serre's conjecture*](https://arxiv.org/pdf/2108.07577v2), arXiv:2108.07577v2. Read: §1.1, Theorems 1.2–1.3 and Remark 1, pp. 1–3.
- `rt83`: [J. D. Rogawski and J. B. Tunnell, *On Artin L-functions associated to Hilbert modular forms of weight one*](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf), Inventiones mathematicae 74 (1983), 1–42; GDZ scan without text layer, read as a page image. Read: §1, the representations π_k, π₁ and the definition of holomorphic of weight k, p. 4.
