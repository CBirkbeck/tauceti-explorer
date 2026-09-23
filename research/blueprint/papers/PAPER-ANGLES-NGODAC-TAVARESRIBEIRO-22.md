# Anglès–Ngo Dac–Tavares Ribeiro (2022): extraction and routing

Issue [#1268](https://github.com/CBirkbeck/tauceti-explorer/issues/1268). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoint of codex-a71f92 (#1981), whose report follows below as history.
- **The paper.** B. Anglès, T. Ngo Dac and F. Tavares Ribeiro, *A class formula for admissible Anderson modules*, Invent. Math. 229 (2022), 563–606.
  - The version of record is closed access.
  - HAL hal-02490566v2 (31 pages, SHA-256 1faf283f…) was read in full. It is the manuscript after refereeing, since it thanks the referee.
  - All locators refer to it.
- **Items.** The result has **103 items: 2 library, 9 planned and 92 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Fifteen are recorded under `sourceIssues`. None affects a stated result.

## This continuation (cc-442dc5)

**What was read.** The whole of HAL v2, pp. 1–31, with every proof followed.

**The `known` field.**
- **The problem.** Every finding carried a sentence about unresolved correction status in `known`. `scripts/errata.py` reads any value other than "new" as "corrected in print".
- **The fix.** They are now "new", and the sentence has moved to `searched`.

**Reclassified findings.**
- **E1, E2, E3, E8 are misprints that affect nothing.** In each the intended meaning is clear from the paper:
  - E1: the ideal-extension form of base change for Fitting ideals;
  - E2: F∞((π)) as in §1.1;
  - E3: k ≥ 0 in the twisting rule;
  - E8: α_t ∈ F_q((1/t)) with v∞(α_t) = 0, as in Taelman.
- **E10 is a misprint (Proposition 5.3).**
  - The proof splits each relation into the components α_ij^{k0} = Σ_{k ≡ k0+j (mod m)} α_ijk z^k. It then asserts they lie in R0, which holds only when R0 is defined by congruence of the z-exponents.
  - With that definition R = R0·A_F[z] holds, and the checkpoint's counterexample (the relation (−z, t) over F_4) lies in R0.
  - The descent of the ideal from Ã_F to Ã then follows by expanding generators in an F_q-basis of F (faithful flatness).
- **E12 is a misprint (Theorem 6.3).** The text says M(E/F_P) is used with column vectors and τ twisted by z, so the carrier is the motive F_P(z){τ}^d, not F_P(z)^d. On the motive, τ − z has cokernel F_P(z)^d, as in (6.1).
- **E4, E11, E13 and E14 stand as recorded.**
  - E11: the root count in Theorem 5.6 is at most d·r, not r. Convergence still follows.
  - E14: normal bases need not be trace-self-dual; the fix is the trace adjoint.

**New finding E15 (Theorem 4.3, Step 1).** The proof asserts that the z-orders a_n become stationary, and that A-coefficients force the limit into Ã. Gauss convergence gives neither by itself. Both hold here:
- x_n = u·y_n^{−1}, where y_n^{−1} = Π x_P/x_P(0) has constant term 1. So ord_z(x_n) = ord_z(u) for every n.
- u ∈ z^a F_q[z]_(z) T_z(K∞) by Proposition 4.5 with n = 1, and y^{−1} ∈ T_z(K∞). So x = z^a h/f with h ∈ T_z(K∞).
- The z-coefficients of h lie in A and tend to 0 ∞-adically. Since A is discrete, they vanish from some point on, and so x ∈ Ã.

Item 58 carries this argument, which closes G3.

**Other proofs checked.**
- **Lemma 5.4.** J(F_q(z)) = J(F_q), since P¹ → J is constant. The rest of the Picard argument, including the ideal norm, is right.
- **Lemma 5.1(ii).** A monomial X^a z^b with b > 0 has b ≤ r(md − a) and b ≥ m.
- **Theorem 4.7.** The norm step: t's only pole is ∞, so v∞ is preserved up to the ramification index.
- **Corollary 6.5's principality.** Each Z_P(φ) is principal, because the reduction of φ at P is constant or a Drinfeld module over F_P. This is recorded in item 100's note.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- What remains is suppliers' proofs (G2, G4, G6) and design adapters (G8).

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), HAL hal-02490566v2, §1.2(5), p. 5; version of record not collated. *Printed:* R' ⊗_R Fitt_R(M) *Correction:* Interpret the RHS as the image ideal Fitt_R(M)R', not the abstract tensor product module.
- **E2** (misprint; affects nothing), HAL hal-02490566v2, §1.3, p. 5; version of record not collated. *Printed:* k((π)) *Correction:* Use (k tensor_F_q F_infinity)((pi)), namely F_infinity((pi)) or F_infinity(z)((pi)).
- **E3** (misprint; affects nothing), HAL hal-02490566v2, §2, p. 7; version of record not collated. *Printed:* k ∈ Z *Correction:* Restrict the skew-polynomial commutation formula and q^k twists over a general F_q-algebra to k>=0. Define inverse twists only on perfect coefficient fields and negative operator powers only in a separate Laurent construction.
- **E4** (error; affects the proof), HAL hal-02490566v2, Lemma 3.7 proof, p. 13; version of record not collated. *Printed:* E'_a(x) ≡ ι(a)x *Correction:* Replace the scalar reduction by E'_a(x) congruent partial_E(a)x modulo P; the constant nilpotent term is unchanged under scalar conjugation.
- **E5** (misprint; affects the proof), HAL hal-02490566v2, Proposition 4.5 proof, p. 16, two consecutive truncation formulas; version of record not collated. *Printed:* z^j μ(m_{i,j,k}) *Correction:* Both truncated sums over k require z^k mu(m_(i,j,k)).
- **E6** (misprint; affects the proof), HAL hal-02490566v2, Theorem 4.3 Step 1(i), p. 17; version of record not collated. *Printed:* ξ_(n+1) divides ξ_n *Correction:* Require xi_n divides xi_(n+1), keeping nonzero xi_n and the prime-exhaustion and coefficient-integrality conditions.
- **E7** (misprint; affects the proof), HAL hal-02490566v2, Theorem 4.3 Step 2, p. 18, last displayed computation; version of record not collated. *Printed:* Z_P(E/O_L) *Correction:* Restore the tildes in the local factors occurring in the final deformed regulator computation: use Ztilde_P(E/O_L).
- **E8** (misprint; affects nothing), HAL hal-02490566v2, Lemma 4.6 statement, p. 18; version of record not collated. *Printed:* α_t ∈ F_q[t] *Correction:* The generator belongs to F_q((1/t))^times and has infinity valuation zero, not generally to F_q[t].
- **E9** (misprint; affects the proof), HAL hal-02490566v2, Proposition 5.3 proof, p. 23; version of record not collated. *Printed:* k ≡ k_0-j (mod m) *Correction:* In the final grouped relation retain the earlier k congruent k_0+j condition consistently, and retain tau^(j+l) before reducing modulo tau^m-1. In the reconstruction sum, sum over k_0 rather than an unused k.
- **E10** (misprint; affects nothing), HAL hal-02490566v2, Proposition 5.3 proof, pp. 22–23; version of record not collated. *Printed:* R = R_0 A_F[z] *Correction:* Use homogeneous components for the Z/m grading, whose jth entries have exponents congruent to j+j_0 modulo m, without the extra lower bound; alternatively invert z first and state the Laurent-module generation identity before localizing to F_q(z).
- **E11** (error; affects the proof), HAL hal-02490566v2, Theorem 5.6 proof, pp. 25–26; version of record not collated. *Printed:* ∏_(i=1)^r (1-α_i z^m_P) *Correction:* Replace the asserted universal count r of reciprocal roots by a bound d*r in Y=z^m_P (pad with zero roots if needed). Carry a valid root-valuation estimate: the weighted determinant bound yields m_P*(-v_infinity(t))/r; a weaker uniform dimension-dependent estimate already suffices for convergence.
- **E12** (misprint; affects nothing), HAL hal-02490566v2, Theorem 6.3 proof, p. 28, definition preceding tau-z sequence; version of record not collated. *Printed:* Mtilde(E/F_P)=F_P(z)^d *Correction:* The source/target of the tau-z motive presentation must be a skew-polynomial motive module with an explicit z-action convention, not the finite-dimensional point space. Derive the cokernel on that corrected module (G7).
- **E13** (misprint; affects the proof), HAL hal-02490566v2, Theorem 6.3 proof, p. 28, adjoint action; version of record not collated. *Printed:* ∑_(i=1)^k *Correction:* Include the i=0 term A_0^T in the adjoint sum.
- **E14** (error; affects the proof), HAL hal-02490566v2, Theorem 6.3 proof, p. 29, matrix comparison; version of record not collated. *Printed:* T'^(-i) · (A'_i)^T *Correction:* Use the trace-pairing adjoint: G^(-1) B^T G in a general normal basis, or use a trace-dual pair of bases. Normal bases need not be self-dual; the matrix of multiplication by an element is not generally symmetric.
- **E15** (gap; affects the proof), Proof of Theorem 4.3, Step 1, p. 17, HAL hal-02490566v2; version of record not collated. *Printed:* It implies that the sequence (a_n)_{n∈N} becomes stationary. … Thus, the coefficients of x must belong to A, and this implies that the limit x belongs to Ã. *Correction:* Justify both steps. (1) x_n = u·y_n^{−1} with y_n^{−1} = Π x_P/x_P(0) ∈ K[z] of constant term 1, so ord_z(x_n) = ord_z(u) for every n. (2) By Proposition 4.5 with n = 1, u ∈ z^a F_q[z]_(z) T_z(K∞), and y^{−1} = lim y_n^{−1} ∈ T_z(K∞); so x = z^a h/f with f ∈ F_q[z], f(0) ≠ 0 and h ∈ T_z(K∞). The z-coefficients of h lie in A and tend to 0 ∞-adically, hence vanish eventually, so h ∈ A[z] and x ∈ Ã.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Collate the 44-page version of record** (unavailable). The version of record is closed access; all locators refer to HAL v2, the post-referee manuscript.
- **G2, Higher-dimensional analytic and Stark-unit inputs** (deferred). The higher-dimensional exponential, unit-lattice and Stark-unit inputs are cited suppliers ([28], [10], [16], [19]).
- **G3, Gauss limit versus z-local integral coefficients** (resolved). E15 records the terse step and item 58 now carries the argument.
- **G4, Norm comparison and rational-constant valuation argument** (deferred). Lemma 4.6 for Anderson F_q[t]-modules and the norm compatibility are supplier inputs (Taelman, Demeslay, Fang; item 103 planned in KTheoryLowDegrees Z.4).
- **G5, Homogeneous Fitting descent and Picard torsion proof** (resolved). E10 is a misprint; items 74, 76 and 77 now carry the congruence form, the descent and the Jacobian input.
- **G6, General-A motives, projectivity and good reduction** (deferred). The A-motive theory (Hartl–Juschka, Goss) and reduction of A-finiteness or abelianness at almost all primes are supplier inputs.
- **G7, Corrected abelian-motive tau-z presentation** (resolved). E12 is a misprint (the carrier is the motive); E13 and E14 are corrected in items 95 and 96.
- **G8, Finish proof-interior and baseline adapters** (deferred). The remaining proof-interior and baseline adapters are design work; Corollary 6.5's principality is argued in item 100's note.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **The `known` field.** Every finding has `known` equal to "new".

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E15 and the argument in item 58.
- Check the reclassifications of E10 and E12 as misprints.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial*, leaves G3, G5 or G7 open, or classifies E10 and E12 as errors, this continuation supersedes it.

## Admissible Anderson class formulas: extraction and routing

Paper job #1268. Agent: Codex, session codex-a71f92. Status: **partial checkpoint**. All mathematical items remain implementation-unchecked.

### Outcome and source boundary

This extraction routes the arbitrary-coefficient and higher-dimensional class-formula branch to **Drinfeld modules, t-motives and characteristic-p special values, Part II: Admissible Anderson class formulas**, proposed id `AdmissibleAndersonClassFormulas`. The base roadmap's DM.6 is explicitly the integral Drinfeld `F_q[t]` theorem, not the theorem for arbitrary Dedekind coefficient ring A or arbitrary Anderson dimension. Generic Fitting algebra remains with IntegralHeckeAndGaloisDeterminants; Steinitz and norm/determinant transfer remain with KTheoryLowDegrees. This is an extension, not a replacement of the earlier roadmap.

The deliverable has 103 items: two exact baseline statements, nine planned imports and 92 missing items, each routed exactly once. The 239 internal edges form an acyclic graph. Forty definitions/constructions have 120 API specifications and 120 unit tests; 63 theorem items have acceptance conditions. Fourteen source findings are restricted to the version actually read. Eight explicit gaps prevent a claim of complete extraction or source closure. In particular the later journal version and several deep external proof inputs are not yet reconciled.

The complete source read is [HAL hal-02490566v2](https://hal.science/hal-02490566v2/document), deposited 16 September 2021, manuscript dated 22 June 2021, 31 numbered pages plus cover. SHA-256: `1faf283f39c566a2bd7acd4e52589ddd22d364b888a6a33199c0ca774354c200`; accessed 22 September 2026. Introduction, all of §§1–6, and references were read continuously. Ambiguous formulas on numbered pages 5, 7, 13, 16–18, 23–26 and 28–29 were checked on rendered PDF pages rather than trusting extracted text.

The [publisher record](https://link.springer.com/article/10.1007/s00222-022-01110-3) confirms the title, authors, DOI and Inventiones 229 (2022), 563–606, and the abstract's admissible/abelian/A-finite/Drinfeld scope. It is a subscription preview; the full 44-page journal text was not acquired. Its acknowledgements mention corrections to an earlier manuscript. Thus neither identical proof text nor identical theorem numbering is asserted. The author publications page links the HAL source; the public author CV lists v2. No itemized erratum or later HAL version was found, but that does not establish that these observations are new errors in the journal. G1 requires a lawful final-version comparison.

### Conventions that control the statements

- q is a prime power; K/F_q is a one-variable global function field with F_q its full constants; infinity is a place of arbitrary degree d_infinity>=1; A is the Dedekind ring regular away from infinity, not assumed principal.
- v_infinity has value group Z; the paper uses |x|=q^(-v_infinity(x)), so deg(aA)=-d_infinity*v_infinity(a), not -v_infinity(a).
- F_infinity is the residue field of cardinality q^d_infinity. With a chosen uniformizer pi, K_infinity=F_infinity((pi)); for k=F_q(z), k_infinity=F_infinity(z)((pi)).
- Atilde=F_q(z) tensor_F_q A and Ktilde_infinity is the Gauss completion of K_infinity(z). T_z(K_infinity) is the Gauss completion of K_infinity[z], not its z-adic completion; tau fixes z.
- For an integral generic-characteristic E of dimension d>=1, iota:K->L is a finite extension, O_L the integral closure of iota(A), L_infinity=L tensor_K K_infinity; all Lie scalar structures use partial_E, including its nilpotent term.
- [M':M] means determinant lattice of M divided by that of M'; for M subset M', it is Fitt(M'/M). It is an actual rank-one A-lattice in K_infinity, not a scalar modulo units or a chosen principal generator.
- Within theorem statements below, 'integral E' abbreviates the preceding full generic-characteristic coefficient hypotheses; finite-field reduction statements explicitly replace the coefficient field. Definitions and conclusions never assume abelianity, A-finiteness or global surjectivity of exp unless stated.
- A reported correction is a proposed repair to the pinned HAL v2, awaiting independent review and comparison with the version of record. In particular no assertion of a new error in the published article is made.

### Proof architecture and what is genuinely new

#### Algebra and analytic lattices

Items 3–9 isolate zeroth Fitting ideals, their annihilator and exact-sequence bounds, base change, and the Dedekind torsion specialization. Arbitrary base change means the *image ideal*, not an injective tensor inclusion. The elementary-divisor statement is stronger than the pinned primary torsion decomposition. Items 10–18 build the discrete full lattice and determinant ratio with the inverse orientation fixed by `[R:tR]=tR`. Finite projectives are not silently made free: item 101 imports Steinitz classification from Z.4, while the top exterior image is used for ratios. The zero-dimensional determinant convention is explicit.

These lattices live over the infinity completion. Mathlib's algebraic `Submodule.IsLattice` has no discreteness condition, so a compatibility theorem is needed. The shared coefficient-ring and affine-class-group material is not newly planned here. Tau Ceti's affine class-number theorem and Mathlib's ClassGroup/Pic equivalence are exact imports, read with their standing hypotheses.

#### Units, deformation and local factors

Items 19–39 distinguish the full point action from the nilpotent differential, build the exponential and local logarithm, ordinary units and class module, and the z-deformation. Frobenius fixes z. Polynomial z-units mean that their *exponential values* are polynomial; the units themselves are Tate-analytic. Rational z-units may have poles at z=1 and cannot all be evaluated there. Only polynomial-unit lifts define Stark units.

The exact quotient/Fitting comparison is an essential theorem, not part of the definition of Stark units. The 2017 Drinfeld proof was read: the z-1 torsion of H_z is identified with U/U_St, and exact multiplicativity equates its Fitting ideal with that of H. Its general Anderson analogue still requires the cited higher-dimensional proofs (G2). The rational deformed class module vanishes, whereas the polynomial class module can be nonzero torsion with invertible z action.

Items 40–49 compute local factors and their changes under scalar conjugation. The quotient I^n/I^(n+1) has identical point/Lie actions because positive Frobenius terms land in I^(n+1). Consequently a prime-power factor equals the prime factor rather than its nth power. Scalar conjugation kills the positive Frobenius terms at primes dividing the scalar but leaves the full nilpotent differential. This supplies the finite exceptional-prime removal, with a class correction in the ordinary case and no such correction in the rationally deformed case.

#### Admissibility and the class formula

Items 50–66 keep the two admissibility conditions separate. (P) includes three compatible generators and both specializations; (C) is a nonzero Gauss-convergent Euler product. Multiplying a rational ideal generator by z-1 illustrates why bare principality is weaker than (P). The L-value is a rank-one lattice, including exceptional local ideals, not an arbitrarily selected scalar generator.

The containment theorem first clears finitely many exponential denominators, approximates z-units by integral vectors, lifts through projectivity and takes determinants. A scalar sequence must have *increasing* divisibility to exhaust the primes. Passing from the resulting congruences to a Gauss limit needs uniform denominator control; merely knowing that the functions converge is not enough to stabilize z-order. That step is exposed as G3.

Specialization uses polynomial-unit lifts and Tate units, not an evaluation map on the entire Gauss-completed rational field. The final upgrade from containment to equality uses a principal power of an ideal class, restriction to F_q[t], and the valuation-zero Euler-characteristic calculation. Item 103 imports the norm-compatible determinant transfer from Z.4; its completed-field adapter is G4. The inspected Taelman theorem gives a generator in F_q((1/t)), not F_q[t]. The first endpoint is the exact A-lattice identity

```text
[Lie_E(O_L) : U_St(E/O_L)]_A
  = [Lie_E(O_L) : U(E/O_L)]_A Fitt_A(H(E/O_L))
  = L(E/O_L).
```

No equality of individual scalar generators is implicit. Remark 4.8's rational-constant analogue is listed separately and retains its own analytic/class-group proof obligation.

#### Principality and motive endpoints

Items 67–83 explain why all Anderson F_q[t]-modules are admissible and why (P') suffices for arbitrary A. Over a residue field of degree m, cyclic scalar decomposition forces the characteristic polynomial into F_q[X,z^m]. Its determinant expansion gives the weighted degree bound; this produces convergence as m grows. In a d-dimensional module with tau-degree r the possible number of factors in the variable z^m is bounded by d*r, not r. A direct sum of two Carlitz modules detects the lost dimension immediately.

For arbitrary A, local Fitting descent and Picard injection produce a primitive polynomial generator. Norm/root bounds give equality of infinity valuations at z, 0 and 1; then Fitting ideal inclusions become equalities because their quotient dimensions agree. The relation-module proof has a genuine polynomial grading error: the printed divisibility lower bounds exclude a simple relation for E_t=tau over F_4. The appropriate repair uses residue grading or first inverts z. G5 retains the full descent/Picard proof work. A suspected additional norm error was *rejected*: the page image really says I^m, which text extraction had obscured.

Items 84–100 keep the two motives separate. The dual motive uses right tau and inverse coefficient Frobenius; the contravariant row motive uses positive left Frobenius and right E. A-finiteness and abelianity are different finite-generation conditions. Projectivity and preservation at almost all primes are essential external inputs, not automatic from skew-ring freeness. At good reductions, a motive cokernel computes a principal local Fitting ideal, giving admissibility and then the class formula.

The abelian proof needs a corrected skew-polynomial carrier and trace adjunction. On the finite point space printed in the preprint, tau-z is invertible and has zero cokernel, so it cannot be the desired presentation. An arbitrary normal basis is not self-dual: use the trace Gram matrix or dual bases. The missing constant term of the adjoint is also restored. These are proof repair obligations; exact finite-field tests do not settle the entire corrected motive theorem. The final statements retain the source's 'abelian **or** A-finite' hypothesis and the Drinfeld corollary's separate principal-lattice assertion.

### Ownership and baseline evidence

- **DrinfeldModulesAndTModules:** Full README and all DM.0–DM.8 reviewed AUDIT-20 entries; atlas layer descriptions. DM.6 is integral Drinfeld over F_q[t]; DM.4 starts with A=F_q[t]. Generic A, dimension d, Stark z-units and admissibility class formulas extend them. DM.2's automatic C_infinity uniformization does not assert surjectivity on L_infinity.
- **IntegralHeckeAndGaloisDeterminants:** Full README, IHG.6; full PadicMeasuresIwasawaAlgebras README L6, which explicitly names IHG as generic Fitting supplier; PAPER-DASGUPTA-KAKDE-23 item 325 ownership lead. Route generic Fitting and its finite Dedekind duality helpers once to IHG.6. Padic L6 and EulerSystems ES.6 consume it. No IHG layer entry was present in the reviewed library-coverage export; that absence is recorded, not interpreted as implementation evidence.
- **KTheoryLowDegrees:** Full README and reviewed AUDIT-29 Z.4/Z.6; actual ClassGroup.equivPic statement. Steinitz and determinant/norm transfer remain Z.4. The new branch constructs analytic lattice comparisons only, not another projective classification.
- **FunctionFieldArithmetic:** Full README; reviewed AUDIT-20 FA.0–FA.3. Coefficient fields, integral closures, exact constants, places and adelic/discreteness comparisons are imports. Existing Tau Ceti AlgebraicCurves supplies built divisor/Riemann–Roch/class-number material; none is re-planned.
- **PeriodsAndSpecialValues:** Full README inspected in the preceding sequential task; PS layer descriptions rechecked here. Complex motivic period/regulator and classical MZV material does not own these characteristic-p class formulas.
- **FoundationsAndLibraryIntegration:** README and data/roadmap-retirements.json. Retired: never used as a supplier, despite stale atlas references.

The retired FoundationsAndLibraryIntegration roadmap is not a supplier. No packet or newly defined roadmap for admissible Anderson class formulas was found in the inspected snapshot. The previously submitted Ngo Dac 2021 multizeta extraction proposes a different Part II; coordinate its polynomial-ring dual-motive interface without moving this general-A class-formula branch into complex MZV or Euler/Kolyvagin Stark systems.

The exact library declarations are:

- `tauceti:TauCeti.Divisor.finite_classGroup_of_finite`, `TauCeti/FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.lean`, 70–109: Finiteness of ClassGroup(R) for a Dedekind affine model R in an algebraic function field over a finite constant field. Full statement and standing hypotheses read at f790474821cf4256814db967cb154e7af3d0c369.
- `mathlib:ClassGroup.equivPic`, `Mathlib/RingTheory/PicardGroup.lean`, 876–880: ClassGroup R ≃* Pic R for every commutative domain. Full statement read at 082e2d37e8b0463410cdb532e111cd43d5a66174.

Near matches were inspected, not promoted by name: generic SkewPolynomial and its monomial multiplication, algebraic IsLattice, the Dedekind primary-torsion decomposition and the PID/free-module cyclic quotient decomposition. Whole-tree concept searches agreed with reviewed AUDIT-20/AUDIT-29 on the source-specific missing material. Open Mathlib PR and Zulip searches found no module-Fitting implementation to replace these targets; a group-theoretic Fitting PR is unrelated. The official roadmap-writing guidance and two already-read upstream models (LocalFieldsRamification and RepresentationTheory/CharacterTheory) controlled conventions, ownership and definition-level tests. A browser request for the linked Zulip roadmap discussion exposed only its public shell, not additional instruction text.

### Routes and design brief

#### Route 1: IntegralHeckeAndGaloisDeterminants

The existing IHG generic commutative-algebra supplier is explicitly imported by PadicMeasuresIwasawaAlgebras L6. Supply the zeroth Fitting API once over arbitrary commutative rings, then the finite Dedekind torsion/exactness and module-duality lemmas needed here. No p-adic or characteristic-zero restriction is added. The Anderson branch imports it; it does not create a second Fitting ideal.

Items: 3, 4, 5, 6, 7, 8, 9, 94.

The named existing stage receives these source statements and supplies them to the new branch.

#### Route 2: KTheoryLowDegrees

Z.4 already owns positive-rank Steinitz classification and finite-flat determinant/norm transfer. This source specifies their function-field consumers and relative-ratio conventions without duplicating the projective-module theory. The existing ClassGroup/Pic comparison is a baseline import, not new work.

Items: 101, 103.

The named existing stage receives these source statements and supplies them to the new branch.

#### Route 3: DrinfeldModulesAndTModules

The q-Frobenius skew-polynomial and additive-operator specialization is already DM.0's target. Read the generic Mathlib SkewPolynomial carrier and adapt it once; keep the source's polynomial nonnegative-exponent convention.

Items: 19.

The named existing stage receives these source statements and supplies them to the new branch.

#### Route 4: AdmissibleAndersonClassFormulas

DM.6 stops at integral Drinfeld modules over F_q[t], and DM.4's motive branch starts with that polynomial coefficient ring. Arbitrary A, nonrational infinity, higher-dimensional Anderson modules, Stark z-deformations and the principality criterion require new layers in precisely that direction. Complex period/ETNC, Euler/Kolyvagin Stark systems and the multizeta relation branch are distinct consumers, not alternative owners.

Items: 2, 10, 11, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 95, 96, 97, 98, 99, 100.

Build first on Drinfeld modules, t-motives and characteristic-p special values (DrinfeldModulesAndTModules), importing DM.0, DM.2, DM.4 and DM.6 only within their stated coefficient and uniformizability scope. Import Global function fields, reciprocity and automorphic foundations (FunctionFieldArithmetic) and the already built Tau Ceti AlgebraicCurves function-field/divisor/class-number APIs; import generic Fitting algebra from Integral Hecke actions, determinants and interpolation (IntegralHeckeAndGaloisDeterminants:IHG.6) and Steinitz/exterior determinant/norm transfer from Explicit K0: projectives, rank and determinant (KTheoryLowDegrees:Z.3–Z.4). Do not use retired FoundationsAndLibraryIntegration. Coordinate the polynomial-ring dual-motive special case with the previously extracted Ngo Dac 2021 multizeta branch; it is not a second owner of generic motive algebra.

Fix a global function field K with full constants F_q, an arbitrary place infinity of degree d_infinity>=1, A regular away from infinity, finite generic-characteristic L/K, O_L and L_infinity. Keep A Dedekind rather than principal. Construct topological A-lattices and their determinant ratios, Gauss/Tate and rational z-coefficient extensions, Anderson A-modules with nilpotent differentials, exponential and local logarithm, ordinary units/class modules, polynomial and rational z-units/classes, evaluation and Stark units. Prove the exact quotient/Fitting comparison, local factors, prime-power invariance and scalar-conjugation identities. Define admissibility by (P),(C), keeping exceptional ideals and convergence; prove the regulator containment, valuation normalization and norm/class-group upgrade. The first endpoint is Theorem 4.7: for every admissible integral E, [Lie_E(O_L):U_St(E/O_L)]_A=L(E/O_L), equivalently [Lie_E(O_L):U(E/O_L)]_A Fitt_A(H(E/O_L))=L(E/O_L).

Build the finite-field cyclic decomposition, graded characteristic-polynomial and weighted degree estimates, then the Fitting-ideal descent and Picard injection needed for Theorem 5.6: almost-everywhere principality of Fitt_Atilde(Etilde(F_P(z))) implies admissibility. Cover all Anderson F_q[t]-modules. Construct general-A motives and dual motives with their opposite Frobenius conventions; prove projectivity and almost-all preservation of abelianity/A-finiteness under reduction. Use corrected skew-motive cokernels and trace-pairing adjoints to prove Theorems 6.1 and 6.3. Deduce Theorem 6.4 for E abelian OR A-finite, and Corollary 6.5 for every integral Drinfeld A-module: L is a principal A-lattice and [O_L:U_St]_A=[O_L:U]_A Fitt_A(H)=L. Do not assume automatic analytic uniformizability or remove admissibility for arbitrary E.

Separate each listed definition and proof lemma, preserving the 40 definition contracts, nonflat-base-change, nonprincipal-lattice, Gauss-versus-z, nilpotent-differential, residue-degree and normal-basis tests. Complete G1–G8 before calling the design source-closed; compare the journal version and independently adjudicate E1–E14. Preserve full characteristic-p and bad-prime hypotheses. Later papers removing admissibility are outside this source's theorem scope. No Lean deliverable is authorized by this extraction issue.

### Source findings, not yet independently adjudicated

The locators below are HAL v2 locators only. Every finding has the same bounded correction search recorded in JSON: publisher preview/issue, author publications and HAL CV, and exact-title erratum/later-version searches. The later publication may already repair them. No author contact, review verdict or new-journal-error assertion is made.

#### E1: misprint

HAL hal-02490566v2, §1.2(5), p. 5; version of record not collated. Printed fragment: `R' ⊗_R Fitt_R(M)`.

Correction: Interpret the RHS as the image ideal Fitt_R(M)R', not the abstract tensor product module.

Reason: Take R=k[x], M=R/(x), R'=k. The left Fitting ideal is Fitt_k(k)=0. The tensor k tensor_R (x) is isomorphic to k; its map into k is zero. The intended ideal-extension statement is correct. Reach: a stated result.

#### E2: misprint

HAL hal-02490566v2, §1.3, p. 5; version of record not collated. Printed fragment: `k((π))`.

Correction: Use (k tensor_F_q F_infinity)((pi)), namely F_infinity((pi)) or F_infinity(z)((pi)).

Reason: For d_infinity>1 the completed residue field contains F_infinity, not just F_q. The hypotheses allow arbitrary d_infinity; the preceding §1.1 correctly retains this residue field. Reach: a stated result.

#### E3: misprint

HAL hal-02490566v2, §2, p. 7; version of record not collated. Printed fragment: `k ∈ Z`.

Correction: Restrict the skew-polynomial commutation formula and q^k twists over a general F_q-algebra to k>=0. Define inverse twists only on perfect coefficient fields and negative operator powers only in a separate Laurent construction.

Reason: Over R=F_q(t), t has no qth root in R, and tau^(-1) is not an element of R{tau}. Later finite-field inverse twists are valid and should not be removed. Reach: a stated result.

#### E4: error

HAL hal-02490566v2, Lemma 3.7 proof, p. 13; version of record not collated. Printed fragment: `E'_a(x) ≡ ι(a)x`.

Correction: Replace the scalar reduction by E'_a(x) congruent partial_E(a)x modulo P; the constant nilpotent term is unchanged under scalar conjugation.

Reason: For the second Carlitz tensor power partial_E(t)=theta I+N with N_12=1. Reducing at any prime containing xi does not kill N, so the vector e2 retains the e1 term. Point and Lie reductions still coincide, and the lemma's factor=unit conclusion survives. Reach: the proof.

#### E5: misprint

HAL hal-02490566v2, Proposition 4.5 proof, p. 16, two consecutive truncation formulas; version of record not collated. Printed fragment: `z^j μ(m_{i,j,k})`.

Correction: Both truncated sums over k require z^k mu(m_(i,j,k)).

Reason: j is the fixed column index, whereas k is the expansion degree. With one column, mu=identity and a nonzero constant input, the printed sum cannot reproduce the constant term modulo z. Reach: the proof.

#### E6: misprint

HAL hal-02490566v2, Theorem 4.3 Step 1(i), p. 17; version of record not collated. Printed fragment: `ξ_(n+1) divides ξ_n`.

Correction: Require xi_n divides xi_(n+1), keeping nonzero xi_n and the prime-exhaustion and coefficient-integrality conditions.

Reason: The printed direction forces every xi_n's prime divisors to belong to the finite support of xi_0, contradicting exhaustion of all primes in condition (ii). The corrected direction permits products clearing successively more primes and denominators. Reach: the proof.

#### E7: misprint

HAL hal-02490566v2, Theorem 4.3 Step 2, p. 18, last displayed computation; version of record not collated. Printed fragment: `Z_P(E/O_L)`.

Correction: Restore the tildes in the local factors occurring in the final deformed regulator computation: use Ztilde_P(E/O_L).

Reason: Both surrounding regulators and Ltilde live over Atilde. Proposition 3.6 supplies deformed factors; replacing them by their z=1 values is not an equality over the Gauss coefficient field. Reach: the proof.

#### E8: misprint

HAL hal-02490566v2, Lemma 4.6 statement, p. 18; version of record not collated. Printed fragment: `α_t ∈ F_q[t]`.

Correction: The generator belongs to F_q((1/t))^times and has infinity valuation zero, not generally to F_q[t].

Reason: A nonzero polynomial of infinity valuation zero is constant. For the Carlitz module over F_q[t], the regulator-class product is zeta_A(1) F_q[t], a nonconstant principal unit. Taelman 0910.3142v4 §5 defines the regulator in k((t^-1)) and Theorem 2 proves precisely its product's valuation-zero assertion. Reach: a stated result.

#### E9: misprint

HAL hal-02490566v2, Proposition 5.3 proof, p. 23; version of record not collated. Printed fragment: `k ≡ k_0-j (mod m)`.

Correction: In the final grouped relation retain the earlier k congruent k_0+j condition consistently, and retain tau^(j+l) before reducing modulo tau^m-1. In the reconstruction sum, sum over k_0 rather than an unused k.

Reason: The components were defined using the plus sign, so the displayed final sum with a minus sign need not select the same monomials. Reduction changes j+l modulo m, not to j in every term. These indexing slips are separate from the polynomial divisibility issue E10. Reach: the proof.

#### E10: error

HAL hal-02490566v2, Proposition 5.3 proof, pp. 22–23; version of record not collated. Printed fragment: `R = R_0 A_F[z]`.

Correction: Use homogeneous components for the Z/m grading, whose jth entries have exponents congruent to j+j_0 modulo m, without the extra lower bound; alternatively invert z first and state the Laurent-module generation identity before localizing to F_q(z).

Reason: Take A=F_2[t], F=F_4, d=1, E_t=tau in characteristic (t), so Etilde_t=z tau. In U=F[z]{tau}/(tau^2-1), the relation (-z,t) on generators (1,tau) is zero. Every printed R_0 vector has its second entry divisible by z since j=1 and j_0>=0; so does its A_F[z]-span. The relation's second entry t is not divisible by z. Thus the printed generation equality fails. The intended localized Fitting descent can still hold. Reach: the proof.

#### E11: error

HAL hal-02490566v2, Theorem 5.6 proof, pp. 25–26; version of record not collated. Printed fragment: `∏_(i=1)^r (1-α_i z^m_P)`.

Correction: Replace the asserted universal count r of reciprocal roots by a bound d*r in Y=z^m_P (pad with zero roots if needed). Carry a valid root-valuation estimate: the weighted determinant bound yields m_P*(-v_infinity(t))/r; a weaker uniform dimension-dependent estimate already suffices for convergence.

Reason: Let E be the direct sum of two Carlitz modules over F_q[t], P=(t-a), d=2 and r=1. Then G_P(z)/G_P(0)=(1-z/(t-a))^2 has degree 2 in z, and cannot be one linear factor. This remains true in characteristic two. A sufficiently large root count repairs the degree issue; the scalar r must not silently mean total dimension. Reach: the proof.

#### E12: error

HAL hal-02490566v2, Theorem 6.3 proof, p. 28, definition preceding tau-z sequence; version of record not collated. Printed fragment: `Mtilde(E/F_P)=F_P(z)^d`.

Correction: The source/target of the tau-z motive presentation must be a skew-polynomial motive module with an explicit z-action convention, not the finite-dimensional point space. Derive the cokernel on that corrected module (G7).

Reason: On the printed F_P(z)^d, tau is F_q(z)-linear and tau^m=1. Consequently tau-z is invertible over F_q(z), with determinant a nonzero power of 1-z^m; its cokernel is zero, contrary to the following assertion that it is F_P(z)^d. In the simplest F_P=F_q case it is multiplication by 1-z. Reach: the proof.

#### E13: misprint

HAL hal-02490566v2, Theorem 6.3 proof, p. 28, adjoint action; version of record not collated. Printed fragment: `∑_(i=1)^k`.

Correction: Include the i=0 term A_0^T in the adjoint sum.

Reason: For a=1 the printed sum is zero, whereas the action of 1 must be identity. The missing constant term also contains the differential, so discarding it cannot define a unital A-action. Reach: the proof.

#### E14: error

HAL hal-02490566v2, Theorem 6.3 proof, p. 29, matrix comparison; version of record not collated. Printed fragment: `T'^(-i) · (A'_i)^T`.

Correction: Use the trace-pairing adjoint: G^(-1) B^T G in a general normal basis, or use a trace-dual pair of bases. Normal bases need not be self-dual; the matrix of multiplication by an element is not generally symmetric.

Reason: For F_9=F_3(i), i^2=-1, the normal basis (1+i,1-i) has trace Gram matrix G=[[0,1],[1,0]]. Multiplication by i has matrix A=[[0,1],[2,0]], so A!=A^T although it is self-adjoint for the trace pairing: A=G^(-1)A^TG. Taking a Carlitz reduction with iota(t)=i already disproves the constant-coefficient matrix-transpose claim. The trace duality repair preserves the desired module-dual comparison. Reach: the proof.

### Unclosed work and resumption order

#### G1: Collate the 44-page version of record

Only the complete 31-page HAL v2 manuscript was available. The publisher confirms the main scope but acknowledges earlier corrections. Obtain the lawful journal text or author-accepted final manuscript, reconcile all theorem numbers and wording, and check every E1–E14. Do not label these new journal errors or this extraction complete before collation.

Consumers: all source items.

#### G2: Higher-dimensional analytic and Stark-unit inputs

Read Demeslay §2.1.2, Goss 5.9.6, Arithmetic of function fields units Propositions 1–3/Theorem 1 and On special L-values §3. Then decompose the all-dimensional local-isometry, finite-generation and specialization-surjectivity proofs; the inspected 2017 Drinfeld theorem alone is not sufficient.

Consumers: 22, 23, 24, 27, 30, 33, 36, 37, 39, 54.

#### G3: Gauss limit versus z-local integral coefficients

Supply the uniform denominator/Tate-unit argument in Theorem 4.3 Step 1 that turns coefficientwise integrality into membership in Atilde. Gauss convergence alone does not stabilize z-adic order: z+pi^n -> z is a counterexample. Use the discrete A coefficients and a fixed common denominator; prove that denominator exists before invoking it.

Consumers: 56, 58, 59.

#### G4: Norm comparison and rational-constant valuation argument

Complete restriction-of-scalars determinant/Fitting norm compatibility, place normalization and the generalized Euler-characteristic proof of Lemma 4.6. For Remark 4.8, justify the analogue over F_q(z) without importing finite-residue-field compactness unchanged. The Taelman 2010 proof was read, but this extension is not closed.

Consumers: 60, 63, 66, 81, 103.

#### G5: Homogeneous Fitting descent and Picard torsion proof

Repair Proposition 5.3's R_0 claim using true residue grading or Laurent localization, then prove the descent of minors and coefficients. Read the Jacobian/divisor-class and constant-field torsion inputs of Lemma 5.4 or supply a fully proved Picard polynomial/localization alternative. Its printed ideal-norm step actually says I^m; the PDF image rules out the apparent OCR error and no source issue is filed for that step.

Consumers: 74, 75, 76, 77, 80, 83.

#### G6: General-A motives, projectivity and good reduction

Read the exact Hartl–Juschka/Goss sources and prove the finite exceptional sets by spreading out both kinds of motive. Split projectivity, coefficient independence and good-reduction assertions into separate declarations. Check the principal-lattice conclusion of Corollary 6.5, including bad reductions, rather than deducing it just from the word Dedekind.

Consumers: 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 97, 99, 100.

#### G7: Corrected abelian-motive tau-z presentation

Resolve the source's incompatible finite-dimensional carrier and z-twist convention in Theorem 6.3, construct the skew-polynomial cokernel explicitly, retain the i=0 term, and replace normal-basis transposition with trace-dual adjunction. The trace identity has exact finite-field tests, but these do not prove the whole motive presentation.

Consumers: 95, 96, 97, 98, 100.

#### G8: Finish proof-interior and baseline adapters

Finish source reading and finer decomposition for general Dedekind cyclic modules/Steinitz, top-exterior base change, projectivity of finite torsionfree modules, discreteness of A and bounded-degree prime finiteness, and norm/root descent. Baseline primary torsion decomposition, algebraic lattice and generic Ore carrier are not exact substitutes. Keep shared results in their named owners.

Consumers: 8, 9, 11, 12, 14, 15, 17, 18, 54, 55, 57, 70, 81, 94, 101, 103.

The order is G1, then G2/G4, G5 and G6/G7, followed by G8's finer proof/API closure. These are exact completion obligations, not omitted scope. Do not make status complete merely because the schema checker succeeds.

### Prerequisite reading ledger

- [Taelman, A Dirichlet unit theorem for Drinfeld modules, Math. Ann. 348 (2010), 899–907; arXiv:0910.3142v4](https://arxiv.org/abs/0910.3142): Inspected §§2–5 completely, including Theorem 1 and the Euler-characteristic proof of Theorem 2. These provide the exact Drinfeld/Carlitz input, not automatically the higher-dimensional extension used by this paper. The proof extension is G2/G4. PDF SHA-256 `7a9d8c73c18efb79a1be306cd6b981170f7735ca6c86edf50ee8263822c251bd`.
- [Anglès–Ngo Dac–Tavares Ribeiro, Stark units in positive characteristic, Proc. LMS 115 (2017), 763–812; public arXiv:1606.05502v1 inspected](https://arxiv.org/abs/1606.05502): Read §2.2 and §2.3 in full: Definitions 2.4–2.6, Theorem 2.7 and Lemmas 2.8–2.10. Supplies the Drinfeld Stark quotient map and norm comparison skeleton. Its dimension-one statements cannot be silently generalized to Anderson modules. PDF SHA-256 `ebce937c0c922da38005a8bee734790828c5881a14168ccee1d40a9c3e27fe62`.
- [Anglès–Tavares Ribeiro, Arithmetic of function field units, Math. Ann. 367 (2017), 501–579](https://arxiv.org/abs/1506.06286): Main Theorem 1 and Propositions 1–3 are cited for z-unit finite generation, class torsion and the specialization quotient. Primary full proof not read in this checkpoint; acquire and match the higher-dimensional statement (G2).
- [Anglès–Ngo Dac–Tavares Ribeiro, On special L-values of t-modules, Adv. Math. 372 (2020), 107313](https://doi.org/10.1016/j.aim.2020.107313): The target source invokes the proof of Theorem 3.3 to extend Stark-unit comparisons to higher-dimensional modules. Publisher metadata and introductory theorem scope inspected; the required §3 proof still needs full reading (G2).
- [Demeslay, A class formula for L-series in positive characteristic; and Formules de classes en caractéristique positive (2015 thesis), §2.1.2](https://arxiv.org/abs/1412.3704): Needed for continuous Lie scalar extension, analytic coefficient estimates and the constant-extension argument over F_q(z). The thesis's exact section and conventions remain to be acquired (G2/G4).
- [Hartl–Juschka, Pink's theory of Hodge structures and the Hodge conjecture over function fields, 2020, §2.5.1–2.5.2](https://arxiv.org/abs/1607.01412): Acquire Definitions 2.5.5 and 2.5.9, Corollary 2.5.17 and proof details for motive conventions, A-finiteness, abelianity and Drinfeld specialization. Only primary-source bibliographic location was checked here (G6/G7).
- [Goss, Basic Structures of Function Field Arithmetic (1996), Theorem 5.9.6 and Lemma 5.4.10; Anderson, t-motives (1986)](https://doi.org/10.1007/978-3-642-61480-4): Exact exponential existence/entireness and motive projectivity inputs used in §§2 and 6 need source-level reconstruction beyond the existing polynomial-ring DM.4 target.
- [Bourbaki, Commutative Algebra VII §4 nos. 5–6; Eisenbud, Commutative Algebra Corollary 20.5](https://stacks.math.columbia.edu/tag/07Z6): Generic projective/Steinitz and Fitting base-change proofs; main source and pinned partial APIs inspected, full cited book proofs not read. Route to the existing KTheoryLowDegrees and IHG owners, with explicit completion obligation G8.

### Validation and reproduction

The paper checker and three-file intake scope check are run against the fresh publication snapshot. The paper and source-issue unit suites provide nine and seven additional passing checks. The explicit structural audit checks all ids, 239 edges, cycles, route multiplicity and all definition contracts; it does not claim mathematical closure.

The scratch arithmetic checks were executed with exact finite-field and polynomial operations, without numerical approximation or symbolic algebra dependencies. There are 80 characteristic-polynomial tests over F_2, F_4 and F_8 (residue degrees 1–3; dimensions 1–2; tau degrees 1–2), six Carlitz local factors modulo (t^n), and 2187 trace-adjoint identities over F_9. To reproduce the determinant tests, expand det(XI-sum A_i z^i tau^i) over an F_2-basis, check z-exponents are multiples of m, and check every monomial X^a z^s obeys a<=dm-ceil(s/r) for s>0. The deterministic matrix entry at power i,row j,column k is ((seed+1)(i+1)+3j+5k+seed*j*k) modulo 2^m, for seed=0,...,7. Use irreducible polynomials T+1, T^2+T+1, T^3+T+1 for degrees 1,2,3. The tested (m,d) pairs are (1,1),(2,1),(3,1),(1,2),(2,2).

For the trace test use F_9=F_3[i]/(i^2+1), all c,x,y in F_9 and powers 0,1,2; compare Tr(c*tau^j(x)*y) with Tr(x*sigma^j(c*y)). For local factors use the matrices of t*x and t*x+x^2 on F_2[t]/(t^n), n=1,...,6: their characteristic polynomials are X^n and X^(n-1)(X+1). The printed relation and normal-basis counterexamples are specified in E10/E14. These calculations falsify tempting wrong formulas; they are not formal proofs of general theorems.

No Lean file is authorized by this paper issue. No Lean compilation or implementation claim is made. PDFs, rendered pages, source text and scratch programs are not included in the pull request.

### Item ledger and definition contracts

All item ids below are prefixed by `PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22/` in the JSON. The JSON additionally records all directed dependencies and detailed uses. API names are planning names, not declarations claimed to exist.

#### 1. Function-field coefficient and completion datum

Fix the coefficient datum in the conventions: A= {a in K: v_P(a)>=0 for P != infinity}, O_L is the integral closure in finite L/iota(K), and L_infinity=L tensor_K K_infinity. Infinity need not be rational, nor A principal.

Source: §1.1, p. 4. Classification: planned — FunctionFieldArithmetic:FA.0, FunctionFieldArithmetic:FA.3.

API:

- `FunctionFieldCoefficientData.regularAway` (characterisation): Membership of a in A is equivalent to v_P(a)>=0 for every P other than infinity.
- `FunctionFieldCoefficientData.scalarTower` (structure): The inclusions F_q -> A -> K -> L and their completed scalar maps form the specified commuting scalar towers.
- `FunctionFieldCoefficientData.infty_degree` (data): The residue degree d_infinity is positive and the residue field has cardinality q^d_infinity.

Tests:

- `FunctionFieldCoefficientData.test_rational_case` (computation): For K=F_q(t) and the usual infinity, A=F_q[t] and d_infinity=1.
- `FunctionFieldCoefficientData.test_constants_not_exact` (non-example): F_(q^2)(t) with proposed full constants F_q does not satisfy the datum.
- `FunctionFieldCoefficientData.test_nonrational_place` (compatibility): For a degree-two place, the residue field has q^2 elements; no equality with F_q is inferred.

#### 2. Gauss coefficient extension and Tate algebra

Extend v_infinity to K_infinity(z) by the minimum valuation of polynomial coefficients and subtraction on quotients. Its polynomial completion is T_z(K_infinity)=F_infinity[z]((pi)); its rational completion is Ktilde_infinity=F_infinity(z)((pi)). Put Atilde=F_q(z) tensor A, Otilde_L=F_q(z) tensor O_L, and T_z(L_infinity)=L_infinity tensor_K_infinity T_z(K_infinity).

Source: §1.1, pp. 4–5. Classification: missing.

API:

- `GaussCoefficientExtension.valuation_polynomial` (simp): For nonzero sum a_i z^i the Gauss valuation is min_i v_infinity(a_i).
- `GaussCoefficientExtension.frobenius_z` (simp): The coefficient Frobenius fixes z and has q-power action on K_infinity.
- `GaussCoefficientExtension.tate_to_field` (coercion): The inclusion of T_z(K_infinity) in Ktilde_infinity is isometric.

Tests:

- `GaussCoefficientExtension.test_norm_z` (computation): v_infinity(z)=0, hence z^n does not converge to zero in the Gauss topology.
- `GaussCoefficientExtension.test_geometric_series` (computation): For v_infinity(pi)>0, sum_(n>=0) pi^n z^n belongs to T_z and equals (1-pi*z)^(-1).
- `GaussCoefficientExtension.test_rational_not_tate` (non-example): 1/z belongs to Ktilde_infinity but not T_z(K_infinity).

#### 3. Zeroth Fitting ideal

For a finitely presented module M over a commutative ring R, choose R^a -> R^b -> M -> 0 and take the ideal of b by b minors; it is zero if a<b and the unit ideal for the zero module. The construction is independent of the presentation.

Source: §1.2, p. 5. Classification: planned — IntegralHeckeAndGaloisDeterminants:IHG.6.

API:

- `Module.fittingIdealZero.presentation_independent` (characterisation): Different finite presentations produce the same ideal.
- `Module.fittingIdealZero.map` (functoriality): For R->S the ideal base-changes by Ideal.map, as in item 7.
- `Module.fittingIdealZero.cyclic` (simp): Fitt_0(R/I)=I for finitely generated I.

Tests:

- `Module.fittingIdealZero.test_zero` (degenerate): Fitt_0(0)=R.
- `Module.fittingIdealZero.test_free_rank_one` (computation): For nonzero R, Fitt_0(R)=0.
- `Module.fittingIdealZero.test_nonflat_image` (non-example): For R=k[x], S=R/(x), M=R/(x), Fitt_S(S tensor M)=0 although S tensor_R (x) is a nonzero rank-one S-module.

#### 4. Fitting ideal of a direct sum

For finitely presented R-modules M,N, Fitt_0(M direct-sum N)=Fitt_0(M) Fitt_0(N).

Source: §1.2(1), p. 5. Classification: planned — IntegralHeckeAndGaloisDeterminants:IHG.6.

Acceptance: For R=k[t], M=R/(t), N=R/(t^2), the product ideal is (t^3).

#### 5. Fitting and annihilator bounds

For finitely presented M generated by b elements, Ann_R(M)^b subset Fitt_0(M) subset Ann_R(M).

Source: §1.2(2), p. 5. Classification: planned — IntegralHeckeAndGaloisDeterminants:IHG.6.

Acceptance: For R=k[t], M=(R/(t))^2, Ann(M)=(t) while Fitt(M)=(t^2).

#### 6. Fitting submultiplicativity in exact sequences

For a short exact sequence of finitely presented R-modules 0->M1->M->M2->0, Fitt_0(M1) Fitt_0(M2) subset Fitt_0(M).

Source: §1.2(3), p. 5. Classification: planned — IntegralHeckeAndGaloisDeterminants:IHG.6.

Acceptance: For 0->R/(t)->R/(t^2)->R/(t)->0, the containment is equality (t^2).

#### 7. Arbitrary base change of a Fitting ideal

For a ring map f:R->S and finitely presented M, Fitt_0,S(S tensor_R M)=Ideal.map(f,Fitt_0,R(M)). In particular quotienting R by I gives the image ideal. Do not identify the image ideal with S tensor_R Fitt_0,R(M) without injectivity of its canonical map.

Source: §1.2(4)–(5), p. 5; corrected E1. Classification: planned — IntegralHeckeAndGaloisDeterminants:IHG.6.

Acceptance: Use the nonflat test R=k[x] -> k, M=R/(x): the image ideal is zero.

#### 8. Dedekind torsion-module elementary divisors

For a Dedekind domain R and finitely generated torsion M, M is a finite direct sum of R/I_j for nonzero ideals I_j; Fitt_0(M)=product I_j. The ideals need not be principal.

Source: §1.2, last paragraph, p. 5. Classification: missing.

Acceptance: For R a Dedekind domain with a nonprincipal prime P, do not require R/P to have a principal presentation ideal.

#### 9. Exact Fitting multiplicativity over a Dedekind domain

For a short exact sequence of finitely generated torsion modules over a Dedekind domain, Fitt(M)=Fitt(M1) Fitt(M2). Torsion and finite generation are retained.

Source: §1.2, last paragraph, p. 5. Classification: missing.

Acceptance: Local lengths at every nonzero prime add in the exact sequence and hence give equality of all ideal valuations.

#### 10. Discrete full A-lattice

For k=F_q or F_q(z), let R=k tensor A and V a finite-dimensional k_infinity-vector space, with its valuation topology. An R-lattice M subset V is an R-submodule which is discrete and spans V over k_infinity. No freeness is part of the definition.

Source: Definition 1.1, p. 5; E2. Classification: missing.

API:

- `DiscreteALattice.span_eq_top` (projection): An R-lattice spans its ambient V over k_infinity.
- `DiscreteALattice.linearEquiv_map` (functoriality): Continuous k_infinity-linear equivalences carry R-lattices to R-lattices and preserve identity/composition.
- `DiscreteALattice.finite_basis_quotient` (characterisation): Full lattices have the equivalent finite-index basis description of item 12.

Tests:

- `DiscreteALattice.test_zero_space` (degenerate): The zero submodule is a full lattice in the zero vector space.
- `DiscreteALattice.test_rational_standard` (computation): F_q[t]^n is a lattice in F_q((1/t))^n.
- `DiscreteALattice.test_nondiscrete_span` (non-example): For V=K_infinity nonzero, all of V as an A-submodule spans but is not discrete.

#### 11. Criterion for a discrete submodule

An R-submodule M of V is discrete iff it contains an R-free submodule generated by a finite k_infinity-linearly independent family such that the quotient is finite-dimensional over k. The family need not span V.

Source: Lemma 1.2, pp. 5–6. Classification: missing.

Acceptance: The zero submodule is discrete with the empty independent family and zero quotient.

#### 12. Three full-lattice criteria

For n=dim_k_infinity V, M is an R-lattice iff it is discrete, finitely generated and of rank n; equivalently it contains the R-span of a k_infinity-basis with finite-dimensional k-quotient.

Source: Proposition 1.3, p. 6. Classification: missing.

Acceptance: A proper coordinate subspace lattice is discrete but fails the full-rank condition.

#### 13. Rank-one lattice ratio

For one-dimensional V, choose e !=0 and write M=alpha I e, M'=alpha' I' e with nonzero fractional R-ideals I,I'. Define [M':M]_R=(alpha/alpha') I (I')^(-1) inside k_infinity. Prove independence of e and the decompositions.

Source: Definition 1.4, p. 6. Classification: missing.

API:

- `RankOneLattice.ratio.coordinate_formula` (simp): For M=alpha I e and N=beta J e, [N:M]=(alpha/beta) I J^(-1).
- `RankOneLattice.ratio.basis_independent` (characterisation): Replacing e by c e leaves the ratio unchanged.
- `RankOneLattice.ratio.scale` (compatibility): [bN:aM]=(a/b)[N:M] for a,b nonzero in k_infinity.

Tests:

- `RankOneLattice.ratio.test_self` (degenerate): [M:M]=R.
- `RankOneLattice.ratio.test_polynomial_index` (computation): For R=k[t], [R:tR]=tR.
- `RankOneLattice.ratio.test_inverse_orientation` (non-example): [tR:R]=t^(-1)R, not tR.

#### 14. Determinant lattice and general ratio

For an R-lattice M in n-dimensional V, take the image of exteriorPower_R^n M in exteriorPower_k_infinity^n V. Define [M':M] by the rank-one ratio of these determinant lattices, with exterior degree zero interpreted as R inside k_infinity.

Source: §1.3, pp. 6–7. Classification: missing.

API:

- `ALattice.determinantRatio.topExteriorImage` (constructor): Map the top exterior power of the lattice into the top exterior power of V.
- `ALattice.determinantRatio.basis_formula` (compatibility): Its coordinate ideal gives item 15's Steinitz formula without requiring freeness.
- `ALattice.determinantRatio.directSum` (relation): The ratio for direct sums is the product of the individual ratios.

Tests:

- `ALattice.determinantRatio.test_rank_zero` (degenerate): Both zero-rank determinant lattices are R and their ratio is R.
- `ALattice.determinantRatio.test_diagonal_index` (computation): For M=R^2 and N=tR direct-sum t^2R, [M:N]=t^3R.
- `ALattice.determinantRatio.test_nonprincipal_rank_one` (non-example): For a nonprincipal invertible ideal I, [R:I]=I; no scalar generator is chosen.

#### 15. Steinitz-coordinate ratio

For n>=1 and decompositions M=R e1+...+R e_(n-1)+I e_n and M'=R f1+...+R f_(n-1)+J f_n, if sigma(e_i)=f_i, then [M':M]=det(sigma)^(-1) I J^(-1). The finite torsionfree/projective Steinitz decomposition is a required algebraic input, not a choice of free basis.

Source: §1.3, pp. 6–7; Bourbaki VII §4. Classification: missing.

Acceptance: When n=1 the formula reduces to the rank-one ideal ratio, without assuming I or J principal.

#### 16. Ratio inverse and cocycle laws

For lattices M1,M2,M3 in the same V, [M1:M2]=[M2:M1]^(-1) and [M1:M3]=[M1:M2][M2:M3]; rank-one lattices in k_infinity form an abelian group.

Source: §1.3, p. 7. Classification: missing.

Acceptance: For R, tR and t^3R the ratios give t^3R=(tR)(t^2R) with the specified orientation.

#### 17. Index is the Fitting ideal

If M' subset M are R-lattices in V, M/M' is finitely generated torsion and [M:M']=Fitt_R(M/M').

Source: Proposition 1.5, p. 7. Classification: missing.

Acceptance: For M=R and M'=tR, both sides equal tR.

#### 18. Determinant-index formula

For a k_infinity-linear automorphism sigma of V and R-lattices with sigma(M) subset M', [M':M]=det(sigma)^(-1) Fitt_R(M'/sigma(M)).

Source: Corollary 1.6, p. 7. Classification: missing.

Acceptance: If sigma is multiplication by t and M=M'=R, det(sigma)^(-1)Fitt(R/tR)=R.

#### 19. Positive Frobenius Ore algebra

For an F_q-algebra R, construct matrices of additive skew polynomials with tau B=B^(q) tau and nonnegative tau powers. On perfect coefficient fields inverse twists may separately be defined; negative tau powers do not belong to this polynomial ring.

Source: §2, p. 7; corrected E3. Classification: planned — DrinfeldModulesAndTModules:DM.0.

API:

- `FrobeniusSkewPolynomial.monomial_mul` (simp): (A tau^i)(B tau^j)=A B^(q^i) tau^(i+j) for i,j>=0.
- `FrobeniusSkewPolynomial.constantTerm` (projection): The constant coefficient is a ring homomorphism to the coefficient matrix ring.
- `FrobeniusSkewPolynomial.eval_comp` (compatibility): Evaluation as additive operators sends skew multiplication to composition.

Tests:

- `FrobeniusSkewPolynomial.test_twist` (computation): tau*c=c^q*tau.
- `FrobeniusSkewPolynomial.test_no_inverse` (non-example): Over F_q(t), inverse q-Frobenius of t is undefined within the field.
- `FrobeniusSkewPolynomial.test_constant_product` (degenerate): Constant matrices multiply by ordinary matrix multiplication.

#### 20. Anderson A-module in arbitrary coefficient ring

For a field R over F_q with iota:A->R and d>=1, an Anderson A-module is an F_q-algebra homomorphism E:A->Mat_d(R){tau}, whose constant-term map partial_E satisfies (partial_E(a)-iota(a)I)^d=0 for all a, and whose image is not contained in Mat_d(R). An integral model means every coefficient lies in O_L. Drinfeld modules are the dimension-one case.

Source: §2, pp. 7–8. Classification: missing.

API:

- `AndersonAModule.differential` (projection): partial_E is an F_q-algebra homomorphism with (partial_E(a)-iota(a)I)^d=0.
- `AndersonAModule.map_mul` (simp): E_(ab)=E_a E_b in the skew ring.
- `AndersonAModule.polynomial_specialization` (compatibility): For A=F_q[t] this agrees with DM.4's Anderson t-module convention.

Tests:

- `AndersonAModule.test_carlitz` (computation): d=1 and E_t=theta+tau gives the Carlitz module.
- `AndersonAModule.test_nilpotent_differential` (computation): For the second Carlitz tensor power, partial_E(t)=theta I+N with N_12=1 and N^2=0, not theta I.
- `AndersonAModule.test_pure_scalar_excluded` (non-example): An action entirely in constant matrices is excluded by the source's nontriviality condition.

#### 21. Point and Lie module functors

For an E-compatible coefficient algebra B, E(B)=B^d with action E_a, while Lie_E(B)=B^d with action partial_E(a). The constant-term map is an algebra homomorphism. Compatible coefficient maps induce maps of both A-modules.

Source: §2, p. 8. Classification: missing.

API:

- `AndersonAModule.pointLie.point_action` (simp): a acts on a point vector through the full additive polynomial E_a.
- `AndersonAModule.pointLie.lie_action` (simp): a acts on a Lie vector through partial_E(a).
- `AndersonAModule.pointLie.baseMap` (functoriality): Compatible coefficient maps commute with both actions, identities and compositions.

Tests:

- `AndersonAModule.pointLie.test_carlitz_one` (computation): For Carlitz, t acts on point 1 by theta+1 but on Lie vector 1 by theta.
- `AndersonAModule.pointLie.test_nilpotent_vector` (computation): For partial_E(t)=theta I+N in dimension two, t*e2=theta e2+e1.
- `AndersonAModule.pointLie.test_zero` (degenerate): Both module actions send the zero vector to zero.

#### 22. Continuous Lie scalar extension and integral lattice

For integral generic-characteristic E, partial_E uniquely extends continuously to K_infinity->Mat_d(L_infinity), and Lie_E(O_L) is an A-lattice in Lie_E(L_infinity) for this action.

Source: §2, p. 8, citing Demeslay §2.1.2. Classification: missing.

Acceptance: For a nonzero nilpotent differential, retain the same partial_E action in the lattice inclusion.

#### 23. Exponential and formal logarithm

For integral E there are unique series exp_E=I+sum_(i>=1)e_i tau^i and log_E=I+sum_(i>=1)l_i tau^i with coefficients in Mat_d(L), satisfying exp_E partial_E(a)=E_a exp_E and log_E E_a=partial_E(a) log_E. They are two-sided inverses in the formal skew-series ring.

Source: §2, p. 8; Goss Theorem 5.9.6 and Anderson 1986. Classification: missing.

API:

- `AndersonAModule.expLog.constantCoeff` (simp): The constant skew coefficient of each series is the identity matrix.
- `AndersonAModule.expLog.intertwine` (relation): exp_E partial_E(a)=E_a exp_E and log_E E_a=partial_E(a) log_E.
- `AndersonAModule.expLog.inverse` (relation): Both formal compositions exp_E log_E and log_E exp_E are I.

Tests:

- `AndersonAModule.expLog.test_carlitz_first` (computation): For E_t=theta+tau, e_1=(theta^q-theta)^(-1).
- `AndersonAModule.expLog.test_log_first` (computation): For the same Carlitz module, l_1=-(theta^q-theta)^(-1).
- `AndersonAModule.expLog.test_log_domain` (non-example): A formal inverse identity alone does not assert that log_E converges at every point of L_infinity.

#### 24. Entire exponential and local inverse

exp_E converges on all Lie_E(L_infinity). On a sufficiently small valuation ball it and log_E are inverse isometries. Neither global surjectivity on L_infinity nor global convergence of log_E is asserted.

Source: §2, pp. 8–9; convergence inputs. Classification: missing.

Acceptance: Near zero the linear coefficient I forces the isometry; it does not assert a global logarithm.

#### 25. Exponential unit lattice

U(E/O_L)={x in Lie_E(L_infinity): exp_E(x) in E(O_L)}, with its inherited Lie A-action.

Source: §2, p. 8. Classification: missing.

API:

- `AndersonAModule.units.mem` (characterisation): x belongs to U iff exp_E(x) is integral.
- `AndersonAModule.units.lie_smul` (structure): U is stable under the Lie action of A by the exponential functional equation.
- `AndersonAModule.units.toPoints` (projection): Restriction of exp_E maps U to E(O_L); its kernel is the period lattice intersected with L_infinity.

Tests:

- `AndersonAModule.units.test_zero` (degenerate): 0 belongs to U.
- `AndersonAModule.units.test_not_ordinary_units` (non-example): U is an additive A-module; it includes zero and is not O_L^times.
- `AndersonAModule.units.test_carlitz` (compatibility): For Carlitz over F_q[t], U is the rank-one lattice generated by log_C(1) in Taelman's normalization.

#### 26. Class module

H(E/O_L)=E(L_infinity)/(E(O_L)+exp_E(Lie_E(L_infinity))), with the point-module A-action, not the Lie action.

Source: §2, pp. 8–9. Classification: missing.

API:

- `AndersonAModule.classModule.quotientMap` (projection): The canonical map E(L_infinity)->H kills integral points and exponential images.
- `AndersonAModule.classModule.lift` (universal-property): An A-linear map killing both submodules factors uniquely through H.
- `AndersonAModule.classModule.exact` (relation): H is the cokernel in item 27's exact sequence.

Tests:

- `AndersonAModule.classModule.test_integral_zero` (computation): Every point of E(O_L) maps to zero.
- `AndersonAModule.classModule.test_exp_zero` (computation): The class of exp_E(x) is zero for every x in the Lie space.
- `AndersonAModule.classModule.test_carlitz_zero` (compatibility): For Carlitz over F_q[t], H=0, while no vanishing is asserted for every integral module.

#### 27. Unit theorem for integral Anderson modules

For integral E, U(E/O_L) is an A-lattice in Lie_E(L_infinity), H(E/O_L) is finite, and 0->U->Lie_E(L_infinity)->E(L_infinity)/E(O_L)->H->0 is exact. The higher-dimensional extension of Taelman 2010 is a proof obligation in G2.

Source: §2, p. 9. Classification: missing.

Acceptance: For Carlitz over F_q[t], the unit lattice has rank one and H=0; compare both exact maps.

#### 28. z-deformation of an Anderson module

If E_a=sum_i E_(a,i) tau^i, define Etilde_a=sum_i z^i E_(a,i) tau^i, with tau acting on coefficients by q-Frobenius and fixing z. Extend by F_q(z)-linearity to Atilde on Otilde_L-compatible modules. Specialization at z=1 gives E and at z=0 gives partial_E.

Source: §2, p. 9. Classification: missing.

API:

- `AndersonAModule.zDeformation.coeff` (simp): The tau^i coefficient is z^i E_(a,i).
- `AndersonAModule.zDeformation.map_mul` (structure): Etilde_(ab)=Etilde_a Etilde_b because tau fixes z.
- `AndersonAModule.zDeformation.specialize` (compatibility): Specializing z=1 gives E, and z=0 gives partial_E.

Tests:

- `AndersonAModule.zDeformation.test_carlitz` (computation): Carlitz deforms to Etilde_t=theta+z tau.
- `AndersonAModule.zDeformation.test_square` (computation): For Carlitz Etilde_(t^2)=theta^2+z(theta+theta^q)tau+z^2 tau^2.
- `AndersonAModule.zDeformation.test_not_z_frobenius` (non-example): The tau^2 coefficient in that test is z^2, not z^(q+1).

#### 29. Deformed exponential and logarithm

Define exp_Etilde=sum_i z^i e_i tau^i and log_Etilde=sum_i z^i l_i tau^i, with e_0=l_0=I. They satisfy the deformed functional equations and are inverse formal series.

Source: Lemma 2.1(1), pp. 9–10. Classification: missing.

API:

- `AndersonAModule.zExpLog.coeff` (simp): The ith skew coefficient is z^i times the original ith coefficient.
- `AndersonAModule.zExpLog.intertwine` (relation): exp_Etilde partial_E(a)=Etilde_a exp_Etilde.
- `AndersonAModule.zExpLog.evaluation` (compatibility): Evaluation at z=1 of the convergent deformed exponential equals exp_E after evaluation of its argument.

Tests:

- `AndersonAModule.zExpLog.test_z_zero` (degenerate): At z=0, the deformed exponential is the identity.
- `AndersonAModule.zExpLog.test_first_coefficient` (computation): For Carlitz its first positive coefficient is z/(theta^q-theta).
- `AndersonAModule.zExpLog.test_formal_inverse` (characterisation): The deformed logarithm composes on either side to the identity as a formal skew series.

#### 30. Tate convergence of the deformed exponential

exp_Etilde converges on T_z(L_infinity)^d and on Ltilde_infinity^d; on a sufficiently small ball it is an isometric bijection with inverse log_Etilde. Evaluation at z=1 intertwines exp_Etilde and exp_E.

Source: Lemma 2.1(2), p. 10. Classification: missing.

Acceptance: Evaluation at z=1 recovers the original convergent exponential, while evaluation on arbitrary rational functions remains unavailable.

#### 31. Polynomial z-units

U_z={x in Lie_Etilde(T_z(L_infinity)): exp_Etilde(x) in Etilde(O_L[z])}, an A[z]-module. Polynomial refers to the exponential's target, not to requiring x itself to be polynomial.

Source: §2, p. 10. Classification: missing.

API:

- `AndersonAModule.polynomialZUnits.mem` (characterisation): x belongs iff x is Tate-analytic and exp_Etilde(x) belongs to O_L[z]^d.
- `AndersonAModule.polynomialZUnits.polynomial_smul` (structure): U_z is stable under A[z], with its deformed Lie action.
- `AndersonAModule.polynomialZUnits.rationalSpan` (compatibility): Its F_q(z)-span is U_rat by item 33.

Tests:

- `AndersonAModule.polynomialZUnits.test_zero` (degenerate): 0 is a polynomial z-unit.
- `AndersonAModule.polynomialZUnits.test_not_rational_target` (non-example): An exponential value with a pole at z=1 is not in O_L[z]^d and cannot certify membership.
- `AndersonAModule.polynomialZUnits.test_specialization_integral` (compatibility): For u in U_z, exp_E(ev_1(u)) belongs to O_L^d.

#### 32. Rationally deformed unit lattice

U_rat={x in Lie_Etilde(Ltilde_infinity): exp_Etilde(x) in Etilde(Otilde_L)}, an Atilde-module.

Source: §2, p. 10. Classification: missing.

API:

- `AndersonAModule.rationalZUnits.mem` (characterisation): x belongs iff its deformed exponential is in Otilde_L^d.
- `AndersonAModule.rationalZUnits.scalar` (structure): U_rat is stable under F_q(z) and the Atilde Lie action.
- `AndersonAModule.rationalZUnits.fromPolynomial` (coercion): The natural inclusion U_z -> U_rat is injective.

Tests:

- `AndersonAModule.rationalZUnits.test_zero` (degenerate): 0 belongs to U_rat.
- `AndersonAModule.rationalZUnits.test_rational_scale` (computation): If u belongs to U_rat then u/(z-1) belongs to U_rat.
- `AndersonAModule.rationalZUnits.test_evaluation_not_total` (non-example): The preceding scaling does not define a universal ev_1 map on U_rat.

#### 33. Finite generation and rationalization of units

U_z is finitely generated over A[z]; U_rat is an Atilde-lattice and equals the F_q(z)-span of U_z in Lie_Etilde(Ltilde_infinity).

Source: §2, p. 10, citing Arithmetic of function fields units, Proposition 1. Classification: missing.

Acceptance: Clearing F_q[z] denominators of finitely many generators realizes each rational unit in the stated span.

#### 34. Polynomial deformed class module

H_z=Etilde(T_z(L_infinity))/(Etilde(O_L[z])+exp_Etilde(Lie_Etilde(T_z(L_infinity)))), with its A[z]-action.

Source: §2, p. 10. Classification: missing.

API:

- `AndersonAModule.polynomialZClass.quotient` (constructor): Form the A[z]-module quotient by integral polynomials plus exponential images.
- `AndersonAModule.polynomialZClass.zAction` (structure): Multiplication by z is induced by its scalar action on Tate vectors.
- `AndersonAModule.polynomialZClass.specialize` (compatibility): The quotient H_z/(z-1)H_z identifies with H(E/O_L).

Tests:

- `AndersonAModule.polynomialZClass.test_polynomial_zero` (computation): Every point in O_L[z]^d has zero class.
- `AndersonAModule.polynomialZClass.test_exp_zero` (computation): Every exp_Etilde(Tate vector) has zero class.
- `AndersonAModule.polynomialZClass.test_z_torsion` (non-example): A nonzero class annihilated by z is forbidden by Proposition 2.2; torsion in other polynomials is not forbidden.

#### 35. Rational deformed class module

H_rat=Etilde(Ltilde_infinity)/(Etilde(Otilde_L)+exp_Etilde(Lie_Etilde(Ltilde_infinity))), with its Atilde-action.

Source: §2, p. 10. Classification: missing.

API:

- `AndersonAModule.rationalZClass.quotient` (constructor): Form the analogous Atilde-module quotient on Ltilde_infinity.
- `AndersonAModule.rationalZClass.fromPolynomial` (functoriality): The polynomial class module maps naturally to the rational class module.
- `AndersonAModule.rationalZClass.vanishes` (characterisation): Proposition 2.2 identifies this quotient with zero after proving its analytic comparison.

Tests:

- `AndersonAModule.rationalZClass.test_zero_class` (degenerate): The zero point represents zero.
- `AndersonAModule.rationalZClass.test_integral_class` (computation): Every Otilde_L point represents zero.
- `AndersonAModule.rationalZClass.test_surjectivity_mod_integrals` (characterisation): Every point of Etilde(Ltilde_infinity) is a sum of an integral rational point and a deformed exponential.

#### 36. Polynomial class torsion and invertibility of z

H_z is finitely generated torsion over F_q[z], and multiplication by z is injective and surjective. The proof uses exp_Etilde congruent I modulo z and finite generation; no invalid local Nakayama inference over F_q[z] is allowed.

Source: Proposition 2.2(1), p. 10. Classification: missing.

Acceptance: A module F_q[z]/(z-1) is torsion and z acts invertibly, showing that the conclusion does not mean H_z=0.

#### 37. Vanishing of the rational deformed class module

H_rat=0. Rationalizing the polynomial class module kills it; the dense-span and small-ball argument must identify this rationalization with H_rat.

Source: Proposition 2.2(2), p. 10. Classification: missing.

Acceptance: For every rational deformed point, exhibit its class as zero after the analytic rationalization comparison.

#### 38. Evaluation and Stark units

Evaluation ev_1:T_z(L_infinity)^d->L_infinity^d is onto with kernel (z-1)T_z(L_infinity)^d and is A-linear from the deformed to the original Lie action. Define U_St(E/O_L)=ev_1(U_z), an A-submodule of U.

Source: §2, pp. 10–11. Classification: missing.

API:

- `AndersonAModule.starkUnits.mem_image` (characterisation): u belongs to U_St iff u=ev_1(v) for some v in U_z.
- `AndersonAModule.starkUnits.subset_units` (coercion): The exponential-evaluation identity gives U_St subset U.
- `AndersonAModule.starkUnits.quotient_fitting` (relation): The finite quotient has the class-module Fitting ideal of item 39.

Tests:

- `AndersonAModule.starkUnits.test_zero` (degenerate): The zero z-unit evaluates to the zero Stark unit.
- `AndersonAModule.starkUnits.test_kernel_eval` (computation): ev_1((z-1)v)=0 for every Tate vector v.
- `AndersonAModule.starkUnits.test_not_all_units_axiom` (non-example): When Fitt_A(H) is nonunit, U_St is a proper sublattice of U.

#### 39. Stark quotient and class-module Fitting ideal

U_St is an A-lattice, U/U_St is finite and Fitt_A(U/U_St)=Fitt_A(H). Obtain the quotient through H_z[z-1], with kernel/cokernel multiplicativity for z-1 on the finite A-module H_z. The all-dimensional input is G2; the 2017 Theorem 2.7 inspected directly proves the Drinfeld case.

Source: Equation (2.1), p. 11; external Stark-unit theorem. Classification: missing.

Acceptance: A nonunit class Fitting ideal forces a proper finite-index Stark sublattice.

#### 40. Local Fitting factor

For a nonzero ideal I of O_L, Z_I(E/O_L)=Fitt_A(Lie_E(O_L/I)) Fitt_A(E(O_L/I))^(-1), as a fractional A-ideal inside K_infinity. Both modules are finite A-torsion modules.

Source: §3.1, p. 11. Classification: missing.

API:

- `AndersonAModule.localFactor.definition` (characterisation): Z_I is the quotient of Lie and point zeroth Fitting ideals.
- `AndersonAModule.localFactor.coprime` (relation): Coprime ideal products give products of factors as in item 42.
- `AndersonAModule.localFactor.prime_power` (relation): Z_(P^n)=Z_P for n>=1.

Tests:

- `AndersonAModule.localFactor.test_unit_ideal` (degenerate): I=O_L gives Z_I=A.
- `AndersonAModule.localFactor.test_carlitz_linear_prime` (computation): For Carlitz over A=F_q[t] and P=(t-a), a in F_q, Z_P=(t-a)/(t-a-1) A.
- `AndersonAModule.localFactor.test_not_multiplicity` (non-example): For n=2 the factor remains Z_P, not Z_P^2 in general.

#### 41. Deformed local Fitting factor

Ztilde_I=Fitt_Atilde(Lie_Etilde(Otilde_L/I Otilde_L)) Fitt_Atilde(Etilde(Otilde_L/I Otilde_L))^(-1), a fractional Atilde-ideal in Ktilde_infinity.

Source: §3.1, p. 11. Classification: missing.

API:

- `AndersonAModule.deformedLocalFactor.definition` (characterisation): Use the two deformed finite modules over Atilde, with the Lie ideal in the numerator.
- `AndersonAModule.deformedLocalFactor.rationalBaseChange` (compatibility): Formation of either Fitting ideal commutes with rational coefficient extension by item 7.
- `AndersonAModule.deformedLocalFactor.prime_power` (relation): Deformed local factors are also insensitive to positive prime-power multiplicity.

Tests:

- `AndersonAModule.deformedLocalFactor.test_unit_ideal` (degenerate): Ztilde_(O_L)=Atilde.
- `AndersonAModule.deformedLocalFactor.test_carlitz_linear` (computation): For Carlitz and P=(t-a), Ztilde_P=(t-a)/(t-a-z) Atilde.
- `AndersonAModule.deformedLocalFactor.test_zero_specialization` (compatibility): A regular representative of this factor at z=0 has value 1.

#### 42. Coprime ideal factorization

For nonzero coprime ideals I,J in O_L, Z_(IJ)=Z_I Z_J; likewise for the deformed factors. Apply the Chinese remainder isomorphism to both A-actions.

Source: Lemma 3.1, p. 11. Classification: missing.

Acceptance: For I=O_L the product identity reduces to Z_J=Z_J.

#### 43. Infinitesimal layers have identical point and Lie actions

For a nonzero ideal I and n>=1, on (I^n/I^(n+1))^d all positive Frobenius terms of E vanish since q n>=n+1. Thus E and Lie_E have the same action on this quotient, also after deformation.

Source: Proof of Lemma 3.2, pp. 11–12. Classification: missing.

Acceptance: For q=2,n=1, squaring I lands in I^2, including the smallest boundary case.

#### 44. Power independence of local factors

For any nonzero ideal I and integer n>=1, Z_(I^n)=Z_I and Ztilde_(I^n)=Ztilde_I. Apply exact Fitting multiplicativity successively to the infinitesimal layers.

Source: Lemma 3.2, pp. 11–12. Classification: missing.

Acceptance: The exact F_2[t]/(t^n) Carlitz calculation for n=1,...,6 gives the same factor t/(t+1).

#### 45. Radical-prime factorization

For every nonzero I, Z_I is the product of Z_P over prime ideals P containing I, each prime once regardless of its multiplicity in I; likewise for Ztilde_I.

Source: Proposition 3.3, p. 12. Classification: missing.

Acceptance: If I=P^2 Q^3, the result is Z_P Z_Q, not Z_P^2 Z_Q^3.

#### 46. Integral scalar conjugation

For xi in O_L nonzero, E'_a=xi^(-1) E_a xi has coefficients xi^(q^i-1) E_(a,i) and is integral, with partial_E'=partial_E. Its exponential is xi^(-1) exp_E xi, and xi U(E') subset U(E). The same formulas hold after z-deformation.

Source: §3.2, p. 12. Classification: missing.

API:

- `AndersonAModule.scalarConjugate.coefficient` (simp): The ith coefficient changes by xi^(q^i-1).
- `AndersonAModule.scalarConjugate.differential` (compatibility): The differential is unchanged, including its nilpotent part.
- `AndersonAModule.scalarConjugate.compose` (functoriality): Conjugating by xi then eta agrees with conjugating by xi*eta.

Tests:

- `AndersonAModule.scalarConjugate.test_identity` (degenerate): Conjugating by 1 gives E.
- `AndersonAModule.scalarConjugate.test_carlitz` (computation): For Carlitz, conjugation gives theta+xi^(q-1)tau.
- `AndersonAModule.scalarConjugate.test_nilpotent_survives` (non-example): Modulo a prime containing xi, a nonzero nilpotent differential coefficient remains; reduction is Lie_E, not necessarily scalar.

#### 47. Conjugation regulator identity with class correction

For xi and E' as in item 46, Z_(xi)(E)=[U(E'):U(E)]_A Fitt_A(H(E))/Fitt_A(H(E')). The comparison is between lattices in the common Lie space.

Source: Lemma 3.4, pp. 12–13. Classification: missing.

Acceptance: For xi=1, E'=E and both sides are A.

#### 48. Finite local product and deformed regulator identity

For the primes containing xi, product Z_P(E)=[U(E'):U(E)] Fitt(H(E))/Fitt(H(E')); product Ztilde_P(E)=[U_rat(E'):U_rat(E)]_Atilde. The second equality uses H_rat=0.

Source: Corollary 3.5 and Proposition 3.6, p. 13. Classification: missing.

Acceptance: For xi=1 the empty local product and both regulator ratios are unit lattices.

#### 49. Removing bad local factors by conjugation

For xi in P, Z_P(E')=A and Ztilde_P(E')=Atilde because E'_a reduces to partial_E(a), including its nilpotent term. For xi not in P, multiplication by xi gives an isomorphism of reductions, so both local factors are unchanged.

Source: Lemma 3.7, p. 13; corrected E4. Classification: missing.

Acceptance: Test a dimension-two nilpotent differential at P containing xi; equality of point/Lie actions survives but scalar equality fails.

#### 50. Principal-specialization condition (P)

Integral E satisfies (P) if there is a finite set S of nonzero primes of O_L such that for each P not in S there is x_P(z) in A[z] with Fitt_Atilde(Etilde(F_P(z)))=x_P Atilde, Fitt_A(Lie_E(F_P))=x_P(0)A, and Fitt_A(E(F_P))=x_P(1)A, where F_P=O_L/P.

Source: Definition 4.1, pp. 13–14. Classification: missing.

API:

- `AndersonAModule.principalSpecializations.witness` (data): Export the finite exceptional set and polynomials x_P with all three ideal equalities.
- `AndersonAModule.principalSpecializations.enlarge_exceptional` (functoriality): Enlarging the exceptional set preserves the condition.
- `AndersonAModule.principalSpecializations.implies_principal` (relation): Condition (P) implies (P') without any convergence input.

Tests:

- `AndersonAModule.principalSpecializations.test_carlitz_linear` (computation): x_P=t-a-z has x_P(0)=t-a and x_P(1)=t-a-1.
- `AndersonAModule.principalSpecializations.test_unit_rescale` (compatibility): Multiplying x_P by a nonzero F_q constant preserves the three ideal equalities.
- `AndersonAModule.principalSpecializations.test_bad_rescale` (non-example): Multiplication by z-1 preserves the rational ideal but makes x_P(1)=0 and destroys (P).

#### 51. Admissibility and Euler convergence condition (C)

With (P), require convergence to a nonzero element in Ktilde_infinity of product_(P notin S) x_P(0)/x_P(z). An integral Anderson A-module satisfying (P) and (C) is admissible. Convergence uses the infinity-adic Gauss valuation, not z-adic convergence.

Source: Definition 4.1, p. 14. Classification: missing.

API:

- `AndersonAModule.admissible.principalData` (projection): Admissibility includes a witness for (P).
- `AndersonAModule.admissible.nonzeroProduct` (projection): It includes the specified nonzero Gauss-convergent product.
- `AndersonAModule.admissible.iff_almostPrincipal` (equivalence): Theorem 5.6 identifies it with (P'), after the convergence and specialization proof.

Tests:

- `AndersonAModule.admissible.test_polynomial_ring` (compatibility): Every integral Anderson F_q[t]-module is admissible.
- `AndersonAModule.admissible.test_finite_change` (characterisation): Enlarging S by finitely many primes and removing the corresponding factors preserves nonzero convergence.
- `AndersonAModule.admissible.test_wrong_topology` (non-example): z-adic convergence alone does not establish (C); Gauss valuation of z is zero.

#### 52. Deformed Euler-product lattice

For admissible E and x(z)=product_(P notin S) x_P(0)/x_P(z), set Ltilde(E)=x(z) product_(P in S) Ztilde_P(E), a rank-one Atilde-lattice. Prove independence of S and the allowed generators rather than selecting one globally principal ideal.

Source: §4.1, p. 14. Classification: missing.

API:

- `AndersonAModule.deformedLValue.exceptional_factors` (data): Multiply the scalar tail product by every exceptional fractional ideal.
- `AndersonAModule.deformedLValue.choice_independent` (characterisation): Changing the permitted data gives the same Atilde-lattice.
- `AndersonAModule.deformedLValue.conjugation` (relation): Scalar conjugation changes the lattice by the finite local-factor product in item 48.

Tests:

- `AndersonAModule.deformedLValue.test_empty_exceptional` (degenerate): If S is empty, the lattice is x(z) Atilde.
- `AndersonAModule.deformedLValue.test_move_one_prime` (compatibility): Moving P into S inserts Ztilde_P and removes precisely its scalar factor from the tail.
- `AndersonAModule.deformedLValue.test_retain_nonprincipal` (non-example): A nonprincipal exceptional factor cannot be discarded by a choice of scalar.

#### 53. Specialized Euler-product lattice

For admissible E, y=product_(P notin S) x_P(0)/x_P(1) converges nonzero in K_infinity; define L(E)=y product_(P in S) Z_P(E). Show choice independence and that, after enlarging S, the tail product converges in the units of T_z(K_infinity), making ev_1 legitimate.

Source: §4.1, p. 14. Classification: missing.

API:

- `AndersonAModule.LValue.choice_independent` (characterisation): The resulting A-lattice is independent of admissibility witnesses.
- `AndersonAModule.LValue.tate_specialization` (compatibility): A sufficiently small tail is a Tate unit and specializes at z=1.
- `AndersonAModule.LValue.class_formula` (relation): Theorem 4.7 identifies this lattice with the Stark regulator.

Tests:

- `AndersonAModule.LValue.test_carlitz` (compatibility): For Carlitz over F_q[t], L= zeta_A(1) A.
- `AndersonAModule.LValue.test_exceptional_restore` (computation): A single exceptional prime contributes its full factor Z_P.
- `AndersonAModule.LValue.test_not_scalar_by_definition` (non-example): The definition does not select a principal generator for every A-lattice.

#### 54. Approximation of deformed units by integral vectors

Suppose e_i in Mat_d(O_L) for 0<=i<n. With B=F_q[z]_(z), every nonzero u in U_rat can be written z^a(alpha+z^n beta), where a in Z, alpha in B O_L[z]^d is not divisible by z and beta in B T_z(L_infinity)^d. Conversely each alpha in O_L^d lifts to alpha+z^n beta in B U_z.

Source: Lemma 4.4, pp. 14–15. Classification: missing.

Acceptance: The leading coefficient cannot be removed when a is negative; rational z-units may have a pole at zero.

#### 55. Projective lift of the identity modulo z^n

Under item 54, use the projectivity of Lie_E(O_L) over A to choose an A-linear map mu:Lie_E(O_L)->B U_z with mu(m) congruent m modulo z^n. Extend to the rational completed Lie space; its determinant lies in 1+z^n B T_z(K_infinity).

Source: Proof of Proposition 4.5, pp. 15–16. Classification: missing.

API:

- `ALattice.projectiveApproximation.congruence` (projection): mu(m)-m belongs to z^n B T_z(L_infinity)^d.
- `ALattice.projectiveApproximation.linear` (structure): mu is A-linear with the common Lie action.
- `ALattice.projectiveApproximation.determinant_congruence` (relation): det(mu)-1 belongs to z^n B T_z(K_infinity).

Tests:

- `ALattice.projectiveApproximation.test_identity_case` (degenerate): When the identity map already lands in B U_z, it is a valid lift.
- `ALattice.projectiveApproximation.test_det_first_order` (computation): For a two-dimensional mu=I+z^n C, det(mu)=1+z^n tr(C)+z^(2n)det(C).
- `ALattice.projectiveApproximation.test_nonfree_lattice` (non-example): The construction must work for a projective nonfree lattice; it cannot require a global A-basis.

#### 56. Approximation of the regulator lattice

Under the integrality of e_0,...,e_(n-1), every nonzero element x of [Lie_Etilde(Otilde_L):U_rat]_Atilde admits x=z^a(alpha+z^n beta), a in Z, alpha in B A not z-divisible and beta in B T_z(K_infinity). Expand each column with z^k, not z^j, and retain determinant cancellations below the first nonzero coefficient.

Source: Proposition 4.5, pp. 15–16; corrected E5. Classification: missing.

Acceptance: A one-column constant vector must survive truncation; replacing z^k by z^j fails this test.

#### 57. Exhausting sequence clearing exponential denominators

Choose nonzero xi_n in O_L such that xi_n divides xi_(n+1), every nonzero prime contains some xi_n, and the first n coefficients of xi_n^(-1) exp_E xi_n are integral. Use finite prime sets in bounded residue degree and denominators of finitely many e_i.

Source: Theorem 4.3 proof Step 1, p. 17; corrected E6. Classification: missing.

API:

- `AndersonAModule.denominatorSequence.nested_divisibility` (projection): xi_n divides xi_(n+1).
- `AndersonAModule.denominatorSequence.prime_exhaustion` (projection): Each nonzero prime contains some xi_n.
- `AndersonAModule.denominatorSequence.integral_coefficients` (projection): For i<n, xi_n^(q^i-1)e_i is integral.

Tests:

- `AndersonAModule.denominatorSequence.test_identity_coefficient` (degenerate): For i=0 the coefficient remains I.
- `AndersonAModule.denominatorSequence.test_nested_prime_sets` (compatibility): P containing xi_n also contains xi_(n+1).
- `AndersonAModule.denominatorSequence.test_reverse_impossible` (non-example): If xi_(n+1) divides xi_n for all n, the prime support stays within that of xi_0 and cannot exhaust all primes.

#### 58. Regulator containment with principal local factors

For admissible E with every Ztilde_P principal, [Lie_Etilde(Otilde_L):U_rat]_Atilde subset Ltilde(E). Apply item 56 to item 57's conjugates and pass to the Gauss limit in discrete A-coefficients. Uniform denominator control required for that passage is isolated as G3.

Source: Theorem 4.3 proof Step 1, p. 17. Classification: missing.

Acceptance: Check that the prime supports of xi_n are increasing and the normalized local tail converges nonzero.

#### 59. Deformed class-formula containment

For every admissible integral E, [Lie_Etilde(Otilde_L):U_rat]_Atilde subset Ltilde(E). Remove the finite exceptional set by a nonzero scalar conjugation, apply the principal case and restore exactly the deformed local factors.

Source: Theorem 4.3 and proof Step 2, pp. 14, 17–18; E7. Classification: missing.

Acceptance: A single exceptional prime is removed and then restored with its deformed, not z=1, factor.

#### 60. Euler-characteristic valuation of regulator and class factor

For any nonconstant t in A, regarding integral E as an Anderson F_q[t]-module, [Lie_E(O_L):U]_F_q[t] Fitt_F_q[t](H)=alpha_t F_q[t] for a nonzero alpha_t in F_q((1/t)) with v_infinity(alpha_t)=0; the same is [Lie_E(O_L):U_St]_F_q[t]. The generator is not asserted to lie in F_q[t].

Source: Lemma 4.6, p. 18, corrected E8; Taelman 2010 Theorem 2. Classification: missing.

Acceptance: For q=2 Carlitz, zeta_A(1) is a nonconstant infinity-adic unit, not an element of F_2[t].

#### 61. Finiteness of the affine ideal class group

For a Dedekind k-subalgebra R of an algebraic function field F/k with fraction field F and finite k, ClassGroup(R) is finite. Apply to A, after matching its affine-model structure.

Source: Theorem 4.7 proof, p. 19; pinned affine-class-number theorem. Classification: library — tauceti:TauCeti.Divisor.finite_classGroup_of_finite.

Acceptance: For the affine line over F_q, ClassGroup(F_q[t]) is the trivial finite group.

#### 62. Specialization of the regulator containment

For admissible E, evaluate polynomial-unit lifts at z=1 and use their determinant ideals to obtain [Lie_E(O_L):U_St]_A subset L(E). No evaluation homomorphism on all of F_q(z) or Ktilde_infinity is used.

Source: Equation (4.4), proof of Theorem 4.7, pp. 18–19. Classification: missing.

Acceptance: All chosen determinant entries have actual polynomial-unit lifts before evaluation; a pole at z=1 is inadmissible.

#### 63. Class-group and norm upgrade from containment to equality

In the principal-local-factor reduction of Theorem 4.7, write L(E)=uA with v_infinity(u)=0 and I=u^(-1)[Lie_E(O_L):U_St] subset A. Raise I to a principal power using finite ClassGroup(A), restrict the determinant index to F_q[t], and use the norm plus item 60 to show its principal generator has degree zero. Then I=A. Norm/restriction compatibility is an explicit input G4.

Source: Theorem 4.7 proof, p. 19. Classification: missing.

Acceptance: An integral nonzero ideal of degree zero must be A; a proper prime ideal cannot pass this test.

#### 64. Class formula for admissible Anderson A-modules

For every admissible Anderson A-module E defined over O_L in the generic-characteristic setting, [Lie_E(O_L):U_St(E/O_L)]_A=L(E/O_L). Neither freeness of O_L nor rationality of infinity nor uniformizability of E is assumed.

Source: Theorem 4.7, pp. 18–19. Classification: missing.

Acceptance: Specialize to A=F_q[t], d=1 to recover the old DM.6 formula through the explicit Stark quotient.

#### 65. Ordinary-unit form of the class formula

Under item 64's hypotheses, L(E/O_L)=[Lie_E(O_L):U(E/O_L)]_A Fitt_A(H(E/O_L)), by the Stark quotient formula and the index cocycle.

Source: Equation (2.1) combined with Theorem 4.7. Classification: missing.

Acceptance: Retain Fitt(H); setting it to A is permitted only when H=0.

#### 66. Equality in the deformed class formula

For admissible E, [Lie_Etilde(Otilde_L):U_rat]_Atilde=Ltilde(E). Remark 4.8 proposes the same argument over F_q(z); its Euler-characteristic and class-group inputs must be justified separately, not inferred from local compactness over a finite residue field.

Source: Remark 4.8, p. 19. Classification: missing.

Acceptance: The rational deformed equality specializes only through regular Tate representatives, not a total F_q(z) evaluation.

#### 67. Finite-field cyclic scalar decomposition

For F/F_q of degree m and V=F(z)^d, identify F(z) tensor_F_q(z) V with direct-sum_(j=0)^(m-1) V_j, where F acts on V_j by its q^j twist. Under psi(l tensor s)=(ls,l^q s,...,l^(q^(m-1))s), 1 tensor tau becomes the cyclic twisted shift sigma.

Source: Proof of Lemma 5.1, pp. 19–20. Classification: missing.

API:

- `FiniteField.cyclicTwistDecomposition.tensor_formula` (simp): psi(l tensor s) has jth component l^(q^j)s.
- `FiniteField.cyclicTwistDecomposition.scalar_action` (structure): F acts on the jth summand by the q^j twist.
- `FiniteField.cyclicTwistDecomposition.frobenius_conjugacy` (compatibility): psi (1 tensor tau)=sigma psi for the cyclic twisted shift.

Tests:

- `FiniteField.cyclicTwistDecomposition.test_degree_one` (degenerate): For m=1, psi is the usual scalar multiplication identification.
- `FiniteField.cyclicTwistDecomposition.test_dimension` (computation): Both sides have dimension m*d over F(z).
- `FiniteField.cyclicTwistDecomposition.test_characteristic_divides_degree` (non-example): The construction for F_4/F_2 works although m=2 is zero in F_2; no averaging by 1/m is used.

#### 68. Characteristic polynomial of a deformed semilinear operator

For r>=1 and A_i in Mat_d(F), put f=sum_(i=0)^r A_i z^i tau^i on F(z)^d, with tau fixing z, and chi(X,z)=det_F_q(z)(X I-f), a monic degree dm polynomial in X with coefficients in F_q[z].

Source: Lemma 5.1, pp. 19–20. Classification: missing.

API:

- `FiniteField.deformedCharacteristicPolynomial.monic` (structure): chi is monic of X-degree d*m.
- `FiniteField.deformedCharacteristicPolynomial.specialize_zero` (simp): chi(X,0) is the characteristic polynomial of A_0.
- `FiniteField.deformedCharacteristicPolynomial.grading_degree` (relation): Items 69–70 give the z^m grading and weighted degree bound.

Tests:

- `FiniteField.deformedCharacteristicPolynomial.test_scalar_identity` (degenerate): If all A_i for i>0 vanish and A_0=a in F_q, chi=(X-a)^(dm).
- `FiniteField.deformedCharacteristicPolynomial.test_frobenius` (computation): For d=1, f=z tau on F_(q^m), chi=X^m-z^m.
- `FiniteField.deformedCharacteristicPolynomial.test_two_copies` (computation): For m=1,d=2,f=z I_2, chi=(X-z)^2; its z-degree is 2, not 1.

#### 69. Residue-degree grading of the characteristic polynomial

Under item 68, chi(X,z) belongs to F_q[X,z^m]. In each determinant monomial the total shift is zero modulo m; this also holds when the characteristic divides m.

Source: Lemma 5.1(i), p. 20. Classification: missing.

Acceptance: For f=z tau on F_(q^m), chi=X^m-z^m, including characteristic dividing m.

#### 70. Degree drop of nonconstant deformation coefficients

Under item 68, deg_X(chi(X,z)-chi(X,0)) <= dm-m/r, with degree of zero interpreted as minus infinity. The determinant proof more precisely gives deg_X([z^s]chi)<=dm-ceil(s/r) for each s>0.

Source: Lemma 5.1(ii) and its determinant proof, p. 20. Classification: missing.

Acceptance: All 80 exact finite-field matrix cases satisfy deg_X([z^s]chi)<=dm-ceil(s/r).

#### 71. Polynomial-ring local characteristic generator

For A=F_q[t] and integral E, define x_P(t,z)=det_F_q(z)(t I-Etilde_t on F_P(z)^d). It lies in F_q[t,z], is monic in t, generates Fitt_Atilde(Etilde(F_P(z))) and specializes to the Lie and point Fitting generators at z=0,1.

Source: Theorem 5.2 proof, p. 21. Classification: missing.

API:

- `AndersonAModule.polynomialLocalGenerator.fitting` (characterisation): x_P Atilde is the point-module Fitting ideal.
- `AndersonAModule.polynomialLocalGenerator.specialize` (compatibility): At z=0 and z=1 it generates the corresponding Lie and point ideals.
- `AndersonAModule.polynomialLocalGenerator.monic_t` (structure): It is monic in t of degree d*m_P.

Tests:

- `AndersonAModule.polynomialLocalGenerator.test_carlitz_degree_one` (computation): For P=(t-a), x_P=t-a-z.
- `AndersonAModule.polynomialLocalGenerator.test_two_carlitz` (computation): For a direct sum of two Carlitz modules at that P, x_P=(t-a-z)^2.
- `AndersonAModule.polynomialLocalGenerator.test_positive_degree` (non-example): The t-degree is d*m_P, not the tau-degree r in general.

#### 72. Admissibility over a polynomial coefficient ring

If A=F_q[t], every integral Anderson A-module E is admissible. The degree-drop bound and finiteness of primes in each bounded residue degree prove convergence of its Euler product.

Source: Theorem 5.2, p. 21. Classification: missing.

Acceptance: A dimension-two direct sum of Carlitz modules is included although DM.6 alone is only Drinfeld.

#### 73. Class formula for every Anderson F_q[t]-module

For A=F_q[t] and integral E of any dimension, [Lie_E(O_L):U_St]_A=L(E)=[Lie_E(O_L):U]_A Fitt_A(H). This extends the existing DM.6 Drinfeld-only target rather than redescribing it.

Source: After Theorem 5.2, p. 21. Classification: missing.

Acceptance: For a direct sum, exponential, units and determinant ratios factor compatibly.

#### 74. Residue-degree descent of the local Fitting ideal

For finite F/F_q of degree m and any Anderson A-module E/F, there is an ideal I of A tensor_F_q F_q(z^m) such that Fitt_Atilde(Etilde(F(z)))=I Atilde. No principality is assumed here. The homogeneous-relation proof must use residue grading or Laurent localization, not the printed polynomial lower-bound condition in E10.

Source: Proposition 5.3, pp. 21–24. Classification: missing.

Acceptance: The characteristic-(t) F_4 example E_t=tau has a local ideal descending to F_2(t,z^2), while the printed R_0 generation claim fails.

#### 75. Injection on Picard groups under rational constants

The extension map Pic(A)->Pic(Atilde) is injective. The statement is about ideal classes; choosing a principal generator after extension does not yet supply good specializations at z=0 or 1.

Source: Lemma 5.4, p. 24. Classification: missing.

Acceptance: A nonprincipal ideal of A must not become principal solely by adjoining the rational constant z.

#### 76. Torsion Picard classes under rational constants

Via item 75, Pic(Atilde)_tors=Pic(A). The source's Jacobian argument is an external dependency G5: identify degree-zero divisor classes with Jacobian points, prove the required rational-function-field torsion assertion, and handle the degree d_infinity quotient.

Source: Lemma 5.4, p. 24. Classification: missing.

Acceptance: For A=F_q[t], both Picard groups in the asserted torsion comparison vanish.

#### 77. Picard injection under z to z^m

For m>=1, extension Pic(A tensor F_q(z^m))->Pic(Atilde) is injective. The norm first proves that a class in the kernel is torsion; descend that torsion class to Pic(A) and then use item 75. It does not immediately prove the ideal itself principal.

Source: Last assertion of Lemma 5.4, pp. 24–25. Classification: missing.

Acceptance: When characteristic divides m, the norm still yields the mth power of the class; do not assume separability of z/z^m.

#### 78. Valuation bound on polynomial reciprocal roots

Let F(z) in K_infinity[z], F(0)=1, deg F<r with r>=1, and v_infinity(F-1)>=C>=1 in the Gauss valuation. Factor F as product_(i=1)^r (1-alpha_i z), padding with zero alpha_i; then v_infinity(alpha_i)>=C/r, with v(0)=infinity.

Source: Lemma 5.5, p. 25. Classification: missing.

Acceptance: For F=1+a z with v(a)>=C and any r>1, its one nonzero reciprocal root has valuation at least C/r.

#### 79. Almost-everywhere principal deformed local ideals

Condition (P') for integral E is: there exists a finite set S of nonzero primes of O_L such that Fitt_Atilde(Etilde(F_P(z))) is principal for every P outside S. Neither specialization generators nor convergence are assumed.

Source: Theorem 5.6 hypothesis, p. 25. Classification: missing.

API:

- `AndersonAModule.almostPrincipalLocalFitting.exceptionalSet` (data): Export a finite set outside which local deformed Fitting ideals are principal.
- `AndersonAModule.almostPrincipalLocalFitting.enlarge` (functoriality): The witness can be enlarged by finitely many primes.
- `AndersonAModule.almostPrincipalLocalFitting.admissible` (equivalence): Theorem 5.6 turns this condition into (P) plus (C).

Tests:

- `AndersonAModule.almostPrincipalLocalFitting.test_pid_case` (compatibility): If A=F_q[t], Atilde=F_q(z)[t] is principal, so (P') holds with S empty.
- `AndersonAModule.almostPrincipalLocalFitting.test_no_specialization_yet` (non-example): A generator multiplied by z-1 still witnesses principality over Atilde but is unusable at z=1.
- `AndersonAModule.almostPrincipalLocalFitting.test_finite_bad_set` (characterisation): Changing finitely many local tests does not alter existence of a witness.

#### 80. Primitive generators with residue-degree grading

Under (P'), use items 74 and 77 to choose generators x_P(z) in A[z^m_P], primitive with respect to F_q[z] factors; remove constant-field polynomial factors before specializing. Compare their norms to the F_q[t] characteristic generators after choosing a separating t in A.

Source: Theorem 5.6 proof, pp. 25–26. Classification: missing.

API:

- `AndersonAModule.primitiveLocalGenerator.graded` (projection): x_P belongs to A[z^m_P].
- `AndersonAModule.primitiveLocalGenerator.primitive` (characterisation): It has no nonconstant F_q[z] factor; equivalently it has no zero over the algebraic closure of F_q.
- `AndersonAModule.primitiveLocalGenerator.norm` (compatibility): The normalized norm x_P(z)/x_P(0) agrees with G_P(z)/G_P(0).

Tests:

- `AndersonAModule.primitiveLocalGenerator.test_constant_rescale` (compatibility): Rescaling x_P by c in F_q^times leaves its normalized ratio unchanged.
- `AndersonAModule.primitiveLocalGenerator.test_remove_factor` (computation): The polynomial (z-1)(t-a-z) is not primitive; removing z-1 preserves its Atilde ideal.
- `AndersonAModule.primitiveLocalGenerator.test_graded_exponent` (non-example): For m_P=2 an isolated nonzero z-linear term cannot occur in x_P.

#### 81. Uniform root bound and Euler convergence from (P')

For a fixed separating t and E_t=sum_(i=0)^r A_i tau^i, r>=1, the norm characteristic polynomial G_P(z)/G_P(0) has degree at most d*r in Y=z^m_P, with reciprocal roots of valuation at least m_P*(-v_infinity(t))/r. Norm-factor comparison bounds the roots of x_P(z)/x_P(0) similarly, hence these ratios tend to 1 and their product is a Tate-algebra unit. The weaker unweighted Lemma 5.5 estimate also suffices for convergence with a dimension-dependent constant.

Source: Theorem 5.6 proof, pp. 25–26; E11. Classification: missing.

Acceptance: For two Carlitz summands and a linear prime, the normalized polynomial has degree two in z even though r=1.

#### 82. Specialization equality from ideal inclusions and degrees

For the primitive generators of item 80, base-change gives Fitt_A(E(F_P)) subset x_P(1)A and Fitt_A(Lie_E(F_P)) subset x_P(0)A. The root bound makes v_infinity(x_P(z)), v_infinity(x_P(0)), v_infinity(x_P(1)) equal; matching dimensions and deg(aA)=-d_infinity*v_infinity(a) upgrades both inclusions to equalities.

Source: End of proof of Theorem 5.6, p. 26. Classification: missing.

Acceptance: For an inclusion I subset J of nonzero ideals, equal finite quotient dimensions force I=J.

#### 83. Principality criterion for admissibility

Every integral Anderson A-module satisfying (P') is admissible. Together with the evident (P) implication, admissibility is equivalent to almost-everywhere principality of these deformed local Fitting ideals.

Source: Theorem 5.6 and Remark 4.2, pp. 14, 25–26. Classification: missing.

Acceptance: The generator (z-1)x_P witnesses (P') but is repaired before establishing (P); this distinction is tested.

#### 84. Perfect coefficient extension for motives

Put F=L^perf and O_F the integral closure of A. Each prime P of O_L has a unique prime Q of O_F above it and O_L/P -> O_F/Q is an isomorphism. Define tau(x)=x^q and sigma(x)=x^(1/q) on F; on auxiliary z-extensions these maps fix z.

Source: §6, p. 27. Classification: missing.

API:

- `AndersonMotive.perfectCoefficients.inverseFrobenius` (relation): sigma tau=tau sigma=id on F.
- `AndersonMotive.perfectCoefficients.prime_above` (characterisation): Each P has a unique Q above it in the integral closure in F.
- `AndersonMotive.perfectCoefficients.residue_iso` (compatibility): The residue inclusion O_L/P->O_F/Q is an isomorphism.

Tests:

- `AndersonMotive.perfectCoefficients.test_finite_residue` (computation): The residue field remains F_P, not its algebraic closure.
- `AndersonMotive.perfectCoefficients.test_z_fixed` (computation): The extended coefficient Frobenius and its inverse fix z.
- `AndersonMotive.perfectCoefficients.test_imperfect_base` (non-example): F_q(t) itself does not contain t^(1/q); the perfect extension is essential for sigma.

#### 85. Dual A-motive

For E/F of dimension d, take columns F{tau}^d with A acting by left E, F acting by right scalar multiplication, and sigma acting by right multiplication by tau. This gives a left (A tensor F){sigma}-module, free of rank d over F{sigma}; (a tensor1-1 tensor iota(a))^d M subset sigma M.

Source: §6.1, p. 27. Classification: missing.

API:

- `AndersonAModule.dualMotive.actions` (data): A acts on the left by E; scalars and tau act on the right to define F and sigma.
- `AndersonAModule.dualMotive.sigma_scalar` (relation): sigma*c=c^(1/q)*sigma in the left skew-module convention.
- `AndersonAModule.dualMotive.nilpotent_cokernel` (relation): (a tensor1-1 tensor iota(a))^d kills M/sigma M.

Tests:

- `AndersonAModule.dualMotive.test_skew_rank` (computation): Its rank over F{sigma} is d.
- `AndersonAModule.dualMotive.test_carlitz_rank` (compatibility): For Carlitz its rank over A tensor F is one.
- `AndersonAModule.dualMotive.test_twist_direction` (non-example): Replacing the inverse q-twist by the positive q-twist changes this left-module convention.

#### 86. A-finite Anderson module

E is A-finite if its dual A-motive is finitely generated over A tensor F; this is independent of the perfect coefficient extension. Finite generation over the commutative ring is additional to automatic rank-d freeness over the skew ring.

Source: §6.1, p. 27; Hartl–Juschka Definition 2.5.9. Classification: missing.

API:

- `AndersonAModule.IsAFinite.finiteModule` (projection): The dual motive is finitely generated over A tensor F.
- `AndersonAModule.IsAFinite.coefficient_independence` (compatibility): The property is invariant under the allowed perfect coefficient extensions.
- `AndersonAModule.IsAFinite.projective` (relation): The dual motive is projective by item 87's external motive input.

Tests:

- `AndersonAModule.IsAFinite.test_carlitz` (computation): Carlitz is A-finite.
- `AndersonAModule.IsAFinite.test_finite_direct_sum` (compatibility): A direct sum of two A-finite modules is A-finite because its dual motive is the finite direct sum.
- `AndersonAModule.IsAFinite.test_wrong_ring` (non-example): Automatic finite freeness over F{sigma} alone is not the A-finite condition.

#### 87. Projectivity and almost-all reduction of an A-finite motive

For A-finite E, its dual motive is projective over A tensor F. Outside finitely many primes of O_L, its reduction is A-finite. Keep projectivity and good reduction as separately verified external inputs G6, rather than conclusions of a name.

Source: §6.1, p. 27; Goss Lemma 5.4.10. Classification: missing.

Acceptance: State explicitly that finitely many bad primes remain allowed; neither freeness nor all-prime good reduction follows.

#### 88. A-finite Frobenius characteristic polynomial

At an A-finite reduction E/F_P, put V=M(E/F_P) tensor_A K and let sigma be induced by right multiplication by tau. It is K-linear; define P_P(X)=det_K(X I-sigma), which belongs to A[X]. The K-dimension includes the residue-field extension, not merely the motive rank over A tensor F_P.

Source: Theorem 6.1 proof, p. 27. Classification: missing.

API:

- `AndersonAModule.localDualCharacteristicPolynomial.definition` (constructor): Take the K-linear characteristic polynomial of right tau on the rational dual motive.
- `AndersonAModule.localDualCharacteristicPolynomial.integral` (structure): Its coefficients lie in A because the operator preserves the finite projective A-lattice.
- `AndersonAModule.localDualCharacteristicPolynomial.fitting_evaluation` (relation): Its value at z generates the local Fitting ideal as in item 89.

Tests:

- `AndersonAModule.localDualCharacteristicPolynomial.test_direct_sum` (compatibility): A direct sum multiplies the two characteristic polynomials.
- `AndersonAModule.localDualCharacteristicPolynomial.test_carlitz_linear` (computation): At P=(t-a), the polynomial is X-(t-a); evaluation at z differs from t-a-z only by a unit.
- `AndersonAModule.localDualCharacteristicPolynomial.test_residue_dimension` (non-example): The K-dimension includes m_P; it is not automatically the A tensor F_P rank.

#### 89. Dual-motive cokernel computes the local Fitting ideal

At an A-finite reduction, after the appropriate z-scalar extension, right multiplication by tau-z gives an injective Atilde-linear map of the projective dual-motive module with cokernel Etilde(F_P(z)). Therefore Fitt_Atilde(Etilde(F_P(z)))=P_P(z)Atilde, up to the harmless determinant sign unit.

Source: Equation (6.1), p. 27. Classification: missing.

Acceptance: For a Carlitz linear prime, P_P(z)=z-(t-a) generates the same ideal as t-a-z.

#### 90. Admissibility of A-finite Anderson modules

Every A-finite Anderson A-module defined over O_L is admissible: good reductions satisfy principal deformed local Fitting ideals by item 89 and the remaining set is finite.

Source: Theorem 6.1, p. 27. Classification: missing.

Acceptance: A-finiteness alone suffices; do not add abelianity or analytic uniformizability.

#### 91. Contravariant A-motive

For E/F, take row vectors M(E/F)=F{tau}^(1 by d), with left F{tau}-action and right A-action m.a=m E_a, regarded as commuting left actions of A tensor F and tau. It is free of rank d over F{tau}, and (a tensor1-1 tensor iota(a))^d M subset tau M.

Source: §6.2, pp. 27–28. Classification: missing.

API:

- `AndersonAModule.motive.right_action` (simp): For a row m, a acts by m E_a.
- `AndersonAModule.motive.left_frobenius` (structure): Left tau uses positive q-Frobenius on coefficients.
- `AndersonAModule.motive.polynomial_case` (compatibility): At A=F_q[t], identify this with DM.4's contravariant effective-motive convention.

Tests:

- `AndersonAModule.motive.test_skew_rank` (computation): The row motive is free of rank d over F{tau}.
- `AndersonAModule.motive.test_carlitz` (computation): For Carlitz, multiplication on a row by E_t is multiplication by theta+tau on the right.
- `AndersonAModule.motive.test_order_matters` (non-example): For matrix coefficients, replacing m E_a by E_a m is not a well-typed row action in general.

#### 92. Abelian Anderson module

E is abelian if the contravariant A-motive is finitely generated over A tensor F; the definition is independent of F. It is not the same definition as A-finiteness.

Source: §6.2, p. 28; Hartl–Juschka Definition 2.5.5. Classification: missing.

API:

- `AndersonAModule.IsAbelian.finiteModule` (projection): The contravariant motive is finite over A tensor F.
- `AndersonAModule.IsAbelian.extension` (compatibility): The property is independent of the allowed coefficient extension.
- `AndersonAModule.IsAbelian.projective` (relation): The motive is projective by item 93's external input.

Tests:

- `AndersonAModule.IsAbelian.test_carlitz` (computation): Carlitz is abelian.
- `AndersonAModule.IsAbelian.test_direct_sum` (compatibility): The direct sum of two abelian modules is abelian.
- `AndersonAModule.IsAbelian.test_distinct_finiteness` (non-example): This checks the contravariant motive, not the dual motive used by A-finiteness.

#### 93. Projectivity and almost-all abelian reduction

For abelian E the motive is projective over A tensor F, and all but finitely many reductions E/F_P are abelian. The spreading-out proof is a required external input G6.

Source: §6.2, p. 28. Classification: missing.

Acceptance: All but finitely many, rather than every, reduction is asserted abelian.

#### 94. Dedekind finite-module duality

Let k be a field, R a Dedekind k-algebra and M an R-module finite-dimensional over k. With (r.f)(m)=f(rm), Hom_k(M,k) is noncanonically isomorphic to M as an R-module. When R is a field use finite-dimensional R-linear duality; otherwise reduce to R/P^n and compare annihilator exponent and k-dimension.

Source: Lemma 6.2, p. 28. Classification: missing.

Acceptance: For R=k[t], M=R/(t^n), the dual is again one cyclic length-n module; the isomorphism is not claimed canonical.

#### 95. Trace adjoint of a deformed finite-field action

For F/F_q finite and Etilde_a=sum_(i>=0) z^i A_i tau^i on F(z)^d, equip F(z)^d with trace pairing <x,y>=Tr_F(z)/F_q(z)(x^T y). The adjoint action is Etilde_a^*=sum_(i>=0) z^i sigma^i(A_i^T) sigma^i, including i=0. In a basis with Gram matrix G its matrix is G^(-1)[Etilde_a]^T G, not necessarily the ordinary transpose in a normal basis.

Source: Theorem 6.3 proof, pp. 28–29; corrected E13–E14. Classification: missing.

API:

- `FiniteField.deformedTraceAdjoint.pairing_identity` (characterisation): <Etilde_a x,y>=<x,Etilde_a^* y> for all vectors.
- `FiniteField.deformedTraceAdjoint.coefficient` (simp): The ith term is z^i sigma^i(A_i^T) sigma^i, including the constant term.
- `FiniteField.deformedTraceAdjoint.basis_matrix` (compatibility): In a basis of Gram matrix G the adjoint is G^(-1) B^T G.

Tests:

- `FiniteField.deformedTraceAdjoint.test_scalar_constant` (computation): For multiplication by c in F, the trace adjoint is again multiplication by c.
- `FiniteField.deformedTraceAdjoint.test_frobenius` (computation): The adjoint of tau is sigma; that of z tau is z sigma.
- `FiniteField.deformedTraceAdjoint.test_normal_not_orthonormal` (non-example): In F_9=F_3(i), i^2=-1, the normal basis (1+i,1-i) has Gram matrix [[0,1],[1,0]], and multiplication by i has matrix [[0,1],[2,0]], not its transpose.

#### 96. Abelian-motive cokernel and principal local ideal

At an abelian finite-field reduction, use the skew-polynomial motive with the z-scalar convention made explicit, not the finite-dimensional point space. The tau-z presentation has cokernel the trace-adjoint action of item 95. Projectivity, the determinant-index formula and item 94 imply Fitt_Atilde(Etilde(F_P(z))) is principal. Full corrected presentation is gap G7.

Source: Theorem 6.3 proof, pp. 28–29; E12–E14. Classification: missing.

Acceptance: On the false finite point-space carrier tau-z is invertible, so it cannot supply the required nonzero cokernel.

#### 97. Admissibility of abelian Anderson modules

Every abelian Anderson A-module defined over O_L is admissible, using the principal local ideal at almost every reduction.

Source: Theorem 6.3, pp. 28–29. Classification: missing.

Acceptance: Abelianity alone suffices; no A-finite hypothesis is silently added.

#### 98. Class formula for abelian or A-finite Anderson modules

If integral E is abelian or A-finite (either hypothesis suffices), [Lie_E(O_L):U_St]_A=L(E/O_L). Equivalently this equals [Lie_E(O_L):U]_A Fitt_A(H).

Source: Theorem 6.4, p. 29. Classification: missing.

Acceptance: Test each of the two alternative hypotheses separately, and compare the overlapping Drinfeld case.

#### 99. Drinfeld modules are abelian and A-finite

Every Drinfeld A-module in the stated field setting is both abelian and A-finite; apply this to the generic fibre of an integral Drinfeld module. Proof and rank/convention dictionary are external input G6.

Source: §6.3, p. 29, citing Hartl–Juschka Corollary 2.5.17. Classification: missing.

Acceptance: Dimension one is a proved common subclass, not a definition equating abelian with A-finite.

#### 100. Class formula for arbitrary-coefficient Drinfeld modules

For any Drinfeld A-module phi defined over O_L, L(phi/O_L) is well-defined and a principal A-lattice in K_infinity, and [O_L:U_St(phi)]_A=[O_L:U(phi)]_A Fitt_A(H(phi))=L(phi/O_L). Principality is a distinct assertion requiring its local/motive justification, not a property of every Dedekind ideal.

Source: Corollary 6.5, p. 29. Classification: missing.

Acceptance: For general A the principal-lattice conclusion needs proof; finite ClassGroup(A) alone does not make each ideal principal.

#### 101. Steinitz classification of finite projectives

For a Dedekind domain R and finite projective module P of positive rank n, there is an invertible ideal I with P isomorphic to R^(n-1) direct-sum I; the ideal class is determined by det(P). Treat rank zero separately. Apply after proving that the discrete lattices are finite torsionfree and hence projective.

Source: §1.3, pp. 6–7, invoking Bourbaki VII §4 no. 6; owner KTheoryLowDegrees Z.4. Classification: planned — KTheoryLowDegrees:Z.4.

Acceptance: A nonprincipal invertible ideal is a rank-one finite projective but not free.

#### 102. Ideal class group and Picard group comparison

For a commutative domain R, there is a multiplicative equivalence ClassGroup(R) ≃ Pic(R). Transport finiteness of ClassGroup(A) through this equivalence when the source writes Pic(A).

Source: Lemma 5.4 and Theorem 4.7; pinned Picard-group comparison. Classification: library — mathlib:ClassGroup.equivPic.

Acceptance: For a nonprincipal ideal, its nontrivial class maps to the corresponding invertible-module class.

#### 103. Norm-compatible determinant restriction of scalars

For a finite flat extension of Dedekind domains R->S, with fraction fields K->L, restriction of two same-rank S-projective lattices identifies their relative determinant ratio with the norm of the S-relative determinant ratio. The determinant of S itself cancels only in the relative ratio. For finite S-torsion M, Fitt_R(M)=Norm_(S/R)(Fitt_S(M)).

Source: Theorem 4.7 proof p. 19 and Theorem 5.6 pp. 25–26; Stark units 2017 Lemma 2.10 proof; KTheoryLowDegrees Z.4. Classification: planned — KTheoryLowDegrees:Z.4.

Acceptance: Norm of a principal ideal (a) is generated by the field norm of a; the determinant of S cancels between equal-rank ratios.

