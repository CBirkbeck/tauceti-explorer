# Modular forms — Hecke theory, newforms, and L-functions, Part II: Geometric reduction, Serre weights and eigenvalue lifting

**Base:** `tauceti:TauCetiRoadmap/ModularForms`. **Ownership:** accepted RS-06, reviewed in `REV-RS-06.md`. **Checkpoint:** partial, for issue #671 (checkpoint 1: ChatGPT Pro, R15.5; checkpoint 2: Claude Code cc-fb70e5, R15.4 and R15.6; checkpoint 3: Claude Code cc-fb70e5, R15.1–R15.3). This document does not declare any of the six stages closed. It expands the algebraic core of R15.5; its stage-specific continuation requirements are part of the specification, not claims that the omitted proofs have been supplied.

The reviewed decomposition remains the source register for the full roadmap. The node `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma` keeps its identifier. Its new prerequisite nodes expose the algebra hidden inside the old single-node outline. The other reviewed nodes must be retained or explicitly refined on continuation; this checkpoint must not be promoted as a complete replacement of that decomposition.

## Carriers and conventions

Use the existing module, linear endomorphism, subalgebra, tensor product, algebra homomorphism, ideal, fraction-field and valuation-subring carriers. A character is an algebra homomorphism, not a new structure containing unspecified representation-theoretic conditions. A finite extension in the lifting statement means a **finite extension of fraction fields**. A chosen dominating valuation ring is not required to be module-finite over the original DVR. Completeness, a perfect residue field and separability of the extension are not standing assumptions.

For an O-module M and an O-algebra A, write M_A=A tensor_O M. All scalar-extension identifications must commute with the actual action of the operator algebra. Distinguish H acting on M_A from the larger algebra A tensor_O H: faithfulness of the former is not a substitute for faithfulness of the latter.

The input residual eigenvector is nonzero. The output integral eigenvector is nonzero but its reduction is **not prescribed**. The output controls the eigenvalues, using an explicit embedding of residue fields. Comparing two residue values without this map is not a well-typed congruence.

## R15.1 — Geometric forms and comparison

**Required construction.** Define all-weight forms as sections of powers of the Hodge line on the actual moduli family or a rigidified cover with descent data; define cusp forms by the cusp ideal. Use the Hodge line and formal cusp geometry supplied by R12.5 and R13.3. Do not assert descent of the Hodge line to a coarse curve in all weights, or identify an analytic form with an arbitrary power series.

**Required comparisons and acceptance.** State coefficient extension as a map before asserting a base-change isomorphism. Record the necessary cohomology/base-change assumptions and the stabilizer action. The analytic comparison must agree with the existing analytic modular-form carrier, including q-expansion normalizations. Test low-level stabilizers and restriction to a Tate-curve chart. This stage's reviewed source decomposition has not been reconstructed into a complete blueprint by this checkpoint.

Checkpoint 3 carries the reviewed decomposition's nodes for this stage with explicit prerequisites.

### Construction. The invertible sheaf omega on the compactified level-n moduli scheme, normalized at the Tate curve

*Module* `TauCeti/NumberTheory/ModularForms/Katz.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`.

For n >= 3 (the range in which Katz 1.4 has the level-n moduli problem represented by the smooth affine curve M_n over Z[1/n]; levels 1 and 2 are treated by descent in 1.8-1.10) there is a unique invertible sheaf omega on the compactified modular scheme Mbar_n over Z[1/n] whose restriction to M_n is omega_{E/M_n} for the universal elliptic curve with level-n structure, and whose sections over the completion Z[1/n, zeta_n][[q]] at each cusp are exactly the Z[1/n, zeta_n][[q]]-multiples of the canonical differential of the Tate curve. Katz asserts, citing his Appendix A1.3.17 and Deligne's Bourbaki expose 355 ([7]) rather than proving it in 1.5, that the Kodaira-Spencer map extends to an isomorphism omega^{tensor 2} = Omega^1_{Mbar_n / Z[1/n]}(log(cusps)), and over Z[1/n, zeta_n][[q]] the square of the canonical differential of Tate(q^n) corresponds to n dq/q. A modular form of level n and weight k holomorphic at infinity over a Z[1/n]-algebra R_0, resp. with coefficients in a Z[1/n]-module K, is a global section of omega^{tensor k} on Mbar_n tensor R_0, resp. an element of H^0(Mbar_n, omega^{tensor k} tensor_{Z[1/n]} K).

*Hypotheses.*

- n >= 3: Katz 1.4 states representability of the level-n moduli problem only for n >= 3, and 1.10 says that modular schemes of level 1 and 2 do not exist as fine moduli schemes
- n invertible on the base: all schemes are over Z[1/n]
- the universal object is an elliptic curve with level-n structure on M_n, extended to the compactification Mbar_n by Tate curves at the cusps
- the cusp normalization is fixed by the Tate curve Tate(q^n) over Z[1/n, zeta_n][[q]] together with its canonical differential
- the Kodaira-Spencer identification carries the factor n: the square of the canonical differential on Tate(q^n) corresponds to n dq/q, not to dq/q

*API.*

- `TauCeti.KatzModularForms.omega` (*constructor*) — The invertible sheaf ω on M̄_n (n ≥ 3) extending ω_{E/M_n}, normalised at each cusp by the canonical differential of the Tate curve.
- `TauCeti.KatzModularForms.omega_cusp` (*characterisation*) — Over Z[1/n, ζ_n][[q]] at a cusp, the sections of ω are the multiples of ω_can on Tate(q^n).
- `TauCeti.KatzModularForms.kodairaSpencer` (*characterisation*) — ω^{⊗2} ≅ Ω¹_{M̄_n/Z[1/n]}(log cusps), with ω_can^{⊗2} ↦ n·dq/q (asserted by Katz with references).
- `TauCeti.KatzModularForms.forms` (*constructor*) — S(K, n, k) = H⁰(M̄_n, ω^{⊗k} ⊗_{Z[1/n]} K), forms holomorphic at ∞ with coefficients in K.

*Unit tests.*

- `TauCeti.KatzModularForms.delta_section` (example) — Δ = q∏(1 − q^m)^{24} is a nowhere-vanishing section of ω^{⊗12} on M_n and has a simple zero at each cusp of level one.
- `TauCeti.KatzModularForms.omega_needs_level_three` (degenerate) — For n = 1, 2 the moduli problem is not representable (the automorphism −1), so ω is not defined this way; levels 1 and 2 go through R15.1/level-one-and-two-by-descent-with-explicit-inverted-primes.
- `TauCeti.KatzModularForms.omega_sq_not_omega1` (non-example) — ω^{⊗2} is Ω¹ with logarithmic poles at the cusps, not Ω¹ itself: weight-2 cusp forms, not all weight-2 forms, are the regular differentials.

*Construction.*

1. Katz 1.5 constructs omega by the stated two conditions (restriction to M_n, and prescribed sections at each cusp) and asserts uniqueness.
2. The extension of the Kodaira-Spencer isomorphism omega^{tensor 2} = Omega^1(log cusps) across the cusps is quoted with the references (cf. A1.3.17 and [7]), [7] = Deligne, Formes modulaires et representations l-adiques, Bourbaki expose 355; no proof is given in 1.5. Katz records the explicit q-form of the identification for Tate(q^n).
3. Modular forms holomorphic at infinity are then defined as sections of omega^{tensor k}, with coefficients in an arbitrary Z[1/n]-module K by tensoring the sheaf.

*Acceptance.*

- Check that the section of omega^{tensor 2} corresponding to dq/q on Tate(q^n) is n^{-1} times the square of the canonical differential, so that the normalization constant n appears where it must in the comparison with Omega^1(log)
- Check the sheaf condition at a cusp by verifying that a section with q-expansion in q Z[1/n, zeta_n][[q]] is the same thing as a section of omega^{tensor k} vanishing along that cusp

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem — forms are sections of ω^{⊗k} on M̄_n and have q-expansions at the cusps
- AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one — A is a section of ω^{⊗(p−1)}

*Uses.* `ModularCurvesPartII:R13.2`, `ModularCurvesPartII:R13.3`, `ModularCurvesPartII:R12.5`.

*Planet:* Katz modular forms.

*Sources.*

- p-adic properties of modular schemes and modular forms, Chapter 1, 1.5, printed p. 83 (Ka-15): “There is a unique invertible sheaf _~ on ~n whose restriction to Mn is _~E/Mn ... and whose sections over the completion Z[1/n~n][[q]] at each cusp are precisely the Z[1/n,~n][[q]] multiples of the canonical differential of the Tare curve.” Literal statement of the defining property and uniqueness of omega used above (OCR renders omega as '_~' and Mbar_n as '~n').
- p-adic properties of modular schemes and modular forms, Chapter 1, 1.5, printed p. 83 (Ka-15): “and, in fact, over Z[l/n~n][[q]] , the "square" of the canonical differential on Tate(q n) corresponds to n- dq q” Fixes the normalization constant n in the Kodaira-Spencer comparison, which the roadmap's normalization conventions require to be retained.
- p-adic properties of modular schemes and modular forms, 1.4, printed p. 81 (Ka-13): “For each integer n >= 3, the functor "isomorphism classes of elliptic curves with level n structure" is representable” The level hypothesis n >= 3 under which Mbar_n and omega exist (text layer prints the inequality as 'n _> 3'). Added by the reviewer.

### Construction. Level one and level two forms as invariants of a rigidifying cover, with the primes that must be inverted

*Module* `TauCeti/NumberTheory/ModularForms/Katz.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.1/level-one-and-two-by-descent-with-explicit-inverted-primes`.

For n = 1, 2 the module S(K, n, k) of weight-k forms holomorphic at infinity with coefficients in a Z[1/n]-module K is defined not as sections over a coarse space but by descent from the rigid levels (Katz 1.9): for n = 2 as the subgroup of H^0(Mbar_4, omega^{tensor k} tensor_{Z[1/4]} K) invariant under the matrices of GL_2(Z/4Z) that are congruent to 1 mod 2, and for n = 1 as the fibre product of the level-3 and level-4 modules over the level-12 module. Base change then holds in the form: Thm 1.8.1, for every ring R_0 in which 2 is invertible and every k >= 1, the canonical map S(Z,2,k) tensor_Z R_0 -> S(R_0,2,k) is an isomorphism (printed with S(Z,2,k); since level-2 forms live over Z[1/2] this is read as S(Z[1/2],2,k)); Thm 1.8.2, for every ring R_0 in which 2 and 3 are invertible and every k >= 1, the canonical map S(Z,1,k) tensor_Z R_0 -> S(R_0,1,k) is an isomorphism, the proof passing through the intermediate isomorphism S(Z[1/6],1,k) tensor_{Z[1/6]} R_0 -> S(R_0,1,k). Remark 1.8.2.2 states that Theorem 1.8.2 (level one) becomes false when 2 and 3 are not excluded; the source makes no corresponding failure statement for level two.

*Hypotheses.*

- for level 2: 2 invertible in R_0; for level 1: 2 and 3 invertible in R_0
- the descent uses that the relevant rigidifying groups (order 16 for the mod-2 congruence subgroup of GL_2(Z/4Z), 96 for GL_2(Z/4Z), 48 for GL_2(Z/3Z)) have order invertible after inverting 2 and 3, so an averaging projector exists
- level-two forms of odd weight vanish because the automorphism -1 of an elliptic curve fixes the level-two structure
- the base-change theorems 1.8.1–1.8.2 rest on the base-change theorem at the rigid levels, R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary, which is planned in the following stage

*API.*

- `TauCeti.KatzModularForms.formsLevelTwo` (*constructor*) — S(K, 2, k) = the invariants in S(K, 4, k) of the matrices of GL₂(Z/4Z) congruent to 1 mod 2.
- `TauCeti.KatzModularForms.formsLevelOne` (*constructor*) — S(K, 1, k) = the fibre product of S(K, 3, k) and S(K, 4, k) over S(K, 12, k).
- `TauCeti.KatzModularForms.formsLevelTwo_baseChange` (*characterisation*) — S(Z[1/2], 2, k) ⊗ R₀ ≅ S(R₀, 2, k) when 2 ∈ R₀^× and k ≥ 1 (Theorem 1.8.1).
- `TauCeti.KatzModularForms.formsLevelOne_baseChange` (*characterisation*) — S(Z, 1, k) ⊗ R₀ ≅ S(R₀, 1, k) when 2, 3 ∈ R₀^× and k ≥ 1 (Theorem 1.8.2).

*Unit tests.*

- `TauCeti.KatzModularForms.levelOne_E4` (example) — E₄ = 1 + 240∑σ₃(m)q^m lies in S(Z[1/6], 1, 4).
- `TauCeti.KatzModularForms.levelOne_baseChange_fails_at_2_3` (non-example) — Remark 1.8.2.2: over F₂ or F₃ there are level-one forms that are not reductions of forms over Z (the Hasse invariant of weight 1 over F₂, weight 2 over F₃), so Theorem 1.8.2 fails without inverting 2 and 3.
- `TauCeti.KatzModularForms.levelOne_via_rigid` (compatibility) — A level-one form is determined by its images at levels 3 and 4, which agree at level 12.

*Construction.*

1. Katz Thm 1.8.1: level-two forms over R_0 containing 1/2 are exactly the level-four forms invariant under the mod-2 congruence subgroup of GL_2(Z/4Z); that group has order 16, a power of 2, so the averaging projector applies to the level-four base-change isomorphism of Thm 1.7.1.
2. Katz Thm 1.8.2: over a ring R_0 containing 1/6 the same projector argument (GL(2,Z/4Z) of order 96 = 32 x 3, GL(2,Z/3Z) of order 48 = 16 x 3) gives S(Z[1/6],1,k) tensor R_0 = S(R_0,1,k); the passage from Z[1/6] down to Z uses that for any ring R, S(R,1,k) is the fibre product of the diagram 1.8.2.1 (a level-3 form over R[1/3] and a level-4 form over R[1/2] inducing the same level-12 form over R[1/12]) and that this diagram and its fibre product commute with the flat extension Z -> Z[1/6].
3. Katz Remark 1.8.2.2 exhibits the failure without inverting 2 and 3: over F_p the Hasse invariant is a nonzero level-one form of weight p-1 holomorphic at infinity, while over Z there are no nonzero level-one forms of weight 1 or 2 holomorphic at infinity; likewise A.Delta is a level-one cusp form of weight 13 over F_2 (resp. 14 over F_3) which is not the reduction of a form over Z.

*Acceptance.*

- Verify that the Hasse invariant in weight p-1 for p = 2, 3 is a counterexample to level-one base change from Z (Remark 1.8.2.2), so that no argument in the roadmap silently descends omega^{tensor k} to the coarse j-line at those primes
- Verify that S(R_0, 2, k) = 0 for odd k when 2 is invertible in R_0

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem — the level-1 and level-2 q-expansion principle (Corollary 1.9.1) tests at a single cusp
- AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one — A is a level-one form, defined through these descents

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`.

*Sources.*

- p-adic properties of modular schemes and modular forms, Theorem 1.8.1 and its proof, printed pp. 85-86 (Ka-17/18): “Let R be any ring in which 2 is invertible. For every integer k > i , the canonical map S(Z,2,k) ... > S(Ro,2,k ) is an isomorphism.” Level-two base change with the exact hypothesis that 2 is invertible; OCR prints 'k >= 1' as 'k > i'.
- p-adic properties of modular schemes and modular forms, Remark 1.8.2.2, printed p. 86 (Ka-18): “The above theorem becomes f~se when we do not exclude the primes 2 and 3. For over the finite field l~p , the Hasse invariant A i_ss a modular form of level one and weight p-I , holomorphic at ~ . But over ~- there are no non-zero modular forms over Z of level one, holomorphic at ~ , of weight either one or two.” Explicit failure of level-one base change at p = 2 and p = 3, which is the source basis for treating small levels by descent rather than on the coarse curve.
- p-adic properties of modular schemes and modular forms, Theorem 1.8.2 and its proof, printed pp. 86-87 (Ka-18/19): “Let R_o be any ring in which 2 and 3 are invertible. For every integer k >= 1, the canonical map S(Z,1,k) tensor_Z R_o --> S(R_o,1,k) is an isomorphism.” Checked on the page image: the level-one theorem is stated over Z, not only over Z[1/6]. Added by the reviewer.

## R15.2 — q-expansions, integral structures and Hecke actions

**Required construction.** Establish section detection at the actual required cusps and the integral version. Compare geometric Hecke actions with the arithmetic normalization of ModularForms. Separate integral Hecke-algebra finiteness from the existence of a particular lattice in a space of forms: the ModularForms weight-at-least-two symbol argument does not, by itself, provide that lattice.

**Required application interface.** For each module to which R15.5 is applied, specify O, the weight, the level, the character, which operators act integrally, and the exact map from its reduction into characteristic-p forms. Supply a preimage of the residual eigensystem under that map. A characteristic-p form is not automatically such a preimage. Cases in which the residue characteristic divides the level cannot be justified by a theorem assuming invertible level.

**Acceptance.** Test reduction of a characteristic-zero form separately from lifting a characteristic-p form. Check all-cusp integrality and the exact operator family. These are open supplier obligations, recorded in the packet's requests, rather than hypotheses silently built into a generic object called a modular form.

Checkpoint 3 carries the reviewed decomposition's nodes for this stage with explicit prerequisites, and adds the generation lemma for the integral Hecke algebra.

### Theorem. The q-expansion principle at level n >= 3 and its underlying vanishing theorem

*Node* `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`.

Let n >= 3, K a Z[1/n]-module, and f a modular form of level n and weight k holomorphic at infinity with coefficients in K. (Vanishing) If on each of the phi(n) connected components of Mbar_n tensor_{Z[1/n]} Z[1/n, zeta_n] there is at least one cusp at which the q-expansion of f vanishes identically, then f = 0. (q-expansion principle) If L is a Z[1/n]-submodule of K and on each of those phi(n) components there is at least one cusp at which all q-coefficients of f lie in L tensor_{Z[1/n]} Z[1/n, zeta_n], then f is a modular form with coefficients in L. For n = 1, 2 the same conclusion holds after testing at a single cusp (one cusp when n = 1, one of the three cusps when n = 2).

*Hypotheses.*

- n >= 3 for the stated component-wise form; n = 1 or 2 for Cor. 1.9.1, where the modules S(K, n, k) are the descent-theoretic ones
- K is a Z[1/n]-module and L a Z[1/n]-submodule; no flatness or finiteness on K is assumed
- the test cusps must meet every one of the phi(n) geometric connected components of Mbar_n over Z[1/n, zeta_n]; a single cusp does not suffice at level n >= 3

*Proof outline.*

1. Katz derives Cor. 1.6.2 from Thm 1.6.1 by applying the latter to the image of f in (K/L) tensor omega^{tensor k}, using the cohomology sequence attached to 0 -> L -> K -> K/L -> 0 and the sheaf sequence 1.6.2.1.
2. Proof of Theorem 1.6.1 (pp. 84-85): replacing K by the ring of dual numbers D(K) = Z[1/n] + K reduces to K a Z[1/n]-algebra; commutation of quasi-coherent cohomology with inductive limits reduces to K finitely generated, then noetherian local; faithful flatness of completion reduces to K complete noetherian local, and Grothendieck's comparison theorem to K artin local. By Krull's intersection theorem f vanishes on an open neighbourhood of a test cusp on each connected component of Mbar_n tensor K tensor Z[1/n, zeta_n], hence on an open dense set. If f were nonzero it would be supported on a closed set Z containing no maximal point; at a maximal point z of Z every element of the maximal ideal is a zero-divisor, so z has depth zero, contradicting that Mbar_n tensor K, smooth over the artin ring K, is Cohen-Macaulay and only its maximal points have depth zero. Imported standard results: Grothendieck comparison (formal functions), Krull intersection theorem, depth of Cohen-Macaulay schemes.
3. Cor. 1.9.1 transports the statement to levels 1 and 2 through the descent/fibre-product definitions 1.9.0.0 and 1.9.0.1.

*Acceptance.*

- Exhibit a nonzero level-n form whose q-expansion vanishes at one cusp but not on all phi(n) components, showing that the component hypothesis is not removable
- Check the integrality direction: a form over Q whose q-expansion at the tested cusps lies in Z[1/n, zeta_n] is a form over Z[1/n]

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions — Hecke operators are defined over any coefficient module through q-expansions
- AutomorphicGaloisRepresentations R19.1 — integral de Rham lattices of modular forms (Diamond–Flach–Guo Lemma 4.12)

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/level-one-and-two-by-descent-with-explicit-inverted-primes`.

*Planet:* q-expansion principle.

*Sources.*

- p-adic properties of modular schemes and modular forms, Theorem 1.6.1 and Corollary 1.6.2, printed pp. 83-84 (Ka-15/16): “Suppose that on each of the q~(n) connected components of Mn ... there is at least one cusp at which the q-expsmsion of f vanishes identically. ~l~en f = 0 .” The literal hypothesis 'on each of the phi(n) connected components ... at least one cusp' that this node retains.
- p-adic properties of modular schemes and modular forms, Corollary 1.9.1, printed p. 88 (Ka-20): “Let n=l or 2, K a Z[1/n]-module, and L C K a Z[1/n] submodule. ... Suppose that at one of the cusps (for n=l , there is only one, j =~ , while for n=2 there are three, k = O,l,~ ), the q-coefficients of f all lie in L . Then f is a modular form with coefficients in L .” The level 1 and 2 form of the principle, where a single cusp suffices.
- p-adic properties of modular schemes and modular forms, Proof of Theorem 1.6.1, printed pp. 84-85 (Ka-16/17): “As Mn tensor K is smooth over an artin local ring K, it is Cohen-Macaulay, and hence only its maximal points have depth zero.” The depth argument that completes the vanishing proof, now recorded in the proof steps. Added by the reviewer.

### Theorem. Strong q-expansion principle: finitely many coefficients may be ignored, at the cost of a hypothesis on multiplication by p for (p-1) | k

*Node* `AlgebraicModularFormsAndSerreWeights:R15.2/strong-q-expansion-principle-with-its-divisibility-hypothesis`.

Let n, k >= 1 and let K be a Z[1/n]-module such that for every prime p with (p-1) | k multiplication by p is injective on K. If f is a modular form of level n and weight k holomorphic at infinity with coefficients in K and all its q-expansions are polynomials in q, then f = 0. Consequently (strong q-expansion principle), with a = product of the primes p such that (p-1) | k, K a Z[1/an]-module and L a Z[1/an]-submodule, if at each cusp all but finitely many q-expansion coefficients of f lie in L tensor Z[1/n, zeta_n], then f is a modular form with coefficients in L. The proof admits Result 1.12.0 (a special case of Swinnerton-Dyer's structure theorem, proved in Katz 4.4.1): if K is a field of characteristic p not dividing n, f has level n >= 1 and weight k >= 1, (p-1) does not divide k, and all q-expansions of f at the cusps of Mbar_n tensor K(zeta_n) are constants, then f = 0.

*Hypotheses.*

- the divisibility hypothesis is indexed by the weight: only the primes p with (p-1) | k are constrained, and for the corollary those primes are inverted
- the conclusion of Thm 1.12.1 concerns forms whose q-expansions at every cusp are polynomials, not merely bounded
- the proof reduces to n >= 3 via the level 1 and 2 descriptions 1.9.0.0/1.9.1.1, then to artin local K, then to K a field
- Result 1.12.0 is admitted, not proved, in 1.12 (its proof is in 4.4.1); as printed its hypothesis 'characteristic p, p-1 does not divide k' does not literally cover a field of characteristic 0, which the field case of the induction also needs (reviewer observation)

*Proof outline.*

1. Katz reduces to n >= 3, then replaces K by K[1/a] (legitimate because K -> K[1/a] is injective by hypothesis) and views f as a form of level a n.
2. He then reduces to K artin local by a filtration argument and induces on the length, the base case being K a field.
3. Over a field one takes a basis f_1, ..., f_r of the finite-dimensional space of such forms, lets N be the maximal degree of their polynomial q-expansions, chooses a prime l not dividing n with l > N, and uses stability of the space under T_l (1.11) to write T_l(F) = C.F for the column F = (f_i); comparing coefficients of q^i in (A_{il} + l^{k-1} A_{i/l}) = C A_i gives A_i = 0 for i >= 1 because il > N and il^2 > N, so every q-expansion is constant, and Result 1.12.0 gives f_i = 0. The artin-local case follows by induction on the nilpotence of the maximal ideal using the cohomology sequence 1.6.2.2.
4. Cor. 1.12.2 follows by applying the theorem to the image of f in K/L.

*Acceptance.*

- Check that for k with (p-1) | k and K = Z/p the conclusion fails, so the hypothesis on multiplication by p is used and not cosmetic
- Check the corollary on a concrete eigenform whose first few coefficients are not integral but whose tail is

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`.

*Sources.*

- p-adic properties of modular schemes and modular forms, Theorem 1.12.1, printed p. 94 (Ka-26): “Suppose that for every prime p such that p-!Ik , the endomorphism "multiplication b y p" is injective on K . Then if all the q-expansions of f are polynomials in q , f = 0 .” The literal divisibility hypothesis '(p-1) | k' (printed 'p-!Ik') retained in the statement.
- p-adic properties of modular schemes and modular forms, Corollary 1.12.2, printed p. 95 (Ka-27): “(Strong q-expansion principle) Let n, k >= i , and let a = II p . Let K be a [i/an]-module of which L C K is a Z[i/an]-sub-module, and f a modular form of level n and weight k, holomorphic at ~ , such that at each cusp, all but finitely many of its q-expansion coefficients lie in L” Literal statement of the corollary with the ring Z[1/an] in which the primes p with (p-1)|k have been inverted.
- p-adic properties of modular schemes and modular forms, 1.12, Result 1.12.0, printed p. 93 (Ka-25) and p. 94 (Ka-26): “In this section we will admit the following result, a special case of Swinnerton-Dyer's structure theorem” The theorem depends on an admitted result whose proof lies outside the sections read. Added by the reviewer.

### Theorem. Base change for spaces of modular forms, and the unresolved weight-one case for n >= 12

*Node* `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`.

Let n >= 3 and suppose either k >= 2, or k = 1 and n <= 11. Then for any Z[1/n]-module K the canonical map K tensor H^0(Mbar_n, omega^{tensor k}) -> H^0(Mbar_n, K tensor omega^{tensor k}) is an isomorphism. The proof is by H^1(Mbar_n, omega^{tensor k}) = 0, which follows from Riemann-Roch once deg(omega^{tensor k}) > 2g-2 on each geometric component, using omega^{tensor 2} = Omega^1(log cusps) and the fact that each component of Mbar_n tensor Z[1/n, zeta_n] contains a cusp. By the Remark after the theorem, for n >= 12 the sheaf omega has degree <= 2g-2 on each component, with equality only for n = 12, and Katz does not know whether formation of weight-one forms of level n >= 12 commutes with base change (the printed inequality is 'n >= 12', checked on the page image; the text layer reads 'n > 12').

*Hypotheses.*

- n >= 3, so that Mbar_n is a scheme and the universal curve exists
- k >= 2, or k = 1 with 3 <= n <= 11; the weight-one case with n >= 12 (including n = 12) is not covered
- the vanishing argument needs each connected component of Mbar_n tensor Z[1/n, zeta_n] to contain at least one cusp

*Proof outline.*

1. Katz Thm 1.7.1 reduces base change to H^1(Mbar_n, omega^{tensor k}) = 0 by the standard cohomology and base-change theorems.
2. For k >= 2 the isomorphism omega^{tensor 2} = Omega^1_{Z[1/n]}(log(cusps)) plus the presence of a cusp on each component gives deg(omega^{tensor k}) > 2g-2, hence the vanishing by Riemann-Roch.
3. For k = 1 and 3 <= n <= 11 the source asserts that 'explicit calculation shows' deg(omega) > 2g-2 on each component (the calculation is not displayed); for n >= 12 the Remark gives deg(omega) <= 2g-2 with equality only at n = 12, and the argument stops.
4. Katz's Remark after Thm 1.7.1 states the open case: weight one and level n >= 12.

*Acceptance.*

- Check deg(omega) against 2g-2 on a component of Mbar_n for n = 11, 12, 13 and confirm that strict inequality holds for n = 11 and fails for n = 12 (equality) and n = 13 (strict reverse inequality)
- Check, for every consumer that needs finite freeness of a module of forms, whether it actually uses this theorem; the Deligne-Serre application 6.10 works with classical forms on Gamma_0(N) with coefficients in O_lambda and does not cite it

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`.

*Sources.*

- p-adic properties of modular schemes and modular forms, Theorem 1.7.1 and the following Remark, printed p. 85 (Ka-17): “Let n ~ 3 ~ and suppose either that k ~ 2 o~r that k= i and n ! ii . Then for any Z[i/n]-module K , the canonical map ... is an isomorphism.” Literal hypotheses n >= 3 and (k >= 2 or (k = 1 and n <= 11)) retained in the node statement.
- p-adic properties of modular schemes and modular forms, Remark following Theorem 1.7.1, printed p. 85 (Ka-17): “The author does not know whether or not the formation of modular forms of weight one and level n >= 12 commutes with base change.” Records the exact boundary of the base-change theorem in weight one. The page image shows 'n >= 12' (underlined inequality); the drafter's excerpt 'n > 12' was an artefact of the text layer and was corrected by the reviewer.

### Construction. Hecke operators defined over arbitrary coefficient modules by their q-expansion formula

*Module* `TauCeti/NumberTheory/ModularForms/Katz.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`.

For a prime l not dividing n and invertible in the base ring R, Katz defines (1.11.0.2) (T_l f)(E/R, omega, alpha_n) = l^{k-1} times the sum over the l+1 subgroups H of order l of f(E_{R'}/H, pi-check^*(omega), pi(alpha_n)), using the level structure pi(alpha_n) with pi o alpha_n = pi(alpha_n) o pi (and explicitly not the other natural choice alpha_n o pi-check = l.pi(alpha_n)). If f(Tate(q^n), omega_can, alpha_n) = sum_i a_i(alpha_n) q^i, then (Formula 1.11.1) T_l f has q-expansion coefficients b_i(alpha_n) = l^{k-1} a_{i/l}(alpha_n') + a_{li}(alpha_n''), with a_{i/l} = 0 unless l | i, where alpha_n' is the unique level-n structure on Tate(q^n) with phi_l^*(alpha_n') = pi_l(alpha_n) (phi_l: q -> q^l, pi_l the projection Tate(q^n) -> Tate(q^n)/mu_l = Tate(q^{nl})) and alpha_n'' = i_l^*(pi_0(alpha_n)) is obtained from pi_0(alpha_n) on Tate(q^{n/l}) by the extension of scalars q^{1/l} -> q. T_l preserves holomorphy at infinity, cuspidality and polynomiality of q-expansions. For n >= 2 and k >= 2 (or 3 <= n <= 11 and k >= 1), for any prime l not dividing n and any Z[1/n]-module K, there is a unique endomorphism of the space of weight-k level-n forms holomorphic at infinity with coefficients in K realizing this formula. For k >= 2, level one and any prime l, there is a unique such endomorphism on level-one forms with coefficients in any Z-module K.

*Hypotheses.*

- for Prop. 1.11.3: l prime with l not dividing n, and (n >= 2 with k >= 2) or (3 <= n <= 11 with k >= 1)
- for Cor. 1.11.4: level one, k >= 2, and K an arbitrary Z-module - in particular l may divide the residue characteristic of K
- existence over K is deduced from existence over Z[1/n] via base change, and descent of the operator from Z[1/n l] to Z[1/n] uses the q-expansion principle

*API.*

- `TauCeti.KatzModularForms.heckeT` (*constructor*) — T_l for l ∤ n invertible in R, by (1.11.0.2): l^{k−1} ∑_H f(E/H, π̌^*ω, π(α_n)).
- `TauCeti.KatzModularForms.heckeT_qExpansion` (*characterisation*) — b_i(α_n) = l^{k−1} a_{i/l}(α′_n) + a_{li}(α″_n) (Formula 1.11.1).
- `TauCeti.KatzModularForms.heckeT_integral` (*characterisation*) — For k ≥ 2 (or 3 ≤ n ≤ 11, k ≥ 1) T_l is an endomorphism of forms with coefficients in any Z[1/n]-module K (Corollary 1.11.4).

*Unit tests.*

- `TauCeti.KatzModularForms.heckeT_delta` (example) — For Δ and l = 2: b₁ = a₂ = τ(2) = −24, so T₂Δ = −24Δ.
- `TauCeti.KatzModularForms.heckeT_other_normalisation` (non-example) — Using the level structure α_n ∘ π̌ = l·π(α_n) instead of π(α_n) gives the operator twisted by the diamond operator ⟨l⟩, not T_l.
- `TauCeti.KatzModularForms.heckeT_level_divisible` (degenerate) — For l | n the formula is not defined (l must be prime to the level); U_l is a different operator.

*Construction.*

1. Katz computes the effect of the l-isogenies of the Tate curve on level structures and on omega_can (1.11.0.3 and 1.11.0.4: pi-check^*(omega_can) = omega_can on Tate(q^{nl}) for H = mu_l, and = l.omega_can for the subgroups H_i) and obtains Formula 1.11.1 with the modified level structures alpha_n' and alpha_n''.
2. Cor. 1.11.2 reads off preservation of holomorphy, cuspidality and polynomial q-expansions from the formula.
3. Prop. 1.11.3: by the base-changing theorem (1.7.1 for n >= 3; for n = 2 the level-two theorem 1.8.1 is the one available) one reduces to K = Z[1/n]; T_l exists a priori over Z[1/nl], but its q-expansions have coefficients in Z[1/n, zeta_n], so 1.6.2 and 1.9.1 place T_l f in forms over Z[1/n].
4. Cor. 1.11.4 handles level one by writing level-one forms as a fibre product over two coprime auxiliary levels n, m >= 3 both prime to l.

*Acceptance.*

- Check that the term l^{k-1} a_{i/l} is evaluated at the modified level structure alpha_n' and the term a_{li} at alpha_n'', as in (1.11.1.2), and that with the other natural choice alpha_n o pi-check = l.pi(alpha_n) the formula would change by the action of l on level structures
- Check that the mod p reduction of T_l for l = p agrees with Serre's U_p on q-expansions, using k >= 2

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.2/generation-of-the-integral-hecke-algebra — the generators T_n and ⟨d⟩ of the Hecke algebra
- AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation — T_l^*(θf) = l θ(T_l^* f)

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `ModularCurvesPartII:R14.1`.

*Sources.*

- p-adic properties of modular schemes and modular forms, Formula 1.11.1 (1.11.1.2), printed p. 92 (Ka-24): “b_i(alpha_n) = l^{k-1} a_{i/l}(alpha_n') + a_{li}(alpha_n'') (with the convention that a_{i/l} = 0 unless l|i).” The literal q-expansion formula for T_l, transcribed from the page image (the text layer garbles the primes on alpha_n). The drafter's reading a_{i/l}(l alpha_n) + a_{li}(alpha_n) was corrected by the reviewer.
- p-adic properties of modular schemes and modular forms, Corollary 1.11.4, printed p. 93 (Ka-25): “Let k > 2 . For any prime ~, and any Z-module K, there is a necessarily unique endomorphism of the space of modular forms of weight k and level one, holomorphic at ~ , whose effect on the q-expansion is that given by the formulas (1.11.1.O-2).” Integral Hecke operators on level-one forms with arbitrary Z-module coefficients, the form needed for reduction mod p; OCR prints 'k >= 2' as 'k > 2'.
- p-adic properties of modular schemes and modular forms, 1.11.0.0-1.11.0.2, printed p. 90 (Ka-22): “There is another "natural" choice of level n structure on E_R'/H, namely alpha_n o pi-check = l.pi(alpha_n), which we will not use.” Fixes which level structure enters the definition of T_l. Added by the reviewer.

### Lemma. Generators of the integral weight-two Hecke algebra of Γ_H(N)

*Node* `AlgebraicModularFormsAndSerreWeights:R15.2/generation-of-the-integral-hecke-algebra`.

Let Γ = Γ_H(N), let 𝕋_ℤ ⊂ End(S₂(Γ)) be generated by the T_n (n ≥ 1) and the ⟨d⟩ (d ∈ (ℤ/Nℤ)^×), and 𝕋_R = 𝕋_ℤ ⊗ R. (a) 𝕋_R is generated as an R-algebra by the T_n for all n ≥ 1, and also by the T_p for all primes p together with the ⟨d⟩. (b) If D is a positive integer prime to N, and either D is odd or 2 is invertible in R, then 𝕋_R is generated by the T_n with (n, D) = 1, and also by the T_p for p ∤ D together with the ⟨d⟩.

*Hypotheses.*

- (b) needs D odd or 2 ∈ R^×; the source attributes (a) to Diamond–Im, Proposition 3.5.1, and (b) to Wiles (Annals 1995), p. 491, neither of which was read
- weight two and the groups Γ_H(N) only, as in the source

*Proof outline.*

1. (a): T_n for composite n is a polynomial in the T_p and ⟨d⟩ by the Hecke relations T_{mn} = T_mT_n for (m, n) = 1 and T_{p^{r+1}} = T_pT_{p^r} − p⟨p⟩T_{p^{r−1}} (p ∤ N), T_{p^r} = T_p^r (p | N); and ⟨d⟩ lies in the algebra generated by the T_n since ℓ⟨ℓ⟩ = T_ℓ² − T_{ℓ²} for primes ℓ ≡ d mod N, ℓ ∤ N, choosing two such primes with coprime values of ℓ (Dirichlet).
2. (b): the diamond operators are recovered from T_ℓ with ℓ ∤ DN in the same way, using the hypothesis on 2 for the coprimality step; then the T_p with p | D are expressed through the duality of 𝕋 with the forms (the pairing (T, f) ↦ a₁(Tf)), as in Wiles' argument (not read).

*Acceptance.*

- N = 11, Γ = Γ₀(11): S₂ is one-dimensional and 𝕋_ℤ = ℤ is generated by T₂ alone (T₂ acts by −2 on 11a1 and ℤ[−2] = ℤ).
- For D = 2 and R = ℤ (2 not invertible, D even) part (b) does not apply: the generation by the T_n with n odd is not asserted.

*Used by.*

- AutomorphicGaloisRepresentations:R19.6/reduced-hecke-algebra-as-a-localisation — 𝕋_Σ contains κ(T_ℓ) when δ = 0 (Darmon–Diamond–Taylor Proposition 4.7)
- AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations — the restriction to 𝕋^{(D)} in the oldform comparison

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`.

*Sources.*

- Fermat's Last Theorem, §4.1, Lemma 4.1, p. 107 (revision of 9 September 2007): “TR is generated as an R-algebra by either of the following” Parts (a) and (b), with the references [DI] Proposition 3.5.1 and [W3] p. 491.

## R15.3 — Characteristic-p operations

The required objects are the Hasse invariant, Frobenius/Verschiebung operations and theta, with their q-expansion formulas, Hecke compatibilities and filtration consequences. Import the Igusa geometry from its owner rather than reconstructing it. The source proof for each operation must state its characteristic and level assumptions; characteristics two and three require their own checks. Ordinary complex differentiation or a Witt-vector identity is not already the modular characteristic-p operator.

The accepted scope still requires explicit Hasse q-expansion and theta-on-a-known-form tests. This checkpoint supplies no replacement for the reviewed Katz/Edixhoven construction nodes and no assertion that their low-characteristic cases are resolved.

Checkpoint 3 carries the reviewed decomposition's nodes for this stage with explicit prerequisites.

### Construction. The Hasse invariant as a level-one weight-(p-1) form over F_p with q-expansion 1

*Module* `TauCeti/NumberTheory/ModularForms/ModP.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`.

Let R be an F_p-algebra and E/R an elliptic curve. Absolute Frobenius induces a p-linear endomorphism of H^1(E, O_E); if omega is a basis of omega_{E/R} with dual basis eta of H^1(E, O_E), define A(E, omega) in R by F_abs(eta) = A(E, omega) eta. Then A(E, k omega) = k^{1-p} A(E, omega) for k in R^*, so A is a modular form of level one and weight p-1 over F_p. Intrinsically A is the section of omega_{E/R}^{tensor (p-1)} corresponding to the R-linear map F_abs: (H^1(E,O_E))^{tensor p} -> H^1(E, O_E). A is holomorphic at infinity and A(Tate(q), omega_can) = 1.

*Hypotheses.*

- R is an F_p-algebra (p = 0 in R); the construction is purely characteristic p
- omega must be a basis of omega_{E/R}, so the scalar A(E, omega) is defined only after a trivialization, the weight p-1 transformation law being exactly the resulting ambiguity
- holomorphy at infinity uses that the Tate curve over F_p((q)) extends to a plane curve over F_p[[q]] whose dualizing sheaf has omega_can as a basis

*API.*

- `TauCeti.ModPModularForms.hasseInvariant` (*constructor*) — A(E, ω) ∈ R defined by F_abs(η) = A(E, ω)η, η dual to ω, for E over an F_p-algebra R.
- `TauCeti.ModPModularForms.hasseInvariant_weight` (*characterisation*) — A(E, λω) = λ^{1−p}A(E, ω): A is a level-one form of weight p − 1 over F_p.
- `TauCeti.ModPModularForms.hasseInvariant_tate` (*simp*) — A(Tate(q), ω_can) = 1.

*Unit tests.*

- `TauCeti.ModPModularForms.hasse_E4_mod5` (example) — p = 5: A = E₄ mod 5, as E₄ = 1 + 240∑σ₃(m)q^m and 5 | 240 (checked in the suggested Lean file).
- `TauCeti.ModPModularForms.hasse_no_level_one_lift_p2` (non-example) — p = 2: A does not lift to a level-one form holomorphic at ∞ over ℚ ∩ ℤ₂ (Katz 2.1); it lifts only at level 3 ≤ n ≤ 11, n odd.
- `TauCeti.ModPModularForms.hasse_weight_zero_filtration` (degenerate) — A has q-expansion 1, the q-expansion of the constant form of weight 0, so its filtration is w(A) = 0.

*Construction.*

1. Katz 2.0 defines A(E, omega) by F_abs(eta) = A(E, omega) eta and computes A(E, k omega) = k^{1-p} A(E, omega) from p-linearity of F_abs, which is exactly the weight p-1 transformation law.
2. He reinterprets F_abs as an R-linear map on the p-th tensor power, exhibiting A as a section of omega^{tensor (p-1)}.
3. Holomorphy at infinity is proved twice: first by extending Tate(q) over F_p((q)) to a plane curve C over F_p[[q]] whose dualizing sheaf has omega_can as a basis, so A(Tate(q), omega_can) is the matrix of F_abs on H^1(C, O_C) and lies in F_p[[q]]; second by the invariant-derivation computation (H^1(E, O_E) is the tangent space, F_abs acts by the p-th iterate of an invariant derivation, D(t) = 1+t, D^p = D, hence F_abs^*(eta_can) = eta_can for the dual basis eta_can). Only the second computation gives the value A(Tate(q), omega_can) = 1.

*Acceptance.*

- Verify A(Tate(q), omega_can) = 1 directly from the invariant derivation D dual to omega_can = dt/(1+t)
- Verify that the vanishing locus of A is the supersingular locus, by checking A(E, omega) = 0 exactly when F_abs is zero on H^1(E, O_E) (a standard characterization not stated in the passage 2.0 read here)

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation — the filtration w(f) is defined by division by A

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/level-one-and-two-by-descent-with-explicit-inverted-primes`.

*Planet:* Hasse invariant.

*Sources.*

- p-adic properties of modular schemes and modular forms, 2.0, printed p. 97 (Ka-29): “whence A(E,k~) = KI-P.A(E,~) , which shows that A(E,~) is a modular form of level one and weight p-i defined over ]Fp” Literal derivation of the weight p-1 transformation law from p-linearity of absolute Frobenius.
- p-adic properties of modular schemes and modular forms, 2.0, printed pp. 97-98 (Ka-29/30): “hence D^p = D, hence F*_abs(eta_can) = eta_can, and A(Tate(q), omega_can) = 1.” The normalization A(Tate(q), omega_can) = 1 at the cusp; the page image shows the Frobenius acting on the dual basis eta_can of H^1, not on omega_can. Corrected by the reviewer.

### Theorem. A = E_{p-1} mod p for p >= 5, and the explicit level-n liftings of A required at p = 2, 3

*Node* `AlgebraicModularFormsAndSerreWeights:R15.3/deligne-congruence-and-the-explicit-p-equals-2-3-liftings`.

For even k >= 4 the Eisenstein series E_k = 1 - (2k/B_k) sum sigma_{k-1}(n) q^n is defined over Q by the q-expansion principle 1.9.1. For k = p-1 with p >= 5 the p-adic ordinal of -2(p-1)/B_{p-1} is 1, so E_{p-1} has q-expansion coefficients in Q intersect Z_p and reduces mod p to a level-one weight-(p-1) form over F_p with constant q-expansion 1; since A also has q-expansion 1 and the same weight, A = E_{p-1} mod p. For p = 2 and p = 3 it is not possible to lift A to a level-one form holomorphic at infinity over Q intersect Z_p. Instead, for p = 2 and 3 <= n <= 11 with n odd, A lifts to a weight-1 level-n form holomorphic at infinity over Z[1/n], and for p = 3 and any n >= 3 with 3 not dividing n, A lifts to a weight-2 level-n form over Z[1/n], both by Theorem 1.7.1 (the following sentence, choosing the lifting E_{p-1}, prints the p = 3 range as n >= 2, 3 not dividing n). By the Remark, for p = 2 a lifting of A to level n over Z[1/n] exists for n = 3, 5, 7, 9, 11 and hence for any n divisible by one of 3, 5, 7, 11; Katz does not know whether A lifts to level n for other n (even n = 13), and notes that E_4 = 1 + 240 sum sigma_3(n) q^n provides a level-one lifting to Z of A^4 when p = 2 and of A^2 when p = 3.

*Hypotheses.*

- p >= 5 for the level-one congruence A = E_{p-1} mod p; the argument needs E_{p-1} to be p-integral and to reduce to the constant 1
- the identification of two forms with equal q-expansion uses the level-one q-expansion principle, Cor. 1.9.1
- the p = 2 lifting is produced by Thm 1.7.1 for odd n with 3 <= n <= 11 and then, by the Remark, for every n divisible by one of 3, 5, 7, 11; for other n it is open in the source. The p = 3 lifting is in weight 2, where Thm 1.7.1 applies for all n >= 3 with 3 not dividing n

*Proof outline.*

1. Katz 2.1 computes the q-expansion of E_k and its field of definition, then observes that for k = p-1 with p > 3 the p-adic ordinal of 2(p-1)/B_{p-1} is 1, so E_{p-1} has p-integral coefficients and reduces to the constant 1.
2. Since A also has q-expansion 1 (node hasse-invariant-as-a-form-of-weight-p-minus-one) and both have weight p-1 and level one, they agree by the q-expansion principle.
3. For p = 2, 3 Katz states that A admits no level-one holomorphic lifting and produces the level-n liftings from Thm 1.7.1 in the indicated weight and level ranges, flagging explicitly that the case p = 2, n = 13 is unknown to him.

*Acceptance.*

- Check the von Staudt-Clausen computation ord_p(B_{p-1}) = -1 for p >= 5, hence ord_p(2(p-1)/B_{p-1}) = 1, so that E_{p-1} is p-integral with constant term 1 and all other coefficients divisible by p
- Check that at p = 2 and p = 3 the roadmap's characteristic-p operations are stated with an explicitly chosen lifting E_{p-1} of level n, and never through a division by p-1 or by 6

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`.

*Sources.*

- p-adic properties of modular schemes and modular forms, 2.1, printed p. 98 (Ka-30): “Thus it makes sense to reduce Ep-i modulo p , obtaining a modular form over ]Fp , whose q-expansion is the constant I. Hence A = Ep_ I mod p , because both are modular forms of the same weight with the same q-expansions.” Literal statement of Deligne's congruence together with the q-expansion argument used to prove it.
- p-adic properties of modular schemes and modular forms, 2.1, printed pp. 98-99 (Ka-30/31): “For p = 2 and 3, it is not possible to lift A to a modular form of level one, holomorphic at infinity, over Q intersect Z_p. However, for p = 2 and 3 <= n <= 11, 2 does not divide n, we may lift A to a modular form of level n and weight 1,” The literal exceptional treatment at p = 2 and p = 3 with its level range, transcribed from the page image (the text layer drops the inequality signs).
- p-adic properties of modular schemes and modular forms, Remark in 2.1, printed p. 99 (Ka-31): “For p = 2, there exists a lifting of A to a modular form of level n over Z[1/n] for n = 3, 5, 7, 9, 11, and hence for any n divisible by one of 3, 5, 7, 11. But the author does not know whether A lifts to a form of level n for other n (even for n = 13!).” The full Remark: the p = 2 lifting extends to every n divisible by 3, 5, 7 or 11, and is open only for the remaining n. Extended by the reviewer.

### Construction. The theta operator, the filtration w(f), and their Hecke commutation relations

*Module* `TauCeti/NumberTheory/ModularForms/ModP.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`.

Let M(N) = direct sum over k >= 0 of M(N, k), the graded F_p-bar-algebra of mod p modular forms of level N. The filtration of f in M(N, k) is w(f) = min{ k - i(p-1) : f is in A^i M(N, k - i(p-1)) } where A is the Hasse invariant; equivalently w(f) is the least k' such that some form of weight k' has, at some cusp, the same q-expansion as f. This equivalence rests on the fact that the kernel of the q-expansion map M(N) -> F_p-bar[[q]] at any cusp is the ideal generated by A - 1. There is a derivation theta: M(N) -> M(N) raising degrees by p+1 whose effect on q-expansions at all cusps is q d/dq. If f in M(N, k) has filtration k and p does not divide k, then w(theta f) = k + p + 1. If f is in M(N, pk) and theta f = 0, then f = g^p for a unique g in M(N, k). The Hecke commutation is T_l^*(theta f) = l theta(T_l^* f), so in particular T_p^*(theta f) = 0, and if f is an eigenform of type (N, k, eps) with eigenvalues a_l then theta f is an eigenform of type (N, k+p+1, eps) with eigenvalues l a_l, whence rho_{theta f} = rho_f tensor chi.

*Hypotheses.*

- forms are Katz mod p modular forms of level N with p not dividing N, in Edixhoven's sense of section 2.1 of the source
- the filtration statement w(theta f) = k + p + 1 needs both w(f) = k and p not dividing k
- the identification of the kernel of the q-expansion map with the ideal (A-1) is imported from Katz's work on mod p modular forms, cited as [15], section 1
- Edixhoven takes the Hasse invariant A from Katz-Mazur ([16], section 12.4) as the form of type (1, p-1) with q-expansion 1 at all cusps, and notes that forms of weights k and k' with the same q-expansion at a cusp have k = k' mod (p-1)

*API.*

- `TauCeti.ModPModularForms.filtration` (*constructor*) — w(f) = min{k − i(p − 1) : f ∈ A^i M(N, k − i(p − 1))}.
- `TauCeti.ModPModularForms.theta` (*constructor*) — The derivation θ : M(N) → M(N) of degree p + 1 acting by q d/dq on every q-expansion.
- `TauCeti.ModPModularForms.theta_filtration` (*characterisation*) — If w(f) = k and p ∤ k then w(θf) = k + p + 1.
- `TauCeti.ModPModularForms.theta_hecke` (*compatibility*) — T_l^*(θf) = l θ(T_l^* f); hence ρ_{θf} = ρ_f ⊗ χ for an eigenform f.

*Unit tests.*

- `TauCeti.ModPModularForms.theta_qexp` (example) — θ(∑a_nq^n) = ∑ n a_n q^n; for Δ mod 5 the coefficient of q² in θΔ is 2·τ(2) = −48 ≡ 2 (checked in the suggested Lean file).
- `TauCeti.ModPModularForms.theta_kills_pth_powers` (non-example) — θ(g^p) = 0 although g^p ≠ 0: θ is not injective, and the kernel in weight pk consists of p-th powers.
- `TauCeti.ModPModularForms.theta_hasse` (degenerate) — θA = 0, as A has constant q-expansion 1.

*Construction.*

1. Edixhoven 3.1 records the two equivalent descriptions of the filtration and reduces the equivalence to the description of the kernel of the q-expansion map as the ideal generated by A - 1.
2. He states Katz's construction of theta as a derivation of the graded algebra raising degree by p+1 and acting as q d/dq on q-expansions at all cusps.
3. The commutation relation T_l^*(theta f) = l theta(T_l^* f) is stated in 3.1, not proved there (the construction of theta is attributed to Katz [15]); taking l = p gives T_p^*(theta f) = p theta(T_p^* f) = 0 because p = 0 in F_p-bar. Edixhoven also notes that theta preserves cusp forms.
4. The eigenvalue statement l a_l is the twist by the cyclotomic character, which is what makes rho_{theta f} = rho_f tensor chi.

*Acceptance.*

- Check theta on a known level-one form (for instance Delta at p = 5) and confirm both the weight shift by p+1 and the eigenvalue shift a_l -> l a_l
- Check that theta f = 0 forces f to be a p-th power and that the induced weight divides by p as stated

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables — θ-cycles are the sequences of filtrations of θ^i f
- AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases — Serre's twisting formula (2.2.5) matches w(θf) = w(f) + p + 1

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`.

*Sources.*

- The weight in Serre's conjectures on modular forms, 3.1, p. 7 of the DVI: “there exists a derivation # : M (N ) -> M (N ) that increases degrees by p+ 1 and whose effect on q-expansions (at all cusps) is qd/dq” Literal construction of theta with its degree shift and its effect on q-expansions; '#' is the conversion's rendering of theta.
- The weight in Serre's conjectures on modular forms, 3.1, p. 7 of the DVI: “If f # M (N, k) has filtration k, and p# |k, then #f has filtration k+ p+ 1. If f # M (N, pk) and #f = 0, then f = gp for a unique g # M (N, k). The commutation relations of # with the Hecke operators are: Tl*(#f ) = l #(Tl*f ).” The exact filtration hypothesis 'p does not divide k' and the Hecke commutation relation retained above.

### Theorem. Tate's theta-cycles, with the p > 3 classification and the explicit p = 2 and p = 3 tables

*Node* `AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables`.

For a homogeneous f in M(N) with theta f nonzero, the theta-cycle of f is the sequence (w(theta f), ..., w(theta^{p-1} f)). Up to cyclic permutation a theta-cycle is always of one of the two displayed shapes: (k, k+p+1, ..., k+(p-2)(p+1)) when k = 2 mod p, and (k, k+p+1, ..., k+(p-k_0)(p+1), k_1, k_1+p+1, ..., k_1+(k_0-3)(p+1)) when k = k_0 mod p with 3 <= k_0 <= (p+3)/2 and k_1 = k + p + 3 - 2 k_0 - this classification being asserted at least for p > 3. For p = 2 the only possibility is (k) with k = 0 mod 2; for p = 3 the possibilities are (k, k+4) with k = 2 mod 3 and (k, k) with k = 0 mod 3. For a cuspidal eigenform of type (N, k, eps) with 1 <= k <= p+1 and w(f) = k, the cycle is given by the case table of Prop. 3.3, which splits on whether a_p = 0 and has explicit small-characteristic variants for p = 2 and p = 3.

*Hypotheses.*

- theta f nonzero, so that the cycle is defined
- the general classification is asserted 'at least for p > 3', with p = 2 and p = 3 listed separately; the published proof cited is for level 1 ([13], section 7)
- Prop. 3.3 requires f cuspidal, an eigenform of type (N, k, eps) with 1 <= k <= p+1 and with filtration equal to k, i.e. f not divisible by the Hasse invariant

*Proof outline.*

1. Edixhoven 3.2 states the classification of theta-cycles as 'straightforward but surprising', without proof, and attributes a proof in the level-one case to [13] = Jochnowitz, The local components of the Hecke algebra mod l, section 7; he also notes that always w(theta^p f) = w(theta f).
2. Prop. 3.3 deduces the case table from that classification, with the single exception a_p nonzero and k = p, where one must exclude w(theta f) = 3; Edixhoven argues that w(theta f) = 3 would force w(theta^{p-1} f) = p = w(f), hence f - theta^{p-1} f = V_p g for a nonzero g of weight 1, hence f a linear combination of A g and V_p g and w(theta f) = p+2, a contradiction.
3. Note that w(theta^{p-1} f) = w(f) holds only when the q-expansion of f at some cusp has a_{p n} = 0 for all n, which the source records explicitly.

*Acceptance.*

- Reproduce the p = 3 table entries (5,9), (6,2), (3,3) for a_3 = 0 and (5,9), (6,6), (5,9), (8,12) for a_3 nonzero on explicit eigenforms of level N prime to 3
- Confirm the p = 2 table of Prop. 3.3: for a_2 = 0 the cycles are (4) for k = 1 and (2) for k = 2, and k = 3 does not occur; for a_2 nonzero they are (4), (4), (6) for k = 1, 2, 3; so no p > 3 formula is used at p = 2

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`.

*Planet:* Tate's θ-cycles.

*Sources.*

- The weight in Serre's conjectures on modular forms, 3.2, p. 7 of the DVI: “where 3 # k0 # (p + 3)/2 and k1 = k + p + 3 - 2k0 , at least for p > 3. A proof of this fact for level 1 can be found in [13 ], S7. For p = 2 the only possibility is (k) with k # 0 (2).” The literal restriction 'at least for p > 3' and the separate p = 2 statement, both retained.
- The weight in Serre's conjectures on modular forms, Proposition 3.3 and its proof, pp. 8-9 of the DVI: “Let f be a cuspidal eigenform of type (N, k, #) with 1 # k # p+ 1, with eigenvalues al and with w(f ) = k. Then the #-cycle of f is given as follows:” The hypotheses of Prop. 3.3, including w(f) = k, which the node keeps.

### Theorem. Every mod p eigensystem comes, up to a theta-twist, from weight at most p+1

*Node* `AlgebraicModularFormsAndSerreWeights:R15.3/weight-reduction-to-at-most-p-plus-one`.

Let f be an eigenform of some type (N, k, eps). Then there exist integers i and k' with 0 <= i <= p-1 and k' <= p+1 and an eigenform g of type (N, k', eps) such that f and theta^i g have the same eigenvalues for all T_l^* with l different from p. Edixhoven's proof (section 7) is modular-form theoretic and stated for arbitrary p: for N >= 5 prime to p it combines the long exact cohomology sequence of multiplication by the Hasse invariant 7.1.1 on X_1(N)_{F_p-bar}, Prop. 7.2 (an element B of the space S(N, p+1) of forms on the supersingular points inducing Hecke-twisted isomorphisms S(N, k) -> S(N, k+p+1)) and Prop. 7.3 (Hecke compatibility of the boundary map S(N, k) -> M^0(N, p+1-k)^dual obtained from Serre duality and Kodaira-Spencer); N = 2, 3, 4 and N = 1 with p > 3 are treated by taking G-invariants on X(4) or X(3) for a group G of order prime to p; the remaining cases N = 1, p = 2 or 3 are referred to Serre [25], Theoreme 3 (Asterisque 24-25), which was not read.

*Hypotheses.*

- the conclusion controls the eigenvalues only away from p: the T_l^* for l different from p
- the source states the range 0 <= i <= p-1; since l^{p-1} = 1 in F_p for l different from p, only i mod (p-1) affects the eigenvalues away from p (reviewer remark, not in the source)
- the cohomological proof is run at level N >= 5; N = 2, 3, 4, and N = 1 with p > 3, are obtained via G-invariants with p not dividing #G; N = 1 with p = 2 or 3 is an unread import from Serre [25], Theoreme 3

*Proof outline.*

1. Edixhoven Thm 3.4 states the result; the alternative, previously unpublished, argument uses the Jordan-Holder filtration of Sym^{k-2} F for the p-torsion F of the universal elliptic curve, with successive quotients Sym^i F tensor (det F)^{tensor j}, 0 <= i <= p-1, 0 <= j <= p-2, illustrated by the exact sequence 0 -> F -> Sym^p F -> Sym^{p-2} F tensor det F -> 0.
2. Edixhoven's own proof is given in section 7: Prop. 7.2 produces B in S(N, p+1) with T_l^*(Bf) = l B T_l^*(f) (three constructions: Robert [23] Thm B, E_{p+1} mod p for p >= 5; the Kodaira-Spencer image of the simple zero of A; Katz [15]), Prop. 7.3 shows via Lemma 7.4 (compatibility of Kodaira-Spencer with isogenies) that the map Phi: S(N, k) -> M^0(N, k')^dual, k' = p+1-k, intertwines T_l^* with l^{k-1} T_l^{*dual}, and 7.5 assembles these with the long exact sequence of 7.1.1 and the fact that duality on finite-length F_p-bar[T_l]-modules preserves supports.
3. The first published proof for p >= 5 is attributed to Ash-Stevens, [1], Thms 3.4 and 3.5.
4. 7.5, small levels: for N = 4 or 2 (so p odd) M(N, k) = H^0(X, omega^k)^G with X = X(4) and G a subgroup of SL_2(Z/4Z) of order prime to p; for N = 3 the same with X(3); for N = 1 and p > 3 with G = SL_2(Z/3Z) or SL_2(Z/4Z); G-invariants are exact and the exact sequence 7.5.1 is G-equivariant. For N = 1 and p = 2 or 3 the source refers to Serre [25], Theoreme 3.

*Acceptance.*

- Check on an example of weight k > p+1 that the produced pair (i, k') satisfies rho_f = rho_g tensor chi^i
- Check that the statement is only about eigenvalues away from p, by exhibiting a case where a_p(f) and a_p(theta^i g) differ

*Used by.*

- SerreWeightAndLevelOptimisation R20.3 — the first step of Edixhoven's proof of Theorem 4.5

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables`, `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`.

*Planet:* Weight reduction to at most p + 1.

*Sources.*

- The weight in Serre's conjectures on modular forms, Theorem 3.4, p. 9 of the DVI: “Let f be an eigenform of some type (N, k, #), then there exist integers i and k# with 0 # i # p- 1, k# # p + 1 and an eigenform g of type (N, k#, #) such that f and #ig have the same eigenvalues for all Tl* (l #= p).” Literal statement including the restriction to l different from p.
- The weight in Serre's conjectures on modular forms, 7.5 Proof of Theorem 3.4, p. 25 of the DVI: “Theorem 3.4 is a consequence of the existence of the long exact cohomology sequence of 7.1.1 combined with Propositions 7.2 and 7.3, if N # 5. We are now left with the cases” Records that the proof is run for N >= 5 and that the small levels need a separate argument.
- The weight in Serre's conjectures on modular forms, 7.5, p. 26 of the DVI: “Theorem 3.4 now follows by taking G-invariants, except for N = 1 and p = 2 or 3. For these remaining two cases we refer to [25], Theoreme 3.” The level-one characteristic-2 and -3 cases rest on an unread import. Added by the reviewer.

## R15.4 — The local Serre recipe

Keep the full local residual representation, including its extension class when required. Equal semisimplified inertia does not imply the same weight recipe. The recipe is defined by the local case table, not by taking a minimum among weights of modular realizations. Separate the classical Serre weight from a Katz minimum; import the local finite-flat and ramification results from R07. Actual modular-weight optimization belongs to R20.3.

Continuation must preserve the irreducible, reducible, scalar, extension-sensitive and twisting rows, coefficient/isomorphism invariance, and the dyadic weight-two/weight-four distinction. Required tests include two extensions with equal semisimplified inertia, the dyadic finite-flat and non-finite-flat branches, and an untwisted weight outside the familiar twist-normalized interval. These are explicit coverage requirements, not completed statements in the present Lean prototype.

Checkpoint 2 carries the reviewed decomposition's nodes for this stage, with their prerequisites made explicit, and adds the nodes marked new.

### Lemma. The two tame characters of a local residual representation are of level 1 or of level 2 and then conjugate

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/tame-inertia-characters-of-a-local-residual-representation`.

Let rho_p: G_p -> GL(V) = GL_2(F_p-bar) be continuous, G_p = Gal(Qbar_p/Q_p), I its inertia subgroup, I_p the wild inertia (the maximal pro-p subgroup of I) and I_t = I/I_p the tame quotient. On the semisimplification V^{ss} of V as a G_p-module, I_p acts trivially, so I_t acts and the action is diagonalizable, given by two characters phi, phi' of I_t. These characters are of level 1 or of level 2; if they are of level 2 then phi' = phi^p and phi = phi'^p. When phi, phi' are of level 2, V is irreducible.

*Hypotheses.*

- V is 2-dimensional over F_p-bar and rho_p is continuous, so its image is finite
- I_p acts trivially on V^{ss}: Serre cites [41], prop. 4 (Serre, Proprietes galoisiennes des points d'ordre fini des courbes elliptiques, Invent. Math. 15 (1972)) for this
- the identification I_t = inverse limit of F_{p^n}^* is cited as [41], prop. 2
- the fundamental characters and the identification of I_t are constructed in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/tame-inertia-characters, which also restates this dichotomy; the node here is the form in which Serre's recipe uses it

*Proof outline.*

1. Choose s in G_p lifting the Frobenius x -> x^p of G_p/I = Gal(F_p-bar/F_p). Serre states ('on verifie facilement') that s u s^{-1} = u^p mod I_p for u in I, so conjugation by s acts on I_t by u -> u^p.
2. Hence the set {phi, phi'} is stable under p-th power, giving the dichotomy: either phi^p = phi and phi'^p = phi' (both of level 1), or phi^p = phi', phi'^p = phi with phi different from phi' (both of level 2).
3. In the level-2 case V is irreducible: a stable line would give a character of I_t extendable to G_p, hence of level 1.

*Acceptance.*

- Check that the tame characters of the p-torsion of a supersingular elliptic curve over Q_p are the two fundamental characters of level 2
- Check that in the level-1 case the restriction of rho_p to I need not be semisimple, so the classification of V^{ss} does not by itself determine rho_p|I

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases — the level-1/level-2 dichotomy selects the case of the recipe

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/tame-inertia-characters`, `ArithmeticGaloisRepresentations:R01.2`.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proposition 1, section 2.1, printed p. 183: “Les caracteres p et p' donnant l'action de I t sur VS' sont de niveau 1 ou 2 . S'ils sont de niveau 2, ils sont conjugues : on a p' _ pp et p = p" .” Literal statement of Proposition 1; the OCR renders phi as 'p' and the exponents are lost, but the dichotomy and the conjugacy relation phi' = phi^p are the content quoted.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proof of Proposition 1 and 2.2, printed p. 183: “La representation V est alors irreductible, car si elle contenait un sous-espace stable de dimension 1, l'action de It sur ce sous-espace se ferait par un caractere prolongeable a Gp , donc de niveau 1 .” The irreducibility argument in the level-2 case, retained as part of the node statement.

### Definition. Serre's weight in the two tame cases, with the normalizations and the (0,0) shift

*Module* `TauCeti/NumberTheory/ModularForms/SerreWeight.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`.

Level-2 case (Serre 2.2): if phi, phi' are of level 2, write phi = psi^{a+pb} = psi^a psi'^b uniquely with 0 <= a, b <= p-1 using the two fundamental characters psi, psi' = psi^p of level 2; then b is different from a (else phi would be (psi psi')^a = chi^a, of level 1), phi' = psi^b psi'^a, and after permuting phi and phi' one may assume 0 <= a < b <= p-1; set k = 1 + pa + b. By Remark 2 of 2.2, for a = 0 one has (phi, phi') = (psi^b, psi'^b) with 1 <= b <= p-1 and k = 1 + b, so 2 <= k <= p; writing rho_p = chi^a tensor rho_p' the pair attached to rho_p' is (0, b-a) with k' = 1 + b - a, whence (2.2.5) k = k' + a(p+1). Level-1 tame case (Serre 2.3): if I acts semisimply on V through chi^a and chi^b, normalize 0 <= a, b <= p-2 and a <= b; set k = 1 + pa + b if (a,b) is not (0,0), and k = p if (a,b) = (0,0). The value k = p in the unramified case is a deliberate shift by p-1 away from the formula's value 1, chosen by Serre to avoid weight-one forms. In both cases the smallest possible value is k = 2 (Remarks 1).

*Hypotheses.*

- the level-2 normalization is 0 <= a < b <= p-1; the level-1 normalization is 0 <= a <= b <= p-2 - the two ranges differ and must not be conflated
- the level-1 case here assumes that the action of I on V is semisimple (I_p acts trivially), not merely that the tame characters of V^{ss} have level 1
- the exceptional convention k = p applies exactly when I acts trivially, i.e. rho_p is unramified
- the recipe depends only on ρ_p ⊗ F̄_p up to isomorphism: every clause refers to the characters of I_t on V^{ss} or to the semisimplicity of ρ_p|I, which do not change under extension of the coefficient field or conjugation

*API.*

- `TauCeti.SerreWeight.tameExponents` (*data*) — The normalised exponents (a, b) of Serre 2.2 (level 2, 0 ≤ a < b ≤ p − 1) or 2.3 (level 1, 0 ≤ a ≤ b ≤ p − 2) of a tamely ramified ρ_p.
- `TauCeti.SerreWeight.serreWeight` (*constructor*) — k(ρ_p) = 1 + pa + b in the tame cases, with k = p when ρ_p is unramified.
- `TauCeti.SerreWeight.serreWeight_twist` (*compatibility*) — In the level-2 case, k(χ^a ⊗ ρ′_p) = k(ρ′_p) + a(p + 1) (Serre (2.2.5)).
- `TauCeti.SerreWeight.serreWeight_baseChange` (*extensionality*) — k(ρ_p) depends only on the isomorphism class of ρ_p ⊗ F̄_p.

*Unit tests.*

- `TauCeti.SerreWeight.serreWeight_supersingular` (example) — For the p-torsion of a supersingular elliptic curve over ℚ_p (characters ψ, ψ′ of level 2, a = 0, b = 1) k = 2.
- `TauCeti.SerreWeight.serreWeight_unramified_shift` (degenerate) — For ρ_p unramified, (a, b) = (0, 0) and k = p, not the formula's value 1.
- `TauCeti.SerreWeight.serreWeight_level_two_p5` (example) — p = 5, level 2 with (a, b) = (1, 3): k = 1 + 5 + 3 = 9 = k′ + a(p + 1) with k′ = 1 + (3 − 1) = 3.
- `TauCeti.SerreWeight.serreWeight_normalisation_nonexample` (non-example) — Using the level-2 range 0 ≤ a < b ≤ p − 1 in the level-1 case would allow b = p − 1, whose character χ^{p−1} is trivial; the level-1 range stops at p − 2.

*Construction.*

1. Serre 2.2: uniqueness of the exponents (a,b) with 0 <= a,b <= p-1 for a level-2 character of I_t; the relation phi' = phi^p forces (2.2.2), so the pair is determined up to swapping phi and phi'.
2. Serre 2.2 Remark 2 (level-2 case): for a = 0 the formula reduces to k = 1 + b with 2 <= k <= p, and the general case is reduced to that one by twisting by chi^a, giving (2.2.5) k = k' + a(p+1). The source states this twisting formula in the level-2 case only.
3. Serre 2.3: the exponents a, b are only determined mod (p-1); the normalization 0 <= a, b <= p-2 and a <= b fixes them, and the (0,0) case is assigned k = p rather than k = 1.
4. Serre 2.3 Remark 3: twisting by successive powers of chi makes the resulting k run through a Tate theta-cycle.

*Acceptance.*

- Check that Serre's (2.2.5), k = k' + a(p+1), matches the filtration shift of the twisted modular form, i.e. that theta raises weight by p+1 as in node theta-operator-filtration-and-hecke-commutation
- Check a cyclotomic twist whose untwisted Serre weight lies outside [2, p+1], as required by the roadmap's conventions

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one — the weight k whose class mod p − 1 is read off from det ρ_p|I
- AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon — k(ρ̄) in the refined conjecture
- ClassicalSerreModularity R26–R27, R33 — Serre's weight k(ρ̄) in Khare–Wintenberger's and Dieulefait–Pacetti's statements

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/tame-inertia-characters-of-a-local-residual-representation`.

*Planet:* Serre weight (tame cases).

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.2, formulas (2.2.1)-(2.2.5), printed pp. 183-184: “Ceci fait, l'entier k attache a pp est defini par : (2 .2 .4) k=1+pa+b .” The weight formula in the level-2 case under the normalization 0 <= a < b <= p-1 recorded just above it in the source.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.3, Remark 2, printed p. 185: “La formule generale k =1 + pa + b donnerait alors k = 1 . Comme les formes modulaires de poids 1 ont un comportement quelque peu exceptionnel, j'ai prefere les eviter, et "decaler" k par p -1 ; d'ou la valeur k = p adoptee.” Serre's own explanation that k = p in the unramified case is a convention, not a computation - the exact point at which Edixhoven's k(rho) differs.

### Definition. The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces

*Module* `TauCeti/NumberTheory/ModularForms/SerreWeight.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`.

Suppose I_p acts nontrivially on V. Then D = V^{I_p} is a line, stable under G_p, and G_p acts on V/D by a character theta_1 and on D by theta_2. Write theta_1 = chi^alpha eps_1, theta_2 = chi^beta eps_2 with eps_i unramified and normalize 0 <= alpha <= p-2 and 1 <= beta <= p-1 (the two exponents do NOT play symmetric roles). Put a = min(alpha, beta), b = max(alpha, beta). If beta is not alpha+1, set k = 1 + pa + b. If beta = alpha+1, then Gal(K_t/K_0) = (Z/pZ)^* with K_t = K_0(zeta_p), K/K_t is elementary abelian of exponent p and by Kummer theory K = K_t(x_1^{1/p}, ..., x_m^{1/p}) with x_i in K_0^*/K_0^{*p}; rho_p is called peu ramifie if v_p(x_i) = 0 mod p for all i (the x_i can be chosen to be units) and tres ramifie otherwise. In the peu ramifie case (2.4.8) k = 1 + pa + b = 2 + alpha(p+1) (here a = alpha, b = alpha+1); in the tres ramifie case (2.4.9) one adds p-1 (resp. 2 if p = 2), giving k = (alpha+1)(p+1) for p different from 2 and k = 4 for p = 2. Serre's Remark (1) states that the tres ramifie case forces eps_1 = eps_2 and then m = 1 or 2; Edixhoven Prop. 8.5 gives m = 1 or 2 for p > 2 but m = 1, 2 or 3 for p = 2, so Serre's remark is incomplete at p = 2.

*Hypotheses.*

- I_p acts nontrivially; the line D = V^{I_p} being 1-dimensional and G_p-stable is what makes theta_1, theta_2 well defined
- the normalization 0 <= alpha <= p-2, 1 <= beta <= p-1 is asymmetric and is part of the definition
- the peu/tres dichotomy is a condition on the extension class, not on the semisimplification: it is read off from the valuations of the Kummer generators x_i in K_0^* = (Q_p^{nr})^*
- for p = 2 the tres ramifie correction is +2, not +(p-1) = +1
- the peu/très ramifiée dichotomy itself is defined in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/peu-tres-ramifiee; this node adds the weight attached to each branch
- Serre's Remark (1) that m = 1 or 2 in the très ramifiée case is false at p = 2, where m = 3 also occurs (Edixhoven Prop. 8.5; source issue AlgebraicModularFormsAndSerreWeights/E1); the weight does not depend on m

*API.*

- `TauCeti.SerreWeight.wildExponents` (*data*) — The exponents (α, β), 0 ≤ α ≤ p − 2, 1 ≤ β ≤ p − 1, of the characters on V/D and D = V^{I_p}.
- `TauCeti.SerreWeight.IsPeuRamifiee` (*other*) — For β = α + 1: the Kummer generators x_i of K/K_t can be chosen among the units of K₀ (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/peu-tres-ramifiee).
- `TauCeti.SerreWeight.serreWeight_wild` (*characterisation*) — k = 1 + pa + b with a = min(α, β), b = max(α, β) if β ≠ α + 1; if β = α + 1, k = 2 + α(p + 1) when peu ramifiée and (α + 1)(p + 1) (p odd) or 4 (p = 2) when très ramifiée.

*Unit tests.*

- `TauCeti.SerreWeight.serreWeight_wild_same_ss` (non-example) — Two extensions of 1 by χ with the same semisimplification, one peu and one très ramifiée, receive the weights 2 and p + 1.
- `TauCeti.SerreWeight.serreWeight_wild_generic` (example) — p = 5, α = 1, β = 3 (β ≠ α + 1): k = 1 + 5·1 + 3 = 9.
- `TauCeti.SerreWeight.serreWeight_wild_p2` (degenerate) — At p = 2 (α = 0, β = 1) the très ramifiée correction is +2, giving k = 4, not +(p − 1) = +1.

*Construction.*

1. Serre 2.4 constructs D, theta_1, theta_2 and normalizes the exponents (2.4.2)-(2.4.3).
2. In case beta = alpha+1 he identifies K_t = K_0(zeta_p) and asserts that the conjugation action of Gal(K_t/K_0) = (Z/pZ)^* on Gal(K/K_t) = rho_p(I_p) is the tautological one, then applies Kummer theory to obtain the generators x_i (2.4.6); neither step is argued in detail.
3. Definition (2.4.7): peu ramifie means all v(x_i) are divisible by p.
4. Formulas (2.4.8) and (2.4.9) give k in the two branches; Serre's Remark (1) derives eps_1 = eps_2 and m in {1,2} in the tres ramifie case from the conjugation action of G_p on rho_p(I_p); Remark (2) computes the conductors of the associated order-p characters in the two cases.
5. Edixhoven Prop. 8.5 (stated without separate proof after the computation 8.4) confirms Serre's Remark (1) that eps_1 = eps_2 - the unramified parts of theta_1 and theta_2, not theta_1 and theta_2 themselves, which differ by chi when p is odd - adds that all x_i can be chosen in Q_p^*, and corrects the value of m at p = 2: m = 1 or 2 for p > 2 and m = 1, 2 or 3 for p = 2.

*Acceptance.*

- Run two local extensions with the same semisimplified inertia but different extension class through the definition and check that they receive different weights, as the roadmap requires
- Check at p = 2 that the correction added in the tres ramifie case is 2 and not p-1 = 1, using Serre's explicit quadratic-field example

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p — the peu ramifiée branch with α = 0 is one of the k = 2 cases
- AlgebraicModularFormsAndSerreWeights:R15.4/dyadic-weight-two-or-four — at p = 2 every wild ρ_p has α = 0, β = 1

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/tame-inertia-characters-of-a-local-residual-representation`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/peu-tres-ramifiee`.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.4, (2.4.6)-(2.4.7), printed p. 186: “nous dirons que l'extension K (ou la representation pp ) est peu ramifiee si (2 .4 .7) v(x) = 0 (mod p) pour i = 1, . . ., m, i .e., si les x . peuvent etre choisis parmi les unites de K0 .” The literal definition of peu ramifie in terms of the p-divisibility of the valuations of the Kummer generators.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.4 (ii_2), formula (2.4.9), printed p. 187: “On ajoute p -1(resp . 2 si p = 2) a ce que donnerait (2 .4 .8) :” The tres ramifie correction with its explicit p = 2 value 2, which the roadmap requires to be recorded separately.
- The weight in Serre's conjectures on modular forms, Proposition 8.5, p. 27 of the DVI: “(Compare [26 ], S2.4, Remarques.) If #p is "tr`es ramifi'e" then #1 = #2 , all xi in [26 ], (2.4.6) can be chosen in Q*p and the integer m in [26 ], (2.4.6), equals 1 or 2 if p > 2 and 1 or 2 or 3 if p = 2.” Edixhoven's version of Serre's Remark (1): eps_1 = eps_2 for the unramified characters of (2.4.2), x_i in Q_p^*, and the extra value m = 3 at p = 2 that Serre's remark omits.

### Lemma. det rho_p restricted to inertia is chi^{k-1}, and the global parity relation eps(-1) = (-1)^k

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one`.

For every case of Serre's recipe, det rho_p restricted to I equals chi^{k-1}; since chi restricted to I has order p-1, the class of k mod (p-1) is determined by det rho_p, and indeed by its restriction to inertia alone. Equivalently det rho_p = eps_p chi^{k-1} with eps_p an unramified F_p-bar^*-valued character of G_p, and when rho_p comes from a global rho the character eps_p is the p-component of eps, with eps_p(Frob_p) = eps(p). Globally, det rho is a character of (Z/pNZ)^*, decomposing as chi^h times eps with h = k-1 mod (p-1), det rho(Frob_l) = l^{k-1} eps(l) for l not dividing pN, and det rho(c) = (-1)^{k-1} eps(-1); the oddness hypothesis det rho(c) = -1 is therefore equivalent to eps(-1) = (-1)^k. For p = 2 oddness is automatic since -1 = 1.

*Hypotheses.*

- the identity det rho_p|I = chi^{k-1} is verified case by case in the source, explicitly for the level-2 case and asserted analogous in the others
- the global decomposition of det rho uses that the conductor of det rho divides pN, which follows by comparing the conductor formulas of rho and det rho
- c denotes complex conjugation for a chosen embedding of Qbar into C; its image in (Z/pNZ)^* is -1

*Proof outline.*

1. Serre 1.3 identifies det rho with a pair of characters (chi^h on (Z/pZ)^*, eps on (Z/NZ)^*) and derives (1.3.5) det(Frob_l) = l^h eps(l).
2. Serre Prop. 2 (2.5.1) computes det rho_p|I = chi^{k-1} in the level-2 case from phi phi' = psi^{a+b} psi'^{a+b} = chi^{a+b} and k-1 = pa+b = a+b mod (p-1), and states that the other cases are analogous.
3. Combining, h = k-1 mod (p-1), so (1.3.5) becomes (1.3.6) det(Frob_l) = l^{k-1} eps(l).
4. (1.3.7) det rho(c) = (-1)^{k-1} eps(-1), so oddness (1.3.8) is equivalent to (1.3.9) eps(-1) = (-1)^k.

*Acceptance.*

- Check the parity rule eps(-1) = (-1)^k on a nebentype example with N > 1 and odd k
- Check that the computation of det rho_p|I in the wild case beta = alpha+1 gives chi^{k-1} in both the peu and tres ramifie branches, i.e. that the tres ramifie shift by p-1 does not change the class mod p-1

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon — ε(ρ̄) and the congruence det ρ̄ = ε χ̄^{k−1}

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proposition 2 (2.5.1) with its proof, printed p. 187: “(Comme x est d'ordre p -1, cette formule montre que la classe de k mod(p - 1) est determinee par det pp , et meme seulement par la restriction de det pp au groupe d'inertie I.)” Literal statement that the determinant on inertia pins down k mod (p-1), which is the content of this node.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 1.3, (1.3.7)-(1.3.9), printed p. 182: “Si p = 2, cette condition est automatiquement satisfaite, puisque -1 =1 .” Records that the oddness condition is vacuous at p = 2, a hypothesis distinction the roadmap's parity rule must keep.

### Theorem. The Raynaud inputs to the k = 2 criterion, and why they degenerate exactly at p = 2

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`.

Let R be a discrete valuation ring of mixed characteristic with absolute ramification index e, fraction field K, residue characteristic p. (Prolongation and uniqueness, Raynaud Prop. 3.3.2) Let G be a K-scheme in F-vector spaces of rank q admitting a finite flat prolongation. (1) The maximal prolongation is characterized on equations of type (1) by v(delta_i) <= p-1 for all i and v(delta_i) < p-1 for some i. (2) If e < p-1 then the prolongation is unique up to isomorphism and is an F-vector space scheme. (3) If e = p-1, G is simple and R is henselian, then either the prolongation is unique or there are exactly two, one etale and one of multiplicative type, and in all cases they are F-vector space schemes. (Uniqueness for group schemes, Thm 3.3.3) If e < p-1, every finite commutative K-group scheme killed by a power of p has at most one finite flat prolongation over R. (Tame characters, Thm 3.4.1, Thm 3.4.3, Cor. 3.4.4, for R strictly henselian of mixed characteristic) Galois acts on an F-vector space scheme G(Kbar) of rank q by homotheties through a character psi = product psi_{i+j}^{v(delta)}; G prolongs to a finite flat group scheme over R if and only if psi = product psi_{i+j}^{n_j} with 0 <= n_j <= e for all j; and for a finite commutative K-group scheme killed by a power of p that prolongs, every Jordan-Holder quotient is an F-vector space scheme whose character has that form. By Remark 3.4.6 these results say nothing for e >= p-1, where every finite K-scheme in F-vector spaces prolongs. (Full faithfulness, Cor. 3.3.6) If e < p-1, every morphism of generic fibres of commutative finite flat R-group schemes killed by a power of p extends uniquely, the kernel and cokernel of the extension are flat over R, and Ext of finite flat group schemes injects into Ext of their generic fibres. Consequence for the Serre recipe: for R = Z_p^{nr} one has e = 1, so the constraint 0 <= n, n' <= 1 on the tame characters holds for every p (vacuously at p = 2), but the uniqueness statements 3.3.2(2) and 3.3.3 require 1 < p-1, i.e. p >= 3; at p = 2 one is exactly in the case e = p-1 of 3.3.2(3) and uniqueness of the finite flat model may fail.

*Hypotheses.*

- Standing hypotheses vary: 3.3 assumes R of unequal characteristics (Prop. 3.3.1); 3.4 assumes R strictly henselian of unequal characteristics (Thm 3.4.1, Thm 3.4.3); Prop. 3.2.1 and Cor. 3.3.7 assume R strictly henselian
- Prop. 3.3.2(2) and Thm 3.3.3 need e < p-1; Prop. 3.3.2(3) covers e = p-1 and additionally requires G simple and R henselian
- Cor. 3.4.4 needs only that the finite commutative p-power torsion G admits a finite flat prolongation (with R strictly henselian); the bound on the exponents is 0 <= n_j <= e, so it is informative only for e < p-1 (Remark 3.4.6)
- Cor. 3.3.6 needs e < p-1 and both group schemes commutative, finite, flat and killed by a power of p
- Raynaud's theorems are owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (raynaud-uniqueness, raynaud-boundary-case, raynaud-tame-inertia); this node records the consequences at e = 1 that the recipe uses

*Proof outline.*

1. Raynaud's Prop. 3.3.2.1 characterizes the maximal prolongation by the conditions v(delta_i) <= p-1 for all i and v(delta_i) < p-1 for some i on the equations of type (1); 2 and 3 follow by comparing the maximal and minimal F-vector space prolongations.
2. Thm 3.4.1 computes the Galois action on G(Kbar) as a homothety through psi = psi_0^{v(delta_0)} ... psi_{r-1}^{v(delta_{r-1})}; Thm 3.4.3 turns prolongability into the condition 0 <= n_j <= e using Prop. 3.3.2 to extend the F-structure to the prolongation.
3. Cor. 3.4.4 combines 3.2.1 (existence of a Jordan-Holder filtration with F-vector space quotients) with 3.4.3.
4. Thm 3.3.3 is proved by reducing, via Prop. 2.2.2 and the devissage Prop. 3.2.1, to showing that a morphism between two prolongations of an F-vector space scheme that is the identity on the generic fibre is an isomorphism, which is Prop. 3.3.2(2); Cor. 3.3.6 is stated after it without separate proof.

*Acceptance.*

- Check that with e = 1 Cor. 3.4.4 yields exactly Serre's four possibilities 1, psi, psi', psi psi' = chi for the pair of tame characters of a finite-at-p representation
- Check at p = 2, e = 1 that Prop. 3.3.2.3 permits two prolongations (one etale, one multiplicative), so that no uniqueness step of the p >= 3 argument transfers verbatim

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-boundary-case`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-tame-inertia`.

*Sources.*

- Schemas en groupes de type (p,...,p), Proposition 3.3.2, parts 2 and 3, printed p. 267: “2° Si e < p— 1, ^ est, a isomorphisme pres. Punique prolongement de G sur R et c'est un schema en F-vectoriels. 3° Si e == p— 1, si G est simple et R henselien, alors, ou bien ^ est Punique prolongement de G, ou bien il existe deux prolongements de G, l'un etale, l'autre de type multiplicatif.” The uniqueness hypothesis is e < p-1; the e = p-1 case admits two prolongations. With R = Z_p^{nr} (e = 1) this is p >= 3 versus p = 2, which is the precise reason Serre's proof of his Proposition 4 is written only for p different from 2.
- Schemas en groupes de type (p,...,p), Corollary 3.4.4, printed p. 270: “Si F a pY elements, le caractere \|/ : 7^ —> F *, qui decrit l'action du groupe de Galois Gai (KjK) sur le F-vectoriel G^ (K) est alors de la forme v|/ = \|/^ . . . \)/^ avec 0 ^ Uj ^ e pour tout j.” The literal exponent bound 0 <= n_j <= e that Serre uses, with e = 1, to reduce to the four character possibilities in the proof of Proposition 4.
- Schemas en groupes de type (p,...,p), Corollary 3.3.6, printed p. 268: “Supposons e < p-\, et soient ^ et ^ des R-schemas en groupes commutatifs, finis et plats, annules par une puissance de p. ... 1° Tout morphisme de G dans H se prolonge de maniere unique en un R-morphisme u : ^ —> e^f. De plus, Ker (u) et Coker (u) sont plats sur R. 2° L'application naturelle Ext^.gr (^, ^)—> Ext^.gr (G, H ) est injective.” Confirms verbatim the statement that FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 undertakes to prove, including the flatness of kernel and cokernel and the Ext-injectivity.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proof of Proposition 4, printed p. 190: “Ce cas est traite dans Raynaud [35], th . 2 .4 .3 .” Serre's printed citation is to 'th. 2.4.3' (confirmed on the page image of p. 190). Raynaud's Bull. SMF 102 (1974), which is Serre's [35], has no section 2.4: its section 2 consists of 2.1-2.3 and its numbered results there are 2.2.2, 2.2.3 and 2.3.1. The theorem that treats exactly this case - prolongability of the F-vector space scheme attached to a character psi - is Theorem 3.4.3, p. 270, which is therefore the plausible intended referent.
- Schemas en groupes de type (p,...,p), Theorem 3.3.3 and Remarks 3.3.4-3.3.5, printed p. 268: “Supposons R d'inegales caracteristiques et e < p-1. Alors tout K-schema en groupes fini, commutatif G, annule par une puissance de p, admet au plus un prolongement fini et plat sur R.” The uniqueness theorem cited by Edixhoven as [21], 3.3.3 in the p > 2 step of Prop. 8.2. Added by the reviewer.
- Schemas en groupes de type (p,...,p), Remark 3.4.6, printed p. 271: “Faut-il souligner que le theoreme 3.4.1 et le corollaire 3.4.4 ne nous apprennent rien pour e >= p-1? Par contre, il resulte de 3.4.3 que si e >= p-1, tout K-schema en F-vectoriels fini, se prolonge en un R-schema en groupes fini.” At p = 2 (e = 1 = p-1 over Z_2^{nr}) the exponent bound is vacuous and every F-vector space scheme prolongs over a strictly henselian R. Added by the reviewer.

### Comparison. For a residually reducible local representation with unramified diagonal twists, peu ramifie is equivalent to admitting a finite flat model

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`.

Let F be a finite extension of F_p and rho_p: G_p -> GL_2(F) continuous of the form (8.1.1) rho_p = (chi eps_2, *; 0, eps_1) with eps_1 and eps_2 unramified F^*-valued characters of G_p (Edixhoven's notation; this packet earlier wrote theta_i for eps_i). Let V_{Q_p} be the F-vector space scheme over Q_p attached to rho_p and D the integral closure of Z_p in the maximal unramified extension K of Q_p inside Qbar_p. Then (Prop. 8.2, for every prime p including p = 2) the following are equivalent: rho_p is peu ramifie in Serre's sense (2.4.7); V_{Q_p} extends to a finite flat F-vector space scheme over D; over Z_p; extends to a finite flat group scheme over D; over Z_p. When these hold one says rho_p is finite. Moreover (8.4) the Frobenius-compatibility of the extension class forces, for the valuations alpha_{i,j} of the Kummer classes, either all alpha_{i,j} = 0 (peu ramifie) or lambda = 1 and eps = eps_1 eps_2^{-1} trivial; hence (Prop. 8.5) tres ramifie forces eps_1 = eps_2. In the peu ramifie case with p > 2 (Prop. 8.6), with lambda = (eps_1 eps_2^{-1})(Frob_p), s = [F_p(lambda):F_p], n the order of lambda and f the minimal polynomial of lambda, the Kummer classes satisfy [x_{i,j}] = (sigma^#)^i [x_{0,j}] and their images y under D^*/D^{*p} = U/U^p = F_p-bar satisfy f(Frob_p)(y) = 0, an equation all of whose p^s solutions lie in F_{p^n}; conversely any such data come from a peu ramifie rho_p.

*Hypotheses.*

- rho_p is of the specific shape (8.1.1): upper triangular with diagonal characters chi eps_2 and eps_1, both eps_i unramified - Serre's case beta = alpha+1 after twisting to alpha = 0
- the equivalence of the five conditions holds for all p; the explicit description 8.6 assumes p > 2 because it uses D^*/D^{*p} = U/U^p
- the proof of (4) => (2),(3),(5) uses the maximal finite flat prolongation cited as [21], 2.2.3 (Raynaud 1974, Cor. 2.2.3, not read) and the unique extension of the F-action and of the Galois descent data to it; the proof of (1) <=> (2) uses, for p > 2, Raynaud [21], 3.3.3 (at most one finite flat prolongation when e < p-1) and, for p = 2, a separate functoriality argument

*Proof outline.*

1. Edixhoven Prop. 8.2: the implications (3) => (2) => (4) and (3) => (5) => (4) are obvious; given (4), the maximal ([21], 2.2.3) finite flat extension V_D of V_K carries unique extensions of the F-action and of the descent data from K to Q_p, giving (2), (3), (5).
2. Lemma 8.3 identifies extensions of the constant F-vector space scheme F_S by an F-vector space scheme W with torsors under the underlying additive group of W.
3. End of 8.3 (the proof of (1) <=> (2)): V_K sits in 0 -> F^D_K -> V_K -> F_K -> 0 (8.3.1); after choosing an F_p-basis of F, Lemma 8.3, the Kummer sequence and Pic(K) = 0 classify such extensions by H^1_fppf(K, F^D) = direct sum of r copies of K^*/K^{*p}, and extensions of F_D by F^D_D by r copies of D^*/D^{*p}; so V_K extends to an extension of F_D by F^D_D iff all v(x_i) = 0 mod p, i.e. iff rho_p is peu ramifie. For p > 2 every extension V_D as in (2) is automatically such an extension by [21], 3.3.3; for p = 2 the functoriality of Ext and a nonzero morphism F_D -> F^D_D produce such an extension from any V_D as in (2).
4. 8.4 is not part of the proof of 8.2: from sigma^* V_{K,1} = V_{K,1}[lambda_1 lambda_2^{-1}] (8.4.1) it derives the equations 8.4.2 on the Kummer classes [x_{i,j}]; taking valuations gives 8.4.3, whence either all alpha_{i,j} vanish (peu ramifie) or lambda = 1 and eps is trivial, which yields Prop. 8.5.
5. Prop. 8.6 then solves the equations 8.4.2 explicitly in the peu ramifie case for p > 2, using D^*/D^{*p} = U/U^p = F_p-bar.

*Acceptance.*

- Check that the count p^s of peu ramifie classes in Prop. 8.6 matches the size of the corresponding space of unramified Kummer classes in a small example, for instance F = F_p and lambda = 1 (s = 1, p classes)
- Check that shape (8.1.1) is used in the proof: the exact sequence 8.3.1 with sub F^D and quotient F requires the characters on the diagonal to be chi eps_2 and eps_1 with eps_i unramified

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-kummer-extensions`.

*Sources.*

- The weight in Serre's conjectures on modular forms, 8.1 and Proposition 8.2, p. 26 of the DVI: “with #1 and #2 unramified F* -valued characters of Gp . ... The following conditions are equivalent: 1. #p is "peu ramifi'e" (see [26 ], 2.4.7), 2. VQp can be extended to a finite flat F-vector space scheme VD over D,” The hypothesis that theta_1, theta_2 are unramified and the literal list of equivalent finiteness conditions.
- The weight in Serre's conjectures on modular forms, 8.4, equations 8.4.3, p. 27 of the DVI: “From this we conclude that either #i,j = 0 for all (i, j) (i.e., #p is "peu ramifi'e") or 1 + as-1 + . . .+ a0 = 0 (i.e., # = 1 and # is trivial).” The valuation dichotomy of 8.4.3, which gives Prop. 8.5 (tres ramifie forces eps_1 = eps_2); the source writes 'lambda = 1 and eps is trivial', eps being the unramified character, not chi. The drafter's 'chi is trivial' and its use as the proof of 8.2 were corrected by the reviewer.
- The weight in Serre's conjectures on modular forms, End of 8.3, p. 27 of the DVI: “For p > 2 any extension of V_K to V_D as in (2) is automatically an extension of F_D by F^D_D (see [21], 3.3.3). If p = 2 and an extension V_D as in (2) exists, the functoriality of Ext and a non-zero morphism F_D -> F^D_D give an extension V_D of F_D by F^D_D. This completes the proof of Proposition 8.2.” The actual location of the proof of (1) <=> (2), including the explicit p = 2 argument. Added by the reviewer.

### Theorem. k = 2 if and only if det rho_p|I = chi and rho_p is finite at p

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`.

Proposition 3 of the source: k = 2 holds exactly when rho_p restricted to I is either given by the two fundamental characters psi, psi' of level 2, or is upper triangular with diagonal (chi, 1) and with I_p acting trivially or peu ramifie. Proposition 4: for rho_p with values in GL_2(F_p), k = 2 if and only if (2.8.3) det rho_p|I = chi and (2.8.4) rho_p is finite at p, i.e. the etale (p,p)-type group scheme over Q_p defined by rho_p extends to a finite flat group scheme over Z_p. The condition (2.8.3) is equivalent to k = 2 mod (p-1). The general F_q-coefficient case requires Raynaud's F-vector-space schemes rather than group schemes of type (p,p).

*Hypotheses.*

- Proposition 4 as proved is stated for rho_p valued in GL_2(F_p); the source says that for general coefficients one must work with Raynaud F-vector space schemes
- the implication (2.8.3) and (2.8.4) imply k = 2 uses Raynaud [35] cor. 3.4.4 to constrain the tame characters to psi^n psi'^{n'} with 0 <= n, n' <= 1, and Raynaud [35] prop. 3.3.2 for uniqueness of the finite flat prolongation
- the converse implication (k = 2 implies finite at p) is written without a restriction on p; its level-2 branch cites 'Raynaud [35], th. 2.4.3', a result number that does not exist in Raynaud 1974 (plausibly Theorem 3.4.3, see node raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction), and its level-1 branch is only sketched as a direct construction over a finite etale extension R of Z_p followed by descent
- Serre restricts to p different from 2 only in case (ii) {phi, phi'} = {1, chi} of the direction (2.8.3) + (2.8.4) => k = 2, saying the p = 2 case is 'un peu different, mais se traite de facon analogue' without writing it out
- the Galois-side finite-flat criterion is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-weight-two-criterion (p odd); combined with Proposition 3 (the k = 2 rows of the recipe) it gives Proposition 4; the misprinted reference "th. 2.4.3" in Serre's proof is FiniteFlatGroupsAndIntegralPadicHodgeTheory/E12

*Proof outline.*

1. Proposition 3 is stated to follow immediately from the definitions of section 2 (no further proof is given).
2. Serre reduces (2.8.3) plus finiteness to four possible pairs {phi, phi'} using Raynaud cor. 3.4.4 and the constraint phi phi' = chi, leaving the cases {psi, psi'} and {1, chi}.
3. The case {psi, psi'} gives (2.8.1) directly.
4. In the case {1, chi} one takes the unique finite flat prolongation J over Z_p (Raynaud prop. 3.3.2), which is reducible, and gets an exact sequence 0 -> A -> J -> B -> 0 of finite flat group schemes of order p with one of A, B etale and the other multiplicative; after a finite etale extension R of Z_p the sequence becomes 0 -> Z/pZ -> J -> mu_p -> 0 or 0 -> mu_p -> J -> Z/pZ -> 0.
5. In the first case the identity component splits the extension and I_p acts trivially; in the second the Kummer sequence gives a class u in R^*/R^{*p} with u a unit, so K/K_t is unramified or peu ramifie; either way k = 2.
6. For the converse, the level-2 branch is Raynaud [35] thm. 2.4.3 and the level-1 branch is a direct construction over an auxiliary finite etale extension R of Z_p followed by descent to Z_p.

*Acceptance.*

- Check that a tres ramifie extension of 1 by chi is not finite at p and has k = p+1 (p odd) or k = 4 (p = 2), so the criterion genuinely separates extension classes
- Check the criterion against the p-torsion of an elliptic curve with good reduction at p, where finiteness is automatic and k = 2

*Used by.*

- ClassicalSerreModularity R26–R27 — k(ρ̄) = 2 iff finite at p with det|_{I_p} = χ̄ (Khare–Wintenberger and Dieulefait–Pacetti)
- EllipticCurveModularity R29 — the weight of E[p] for p of good reduction

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one`, `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`, `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-weight-two-criterion`.

*Planet:* Serre's weight-two criterion.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proposition 4 and its proof, printed pp. 189-190: “On a k = 2 si et seulement si les deux conditions suivantes sont satisfaites : (2 .8 .3) det pp I = x ; (2 .8 .4) pp est finie en p .” Literal statement of the two conditions characterizing k = 2.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), Proof of Proposition 4, printed p. 190: “Occupons-nous du cas (ii), en nous bornant, pour simplifier, au cas p != 2 (le cas p = 2 est un peu different, mais se traite de facon analogue).” The source does not write out the p = 2 case of case (ii); this packet records that as an unresolved boundary rather than as an available input. The inequality sign, lost in the text layer, was restored from the page image by the reviewer.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.8, before Proposition 4, printed p. 189: “je me bornerai au cas ou pp prend ses valeurs dan GL 2 (Fp ), donc definit un schema en groupes (etale) de type (p, p ) sur le corps Q p (dans le cas general, il faudrait parler de "schemas en Fq vectoriels" au sens de Raynaud [35]) .” The coefficient hypothesis of Proposition 4 and the pointer to Raynaud F-vector space schemes for general F_q coefficients.

### Comparison. Edixhoven's k(rho_p), its exact difference from Serre's k_rho, and the minimality theorem

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`.

Edixhoven defines k(rho_p) (Def. 4.3) by the same case division and the same normalizations as Serre, except in two places: in the tame level-1 case (rho_p|I_p trivial, rho_p|I = diag(chi^a, chi^b), 0 <= a <= b <= p-2, the same normalization as Serre's 2.3) he sets k(rho_p) = 1 + pa + b also for (a,b) = (0,0), so k(rho_p) = 1 for rho_p unramified; and in the wild case (0 <= alpha <= p-2, 1 <= beta <= p-1) the additional p-1 is added exactly when chi^{beta - alpha} = chi and rho_p tensor chi^{-alpha} is not finite at p (so at p = 2 the addition is 1, not Serre's 2). Remark 4.4: always k(rho) <= k_rho, and they differ in exactly two cases - (i) rho_p|I_p trivial with a = b = 0, where k(rho) = 1 and k_rho = p; (ii) p = 2, rho_p|I_p nontrivial, alpha = 0, beta = 1 and rho_p not finite at p, where k(rho) = 3 and k_rho = 4. Theorem 4.5 (whose proof is the obligation of SerreWeightAndLevelOptimisation:R20.3, 'Prove the Edixhoven/Serre weight theorem'; it is recorded here as the statement the local recipe is compared against): if rho is continuous irreducible odd and isomorphic to rho_g for some cusp form g of type (N, k, eps) with p not dividing N which is an eigenform for all T_l^*, then there is a cuspidal eigenform f of type (N, k_rho, eps) with the same T_l^* eigenvalues as g for l different from p and rho isomorphic to rho_f; if moreover rho is not exceptional (rho_p not an extension, split or not, of an unramified character by itself), there is an eigenform f of type (N, k(rho), eps) with the same eigenvalues for l different from p and rho isomorphic to rho_f, and no eigenform of level prime to p and weight less than k(rho) has associated representation rho.

*Hypotheses.*

- k(rho_p) is defined for a local representation and depends only on rho_p; the 'not finite at p' clause refers to the finiteness notion of section 8 of the source, i.e. existence of a finite flat model
- Thm 4.5 assumes rho already modular of some type (N, k, eps) with p not dividing N; it is a weight-optimisation statement, not an existence statement
- the minimality assertion and the k(rho) form of the conclusion require rho to be non-exceptional; the added end-of-introduction note states that for p > 2 the Coleman-Voloch result removes this condition
- the proof depends on Gross [10] whose Hecke-equivariance compatibilities on pages 504-505 were, at the time of writing, unchecked; Coleman verified the map in (16.6)

*Proof outline.*

1. Edixhoven Def. 4.3 gives the case division; Remark 4.4 compares it with Serre's k_rho and isolates the two discrepancies.
2. Proof of Thm 4.5: by Thm 3.4 there is alpha with rho tensor chi^{-alpha} isomorphic to rho_{f_1} for an eigenform f_1 of type (N, k_1, eps) with k_1 <= p+1 and w(f_1) = k_1; the local results Thms 2.5, 2.6, 2.8 and Prop. 2.7 then pin down k_1 and alpha in terms of rho|G_p.
3. The desired f is obtained by untwisting: apply theta alpha times and divide by the Hasse invariant as often as possible.
4. The main complication is that k_1 is not unique: a companion form of weight p+1-k_1 may exist (Gross, Thm 2.9) or f_1 may be a multiple of the Hasse invariant (only for k_1 = p or p+1; the k_1 = p+1 case is Mazur's Thm 2.8, which is where 'finite at p' enters).
5. Minimality: given g of type (M, k, eps') with p not dividing M, the existence part gives f of type (M, k(rho), eps') with the same eigenvalues away from p; if T_p^* f = 0 = T_p^* g the q-expansions differ by a constant and k(rho) = w(f) = w(g) <= k; if T_p^* g is nonzero then k <= p+1 by Gross [10], Proposition 4.12 (not read) and 'a case by case check' (not displayed) gives k(rho) <= k.
6. Existence in the tame level-1 case alpha = beta = 0 uses Gross's Thm 2.9 (companion forms) and the non-exceptional hypothesis; the added end-of-introduction note says that for p > 2 the Coleman-Voloch theorem removes the 'not exceptional' condition from all statements of Thm 4.5.

*Acceptance.*

- Check the two discrepancy cases of Remark 4.4 explicitly: an unramified rho_p (k(rho) = 1, k_rho = p) and a p = 2 non-finite extension with alpha = 0, beta = 1 (k(rho) = 3, k_rho = 4)
- Check that the recipe is invariant under enlarging the coefficient field and under isomorphism of rho_p: every clause refers to rho_p|I, to rho_p|I_p, or to the finiteness at p of rho_p tensor chi^{-alpha}, which is a property of the G_p-representation

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`.

*Sources.*

- The weight in Serre's conjectures on modular forms, Definition 4.3 case 2(b), p. 10 of the DVI: “If ##-# = # and #p # #-# is not finite at p (see S8.1) then we set k(#p ) = 1 + pa + b + p - 1; otherwise we set k(#p ) = 1 + pa + b.” Literal statement of the extension-sensitive clause, phrased through 'finite at p' rather than through Serre's Kummer-valuation condition.
- The weight in Serre's conjectures on modular forms, Remark 4.4.1, p. 10 of the DVI: “By comparing the definitions of k# and k(#) one sees that always k(#) # k# and that they differ only in two cases. In both cases # and ## are of level 1. In the first case #p |Ip is trivial and a = 0 = b: then k(#) = 1 and k# = p. In the second case p = 2, #p |Ip is non-trivial, # = 0, # = 1 and #p is not finite at p: then k(#) = 3 and k# = 4.” The exact comparison between the two weight recipes, including the p = 2 discrepancy, which the roadmap requires the local table to record.
- The weight in Serre's conjectures on modular forms, Introduction, p. 2 of the DVI: “The remaining compatibilities (pages 504 and 505 of [10 ]) have not been checked.” Records the unverified Hecke-compatibility inputs from Gross that Theorem 4.5 depended on at the time of writing; the added note limits the damage to p = 2.

### Theorem. At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case

*Node* `AlgebraicModularFormsAndSerreWeights:R15.4/dyadic-weight-two-or-four`.

Let ρ_2 : G_{ℚ₂} → GL₂(F̄₂) be continuous. Then Serre's weight k(ρ_2) is 2 or 4, and k = 4 exactly when I_2 acts nontrivially on V (the wild case) and ρ_2 is très ramifiée (Serre 2.6). Moreover: (a) if I_2 acts trivially on V then ρ_2 is unramified or its tame characters are the fundamental characters of level 2, and k = 2; (b) in the wild case, ρ_2 is finite at 2 if and only if it is peu ramifiée (Edixhoven Prop. 8.2, valid at p = 2), so k = 2 there iff ρ_2 is finite; (c) an unramified ρ_2 is finite (it comes from a finite étale group scheme). For ρ_2 = (1 u; 0 1) with u cutting out ℚ₂(√d): k = 2 for d ∈ {5, −1, −5} and k = 4 for d ∈ {±2, ±10}. Khare–Wintenberger state the full dichotomy "k(ρ̄) = 2 iff ρ̄ is finite at 2"; its level-2 tame case needs finiteness over ℤ₂ of the prolongation that Raynaud constructs over ℤ₂^nr, which is recorded as a gap.

*Hypotheses.*

- p = 2: χ̄ is trivial, so the level-1 tame characters are trivial and the wild normalisation forces α = 0, β = 1
- the très ramifiée correction at p = 2 is +2 (Serre (2.4.9))
- the level-2 tame case: Raynaud's prolongation (Theorem 3.4.3, over a strictly henselian base) and its descent to ℤ₂ when uniqueness can fail at e = p − 1 = 1 are not written in any source read (gap)

*Proof outline.*

1. Tame case: I_2 acts on V^{ss} through characters of I_t of level 1 or 2 (R15.4/tame-inertia-characters-of-a-local-residual-representation); level-1 characters are trivial at p = 2, and a tame action is semisimple, so either ρ_2 is unramified (k = p = 2 by the shift of 2.3) or the characters are ψ, ψ′ of level 2 with (a, b) = (0, 1) and k = 1 + 0 + 1 = 2.
2. Wild case: 0 ≤ α ≤ p − 2 = 0 and 1 ≤ β ≤ p − 1 = 1 give α = 0, β = 1 = α + 1, so k = 2 + 0 = 2 if peu ramifiée and 4 if très ramifiée (R15.4/peu-et-tres-ramifie-and-the-wild-case-weight).
3. Finiteness: in the wild case R15.4/finite-at-p-equals-peu-ramifie (Edixhoven 8.2 for every p); the unramified case is étale; the example is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/dyadic-finite-flat-dichotomy and Serre's Exemple in 2.6.

*Acceptance.*

- Serre's example (2.6): ℚ₂(√5) unramified and ℚ₂(√−1), ℚ₂(√−5) of discriminant (4) give k = 2; ℚ₂(√±2), ℚ₂(√±10) of discriminant (8) give k = 4.
- The 2-torsion of a supersingular elliptic curve with good reduction at 2 is the level-2 tame case, with k = 2 and a finite flat model (its Néron model).

*Used by.*

- ClassicalSerreModularity R27.5 — the dyadic weight claim k(ρ̄′₂) = 2 and Theorem 9.1
- ClassicalSerreModularity R33.5 — the weight-2 lifts at p = 2 used by Dieulefait–Pacetti §3

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`, `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/dyadic-finite-flat-dichotomy`.

*Planet:* Dyadic Serre weights 2 and 4.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 2.6, printed p. 188: “Pour p = 2, on a k = 2 si l'action de Ip est triviale, ou peu ramifiée, et k = 4 si” The p = 2 values of the recipe and Serre's quadratic-field example.
- Serre's modularity conjecture (I), §1, p. 2 (authors' preprint): “In the case of p = 2, the values of k(ρ̄) can either be 2 or 4, with the former if and only if ρ̄ is finite at 2.” The dichotomy as Khare–Wintenberger use it.

## R15.5 — The algebraic eigenvalue-lifting core

### The input and the conclusion

Let O be a DVR, k its residue field, K its fraction field and M a finite free O-module. Let T_i be an arbitrary pairwise commuting family of endomorphisms. A nonzero common eigenvector of their action on M_k determines residue eigenvalues a_i. Deligne–Serre 6.11 supplies a DVR V dominating O, with fraction field finite over K, and a nonzero common eigenvector in M_V whose eigenvalues reduce to the images of a_i. Neither a specified lift of the original vector nor a separable extension is part of the conclusion. [DS, Lemme 6.11, printed p. 522.]

### 1. The character of the invariant line

`adjoin_invariant_line` proves that stability under all T_i extends to the generated algebra H=O[T_i]. The endomorphisms preserving the line form a subalgebra, so the statement is an application of the existing adjoin universal property. This preservation lemma is valid even for the zero line; the construction of a character is not.

`eigencharacter` takes an action r of an R-algebra H on a compatible vector space over a field k, a nonzero vector f, and invariance of its line. Each r(h) acts by a unique scalar. Cancellation against f proves additivity, multiplicativity, preservation of one and compatibility with R. The result is the existing algebra-homomorphism type H -> k. Its three API lemmas are:

- `eigencharacter_apply`: evaluate the action on f without unfolding the choice of scalar.
- `eigencharacter_unique`: identify any candidate character by the action equation.
- `eigencharacter_rescale`: a nonzero scalar multiple of f gives the same character.

The three unit tests are `scalar_character_test` (the ordinary scalar action on k gives the identity character), `nilpotent_character_test` (nilpotent elements map to zero), and `diagonal_character_test` (the two coordinate lines of k x k produce different characters). They reject, respectively, the wrong scalar normalization, an erroneous semisimplicity assumption, and a construction that forgets the selected invariant line. The suggested file states all three as examples.

### 2. The horizontal branch and its integral character

Since H is an O-submodule of a finite free endomorphism module, it is finite and torsion-free. Over the DVR it is free. Commutation of the T_i makes H commutative. These are existing-library facts whose exact instance chain still needs baseline integration; they are not a new Hecke theory.

`horizontal_prime` uses the residual character chi:H -> k. Its kernel is maximal because chi restricts to the surjective residue map of O. Flatness of H and going down produce P contained in that kernel and contracting to zero in O. The packet cites the actual pinned going-down statements rather than a generic appeal to minimal primes.

`character_valuation_lift` spells out the next construction. Put B=H/P and L=Frac(B). The field L is finite over K. Let C be the integral closure of O in L. The pinned theorem `TauCeti.integralClosure.isDedekindDomain` proves that C is Dedekind **without separability**. Because B is integral over O, it embeds in C, and C is integral over B. Choose a prime q of C above ker(chi)/P. It contains the nonzero image of an O-uniformizer, so q is nonzero. Then V=C_q is a DVR with fraction field L. The map H -> B -> V gives a lifted character. Factoring its residue map through H/ker(chi) produces the embedding k -> k_V and the required reduction square.

This expands the integral character step by a normalization argument; it is not a claim that the paper separately states this construction. It also explains why no assertion of module-finiteness of V/O belongs in the interface. The exact pinned lying-over, generic-fiber and Dedekind-localization APIs remain a named baseline-integration worklist, not unmentioned mathematical assumptions.

### 3. Why the selected character actually occurs

`generic_action_faithfulness` concerns the entire algebra L tensor_O H. Tensoring H -> End_O(M) with the flat O-module L preserves injectivity. For a finite basis of M, the natural map from the tensor of its endomorphism module to the endomorphisms of its tensor extension is the identity between the corresponding matrix modules. Thus the scalar-extended algebra acts faithfully.

`nilpotent_ideal_socle` states that a nilpotent ideal I acting on a nonzero module kills a nonzero vector. Choose the last nonzero module I^n V in the finite descending sequence. This requires neither finite generation of V nor semisimplicity.

`localized_socle_descent` is the necessary denominator step. For a maximal ideal I of a Noetherian ring A, suppose V_I is nonzero and A_I is Artinian. Its maximal ideal is nilpotent, giving an annihilated nonzero localized vector w/s. Choose finitely many generators of I and clear the annihilation equation for each generator with a denominator outside I. Multiplying those denominators gives t w in V, killed by I. Its localization is still nonzero, so t w is nonzero. It would be a gap to stop with a vector that exists only in V_I.

`faithful_character_occurrence` now applies to a finite-dimensional commutative k-algebra H acting faithfully on a finite-dimensional k-vector space V. The annihilator is zero; the pinned finite-module support theorem makes the localization at ker(chi) nonzero. The localized-socle argument gives a vector killed by that kernel. Subtracting chi(h) from h gives the desired eigenvalue equation. This proof works for nonreduced algebras. The product-of-fields theorem for **reduced** Artinian algebras is not a substitute.

### 4. Return to the integral module

`integral_eigenvector` clears the finitely many coordinates of one common eigenvector over the fraction field. The index set of operators can be infinite: no operator-specific denominators are introduced. Homogeneity preserves all eigenvector equations, and injectivity of a finite free module into its generic fiber descends them to the integral module.

`deligneSerreEigenvalueLifting` assembles the preceding declarations. The suggested statement displays the field extension, the valuation subring, the scalar embedding, the residue-field embedding, maximal-ideal contraction and every eigenvalue congruence. Its retained node ID is the integration anchor; the prototype name is a proposed Lean spelling, not a claim of an existing declaration.

### Regression examples

**A prescribed residual vector need not lift.** For T=[[0,pi],[0,0]] on O^2, the reduction of T is zero and e_2 is a residual eigenvector. Over any dominating domain, T^2=0 forces the eigenvalue of a nonzero eigenvector to be zero; then pi*y=0 forces y=0. Thus no eigenvector reduces to e_2. Nevertheless e_1 gives the required lift of the eigenvalue zero.

**A field extension can be necessary.** For T=[[0,pi],[1,0]], every eigenvalue satisfies lambda^2=pi. A uniformizer is not a square in the fraction field of a DVR because its valuation is odd. Adjoining a root alpha gives the eigenvector (alpha,1). This can be inseparable in characteristic two, precisely a case the interface must admit.

**Faithfulness is load-bearing.** Let k x k act on k by its first projection and choose the second projection as the character. Evaluating at (1,0) forces any putative eigenvector to be zero. A bare character of an algebra does not automatically occur in a particular module.

These examples are explicit tests constructed for the blueprint, not examples attributed to Deligne and Serre. Exact rational and finite-field calculations were run for the matrix identities and finite-characteristic cases; their uniform proofs are specified in the suggested file but have not been checked by Lean.

### The modular-form application still required

The reviewed node `R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform` remains on the continuation worklist. Split its actual module-lifting application from its Eisenstein weight shift and from R19's Galois attachment. DS 6.9 and 6.10 are on printed page **522**, not 521. The weight-shift argument needs its actual congruence and weight divisibility conditions; it is not supplied merely by writing a formal Hasse multiplier.

Reuse ModularForms Layer 8 and its weight-one sublayer 8W for their exact integral input. Deligne–Serre Proposition 2.7 is not Lemme 6.11. Layer 4 supplies the relevant newform/normalization and bad-prime information. A good-prime eigensystem alone is not a normalized full eigenform, and the algebraic lemma alone does not prove lifting of every Katz weight-one form at weight one. The packet makes three precise requests for these interfaces.

## R15.6 — Residual modularity witnesses

After R19.1 supplies the associated Galois representation, define the witness using its coefficient field, a prime over p, the eigenform and the isomorphism with the residual semisimplification. Use R01.5 for the finite-field descent input and R15.4 for the local weight recipe. Keep modularity-existence, weight optimization and the exceptional dyadic completion with their accepted owners. Continuation must type all maps and determinant comparisons; this checkpoint does not introduce an unspecified predicate standing for those constructions.

Checkpoint 2 carries the reviewed decomposition's nodes for this stage, with their prerequisites made explicit, and adds the nodes marked new.

### Definition. Residual modularity: mod p cusp forms of type (N, k, eps), the chosen place above p, and the field of coefficients

*Module* `TauCeti/NumberTheory/ModularForms/ResidualModularity.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field`.

Fix N >= 1 prime to p, k >= 2 and a character eps: (Z/NZ)^* -> F_p-bar^* with eps(-1) = (-1)^k for p different from 2 and k even for p = 2. Embed Qbar in C and choose a place of Qbar above p, giving a reduction map from the ring of algebraic integers to F_p-bar; let eps_0 be the multiplicative (Teichmuller) lift of eps. A cusp form of type (N, k, eps) with coefficients in F_p-bar is a formal series f = sum_{n >= 1} a_n q^n that is the reduction of some classical cusp form F = sum A_n q^n of type (N, k, eps_0) with algebraic integer coefficients. The space S(N, k, eps) does not depend on the chosen p-adic place and has F_p-bar-dimension equal to the complex dimension of S(N, k, eps_0); it is stable under T_l (l not dividing pN) and U_l (l | pN), with U_p the reduction of T_p using k >= 2; a normalized eigenform is determined by its eigenvalues a_l through the usual Euler product. Serre's Remark (6) notes that Katz's definition [23] leads to an a priori larger space, and his footnote 2 that with Katz's definition every form of weight k is also of weight k+p-1, whereas with the reduction definition adopted here this holds for p >= 5 but fails for p = 2 and 3; Edixhoven records that in [27] Serre replaced the reduction definition by Katz's, which makes it natural to allow weight 1.

*Hypotheses.*

- N prime to p and k >= 2 in this definition; the level-p case is not excluded mathematically but yields no genuinely new mod p forms, at the cost of raising the weight
- the parity condition eps(-1) = (-1)^k is imposed, and is automatic at p = 2 where instead k is required even
- the reduction of T_p to U_p uses k >= 2 so that the term eps_0(p) p^{k-1} vanishes mod p
- the dimension comparison 3.1.3 is imported from Shimura [51] Thm 3.52 (also Deligne-Serre [11] Prop. 2.7) and is not reproved in the source

*API.*

- `TauCeti.ResidualModularity.modpCuspForms` (*data*) — S(N, k, ε) ⊂ F̄_p[[q]]: reductions, at the chosen place above p, of cusp forms of type (N, k, ε₀) with algebraic-integer coefficients (N prime to p, k ≥ 2).
- `TauCeti.ResidualModularity.modpCuspForms_finrank` (*characterisation*) — dim_{F̄_p} S(N, k, ε) = dim_ℂ S_k(N, ε₀), and S(N, k, ε) does not depend on the chosen place.
- `TauCeti.ResidualModularity.modpHecke` (*constructor*) — The operators T_l (l ∤ pN) and U_l (l | pN) on S(N, k, ε), U_p being the reduction of T_p since k ≥ 2.
- `TauCeti.ResidualModularity.normalisedEigenform_eq` (*extensionality*) — A normalised eigenform (a₁ = 1) is determined by its eigenvalues a_l.

*Unit tests.*

- `TauCeti.ResidualModularity.modpCuspForms_level_eleven` (example) — S(11, 2, 1) over F̄₃ is spanned by the reduction of 11a1, q − 2q² − q³ + 2q⁴ + ⋯ .
- `TauCeti.ResidualModularity.katz_vs_reduction` (non-example) — At p = 2 or 3 a Katz form of weight k need not be a reduction of a characteristic-zero form of weight k + p − 1 in this definition (Serre's footnote 2).
- `TauCeti.ResidualModularity.parity_p2` (degenerate) — At p = 2 the parity condition ε(−1) = (−1)^k is vacuous and k is required even instead.

*Construction.*

1. Serre 3.1 fixes the embeddings and the Teichmuller lift, then defines S(N, k, eps) as the space of reductions.
2. 3.1.3: independence of the chosen place and the equality of dimensions, quoted from Shimura Thm 3.52.
3. 3.1.4: stability under T_l and U_l with explicit q-expansion formulas; the U_p case uses k >= 2.
4. 3.1.5: normalization a_1 = 1, commutation of Hecke operators, and the Euler product showing f is determined by the a_l.
5. 3.1.6: every mod p eigensystem lifts to a characteristic-zero normalized eigenform, by the eigenvalue lifting lemma cited as [11] lemme 6.11 - i.e. the node deligne-serre-eigenvalue-lifting-lemma.
6. 3.1.7: Deligne's theorem attaches to a normalized eigenform f a continuous semisimple rho_f, unramified outside pN, with Tr rho_f(Frob_l) = a_l and det rho_f(Frob_l) = eps(l) l^{k-1}.

*Acceptance.*

- Check that the two definitions (reduction of characteristic-zero forms versus Katz forms) can differ, and that every statement in the roadmap that uses weight 1 uses the Katz definition
- Check that a mod p eigensystem determines f uniquely once normalized, using the Euler product of 3.1.5

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon — the forms f in the qualitative and refined statements

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`.

*Planet:* Mod p cusp forms of type (N, k, ε).

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 3.1, (3.1.3), printed p. 194: “S(N, k, e) ne depend pas du choix de la place p-adique de Q utilisee pour le definir. De plus, sa dimension sur Fp est egale a la dimension de l'espace analogue S(N, k, e 0 ) sur C .” The independence-of-place and dimension statement that makes the definition of residual modularity well posed.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 3.1, (3.1.6), printed pp. 194-195: “En effet, du fait que les operateurs T1 et U,, commutent entre eux, tout systeme commun de valeurs propres de ces operateurs dans Fp se releve en caracteristique 0 (cf. par exemple [11], lemme 6 .11)” The explicit use of Deligne-Serre Lemme 6.11 inside the definition chain, justifying the R15.5 -> R15.6 dependency.
- The weight in Serre's conjectures on modular forms, 4.2 and the paragraph following it, pp. 9-10 of the DVI: “Later, in [27 ], Serre replaced this definition of modular form mod p by the definition that we are using in this article (i.e., Katz's definition). This change in definition makes it natural to allow forms of weight 1.” Records the change of definition that separates k_rho from k(rho) and licenses weight 1.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 3.2, Remark (6) and footnote 2, printed p. 197: “toute forme de poids k est aussi de poids k + p - 1. Avec la definition adoptee ici, cet enonce est vrai pour p >= 5, mais est faux pour p = 2 ou 3.” A small-characteristic difference between the reduction definition and Katz's definition. Added by the reviewer.

### Lemma. A semisimple representation over a finite field is realizable over the subfield generated by its characteristic polynomials

*Node* `AlgebraicModularFormsAndSerreWeights:R15.6/realizability-over-the-field-of-characteristic-polynomials`.

Let phi: Phi -> GL_n(k') be a semisimple representation of a group Phi over a finite field k', and let k be a subfield of k' containing the coefficients of the polynomials det(1 - phi(s)T) for all s in Phi. Then phi is realizable over k, i.e. isomorphic to a representation Phi -> GL_n(k). The proof: it suffices that phi be isomorphic to sigma(phi) for every k-automorphism sigma of k', because the Brauer group of a finite field is trivial so there is no Schur index; and phi and sigma(phi) have the same characteristic polynomials and are semisimple, hence isomorphic by Curtis-Reiner Thm 30.16.

*Hypotheses.*

- k' finite and phi semisimple; both are used, semisimplicity through the character-determines-representation theorem and finiteness through the vanishing of the Brauer group
- the hypothesis is on the coefficients of all characteristic polynomials det(1 - phi(s)T), not merely on traces
- in Deligne-Serre's application the field k_f is generated by the eigenvalues a_p and the reductions of eps(p), and Cebotarev is used to see that every element of the image is a Frobenius

*Proof outline.*

1. Deligne-Serre 6.12 produces a semisimple mod-lambda representation phi whose characteristic polynomials have coefficients in k_f, by Cebotarev plus the definition of k_f.
2. Lemme 6.13 then descends the field of definition: it suffices that phi be isomorphic to sigma(phi) for every k-automorphism sigma of k', because the Brauer group of a finite field is trivial (no Schur index); phi and sigma(phi) are semisimple with the same characteristic polynomials, hence isomorphic by [3] = Curtis-Reiner, Representation theory of finite groups and associative algebras, th. 30.16 (not read).

*Acceptance.*

- Check that a semisimple representation over F_4 with F_2-rational characteristic polynomials is conjugate into GL_n(F_2)
- Check that semisimplicity cannot be dropped, using a non-split extension whose characteristic polynomials are rational over a proper subfield
- Check that in characteristic 2 traces alone would not suffice for 2-dimensional representations, so that the hypothesis on full characteristic polynomials is needed (reviewer-suggested check; not a claim of the source)

*Used by.*

- AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular — invariance of 'arises from' under enlarging the coefficient field

*Uses.* `ArithmeticGaloisRepresentations:R01.1`.

*Sources.*

- Formes modulaires de poids 1, Lemme 6.13 with proof, printed p. 523: “Soit k un sous-corps de k ' contenant les coefficients des polynomes det (l-(p (^)T), s e < S ) . Alors (p est realisable sur k,i.e. est isomorphe a une representation p : e>->GL^(A;).” Literal statement of the descent of the field of definition by characteristic polynomials.
- Formes modulaires de poids 1, Proof of Lemme 6.13, printed p. 523: “cela provient de ce que le groupe de Brauer d'un corps fini est trivial, et qu'il n'y a donc pas " d'indice de Schur " a considerer.” The finiteness hypothesis is used exactly through the vanishing of the Brauer group.

### Definition. S-type representations, "arises from a newform" and "modular", and their invariance under the coefficient field

*Module* `TauCeti/NumberTheory/ModularForms/ResidualModularity.lean`. *Node* `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`.

Let F be a finite field of characteristic p. A continuous ρ̄ : G_ℚ → GL₂(F) is of Serre type (S-type) if it is absolutely irreducible and odd, det ρ̄(c) = −1 for a complex conjugation c (a vacuous condition when p = 2). Its invariants are N(ρ̄), the prime-to-p Artin conductor (Serre 1.2), k(ρ̄), Serre's weight (R15.4), and ε(ρ̄), the character of (ℤ/N(ρ̄)ℤ)^× with det ρ̄ = ε(ρ̄)χ̄_p^{k(ρ̄)−1} (Serre 1.3, R15.4/determinant-parity-and-weight-mod-p-minus-one). Fix ι_p : ℚ̄ → ℚ̄_p. ρ̄ arises from a newform f (of some weight and level) if there is an integral model ρ : G_ℚ → GL₂(𝒪), 𝒪 the ring of integers of a finite extension of ℚ_p, of the p-adic representation ρ_f attached to f through ι_p, such that ρ̄ is isomorphic to the reduction of ρ modulo the maximal ideal of 𝒪, both considered over a common finite field; ρ̄ is modular if it arises from some newform; it arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))) if it arises from a newform of weight k(ρ̄) and level N(ρ̄). For absolutely irreducible ρ̄ these notions, and N, k and ε, are unchanged when F is replaced by a finite extension F′ and ρ̄ by ρ̄ ⊗_F F′, and depend only on the isomorphism class of ρ̄ ⊗ F̄_p; in particular the choice of the common field in "isomorphic to the reduction" is immaterial.

*Hypotheses.*

- absolute irreducibility is part of S-type (Khare–Wintenberger); Serre's (3.2.1) asks only irreducibility over F̄_p, which is the same condition
- the reduction of ρ modulo the maximal ideal is independent of the integral model up to semisimplification, and for absolutely irreducible ρ̄ the reduction is itself semisimple (AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform)
- "arises from" is Khare–Wintenberger's formulation with a newform in characteristic 0; its relation with Serre's formulation through mod p eigenforms of type (N, k, ε) (R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field) is not proved here

*API.*

- `TauCeti.ResidualModularity.IsSType` (*other*) — ρ̄ continuous, absolutely irreducible and odd.
- `TauCeti.ResidualModularity.ArisesFrom` (*other*) — ρ̄ arises from the newform f through ι_p: an integral model of ρ_f reduces to ρ̄.
- `TauCeti.ResidualModularity.IsModular` (*other*) — ∃ f, ArisesFrom ρ̄ f.
- `TauCeti.ResidualModularity.isSType_baseChange` (*compatibility*) — IsSType ρ̄ ↔ IsSType (ρ̄ ⊗_F F′).
- `TauCeti.ResidualModularity.arisesFrom_baseChange` (*compatibility*) — For absolutely irreducible ρ̄, ArisesFrom ρ̄ f ↔ ArisesFrom (ρ̄ ⊗_F F′) f.

*Unit tests.*

- `TauCeti.ResidualModularity.isSType_11a1_three` (example) — E[3] for 11a1 is of S-type with N = 11, k = 2, ε = 1, and arises from 11a1.
- `TauCeti.ResidualModularity.not_isSType_11a1_five` (non-example) — E[5] for 11a1 is reducible, hence not of S-type.
- `TauCeti.ResidualModularity.isSType_p2_odd` (degenerate) — At p = 2 oddness is automatic: det ρ̄(c) = 1 = −1 in F.

*Construction.*

1. Invariance of S-type: absolute irreducibility and oddness are properties of ρ̄ ⊗ F̄_p.
2. Invariance of N, k, ε: each is defined from ρ̄ ⊗ F̄_p (the Artin conductor from the inertia action, the weight from ρ̄|G_p by R15.4/serre-weight-tame-cases, ε from det ρ̄).
3. Invariance of "arises from": two absolutely irreducible representations over finite fields that become isomorphic over F̄_p are isomorphic over any common finite subfield, by Brauer–Nesbitt and R15.6/realizability-over-the-field-of-characteristic-polynomials (no Schur index over a finite field).

*Acceptance.*

- ρ̄ = E[3] for E = 11a1: absolutely irreducible (no rational 3-isogeny) and odd, so of S-type; N(ρ̄) = 11 (ramified at 11 with inertia of order 3), k(ρ̄) = 2 (good reduction at 3), ε = 1; it arises from the newform 11a1 of weight 2 and level 11, i.e. from S₂(Γ₁(11)).
- Non-example: E[5] for E = 11a1 is reducible (ρ̄^{ss} ≅ 1 ⊕ χ̄₅), so not of S-type.

*Used by.*

- ClassicalSerreModularity R26–R27 — S-type, N(ρ̄), k(ρ̄), ε(ρ̄) and "arises from" in Khare–Wintenberger's theorems
- ClassicalSerreModularity R33.6 — the notion against which Dieulefait–Pacetti's modularity is compared

*Uses.* `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform`, `AlgebraicModularFormsAndSerreWeights:R15.6/realizability-over-the-field-of-characteristic-polynomials`, `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one`, `ArithmeticGaloisRepresentations:R01.3`.

*Planet:* S-type representations and "arises from".

*Sources.*

- Serre's modularity conjecture (I), §1, p. 2 (authors' preprint): “We say that such a representation is of Serre-type, or S-type, for short.” S-type: continuous, absolutely irreducible, two-dimensional and odd.
- Serre's modularity conjecture (I), §1, p. 2 (authors' preprint): “By arises from f we mean that there is an integral model ρ : GQ → GL2 (O) of the p-adic representation ρf associated” "Arises from", "modular" and "arises from S_{k(ρ̄)}(Γ₁(N(ρ̄)))".

### Theorem. The weight-and-level target: the statement to which the recipe is attached

*Node* `AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon`.

Let rho: G_Q -> GL(V) = GL_2(F_p-bar) be continuous with (3.2.1) rho irreducible and (3.2.2) det rho odd. The qualitative statement (3.2.3?) is that rho is isomorphic to rho_f for some mod p Hecke eigenform f; the refined statement (3.2.4?) is that f can be taken of type (N, k, eps) with N the prime-to-p Artin conductor of rho, k the weight of section 2 and eps the character of 1.3. For a normalized f this means Tr rho(Frob_l) = a_l and det rho(Frob_l) = eps(l) l^{k-1} for all l not dividing pN - and the trace identity on a set of l of density 1 already suffices. Serre further conjectures (3.2.6?) that for l dividing pN, a_l is nonzero exactly when rho restricted to the decomposition group at l has a 1-dimensional unramified quotient V/D, in which case a_l is the Frobenius eigenvalue on V/D; for l | N such a D is unique, and the same holds for l = p when rho is ramified at p, whereas for rho unramified at p (so k = p by Serre's convention) there are two possible a_p, the two Frobenius eigenvalues, with product eps(p).

*Hypotheses.*

- rho irreducible and det rho odd - both are hypotheses of the statement, not conclusions
- N is the prime-to-p part of the Artin conductor: n(l, rho) = dim V/V^{G_0} + b(V) where b is the wild invariant, so N is a genuine conductor and not merely a ramification set
- Serre's remark (5) that N and k are minimal is stated as probable, not proved, in the source; Edixhoven Thm 4.5 proves minimality, under the non-exceptional hypothesis, of his own weight k(rho) for Katz forms, which differs from Serre's k_rho in the two cases of his Remark 4.4
- the a_p statements at l = p distinguish sharply between rho ramified and unramified at p
- the labels (3.2.3?), (3.2.4?) and (3.2.6?) are Serre's own: he marks conjectural statements with a question mark

*Proof outline.*

1. Serre 1.2 defines n(l, rho) by (1.2.1) and rewrites it as (1.2.2) dim V/V^{G_0} + b(V), and deduces that n(l, rho) = 0 exactly when rho is unramified at l and n(l, rho) = dim V/V^{G_0} exactly when rho is tamely ramified at l.
2. 3.2 states the conjecture in its qualitative and refined forms and translates the isomorphism rho = rho_f into the trace and determinant identities (3.2.5).
3. Remarks (1)-(3) analyse the local eigenvalue a_l for l | pN: for l | N there is at most one line D; the bracketed claims that D exists iff v_l(N) = 1 or v_l(N) = v_l(cond eps) >= 2 ('Il n'est pas difficile de prouver') and that, when v_l(N) = 1 and v_l(cond eps) = 0, the Frobenius eigenvalue lambda on V/D satisfies lambda^2 = eps_prim(l) l^{k-2} ('on peut montrer') are asserted without proof; for l = p unramified the two eigenvalues lambda, mu with lambda mu = eps(p) may coincide.
4. Remark (2) notes the consequent uniqueness of f, with coefficients generating the field of rationality of rho over F_p.

*Acceptance.*

- Check that N is prime to p by construction and that n(l, rho) = dim V/V^{G_0} exactly in the tame case
- Check the density-1 sufficiency of the trace identity by a Cebotarev argument on the finite image of rho

*Used by.*

- ClassicalSerreModularity R27.6 — the strong form proved by Khare–Wintenberger

*Uses.* `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field`, `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`, `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`, `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`, `AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one`, `ArithmeticGaloisRepresentations:R01.3`.

*Planet:* Serre's conjecture: the refined target.

*Sources.*

- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 3.2, (3.2.1)-(3.2.5), printed pp. 195-196: “(3 .2 .4,) La forme parabolique f de (3 .2 .3,) peut etre choisie de type (N, k, e), ou N, k et e sont les invariants de p definis au §1 et au §2 .” The refined statement that fixes the type (N, k, eps) to be the invariants of the recipe rather than any admissible type.
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 3.2, Remark (5), printed p. 197: “Il est probable que N et k sont minimaux pour rho, autrement dit que, si rho est isomorphe a rho_f', avec f' de type (N', k', eps'), N' premier a p, k' >= 2, alors N' est multiple de N et k' >= k.” The source itself only conjectures minimality; this packet does not record minimality as an established input. Transcribed from the page image by the reviewer (the text layer garbles the inequalities).
- Sur les representations modulaires de degre 2 de Gal(Qbar/Q), 1.2, (1.2.2), printed p. 181: “n(l, p) = dimV/Ijo + b(V), ou b(V) est "l'invariant sauvage" du G o-module V” The Artin conductor exponent with its wild part, the definition of N used in the statement.

## Source and baseline record

**DS:** Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*, Annales scientifiques de l'ENS, fourth series 7 (1974), 507–530, published Numdam scan, <https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf>. Section 6.8–6.11 on printed page 522 was read; Lemme 6.11 and its proof were checked in the page image on 26 September 2026. No new error is asserted for this checked passage. Unread source material is not certified by the empty source-issues list.

The eight baseline declarations listed in the packet were read in their actual files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, `IsDiscreteValuationRing.exists_lift_of_le_one` concerns bounded elements of an **existing fraction field**; it is not an existence theorem for a new DVR or a substitute for the normalization argument. No unchecked search hit is promoted to a verified baseline declaration.

**Checkpoint 2 sources.** Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987); Edixhoven, *The weight in Serre's conjectures on modular forms* (author's DVI); Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. SMF 102 (1974); and Khare–Wintenberger, *Serre's modularity conjecture (I)* (authors' preprint). Each was downloaded again and its SHA-256 matches the record. All 33 carried excerpts and the 4 new ones were compared with the extracted text: Edixhoven's text was extracted from the DVI, which renders Greek letters as placeholders. The excerpts match exactly or up to OCR and rendering, and they lie on the pages given. Serre's printed page is the PDF page + 178, and Raynaud's is the PDF page + 239.

**Checkpoint 3 sources.** Katz, *p-adic properties of modular schemes and modular forms*, LNM 350 (1973), from Katz's page: its SHA-256 matches the record. Its text layer is OCR, but every carried excerpt's best match lies on the page its locator gives, where Katz's page marks Ka-n are PDF pages. Theorem 1.12.1 was checked on the page image (printed p. 94). Edixhoven §§3 and 7 are carried as reviewed. Darmon–Diamond–Taylor Lemma 4.1 (p. 107) is the source of the new generation lemma. Its references, Diamond–Im and Wiles, are not read.

**Source issue E1.** Serre's Remark (1) in 2.4 (p. 186) says that m = 1 or 2 in the très ramifiée case. For p = 2, m = 3 also occurs (Edixhoven, Proposition 8.5). This correction is known. The weight does not depend on m.

The suggested file imports a Tau Ceti module, so it cannot be compiled without a Tau Ceti build, and no build was run. The checks added in checkpoint 2 import Mathlib only. They were compiled as a separate file against Mathlib `082e2d3`, with no errors. No mathematical implementation is claimed. The remaining exact-API, full-audit/link reconciliation, source and geometric/local construction obligations are recorded explicitly in the packet and handoff.
