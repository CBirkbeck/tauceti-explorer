# Independent review of FiniteFieldsAndCharacterSums, FF.2

**Verdict: accepted as a complete target-level planning pass.** FF.2 remains
`planned`, with ten recorded gaps and no claim of mathematical closure or Lean
implementation. Protocol §0 explicitly allows a planned target's prerequisite
chain to end in a requested supplier stage or recorded gap. Every target here
has such a chain; the outstanding inputs are specified rather than silently
credited to existing suppliers.

Job: `REV-FiniteFieldsAndCharacterSums--FF.2`, issue #6306. Reviewer: Codex,
session `codex-fO1yqm`, 2026-10-10. The writing session was `codex-kKshfL`;
this reviewer did none of that work. Reviewed the FF.2 packet, suggested file,
reader, parent import inventory, relevant supplier statements and all six
assigned confirmed red-team findings. Only the issue's packet, suggested file,
this report and its handoff were edited.

## Counts and checks

| Item | Result |
| --- | --- |
| Nodes | 31: 19 verified, 12 corrected; none added or unverifiable |
| Node kinds | 3 definitions, 2 constructions, 4 lemmas, 17 theorems, 3 comparisons, 2 applications |
| API items | 26: 24 retained, 2 added |
| Definition/construction tests | 20, four for each of the five objects |
| Pinned baseline declarations | 16: all 14 original entries confirmed, 2 trace entries added |
| Supplier requests / recorded gaps | 19 / 10 |
| Route records / parent FF.2 imports | 30 / 88 |
| Local planets / proposed subdivisions | 6 / 5 |
| Coverage | One planned stage, zero closed stages |
| Source issues | E800 independently confirmed; none newly introduced |

`python3 scripts/check_blueprint.py
research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.2.json`:
**0 errors, 0 warnings**. `git diff --check` passed. An additional consistency
check compared every ledger signature/hypothesis against the packet and checked
all API/test names and all 31 per-node verdicts.

`lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums--FF.2.lean`
finished with exit code 0 at the pinned Mathlib/Tau Ceti build. The final check
emitted exactly **28 warnings, all for declarations using `sorry`**, and no
errors or other warnings. Available memory before that check was 103 GB.

Five node signatures, nine API signatures and eight tests are executable in the
prototype. The remaining 26 node signatures, 17 API items and 12 tests are
explicit mathematical specifications in its genuine-carrier ledger. Three
geometric definitions/constructions need actual scheme, sheaf and pullback
carriers. The functional equation additionally needs its imported parent series
carrier. No placeholder record, axiom or opaque proposition substitutes for
these objects. Elaboration checks the available signatures; it proves none of
their assertions.

## Corrections made

1. **Citation locators.** Kowalski's (4.12) is on printed pp. 44–45, while
   (4.16) and its proof run through pp. 48–49; Proposition 4.11 and its proof
   span pp. 46–49. The FKMS hyper-Kloosterman example is §4.2.4, Theorem 4.4,
   p. 12, rather than §4.3.3. Corrected all three affected node citations and
   the packet's source-reading metadata. Original source hashes were retained:
   independently downloaded public files matched all twelve.
2. **Current library reuse.** The current Tau Ceti Place displacement theorem
   already proves the function-field Artin–Schreier uniformizer calculation.
   Its completion compatibility and geometric conductor interpretation remain
   the new work. The existing primitive Dirichlet Gauss product covers ZMod n;
   the finite-ring target extends that case. Added separate current-tree
   observations, without pretending these newer declarations exist at the
   pinned baseline or requesting their implementation again.
3. **Trace-lift prototype.** The packet's extension-model independence API
   specified a base-compatible isomorphism of finite extensions, but its Lean
   signature only transported an arbitrary additive character along a ring
   isomorphism. Replaced it with `K ≃ₐ[F] L` and actual `Algebra.trace` lifts on
   both sides. Added the checked trace definition and trace-preservation lemma
   to the baseline, prerequisites and proof sketch.
4. **Étale-algebra Gauss cohomology.** The imported parent Gauss theorem assumes
   a nontrivial multiplicative character. For a trivial factor, added the
   localization sequence for G_m inside A¹ and the parent additive-sheaf
   vanishing theorem, which give H¹_c = E with Frobenius 1. Added the finite
   étale Weil restriction, trace and character-descent contract at SF.0.
   A factor permutation acts on the fixed Gauss sheaf only if it preserves the
   character tuple. Corrected the theorem and ledger accordingly; arbitrary
   permutations compare permuted tuples with the Koszul sign.
5. **Projective dimension conventions.** The zeta-quotient assertion now assumes
   X nonempty, so its dimension parameter is a nonnegative integer. The Betti
   bound continues to cover the empty scheme.
6. **Uniform Lang–Weil hypotheses.** Made geometric integrality, positive
   dimension and the bounded homogeneous equation data explicit for projective
   fibers. Added the dimension-one normalization/genus route and its SF.3
   prerequisite; the higher-dimensional Albanese comparison is not applied to
   curves. Included this consumer in the rational-Albanese/genus gap.
7. **Boundary weights.** Added DWP.5 to the correlation theorem's direct
   prerequisites and requested its precise local bound on middle-extension
   boundary stalks. The DWP.7 compact-support bound alone did not supply that
   step. The error remains the exact Betti error plus the finite boundary term.
8. **Isotypic weights.** Replaced the unproved assertion that the multiplicity
   Hom space is pure with a proof using the compact-support bound for both
   F⊗G∨ and G⊗F∨. Geometric semisimplicity identifies the exchanged
   coinvariants with the dual. Both a root and its reciprocal have modulus at
   most one, so its modulus is one. No arithmetic diagonalizability is needed.
9. **Möbius API.** Added isomorphism-class extensionality and the rational
   intersection criterion. Rational membership asks for an isomorphism after
   geometric base change; it does not require one over F_q. Both names and
   full contracts were added to the omitted-carrier ledger.
10. **Review provenance.** Updated all baseline check dates, recorded the
    independent source checks, replaced E800's pending-review marker with its
    confirmed verdict, and added all 31 independent node verdicts.

There are no source excerpts in the packet. The `printed` field of E800 is a
short description of the challenged claim in the worker's own words.

## Baseline verification

Read the declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin remains
`f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation was removed.
The MvPolynomial entry's declaration kind was corrected from `def` to `abbrev`.

| Reference | Confirmed scope at the pin |
| --- | --- |
| `AddChar` | Additive monoid to multiplicative monoid, with zero/addition laws |
| `AddChar.IsPrimitive` | Every nonzero scalar shift on a commutative ring is nontrivial |
| `AddChar.sum_mulShift` | Finite commutative source ring; domain coefficient ring; primitive additive orthogonality |
| `MulChar` | Characters vanish on all nonunits, not only on zero |
| `MulChar.ofUnitHom` | Extends a character of units by zero |
| `gaussSum` | Finite commutative ring sum, without a field restriction |
| `gaussSum_mulShift_eq` | Scalar must be a unit; it supplies only that part of the new finite-ring theorem |
| `star_gaussSum_eq` | Conjugation inverts both characters on a finite commutative ring |
| `gaussSum_mul_gaussSum_eq_card` | Source is a field; multiplicative character nontrivial; additive character primitive |
| `AdjoinRoot` | Polynomial quotient by the principal ideal, with actual algebra maps |
| `MvPolynomial` | Finitely supported coefficient carrier, an abbreviation |
| `MvPolynomial.eval` | Evaluation ring homomorphism to the coefficient ring |
| `AdjoinRoot.modByMonicHom` | Linear map to the canonical remainder for monic g |
| `AdjoinRoot.powerBasisAux'` | Monic quotient basis indexed by Fin g.natDegree; squarefreeness unnecessary |
| `Algebra.trace` (added) | Linear trace of multiplication in a commutative algebra |
| `Algebra.trace_eq_of_algEquiv` (added) | A base-algebra equivalence preserves that trace; no finiteness hypothesis required by the lemma |

The module paths are recorded in `baseline.declarations`. Finite-field norms
were not used as finite-ring theorems; additive and multiplicative primitivity
were kept distinct. The actual monic quotient maps suffice for nonreduced
quotients.

## Current upstream and library screen

Read the current upstream **JacobianChallenge** and **AlgebraicCodingTheory**
README documents in full. Also checked the relevant **AlgebraicCurves** and
**LocalFieldsRamification** interfaces. JacobianChallenge treats the regular,
pointed Albanese; it does not construct the rational-map Albanese of a singular
projective variety. The arbitrary-residue Place/completion bridge in
AlgebraicCurves is relevant, while finite-residue upper numbering alone does not
supply the geometric conductor contract.

Screened all nine roadmaps newer than the atlas snapshot:
AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry. Read their relevant suggested
signatures, using the README for OperatorTheory, which has no Suggested.lean.
Also screened all four Completed suggested files: ContourIntegration,
EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. The finite quadratic
Gauss sums, projective-module Swan theory and quadratic étale algebra hits have
different carriers and hypotheses; none supplies the new targets here.

At current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read:

- [Artin–Schreier displacement](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/FieldTheory/FunctionField/Place/Extension/ArtinSchreier/Displacement.lean),
  `TauCeti.Place.exists_uniformizer_ord_aut_sub_of_artinSchreier_pole`.
  It supplies order 1−ord(u) for the displacement of a uniformizer in a
  generated integral function-field extension. Generic perfect-residue Laurent
  series and geometric ℓ-adic conductors still need the requested interfaces.
- [Primitive Dirichlet Gauss product](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean),
  `DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`.
  Its source ring is ZMod n. The general finite-ring theorem must specialize
  to it, rather than replan it.

The current Mathlib source commit screened was
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Current observations are separated
from the pinned baseline in `currentLibraryChecks`. The reviewed library audit
records no built FF.2 layer; existing FF.1 character/Gauss results remain
imports. No upstream document or source tree was modified or built.

## Sources and independent reading boundary

All readings used the following public versions, independently acquired on
2026-10-10 and checked against the packet's SHA-256 values. Page numbers below
are printed pages unless identified as manuscript/arXiv pages. No cleared
restricted source was needed.

- [Exponential sums over finite fields: elementary methods](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf) — Chapter 4, primitive characters and Proposition 4.8; Proposition 4.11 and (4.12)/(4.16), pp. 41–49. Checked the corrected coefficient pairing and all nonunit terms independently.
- [Cohomologie etale (SGA 4 1/2), expose 'Application de la formule des traces aux sommes trigonometriques' [Sommes trig.]](https://publications.ias.edu/sites/default/files/Number32.pdf) — §3.2(3.2.1), p. 189; §3.5(3.5.4), p. 191; §§4.3–4.4, 4.6–4.8, 4.11–4.12, pp. 196–202; §§7.1–7.14, pp. 218–225. The IAS scan has 351 PDF pages; PDF page = printed volume page +39 in this exposition.
- [La conjecture de Weil. I](https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf) — §§8.4–8.13, pp. 302–306; compactification/local models, relative family and Fermat reduction.
- [La conjecture de Weil. II](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf) — §§1.8.10–1.8.13, pp. 177–178, and §§3.7.2–3.7.4, pp. 215–216; family weight constancy and local acyclicity/lissity.
- [Lectures on Applied l-adic Cohomology](https://arxiv.org/pdf/1712.03173v3) — arXiv v3: §4.2.4/Theorem 4.4, p. 12; §5, pp. 13–14; Definition 7.1, Proposition 7.2 and Examples 7.3, pp. 19–20. The normalization/sign dictionary was checked against Sommes trig.
- [Transformation de Fourier, constantes d'equations fonctionnelles et conjecture de Weil](https://www.numdam.org/item/PMIHES_1987__65__131_0.pdf) — §1.2, pp. 140–141, and the local-transform/duality contracts of §§2.3–2.4, pp. 161–164. The complete stationary-phase proof in §2.5 is not certified by this review.
- [Etale cohomology, Lefschetz theorems and number of points of singular varieties over finite fields](https://arxiv.org/pdf/0808.2169v1) — arXiv v1: §5, p. 17; Albanese conventions and Proposition 9.4, pp. 26–29; Theorem 10.7, p. 34; Theorem 11.1/Remark 11.3, pp. 35–36; Lemma 11.7 and comparison, pp. 37–38.
- [Sums of Betti numbers in arbitrary characteristic](https://web.math.princeton.edu/~nmk/BettiSum14.pdf) — Part I, Theorems 1–3 and proofs, manuscript pp. 1–4; verified both constants A/B and the projective deduction, conditional on the explicitly requested Euler bound.
- [Sur les corps locaux à corps résiduel algébriquement clos](https://www.numdam.org/item/BSMF_1961__89__105_0.pdf) — §4.4, Lemma 4′, pp. 144–145; checked the Artin–Schreier pole/break formula and separately the perfect-residue uniformizer argument.
- [Caractéristique d’Euler–Poincaré d’un faisceau et cohomologie des variétés abéliennes](https://www.numdam.org/item/SB_1964-1966__9__129_0.pdf) — Part I, pp. 129–136, including Theorem 1 and its finite-torsion proof. Visually checked the formulas on p. 133. This does not certify the complete E_λ passage requested at the shared GOS owner.
- [A simple proof of Chebotarev’s density theorem over finite fields](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/72DECC8EB5E120B1218B4A3AC4129C62/S0004972718000448a.pdf/a-simple-proof-of-chebotarevs-density-theorem-over-finite-fields.pdf) — The full seven-page publisher article, pp. 196–202; component twisting/counting and Appendix A, Proposition A.2, p. 201.
- [On the degree of the L-function associated with an exponential sum](https://www.numdam.org/item/CM_1988__68_2_125_0.pdf) — Introduction and §§5.22–5.27, pp. 149–151; visually checked Theorems 5.26–5.27 on p. 150. The complete p-adic proof and its ℓ-adic Euler comparison remain at the explicit-euler-degree supplier gap.

The complete source proofs underlying the explicit Euler bound, geometric
E_λ GOS and local stationary phase remain outstanding at their named suppliers.
The review verifies the exact requested contracts and the deductions from them;
it does not relabel those missing proofs as established. The source hashes
pin versions rather than certify every page of a book or paper.

**E800 confirmed.** In Meagher Appendix A, Proposition A.2, p. 201, all sections
of a very ample bundle on a quasi-projective scheme need not form a
finite-dimensional representation: A¹ with its trivial bundle has k[t] as its
section space. A chosen finite generating/separating linear system and the
finite span of its G-orbits provide the finite representation required by the
embedding/descent argument. This repairs the proof step; it does not contradict
the Chebotarev conclusion. Rechecked the
[publisher article page](https://www.cambridge.org/core/journals/bulletin-of-the-australian-mathematical-society/article/simple-proof-of-chebotarevs-density-theorem-over-finite-fields/72DECC8EB5E120B1218B4A3AC4129C62)
and bounded title/author/erratum searches on 2026-10-10. No public correction was
located; no novelty claim is made. The parent E709/E720/E721/E723 entries remain
imports, without duplicate source issues.

## Per-node verification

Ids below use the prefix `FiniteFieldsAndCharacterSums:FF.2/`. Each corresponding
full id and verdict is also in the packet's `review.checked` list.

| Node | Verdict | Independent check / correction |
| --- | --- | --- |
| `primitive-multiplicative-ring-character` | verified | The top ideal forces nontriviality; finite-ring unit reduction is surjective, so the quotient formulation has exactly the claimed scope. The product and ZMod 4 tests distinguish multiplicative from additive primitivity. |
| `primitive-finite-ring-gauss-norm` | corrected | Corrected (4.12)/(4.16) page ranges. The annihilator-unit substitution proves nonunit Fourier vanishing, and Parseval proves the norm without reducedness. Current Tau Ceti already covers ZMod n; record this specialization as an import. |
| `polynomial-quotient-frobenius-pairing` | verified | The coefficient pairing uses actual monic remainders and an anti-triangular matrix with unit anti-diagonal. Its degree filtration annihilator has the stated dimension. The parent E720 correction prevents treating reversed raw coefficients as the dual basis. |
| `primitive-modulus-functional-equation` | corrected | Extended the citation through the proof on pp. 48–49. All lower-degree representatives cancel under the nontrivial constant character; the Gauss factors and q powers give the displayed Laurent identity for repeated-factor moduli. |
| `geometric-artin-schreier-break` | corrected | The prime-to-p pole calculation gives displacement m+1 and the single lower/upper break m. Reuse the current Place displacement theorem; only Laurent-series completion compatibility and the geometric conductor extension remain new. Perfect residues are a stated extension beyond Serre’s algebraically closed case. |
| `universal-smooth-leading-polynomial-family` | verified | The parameter space is the actual open smooth-leading coefficient scheme. Its nonempty Fermat locus gives geometric integrality; the one-variable empty projective zero locus and p∤d guard are treated correctly. |
| `polynomial-boundary-local-models` | verified | Weil I 8.7–8.8 gives the two normalized local models. The smooth leading divisor allows the second transverse coordinate; its locus is empty for n=1. Relative normalization and étale compatibility are requested explicitly. |
| `relative-artin-schreier-compactification` | verified | The compactification is restricted to the surface-product Artin–Schreier models. The SF.4 contract records resolution termination, equivariance and relative normal crossings; no arbitrary positive-characteristic resolution is asserted. |
| `polynomial-family-local-acyclicity` | verified | Weil II 3.7.3 applies local acyclicity to j!L on the projective compactification via constant product neighborhoods. The general coefficient-base LPV.0 extension is recorded instead of inferred from its trait statement. |
| `polynomial-family-lissity` | verified | Proper pushforward of the locally acyclic j!L gives lissity and base change for the nonproper affine family. Constant ranks alone are not used to infer lissity. |
| `polynomial-family-cohomology` | verified | Fermat Künneth, the rank-one break and GOS give concentration and rank (d−1)^n; mixed direct images and Weil II 1.8.12 transport purity through the connected family. Each complex embedding is accounted for, and d=1 gives rank zero. |
| `polynomial-boundary-clean-duality` | verified | The historical relative compactification makes both support conventions locally constant; the clean Fermat fiber transports the perfect pairing. The proof does not assert vanishing on every exceptional boundary divisor. |
| `hyper-kloosterman-sum` | corrected | Corrected FKMS to §4.2.4/Theorem 4.4, p. 12. Positive-rank zero fibers and the geometric trace sign agree with Sommes trig. §7. Replaced the ring-isomorphism prototype by the stated base-algebra-equivalence trace-lift API, using two independently checked Mathlib trace imports. |
| `etale-algebra-gauss-cohomology` | corrected | Added the missing trivial-character factor proof by localization and additive-sheaf vanishing. Added the Weil restriction supplier contract. Restricted scalar permutation actions to permutations preserving the character tuple, as required in Sommes trig. 4.12. |
| `hyper-kloosterman-sheaf` | corrected | Corrected the FKMS locator. The sheaf is genuinely R^(k−1)π!L, with rank and extension properties proved by the subsequent simultaneous induction. Its zero stalk and extension at infinity agree with Theorem 7.8; it is not j! across zero. |
| `hyper-kloosterman-fiber-cohomology` | verified | The singular zero fiber is handled by the coordinate-hyperplane calculation; the nonzero fiber uses smooth duality and the simultaneous GOS/monodromy induction of §§7.13–7.14. Clean comparison gives purity of weight k−1. |
| `hyper-kloosterman-local-monodromy` | verified | Theorem 7.8 and §§7.9–7.12 supply lissity, one tame Jordan block at zero and Swan one with no wild invariants at infinity. The SF.2 specialization request is needed beyond equality of fiber ranks. |
| `hyper-kloosterman-bound` | corrected | Corrected the FKMS locator. Rank k, weight k−1 and the signed trace yield the bound on unit fibers; a=0 retains its separate exact value. The prototype includes positive rank, nontrivial character and nonzero parameter guards. |
| `smooth-affine-betti-bound` | verified | Katz Theorem 2 gives the stated A constant from the exact Euler bound and affine hyperplane induction. The curve and zero-dimensional starts are sound. Both quantitative Euler and affine Lefschetz inputs remain explicit supplier gaps. |
| `arbitrary-affine-betti-bound` | verified | Complement Mayer–Vietoris and the smooth hypersurfaces z∏f_j=1 give the stated B constant. The same argument supplies N=1 despite the theorem header’s N>1; singularities and nilpotents cause no additional assumption. |
| `explicit-projective-betti-bound` | corrected | Added nonemptiness for the zeta quotient’s dimension parameter. The projective stratification gives 1+ΣB; the displayed geometric-series estimate yields the 8 constant. Cancellation of a top Tate root in the nonempty case gives τ≤β+n and the 9 constant. |
| `albanese-linear-section-bound` | verified | Generic curve sections and their normalizations surject onto the rational-map Albanese. The singular-curve genus bound is requested separately. The current JacobianChallenge regular Albanese does not supply this singular rational-map construction. |
| `bombieri-sperber-albanese-expansion` | verified | Lemma 11.7 gives the all-extension fixed-X expansion with the Albanese Frobenius convention stated. Resolution and bounded bad-pencil loci remain requests; this node does not claim uniformity over arbitrary X. |
| `top-weight-albanese-comparison` | verified | The top odd-weight spectra follow from the all-extension power sums and the abelian weight-one roots. The Frobenius inversion/twist conventions agree with Theorem 10.7; the statement deliberately claims spectra rather than an unsupported canonical representation isomorphism. |
| `uniform-lang-weil-family` | corrected | Added explicit geometric integrality, positive dimension and bounded homogeneous equations to the projective assertion. Added the dimension-one normalization/genus route and its SF.3 dependency; dimensions at least two use the Albanese chain. Quantitative projective closure remains a recorded gap. |
| `constant-coset-twist-count` | verified | For g in the arithmetic Frobenius coset, g⁻¹Frob^r fixes each geometric component. Counting every component twist and dividing by the centralizer gives the exact fiber count; individual component counts are not assumed equal. |
| `constant-field-coset-chebotarev` | verified | Componentwise Lang–Weil gives density \|C∩Γ_r\|/\|H\|, including empty cosets, and uniformity requires bounded cover/action/boundary data. Confirmed the Appendix A proof repair independently; the finite equivariant linear-system descent is an explicit request. |
| `trace-correlation-main-term` | corrected | Added DWP.5 as the direct supplier of local weights on boundary stalks. Dual traces on U, H²_c=W(−1) and DWP.7 give the full main term and exact Betti error. The finite middle-extension correction keeps the invariant contribution. |
| `isotypic-quasi-orthogonality` | corrected | Replaced an unsupported purity assertion for the multiplicity Hom space by two DWP.7 bounds, applied also with F and G exchanged. Geometric semisimplicity identifies the exchanged space with W∨, forcing modulus one. Arithmetic Jordan blocks are allowed. |
| `geometric-mobius-stabilizer` | corrected | Added isomorphism-class extensionality and rational-intersection API items. Pullback composition gives a subgroup and the correct conjugation order; the four tests separate geometric from arithmetic isomorphism and detect singular-locus errors. |
| `mobius-autocorrelation-bound` | verified | Geometric irreducibility and stabilizer nonmembership annihilate the Hom coinvariants. The correlation theorem supplies cancellation on the common lisse affine domain; conductor/boundary terms are retained. The identity is an essential noncancellation control. |

## Assigned red-team findings

Read each finding and its independent confirmation, then checked both packet
and reader treatment. Their mathematical content is retained; historical queue
or paper-route gates that this issue cannot edit remain maintainer actions.

| Finding | Review result |
| --- | --- |
| `RT-AREA-finitefields/3` | One shared geometric GOS request remains at the EDC direction. The rank-one Artin–Schreier calculation is distinct from general conductor foundations and now reuses the current displacement theorem. Finite-residue upper numbering is not silently applied over k̄. |
| `RT-AREA-finitefields/4` | The several-variable endpoint has the actual universal scheme, local models, local acyclicity/lissity, relative concentration and clean-duality routes. Both historical resolution and modern local-acyclicity inputs have exact supplier requests. |
| `RT-AREA-finitefields/5` | The inherited multiplicative degeneracy uses geometric c·g^ord(χ), including non-ground constants. The cubic-character X² control is retained; the endpoint is not weakened to “some perfect power.” |
| `RT-AREA-finitefields/10` | EXT-08 integration/queue reconciliation is recorded in upstreamNotes and not falsely marked completed by this review. No queue or data file was edited. |
| `RT-AREA-etale/7` | HW-16 bounded-family uniformity and the nontrivial-constant-field BN-23/HW-16 Chebotarev variant are explicit targets. The exact component sum gives the \|H\| denominator. Bounded closure/twist presentations remain gaps; rejected paper routes require their own maintainer reconciliation. |
| `RT-AREA-etale/14` | Parent global Fourier and Artin–Schreier owners are imported once. Local kernels, nearby/vanishing cycles, stationary-phase comparison, shifts/inversion/twists and Abe's broader coefficient scope are requested at the existing suppliers. The proposed GeneralBasesFourier Part II is not treated as an existing registered stage. |

## Reader synchronization and assembly instructions

The reader is read-only for #6306. Its statements are close to the corrected
packet, but the following precise changes must be applied when assembly is
authorized. No next worker needs this run's disposable scratch files.

1. In the finite-ring and functional-equation sections, extend the Kowalski
   page ranges to (4.12), pp. 44–45, and (4.16), pp. 48–49; Proposition 4.11,
   pp. 46–49. In all hyper-Kloosterman sections and the source list, use FKMS
   §4.2.4/Theorem 4.4, p. 12.
2. In the geometric-break section and its gap/target accounting, cite the
   current Place displacement import, retain the perfect-residue Laurent-series
   calculation, and name completion/conductor compatibility as the additional
   work. In the finite-ring section note the existing ZMod primitive product.
3. Replace the hyper-Kloosterman extension API text by the packet's exact
   base-algebra-equivalence/trace-lift statement; mention the two baseline trace
   declarations in the baseline list.
4. In the étale-algebra cohomology section, use the corrected guarded symmetry
   statement, add the trivial-factor localization proof, and add the direct
   additive-sheaf-vanishing and SF.0 dependencies. Add Weil restriction,
   splitting, trace and character descent to the SF.0 request.
5. In the projective Betti/zeta section require nonempty X for τ and retain the
   empty-scheme Betti case. In uniform Lang–Weil make the projective hypotheses
   explicit and add the curve normalization/genus route, SF.3 prerequisite and
   gap consumer.
6. In trace correlation, add DWP.5 to direct dependencies and its local
   boundary-weight contract. In isotypic quasi-orthogonality use the dual-space
   weight argument from the packet, preserving arithmetic Jordan blocks.
7. Add the stabilizer `.iso` and `.rational` API contracts exactly as in the
   packet and ledger. The API total becomes 26.
8. In the source-correction paragraph replace the pending independent
   verification statement for E800 with its confirmed verdict dated
   2026-10-10, keeping the limited-search/no-novelty qualification.

Retain all ten remaining obligations: geometric GOS registration/E_λ passage;
geometric conductors/completions; relative surface-product resolution;
general-base local acyclicity/family weights; affine weak Lefschetz; explicit
p-adic Euler bound/comparison; rational Albanese/singular genus; quantitative
pencil/closure/twist presentations; local/global Fourier with coefficient
change; actual prototype carriers. Requests extend existing owners rather than
creating duplicate global character-sheaf or Fourier constructions.

The parent and this part each mark six local planets. Assembly must use the
recorded combined six-candidate selection, not promote their twelve flags onto
one layer. Stage restructuring and supplier Part II registration remain with
the orchestrator. None of these actions is a prerequisite to accepting this
honest planned pass; they are prerequisites to its later closure/package.
