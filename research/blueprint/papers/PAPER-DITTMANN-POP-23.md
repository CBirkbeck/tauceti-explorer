# PAPER-DITTMANN-POP-23: extraction and routing

Issue [#1099](https://github.com/CBirkbeck/tauceti-explorer/issues/1099). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged partial checkpoints of Codex sessions codex-a71f92, codex-c83e7a and codex-hjdg0j (latest [#1935](https://github.com/CBirkbeck/tauceti-explorer/pull/1935)), whose material follows below.
- **The paper.** Philip Dittmann and Florian Pop, *Characterizing finitely generated fields by a single field axiom*, Annals of Mathematics 198 (2023), 1203–1227 (doi 10.4007/annals.2023.198.3.4; arXiv 2012.01307v2, the authors' final version).
- **Items.** The result has **154 items: 29 library, 7 planned and 118 missing**.
  - The checkpoint's 152 item ids are kept; niceness-definability and function-field-fundamental-equality are new.
  - Seven routes own the missing items, each exactly once.
- **Mistakes.** Seventeen are recorded under `sourceIssues`: E1–E4 and E6–E18. E5 was withdrawn earlier and is not reused.

## Independent review (Codex, codex-7e92bd, 23 September 2026)

**Accepted after corrections.** The current extraction has 154 items: 29 library, 7 planned and 118 missing, each missing item routed exactly once. All seven routes are accepted. See [the independent report](../reviews/REV-PAPER-DITTMANN-POP-23.md) for the item/status audit, exact fixes, source versions and checks.

The function-field fundamental equality is imported from upstream AlgebraicCurves Layer 6. The niceness formula now has a characteristic-zero dyadic guard and an explicit derivative Hensel criterion which works in characteristic two. The odd-degree alteration has the precise ILO base-extension contract, and cohomology injectivity includes the purely inseparable part. Existing finite-generation, relative algebraic closure and prime-localization carriers are explicitly credited.

Sixteen source findings are independently confirmed at the stated author-version locators; E18 is rejected as a new error because Remark 4.4 supplies the low-dimensional inputs. Its useful low-dimensional planning item is retained. E8 belongs to the cited Kuhlmann–Novacoski paper, not Dittmann–Pop. Typeset Annals collation remains unavailable. Earlier narrative below records the extraction history; the review objects and corrected items give the current verdicts.

## This continuation (cc-442dc5)

**What was read.**
- The arXiv v2 TeX source was read in full, with the v2 PDF (the checkpoint's copy, same SHA-256).
- AKNS was read at §2.9, Proposition 2.28, Examples 2.9 and Lemma 2.17, to settle E7.
- Crossref was checked for the paper, which has no correction relation, and for the three references of E12–E14.

**The checkpoint's findings.** All of E1–E4 and E6–E14 were rechecked against the source.
- E6 now states the corrected cohomological-dimension bound in full: cd₂(E′k′_{v′}) ≤ cd₂(k′_{v′}) + trdeg ≤ dim(E′) + 1 at non-real places.
- E7 now quotes what AKNS Proposition 2.28 needs: a finitely generated structure in a finite language.
- E8 now says that it concerns the cited Kuhlmann–Novacoski paper, not Dittmann–Pop's text.

**Four new findings.**
- **E15 (misprint), Claim 3 of Proposition 3.10.** The form over F must be q_ε: a_d need not lie in F.
- **E16 (misprint), p. 14.** D_{K|k_a} is written twice for D_{K|k_t}.
- **E17 (gap), Recipe 4.3(1).** The recipe needs the admissible test data to form a first-order family. The paper never says why k₁-niceness is first-order, although it quantifies over all places of k₁. The repair, recorded in the new item niceness-definability, has three parts:
  - the finite places of k₁ are uniformly definable (Rumely);
  - local isotropy is a Hensel-type condition in O_v;
  - the real places are handled through the Positivstellensatz with sums of four squares.
- **E18 (gap), §5.** §5 proves bi-interpretability only under (H_d), d ≥ 3, while Theorem 1.2 also covers dimensions one and two. The same normalization argument works there, with Rumely's O_K or Remark 4.4 in place of Theorem 1.3 (low-dimensional-biinterpretability).

**A new supplier item: the fundamental equality without separability.** The proof of Lemma 3.6 uses Chevalley's fundamental equality for the purely inseparable extension K|K_s.
- Tau Ceti has the identity only for separable extensions (`TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`, `Fundamental.lean:77`). Its docstring says that the general form waits on a separability-free finiteness of normalization.
- Independent review correction: upstream AlgebraicCurves Layer 6 already owns the full fundamental equality, supported by Layer 2 normalization. The item is planned there and removed from the A0-extension source route.

**Spacing.** Stripped spaces in the checkpoint's strings ("Proposition5.1", "On2026-09-23") are restored. Session ids, API names and citation keys are left as they were.

**Why the status is now complete.**
- Every numbered statement of the paper and every theorem cited in its proofs is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The checkpoint's gaps G1–G7 are closed, deferred or marked unavailable in the result:
  - closed: G3, G4 and G6. The false bound and the low-dimensional case are recorded as E6 and E18, with repairs, and the three corrections named in G6 were checked.
  - deferred: G1, G2 and G5. G1 and G2 ask for the proofs of cited suppliers (Jannsen, Kerz–Saito, Suwa, Gabber/ILO, Cossart–Piltant); an extraction states those theorems as items and lists their sources as prerequisites. G5 is implementation work for the routes.
  - unavailable: G7. The typeset Annals text is paywalled, and arXiv v2 is the authors' final version.

## Main results and source scope

Dittmann and Pop characterize every finitely generated field, among finitely generated **fields**, by one parameter-free sentence in the ring language. Every **infinite** such field is parametrically bi-interpretable with Z. Both statements assume resolution of singularities above F₂ only when the characteristic is two and the Kronecker dimension exceeds three. Characteristic two in dimension three is unconditional; finite fields use a cardinality sentence instead of bi-interpretability with an infinite structure.

For each fixed d≥3, Theorem 1.3 uniformly defines geometric prime-divisor valuation rings: every parameter fibre is such a ring or empty. It asserts neither a single formula uniform in all dimensions nor parameter-free definability of each individual valuation ring.

The source is the [final author version, arXiv 2012.01307v2](https://arxiv.org/pdf/2012.01307v2), 27 April 2023, 19 pages, SHA256 f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f. All 19 pages, including every proof and the references, were freshly reread. The [publisher metadata](https://annals.math.princeton.edu/2023/198-3/p04) agrees on title, authors, Annals 198 (2023), 1203–1227 and DOI 10.4007/annals.2023.198.3.4. The public publisher-PDF guess again returned 404; the article page and author lists did not yield the 25-page typeset text. Publisher-format collation remains G7. Older selected-source reads below retain their original attribution and are not claimed as freshly repeated.

## The direct valuation-dimension argument

Write valuations additively on nonzero elements and use their **actual** ordered value groups. The library uses multiplicative valuations, where the largest value dominates. The initial valuation need not have rank one, be discrete or be henselian.

First restrict to the prime field. If the residue field has the same characteristic as the original field, this restriction is trivial. In characteristic p, nonzero prime-field elements form a finite multiplicative group and ordered groups have no torsion. In characteristic zero with characteristic-zero residue, every nonzero integer has nonzero residue and is a valuation unit. In mixed characteristic (0,p), the reduction kernel on Z is pZ, giving v(q)=ord_p(q)·v(p) for every nonzero rational q, with v(p)>0.

Suppose v is trivial on a subfield k. Lift a finite tuple of residue elements algebraically independent over k to units x. Every nonzero polynomial P(x) over k has nonzero residue, hence value zero. Thus k(x) lies in the valuation ring and reduces isomorphically to k(x̄). If t has positive value, a nonzero polynomial sum P_j(x)t^j has distinct summand values jv(t). Its unique least-valued term survives, so (x,t) is algebraically independent.

This proves dimension drop in equal characteristic: every residue-independent tuple can be enlarged by one element upstairs, so trdeg(Fv)+1≤trdeg(F). In mixed characteristic lift a residue-independent tuple over Fp. Scale any nonzero polynomial over Q by a power of p so all its coefficients are p-integral and one is a unit. Its nonzero reduction cannot vanish at the tuple, proving that the lifts are Q-algebraically independent. Thus trdeg_Fp(Fv)≤trdeg_Q(F), and the extra 1 in the characteristic-zero Kronecker dimension gives strict drop. This argument works for **any field of finite Kronecker dimension**, without finite generation. It supplies the exact input of Proposition 3.2(3), without needing the full Abhyankar inequality.

For the stronger discreteness criterion assume K is finitely generated and dim_Kr(Kv)=dim_Kr(K)−1. The valuation is nontrivial, because a trivial valuation has residue K. There are two cases.

- **Geometric case:** Lift a residue transcendence basis x̄ over the prime field k and choose t of positive value. Then (x,t) is a transcendence basis of K/k, and K is finite over F0=k(x,t). The restriction is t-adic: its group is Z·v(t) and its residue field is k(x̄). Equivalently K is a one-variable function field over k(x), and its proper valuation ring contains that base. Tau Ceti's existing one-variable DVR theorem applies, with no perfectness, exact-constant-field or separability assumption.
- **Arithmetic case:** If char K=0 and char Kv=p, the dimension equality is trdeg_Fp(Kv)=trdeg_Q(K). Lift a residue transcendence basis x̄. Scaling coefficients gives v(P(x))=min ord_p(P_a)·v(p) for any nonzero polynomial over Q, with the minimum over nonzero coefficients. Hence F0=Q(x) has group Z·v(p), residue field Fp(x̄), and K/F0 is finite. For fractions subtract the two Gauss values; a normalized value-zero fraction reduces to the ratio of its nonzero reduced polynomials. This proves equality of the residue field, not only containment.

## Finite extensions without assuming discreteness

Let E/F be finite of degree N, with one valuation on E and its restriction on F. Choose u_i whose values occupy distinct cosets of Γ_E/Γ_F, and units y_j whose residues are independent over κ_F. The products u_i y_j are F-linearly independent.

In a proposed relation collect each block A_i=sum_j a_ij y_j. For a nonzero coefficient block choose a coefficient of least valuation and divide by it. The resulting coefficients are integral and one has nonzero residue. Residue independence makes the reduced combination nonzero, so A_i is nonzero and its value belongs to Γ_F. The nonzero terms u_i A_i occupy distinct value cosets; their uniquely least-valued term cannot cancel.

Taking one residue vector bounds every finite set of value cosets by N; taking one coset bounds all finite residue-independent sets by N. Thus e=[Γ_E:Γ_F] and f=[κ_E:κ_F] are finite, and taking all cosets and a residue basis gives **ef≤N**. This needs neither separability nor henselianity and allows arbitrary ordered value groups. The built Tau Ceti place inequality assumes discrete function-field places, so using it to establish the initial arithmetic discreteness would be circular.

If Γ contains Zβ with finite index e and β>0, every γ satisfies eγ=nβ for a unique integer n. The map γ↦n is an additive order-preserving injection into Z. Its nonzero image is a subgroup of Z and hence cyclic. Mathlib's existing cyclic-value-group theorem then gives a DVR. This finishes the arithmetic case. The finite-extension inequality also makes Kv finite over the rational residue field of F0, so Kv is finitely generated.

For independently normalized valuations, restriction multiplies by e. Equality of contracted valuation rings does not imply equality of the numerical valuations.

## Boundary examples and finite checks

Finite generation is essential for discreteness. Fp(t^(1/p^∞)) has residue Fp and transcendence degree 1 but group Z[1/p], with no least positive element. Dimension drop still holds there. The rank-two lexicographic valuation of Fp(s,t), with v(s)=(1,0), v(t)=(0,1), has residue Fp and drops dimension by two; arbitrary nontrivial valuations are not automatically divisorial. Residue independence is essential too: substituting a residue a into X−a can increase the value beyond the least coefficient value.

The certificate checks F4(u)/F2(u^e), e=1,2,3,4, with t=u^e and residue basis 1,a where a²+a+1=0. It exhausts all coefficient choices of degree at most 1 in t for the 2e basis vectors u^i and a*u^i, testing within-block residue cancellation and between-block distinct values, including inseparable e=2,4. Additional checks cover finite-index ordering, dependent residues, lexicographic rank two and finite stages of the infinite tower. Infinite assertions rest on the written proofs, not enumeration.

## Library and ownership decisions

The three new exact imports are:

- [Valuation.map_sum_eq_of_lt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Basic.lean#L314), read with the distinguished support index and strict domination hypotheses.
- [IntermediateField.finiteDimensional_adjoin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean#L611), for finitely many algebraic generators, without separability.
- [Valuation.valuationSubring_isDiscreteValuationRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Discrete/Basic.lean#L449), with nontrivial cyclic actual value group; the discrete-rank-one constructor was read too.

The already-credited [one-variable DVR theorem](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/OfValuationSubring.lean#L217) was reread with its proof and binders, as was the trdeg-one function-field bridge. The general inequality remains distinct from the pinned discrete-place inequality and complete local-field extension APIs.

The two dimension items already belong to LogicAndDefinabilityInNumberTheory:LD.1's source route. Their new proof inputs remain there, sharing existing valuation carriers. The full owner README was read; reviewed coverage has no dedicated LD.0/LD.1 entries, recorded as an audit absence. Relevant AlgebraicCurves Layer 0 and LocalFieldsRamification Layer 0 targets were checked at their actual scope. Cross-paper searches found valued-field consumers but no more precise general supplier. No new roadmap is proposed.

Earlier ownership remains intact: finite normalization belongs to AlgebraicModuliForArithmeticGeometry:A0-extension; generic height-one intersection comes from the early algebraic part of AutomorphicCongruences:L4, without any automorphic dependency. Higher cohomology and wild coefficients stay with their higher-local-fields and de Rham–Witt owners. The total-inverse bridge, full-rank flags, union of balls and intersection of stabilizers retain their corrected contracts.

## The seven routes

### 1. LogicAndDefinabilityInNumberTheory (source)

LD.0 already owns interpretation and explicit semantics; LD.1 owns henselianity and residue/value sorts. Supply quotient/composition, valuation coarsening and field-patch adapters here, importing actual library carriers. No Ax–Kochen–Ershov or Denef–Pas theorem is used to assert the new global-field definability result. The direct residue-dimension proof and its general valued-field independence lemmas refine the same LD.1 source route. Complete local-field and one-variable place APIs remain imported at their actual scope; no competing valuation carrier is introduced.

Stages: LogicAndDefinabilityInNumberTheory:LD.0, LogicAndDefinabilityInNumberTheory:LD.1.

Items: biinterpretation, biinterpretation-transitivity, auxiliary-quadratic-field, quadratic-extension-formulas, residue-interpretation, fraction-interpretation, finitely-generated-field, constant-field, kronecker-dimension, prime-divisor, divisorial-discreteness, henselization, valuation-dimension-drop, patch-field-dictionary, henselian-embedding-open, coarsening-prime, coarsening-henselian-inclusion, maximal-geometric-flags, composition-definability, henselian-generator-input, interpretation, henselian-prime-orbit, henselian-crt-generator, henselian-crt-primitivity, henselian-simple-reduction, henselian-generator-neighborhood, valuation-extension-exact, equichar-zero-coefficient-field, valued-prime-field, residue-independent-unit-lifts, geometric-gauss-subfield, arithmetic-gauss-subfield, valuation-extension-ef, finite-index-cyclic-value.

### 2. HigherLocalFieldsAndHigherClassFieldTheory (source)

HL.2 already owns continuous Galois cohomology/twists and HL.6 Kato complexes and cohomological Hasse principles. Supply the exact tame/wild signatures and resolution assumptions needed here. Generic Milnor K and norm-residue comparisons remain with K2SymbolsBrauer and MotivicEtaleKTheory:M.5d; logarithmic Witt carriers remain with CrystallineCohomology:CR.4.

Stages: HigherLocalFieldsAndHigherClassFieldTheory:HL.2, HigherLocalFieldsAndHigherClassFieldTheory:HL.6.

Items: resolution-f2, kato-coefficients, kato-cohomology, cohomology-restriction, cohomology-residue, cohomology-low-degrees, constant-place-fields, lgp-global-base, kato-complex, lgp-good-model, lgp-characteristic-two, odd-degree-injectivity, nonreal-local-cd-bound.

### 3. AlgebraicModuliForArithmeticGeometry (source)

A0-extension already owns finite normalization. For this consumer import the pinned separable and purely inseparable polynomial theorems, fixed-field splitting and transfer results; assemble the arithmetic polynomial case there. General excellent-scheme normalization is not a prerequisite of this narrower proof. Add the selected-family valuation-prolongation adapter in this owner. The height-one intersection theorem imports AutomorphicCongruences:L4; only normalization and selected-family integral-closure adapters remain here.

Stages: AlgebraicModuliForArithmeticGeometry:A0-extension.

Items: valuation-prolongation-integrality, finite-normalization-generic, root-coefficient-descent.

### 4. FinitelyGeneratedFieldDefinability (part-ii)

LD.0–LD.6 cover interpretation, valued-field elimination and motivic/local arithmetic, but no layer proves uniform definability of all geometric prime divisors of finitely generated fields or their single-sentence characterization.

Design brief: Prove Dittmann–Pop Theorems 1.1–1.3 with exactly their hypotheses: for each fixed d>=3 obtain a ring formula whose fibers over every H_d field are precisely geometric prime-divisor rings or empty; prove every infinite finitely generated field parametrically bi-interpretable with Z; and give each finitely generated field one parameter-free ring sentence characterizing it among finitely generated fields. Only characteristic two in Kronecker dimension greater than three carries the stated resolution assumption. Develop nice/test presentations, auxiliary root fields, compact detecting valuations, the UNION-of-balls/intersection-of-stabilizers argument, singleton isolation, definable normalizations and full-rank arithmetic flags. Import Logic, definability, valued fields and motivic integration (LogicAndDefinabilityInNumberTheory), Higher local fields and higher class field theory (HigherLocalFieldsAndHigherClassFieldTheory), the proposed Quadratic forms and cohomological invariants, Part II (HigherPfisterForms), and finite normalization from Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry). Import the general height-one intersection theorem from the early algebraic portion of Automorphic congruences and reverse main-conjecture divisibilities (AutomorphicCongruences:L4), without depending on its later automorphic conclusions. Reuse the pinned function-field place, approximation and prescribed-pole theorems; import regular curve models from Algebraic curves — function fields, divisors, and Riemann–Roch (tauceti:TauCetiRoadmap/AlgebraicCurves). Import Chebotarev's theorem (tauceti:TauCetiRoadmap/Chebotarev) and Function-field arithmetic (FunctionFieldArithmetic) for split places. Audit the remaining off-a-finite-place number-field approximation adapter without re-planning Global number fields (tauceti:TauCetiRoadmap/GlobalNumberFields). Finish the low-dimensional inputs, AKNS coding and the finite-language total-inverse bridge. Every definition requires its API and edge-case tests; no completed Lean proof is claimed by this brief.

Items: hypothesis-hd, uniform-family, uniform-divisors, main-biinterpretability, main-single-sentence, finite-field-sentence, nice-form, nice-detection, nice-parity, global-nice-tail, separating-parameters, test-form, test-abundance, quadratic-parameters, detecting-nonnegative, detecting-domination, compact-detecting-valuation, coarsening-constant-trivial, refined-detection, relative-constant-field, anisotropy-set, stabilizer-ring, detecting-divisor-set, valuation-ball, ball-stabilizer, anisotropy-union, stabilizer-intersection, single-divisor, valuation-filter, small-dimension-inputs, dimension-definability, constant-definability, global-subfield-definability, relative-independence, normalization-ring, normalization-finite, geometric-normalization, normalization-intersection, arithmetic-flags, arithmetic-intersection, coefficient-detection, normalization-definable, normalization-uniform, field-ring-biinterpretation, domain-biinterpretability, qfa-theorem, inverse-language-bridge, global-approximation-input, etale-specialization-input, rumely-global-definitions, low-dimensional-biinterpretability.

### 5. HigherPfisterForms (part-ii)

The upstream roadmap owns characteristic-not-two forms, the Witt ring and its existing low-degree comparisons. This paper requires arbitrary Pfister length, nonsingular characteristic-two quadratic last factors and high-degree cohomological vanishing, which are additional layers, not a re-plan of the upstream roadmap.

Design brief: Construct quadratic Pfister forms in characteristic two as bilinear outer factors tensored with x²+xy+a_0y², and compare their behavior with the already planned characteristic-not-two Pfister construction. Prove all-length roundness, isotropic-if-and-only-if-hyperbolic, the Arason–Pfister dimension bound and the invariant-zero/isotropy criterion in H^n(F,Z/2(n−1)). Prove the non-dyadic henselian unit-reduction, principal-unit and independent-value criteria, finite-characteristic C-field bounds and the finite-descent real-place argument used by Dittmann–Pop Proposition 3.2. Import Quadratic forms and cohomological invariants (tauceti:TauCetiRoadmap/QuadraticFormInvariants), Higher local fields and higher class field theory (HigherLocalFieldsAndHigherClassFieldTheory), Logic, definability, valued fields and motivic integration (LogicAndDefinabilityInNumberTheory), Motivic and étale K-theory (MotivicEtaleKTheory) and Crystalline cohomology (CrystallineCohomology). Do not recreate general Milnor K, norm-residue or de Rham–Witt theory here. State separately the graded quadratic-Witt comparison, including Kato's characteristic-two theorem, which is not merely the generic Bloch–Gabber–Kato symbol map. Export the precise anisotropy interfaces consumed by the finitely generated field roadmap and test both F_2 and F_4, mixed dyadic exclusion and arbitrary-rank valuations.

Items: pfister-two, pfister-hyperbolic, pfister-invariant, pfister-invariant-zero, pfister-invariant-natural, unit-reduction-isotropy, principal-unit-isotropy, independent-values-isotropy, finite-characteristic-c-field, real-place-finite-descent, dimension-unit-isotropy, henselian-isotropy-open, pfister-roundness, arason-pfister-bound, graded-witt-invariant.

### 6. PrimeToDegreeAlterations (part-ii)

The reviewed L5 decomposition deliberately allows alteration degree divisible by the coefficient prime. Dittmann–Pop needs the Gabber odd-degree strengthening so restriction on mod-two cohomology stays injective; arbitrary de Jong alterations do not supply it.

Design brief: Extend Adic coefficients and comparison with schemes (AdicCoefficientsAndComparisons) beyond L5 with prime-to-degree control. Prove the following exact consumer of ILO Exposé X Theorem 2.4: for an excellent henselian DVR R with residue characteristic different from two and an integral projective flat R-model X, obtain a projective regular integral alteration Y→X whose function-field degree is odd, allowing the stated odd-degree extension of Frac(R) and normalization of the base. Do not assert separability. Import L5 alteration/model/boundary infrastructure, Scheme and stack foundations (SchemeAndStackFoundations) for scheme operations, and Higher local fields and higher class field theory (HigherLocalFieldsAndHigherClassFieldTheory) for restriction/corestriction and the purely inseparable etale-cohomology comparison. Retain the actual excellent one-dimensional base hypotheses. Test that an arbitrary even-degree alteration does not satisfy this interface. The general Gabber theorem and its log-modification proof remain the supplier work; this brief claims no general resolution of singularities.

Items: odd-degree-alteration.

### 7. AutomorphicCongruences (source)

The reviewed L4 audit explicitly identifies the general normal-noetherian height-one intersection/descent theorem. Supply its early pure commutative-algebra proof leaves once, using existing determinant, associated-prime and DVR APIs. DP imports this theorem before any automorphic application; it does not require a zeta morphism, L3, or the main-conjecture endpoint.

Stages: AutomorphicCongruences:L4.

Items: krull-intersection, principal-associated-height-one, associated-localization-detection.

## Gaps of the checkpoints and their resolution

- **DP23-G1** (deferred). Cited suppliers (Jannsen, Kerz–Saito, Suwa, Gabber/ILO). They are items stated as the paper uses them; the sources are listed under prerequisites (Jannsen is already queued as PAPER-JANNSEN-16). Their proofs belong to the owning layers' blueprints. *Checkpoint text:* Read the original full Jannsen/KS, Suwa and ILO proof chains; check completed-versus-henselian comparison, finite wild coefficient passage, alteration base changes and degree/separability. Jannsen is already queued, not a duplicate prerequisite request.
- **DP23-G2** (deferred). Cossart–Piltant is a cited supplier, now listed under prerequisites. The resolution hypothesis is used exactly as (H_d) states it: assumed only in characteristic two with d > 3. *Checkpoint text:* Acquire Cossart–Piltant's 2009 threefold resolution and the precise low-dimensional use. Separate smooth proper models from the TWO-CLAUSE resolution hypothesis; do not impose the global assumption in characteristic two dimension three.
- **DP23-G3** (closed). The false cd bound is recorded as E6 with its repair (nonreal-local-cd-bound). The remaining inputs (coefficient fields, cohomology of direct limits, EKM and Kato) are cited facts stated as items. *Checkpoint text:* The equicharacteristic-zero coefficient-field argument is now sourced and separated. Finish the exact nonreal local-field cd_2 bound and henselization/completion comparison, the transcendence-degree proof referred to by Milne, cohomology continuity and real-place descent; retain EKM subform/cancellation and Kato graded quadratic-Witt tasks. Kuhlmann–Novacoski decomposition-field and integral-closure localization foundations remain open. Do not restore the false cd(E′) bound in E6.
- **DP23-G4** (closed). Rumely, Pop 2017 and Poonen are cited suppliers stated as items. The low-dimensional bi-interpretability is recorded as E18 with its argument (low-dimensional-biinterpretability). *Checkpoint text:* Read original Rumely/Pop/Poonen internal inputs and AKNS coding/one-dimensional proof leaves. Fully verify that the same definable-normalization construction supplies low-dimensional bi-interpretability, not just a single-sentence result.
- **DP23-G5** (deferred). Implementation adapters and the number-field approximation are design and blueprint work for the routes. *Checkpoint text:* The residue-dimension criterion and arbitrary finite-extension e*f inequality now have direct mathematical proofs, including the mixed-characteristic Gauss subfield. The earlier selected-family integrality and height-one arguments remain supplied. Remaining: the exact number-field approximation off one finite place, normalization algebra/fraction-field towers, and typed Lean adapters for the new residue-basis/value-group constructions and the earlier extension, multiplicity, associated-prime and height-one arguments. General excellence is not inferred; the height-one theorem remains owned by AutomorphicCongruences:L4.
- **DP23-G6** (closed). This continuation checked the full-rank flag correction (E3), the torus specialization (E4) and the inverse-language bridge (E7) against the TeX source and AKNS. *Checkpoint text:* Independent review of the explicit full-rank flag repair, torus specialization, and finite inverse-language bridge. Check any formula-level uniformity across finite residue-number-field interpretations.
- **DP23-G7** (unavailable). The typeset Annals text is paywalled. arXiv v2 is the authors' final version; the locators follow it. *Checkpoint text:* Acquire the publisher-format DP paper and collate the structured source findings against v2. Preserve E1–E4 IDs shared with the separate errata file, without self-review. Complete the inherited Part II signature audit and remaining full-source proof tasks before marking complete. On 2026-09-23 the public Annals PDF guess again returned 404; the current article page and author lists expose the same 19-page final author copy. No publisher-format collation is claimed.

## Mistakes found (`sourceIssues`)

Seventeen findings are recorded, each with a quotation, a correction and the reason. Locators are to arXiv v2, the final author version; the typeset Annals text was not available. No erratum was found (arXiv, Crossref, the Annals page and Dittmann's list).

- **E1** (misprint; affects nothing), §3, definition of Pfister forms in characteristic two, p. 6. *Printed:* ⟨⟨a_i⟩⟩ ⊗ … ⟨⟨a_1⟩⟩ ⊗ ⟨⟨a_0]] *Correction:* In characteristic 2 the factors ⟨⟨a_j⟩⟩ (j ≥ 1) are the bilinear Pfister forms ⟨1, −a_j⟩_b of [EKM, 9.B], and q_a is their product with the quadratic form ⟨⟨a_0]]: a nonsingular quadratic form of dimension 2^{i+1}. *Reason:* With ⟨⟨a⟩⟩ read as the quadratic form x_1² − a x_2² just defined, the tensor product in characteristic 2 is not defined (quadratic forms do not multiply there), and that form is totally singular, being (x_1 + √a x_2)². The reference [EKM, 9.B] has the bilinear factors. Noted by the extraction (item pfister-two).
- **E2** (misprint; affects nothing), proof of Proposition 3.10, Claim 1, p. 12. *Printed:* a′_i = 1 − 1/u_i + ε_i/u_i² *Correction:* a′_i = 1 − 1/u_i − ε_i/u_i². *Reason:* Dividing u_i² − u_i − ε_i by u_i² gives the minus sign. Either way a′_i is a principal w̃-unit (w̃(u_i) < 0 and w̃(ε_i) = 0), so the argument is unaffected. Noted by the extraction (item detecting-nonnegative).
- **E3** (misprint; affects nothing), proof of Proposition 5.1, Case 2, and proof of Lemma 5.3, pp. 16–17. *Printed:* w ∈ W_T *Correction:* In Case 2 and Lemma 5.3, W_T should denote {w ∈ D^e_{K|κ} : T ⊂ O_w}, the full-rank geometric flags containing T, not the rank-one divisors of p.16. *Reason:* For a rank-one geometric prime divisor w the residue field κw has transcendence degree e − 1 over κ, so it is not a number field and the finite primes P_fin(κw) used next do not apply; the construction needs the rank-e flags just introduced. The symbol is reused for two different sets. Noted by the extraction (items maximal-geometric-flags, arithmetic-flags).
- **E4** (gap; affects nothing), proof of Lemma 5.3, Claim, p. 17. *Printed:* Then ζ is an e-tuple of roots of unity *Correction:* Choose ζ in the torus, with all coordinates nonzero and ḡ(ζ) ≠ 0 (possible because ḡ is a nonzero polynomial over the infinite field κv^alg); then each coordinate is a root of unity of order prime to char(κv) and has a Teichmüller-type lift. *Reason:* An element of the algebraic closure of a finite field is a root of unity only if it is nonzero, and a nonvanishing point of ḡ may have zero coordinates. Noted by the extraction (report, §5).
- **E6** (error; affects the proof), proof of Proposition 3.2(3), Case 2, Claim, p. 7. *Printed:* cd(E′) ⩽ dim(E′) + 1 *Correction:* Bound the nonreal base change E′k′_v directly by cd_2(k′_v)+trdeg(E′/k′)≤dim(E′)+1, using the nonreal local-field theorem and the transcendence-degree inequality. *Reason:* E′ can be formally real (it contains ℚ whenever the residue field does, and may have orderings), and then cd₂(E′) = ∞, so the printed intermediate bound is false. What the argument needs holds: for a non-real place v′ of k′, k′_{v′} is a henselian p-adic field (cd₂ = 2) or algebraically closed, and cd₂(E′k′_{v′}) ≤ cd₂(k′_{v′}) + trdeg(E′|k′) ≤ dim(E′) + 1. nonreal-local-cd-bound records this.
- **E7** (gap; affects the proof), final sentence of §5, p. 18. *Printed:* [AKNS, Proposition 2.28] *Correction:* Apply the finite-language QFA theorem after adjoining total inversion to the field language, and then eliminate that definable function. Retain the existing inverse-language-bridge item. *Reason:* AKNS §2.9 works with a finitely generated L-structure A in a finite language L, and Proposition 2.28 gives a formula characterizing A among finitely generated L-structures (read in arXiv 1610.04768, p. 20). A finitely generated field is not a finitely generated ring unless it is finite (ℚ is not), so applied in the ring language the proposition says nothing about finitely generated fields. In the language with total inversion, whose graph is ring-definable, K is a finitely generated structure and remains bi-interpretable with ℤ; the resulting sentence translates back to the ring language. inverse-language-bridge records the bridge.
- **E8** (misprint; affects nothing), Kuhlmann–Novacoski, Henselian elements, Theorem 1.2, proof (arXiv 1311.6155, p. 11), as used in the proof of Lemma 3.9(1), p. 11. *Printed:* σ_iη ≠ η for 1 ≤ i ≤ n *Correction:* Exclude the identity embedding from both nonfixing ranges (choose σ_1=id and use 2≤i≤n, and 2≤i≤k for the residue embeddings). *Reason:* The identity fixes η. Nonidentity residue embeddings separate the nonzero generator, and the remaining embeddings send it to residue zero. This preserves the primitive-generator argument. This slip is in the cited paper [K-No], not in Dittmann–Pop's text.
- **E9** (misprint; affects nothing), proof of Lemma 3.9(2), p. 11. *Printed:* q_a *Correction:* The open set V_{E|F} is a neighborhood of the valuation w, not of the quadratic form q_a. *Reason:* V_{E|F} is a subset of Val_F, and the chosen point is w∈V_a. The immediately preceding argument supplies that neighborhood.
- **E10** (misprint; affects nothing), proof of Proposition 3.2(2), p. 7. *Printed:* q_{π,ε}(y) = ∑_χ π^χ q_ε(x_χ) *Correction:* In characteristic different from two insert (−1)^{|χ|} in each summand for the paper’s convention ⟨⟨π_i⟩⟩=⟨1,−π_i⟩. Every block has N+1 coordinates; replace the subsequent F^N by F^{N+1}. *Reason:* For one outer factor the tensor is q_ε(x_0)−π_1q_ε(x_1). Signs are valuation units, so the distinct-value anisotropy proof is unchanged. The source defines N=2^{r+1}−1 while q_ε has 2^{r+1} variables.
- **E11** (misprint; affects nothing), proof of Proposition 3.10, p. 12. *Printed:* w̃ = w̃_N *Correction:* Use the restriction w̃_N|L in V_{a,N}. *Reason:* The constructed valuation is on L(α), whereas V_{a,N} consists of valuations on L. Its restriction preserves the inequalities, and anisotropy over the larger henselization implies anisotropy over the restricted one.
- **E12** (misprint; affects nothing), bibliography, entry [Du], p. 18. *Printed:* 808–923 *Correction:* [Du] ends at p.823, not p.923. *Reason:* Crossref metadata for doi 10.2307/2275432 gives pages 808–823.
- **E13** (misprint; affects nothing), bibliography, entry [Ka], p. 18. *Printed:* 493–51 *Correction:* [Ka] ends at p.510. *Reason:* Crossref metadata for doi 10.1007/BF01389226 gives pages 493–510.
- **E14** (misprint; affects nothing), bibliography, entry [P1], p. 18. *Printed:* 385–308 *Correction:* [P1] ends at p.408. *Reason:* Crossref metadata for doi 10.1007/s00222-002-0238-7 gives pages 385–408.
- **E15** (misprint; affects nothing), proof of Proposition 3.10, Claim 3, p. 13. *Printed:* Finally, since q_{a_1,a_0} is isotropic over k_{1v} for all archimedean places of k_1, it follows that q_a is isotropic over F_v := F k_{1v} for all archimedean places v of k_1. *Correction:* q_ε is isotropic over F_v, where ε = (a_{d−1}, …, a_1, a_0). *Reason:* F is the relative algebraic closure of k_1(t) in L_{w_L}, so a_d need not lie in F and q_a is not defined over F. The next sentence applies Proposition 3.2(3) to q_ε, which contains q_{a_1,a_0} as a Pfister factor and is therefore isotropic over F_v.
- **E16** (misprint; affects nothing), Notations/Remarks 4.1(2) and proof of Theorem 4.2(1), p. 14. *Printed:* w ∈ D_{K|k_a} are in bijection with the closed points P ∈ C … Since V_a ⊂ D_{K|k_a} is finite *Correction:* D_{K|k_t} in both places. *Reason:* Only k_t = k_u is defined, and D_{K|k_t} is introduced in the same item as the set of prime divisors of K|k_t.
- **E17** (gap; affects the proof), §4, opening paragraph, p. 13, and Recipe 4.3(1), p. 15. *Printed:* 1) Consider the uniformly first-order definable k_1, u = (u_i)_{d>i>1}, k_1 ⊂ k_t ⊂ K, and further a := (a_d, …, a_1, a_0) and q_a as in Notations/Remarks 4.1. *Correction:* Add that the conditions of Notations/Remarks 4.1(1)(c) are uniformly first-order: q_{a_1,a_0} is k_1-nice and every ε_i is a v-unit at the finite places v of k_1 with v(a_1) > 0. One way:
- the finite places of k_1 are uniformly definable (Rumely);
- isotropy of q_{a_1,a_0} over a henselization k_{1v} is a Hensel-type condition in O_v;
- at real places, q_{a_1,a_0} = ⟨1, −a_1, −a_0, a_1a_0⟩ is anisotropic exactly where a_1 and a_0 are both negative, and 'no ordering of k_1 makes both negative' is −1 = σ₀ − σ₁a_1 − σ₂a_0 + σ₃a_1a_0 with each σ_i a sum of four squares.
niceness-definability records this. *Reason:* The opening of §4 lists the first-order inputs used: isotropy of Pfister forms over K and K(√−1), the Kronecker dimension, the global subfields and algebraic independence. Niceness quantifies over all places of k_1 and is not among them. Without it, the family of Recipe 4.3 is not shown to be definable, and Theorem 1.3 rests on that.
- **E18** (gap; affects the proof), §5, p. 15 (and the final proof, p. 17). *Printed:* We will now prove that every field satisfying Hypothesis (H_d) is bi-interpretable with the ring ℤ *Correction:* Theorem 1.2 also covers infinite finitely generated fields of Kronecker dimension one and two, which (H_d), d ≥ 3, excludes. For them the same argument works:
- for a number field, R_T = O_K is definable by Rumely;
- otherwise, run the proof of Proposition 5.1 with Remark 4.4 in place of Theorem 1.3. *Reason:* §5 is written only under (H_d), d ≥ 3. The introduction attributes dimensions one and two to [P2] and [Ru] for the definability of prime divisors, but the paper does not say where Theorem 1.2 is proved in those dimensions. low-dimensional-biinterpretability records the case.

## Preserved external-source provenance

These records preserve earlier acquisition and reading scopes, without claiming fresh full reads.

```json
{
  "id": "AKNS",
  "url": "https://math.berkeley.edu/~scanlon/papers/logical-complexity-fg-ring.pdf",
  "sha256": "b5d1e7c33744a03ff22bb7d314359c861542e0bd6bd57f4517e5494d495c5f05",
  "readSections": [
    "§§2.2–2.3 interpretations and bi-interpretations",
    "Examples2.9(4) localization",
    "§2.9 Proposition2.28 and Lemmas2.29–2.30",
    "Theorem3.1 and §3.2 proof"
  ],
  "notRead": "§3.1 and the earlier coding/model-theoretic lemmas on which the selected proof rests; external arithmetic inputs.",
  "accessed": "2026-09-21",
  "provenanceSession": "codex-a71f92 (inherited selected reading; not claimed as reread by this continuation)"
}
```

```json
{
  "id": "Poonen",
  "url": "https://math.mit.edu/~poonen/papers/uniform.pdf",
  "sha256": "3042f2c17cc0ea7dd388712bbb2c12f0526e003179485509555ff983db013554",
  "readSections": [
    "Theorems1.1–1.4",
    "Theorem2.2(1–8), Theorem2.3, Definition3.1",
    "Lemmas3.6–3.7",
    "Proposition4.10 and §5 including Lemma5.3"
  ],
  "notRead": "Earlier elliptic-curve/Moret-Bailly and definability proof inputs.",
  "accessed": "2026-09-21",
  "provenanceSession": "codex-a71f92 (inherited selected reading; not claimed as reread by this continuation)"
}
```

```json
{
  "id": "Jannsen",
  "url": "https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf",
  "sha256": "26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71",
  "readSections": [
    "Coefficient convention(0.2), Conjecture1, Theorem0.4",
    "Conjecture3 and Theorem0.10",
    "Definition4.18 and adjacent Theorem4.19 statement"
  ],
  "notRead": "The full higher-dimensional Hasse proofs; already queued as PAPER-JANNSEN-16.",
  "accessed": "2026-09-21",
  "provenanceSession": "codex-a71f92 (inherited selected reading; not claimed as reread by this continuation)"
}
```

```json
{
  "id": "KerzSaito",
  "url": "https://arxiv.org/pdf/1010.5930v3",
  "sha256": "8f887a2b55bc9a71eb44ae75056488aa50df7867f8202aca1ccdad239bb5a483",
  "readSections": [
    "§8 setup, coefficient complex(8.1), Theorem8.1 and its proof, adjacent Theorem8.2"
  ],
  "notRead": "Proof ingredients in §§3–7.",
  "accessed": "2026-09-21",
  "provenanceSession": "codex-a71f92 (inherited selected reading; not claimed as reread by this continuation)"
}
```

```json
{
  "id": "EKM",
  "url": "https://www.math.ucla.edu/~merkurev/Book/Kniga-final/Kniga.pdf",
  "sha256": "0b547b09ee83c370a932e2c2117fe1757bb8b342ca0af9d73526b5edffb842e6",
  "readSections": [
    "§9.B definitions, Proposition9.8, Corollaries9.9–9.10 and proof",
    "§16 Proposition16.1, Fact16.2 and its original-reference discussion",
    "§23.A Theorem23.7 and proof, surrounding Corollaries23.4–23.9"
  ],
  "notRead": "The complete subform theorem, Witt theory and original Kato/Voevodsky proofs cited by these selections.",
  "accessed": "2026-09-21",
  "provenanceSession": "codex-a71f92 (inherited selected reading; not claimed as reread by this continuation)"
}
```

```json
{
  "id": "KuhlmannNovacoski",
  "url": "https://arxiv.org/pdf/1311.6155",
  "sha256": "19bcd00d932899fdd8ba63b56aff45cee048fa8d6667de154206d23c63058a62",
  "readSections": [
    "PDF pp.1–3,5,7–13: setting(1), Theorems1.2–1.3, Definition3.1, Lemmas2.5,3.2,3.3 and full proof of Theorem1.2; selected adjacent proof material.",
    "codex-hjdg0j reread PDF pp.7,9–13, including Theorem 1.2 proof and identity-index slip; no claim to reread the other selections."
  ],
  "notRead": "Raynaud local-rings inputs cited in Lemma3.2, full proofs of the remaining valuation/Galois background, and the rest of the paper. Lemma2.5 is stated by reference, not proved there.",
  "accessed": "2026-09-22",
  "provenanceSession": "codex-c83e7a; same PDF hash, additional proof reading"
}
```

```json
{
  "url": "https://stacks.math.columbia.edu/tag/032N",
  "sha256": "006c9c4fb36aae28dc403381cfe5600f830abe3c71dce0105fe65431e9d6944e",
  "accessed": "2026-09-22",
  "id": "Stacks-032N",
  "readSections": [
    "Full lemma statement and supplied proof; 030M itself omits proof details, checked against pinned Tau Ceti proof."
  ],
  "provenanceSession": "inherited from the preceding checkpoint; not claimed as newly read by codex-hjdg0j"
}
```

```json
{
  "url": "https://stacks.math.columbia.edu/tag/030M",
  "sha256": "4e733ee60ee94ab83ab858e68b4b3a3b437f6a90672cb79993d99cbf5f5e382a",
  "accessed": "2026-09-22",
  "id": "Stacks-030M",
  "readSections": [
    "Full lemma statement and supplied proof; 030M itself omits proof details, checked against pinned Tau Ceti proof."
  ],
  "provenanceSession": "inherited from the preceding checkpoint; not claimed as newly read by codex-hjdg0j"
}
```

```json
{
  "url": "https://stacks.math.columbia.edu/tag/032L",
  "sha256": "ab6529a0cf20c0dfb03e16aa3e883fd89bd15d1d536f2349e216ca856c1c6b5a",
  "accessed": "2026-09-22",
  "id": "Stacks-032L",
  "readSections": [
    "Full lemma statement and supplied proof; 030M itself omits proof details, checked against pinned Tau Ceti proof."
  ],
  "provenanceSession": "inherited from the preceding checkpoint; not claimed as newly read by codex-hjdg0j"
}
```

```json
{
  "url": "https://stacks.math.columbia.edu/tag/032O",
  "sha256": "64c40bc5a0bf1acb69ab6713f3782244e4b364b747de4c7719dab6df774e4639",
  "accessed": "2026-09-22",
  "id": "Stacks-032O",
  "readSections": [
    "Full lemma statement and supplied proof; 030M itself omits proof details, checked against pinned Tau Ceti proof."
  ],
  "provenanceSession": "inherited from the preceding checkpoint; not claimed as newly read by codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-031T",
  "url": "https://stacks.math.columbia.edu/tag/031T",
  "sha256": "60ca68ba7864eb7885f7d8525b4f2071ec88f04d8e2c2bcb310ab7c23c9f46dc",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-031S",
  "url": "https://stacks.math.columbia.edu/tag/031S",
  "sha256": "05a6f4daf4e0ce0e22731a953dc355b411931313c9e549bbec1f7b9d0a1105c9",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-0311",
  "url": "https://stacks.math.columbia.edu/tag/0311",
  "sha256": "bbfeb5589665e35301bf03ddb87900212ee9f675ec598491e146c89d0712a484",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-031Q",
  "url": "https://stacks.math.columbia.edu/tag/031Q",
  "sha256": "2ea1d6254bd264b9ba91b59f39ea5131dd5aa9321ae0dccd51f809aa356bff46",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-00KV",
  "url": "https://stacks.math.columbia.edu/tag/00KV",
  "sha256": "66c7246a7535b3a8fb210d84d1d0f30d7f77ad36e3e318b4c01b6f055bb5fab5",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-00IA",
  "url": "https://stacks.math.columbia.edu/tag/00IA",
  "sha256": "907597decfd295ba0cab7f6622d76d2a4ee8bbb8e4e3de11cd59a18a54b3024d",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-00I8",
  "url": "https://stacks.math.columbia.edu/tag/00I8",
  "sha256": "040cdede3303a892a71f1eb53d4dbeaff99233b2514b20ee4090d4eef4c29d5a",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Stacks-0ASF",
  "url": "https://stacks.math.columbia.edu/tag/0ASF",
  "sha256": "cc51e90bab70302226089bd5f14b6dc3a171fce08163f8425edd0b2fb6326d43",
  "accessed": "2026-09-22",
  "readSections": [
    "Statement and supplied proof read; for 00I8 the valuation-ring section was read. These readings do not claim the full proof chain of every cited lemma."
  ],
  "provenanceSession": "codex-hjdg0j"
}
```

```json
{
  "id": "Milne-LEC",
  "url": "https://www.jmilne.org/math/CourseNotes/LECc.pdf",
  "sha256": "718182f1a55d3af6b71f0d2faa5836851fb8611f1d7276896e3d5affdf28697b",
  "accessed": "2026-09-22",
  "readSections": [
    "pp.105–106: cohomological-dimension convention, Theorem 15.2 and its reference-only proof; Lemma 15.3 with its complete coefficient-field proof; adjacent 15.4–15.5."
  ],
  "notRead": "The referenced Shatz proof, local-field cohomological dimension and the remainder of Milne’s notes.",
  "provenanceSession": "codex-hjdg0j"
}
```

## Complete interface ledger

All formalization statuses remain unchecked.

### ring-language — First-order ring language

**definition · library**. §1, pp.1–2

The single-sorted language has binary addition and multiplication, unary negation, and constants zero and one; formulas quantify over the underlying ring. Inversion is not a primitive symbol.

Library: mathlib:FirstOrder.Language.ring.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.ringLanguage.characterise` (characterisation): Realization of an addition term is addition of realizations.
- API `DittmannPop.ringLanguage.structure` (structure): Realization of a multiplication term is multiplication of realizations.
- API `DittmannPop.ringLanguage.compatibility` (compatibility): Symbol-preserving equivalences are exactly ring equivalences.

- Use: PAPER-DITTMANN-POP-23/main-single-sentence — Express the final parameter-free field-characterizing sentence and eliminate total inversion.

- Proposed test `DittmannPop.ringLanguage.test1`: The term (1+1)·(1+1) realizes to 4 in Z.
- Proposed test `DittmannPop.ringLanguage.test2`: In F_2, 1+1 realizes to 0.
- Proposed test `DittmannPop.ringLanguage.test3`: The language has no primitive inverse function.

### definable-set — Definability with parameters

**definition · library**. §1, Theorems 1.2–1.3; AKNS §2.1

For a language L, an L-structure M, a parameter set A⊆M and a finite index set I, S⊆M^I is A-definable when an L-formula with constants from A has realization set exactly S.

Library: mathlib:Set.Definable.

Prerequisites: PAPER-DITTMANN-POP-23/ring-language.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.definableSet.characterise` (characterisation): A formula with constants A defines its realization set.
- API `DittmannPop.definableSet.structure` (structure): Finite intersections and complements preserve A-definability.
- API `DittmannPop.definableSet.compatibility` (compatibility): Projection from a finite Cartesian power preserves definability.

- Use: PAPER-DITTMANN-POP-23/normalization-definable — Close formula-defined sets under Boolean operations and projection when defining normalization rings.

- Proposed test `DittmannPop.definableSet.test1`: x=x defines all of M.
- Proposed test `DittmannPop.definableSet.test2`: x≠x defines the empty set.
- Proposed test `DittmannPop.definableSet.test3`: With parameter a, x=a defines {a}.

### finitely-generated-field — Finitely generated field

**definition · missing**. §1, p.1

A field K is finitely generated when it is generated as a FIELD by a finite tuple over its prime field; equivalently K is the fraction field of a finitely generated integral domain over Z.

Prerequisites: PAPER-DITTMANN-POP-23/ring-language.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.finitelyGeneratedField.characterise` (characterisation): A finite tuple generates K precisely when its field-adjoin over the prime field is K.
- API `DittmannPop.finitelyGeneratedField.structure` (structure): K is the fraction field of the prime-ring algebra generated by a field-generating tuple.
- API `DittmannPop.finitelyGeneratedField.compatibility` (compatibility): Finite extensions of finitely generated fields are finitely generated.

- Use: PAPER-DITTMANN-POP-23/main-single-sentence — Restrict the comparison class to fields finitely generated over their prime field.

- Proposed test `DittmannPop.finitelyGeneratedField.test1`: Q is finitely generated as a field but not as a Z-algebra.
- Proposed test `DittmannPop.finitelyGeneratedField.test2`: F_p(t_1,…,t_r) is field-generated by t_1,…,t_r.
- Proposed test `DittmannPop.finitelyGeneratedField.test3`: An algebraic closure of F_p is not finitely generated as a field.

### constant-field — Constant field

**definition · missing**. §1, p.1; §3, Proposition 3.2

For a field F its constant subfield κ is the relative algebraic closure in F of its prime field. For finitely generated F it is a number field in characteristic zero and a finite field in positive characteristic.

Prerequisites: PAPER-DITTMANN-POP-23/finitely-generated-field.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.constantField.characterise` (characterisation): Membership means algebraicity over the prime field.
- API `DittmannPop.constantField.structure` (structure): Every element of K algebraic over κ belongs to κ.
- API `DittmannPop.constantField.compatibility` (compatibility): Field isomorphisms carry constants onto constants.

- Use: PAPER-DITTMANN-POP-23/normalization-ring — Separate the finite or number-field constant field from its integer ring in the arithmetic normalization.

- Proposed test `DittmannPop.constantField.test1`: Q(t) has constants Q.
- Proposed test `DittmannPop.constantField.test2`: F_{p^n}(t) has constants F_{p^n}.
- Proposed test `DittmannPop.constantField.test3`: In Q(√2)(t), √2 is constant and t is not.

### kronecker-dimension — Kronecker dimension

**definition · missing**. §1, p.1

For F of finite absolute transcendence degree, dim_Kr(F)=trdeg(F)+1 if char F=0 and dim_Kr(F)=trdeg(F) if char F>0. In particular finite fields have dimension zero and global fields dimension one.

Prerequisites: PAPER-DITTMANN-POP-23/finitely-generated-field.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.kroneckerDimension.characterise` (characterisation): In characteristic zero add one to absolute transcendence degree.
- API `DittmannPop.kroneckerDimension.structure` (structure): In positive characteristic use absolute transcendence degree.
- API `DittmannPop.kroneckerDimension.compatibility` (compatibility): Algebraic extensions preserve finite Kronecker dimension.

- Use: PAPER-DITTMANN-POP-23/uniform-divisors — Fix formula arity and the dimension drop at geometric divisors.

- Proposed test `DittmannPop.kroneckerDimension.test1`: dim_Kr(F_{p^n})=0.
- Proposed test `DittmannPop.kroneckerDimension.test2`: dim_Kr(Q)=1.
- Proposed test `DittmannPop.kroneckerDimension.test3`: dim_Kr(Q(t))=2 and dim_Kr(F_p(t))=1.

### resolution-f2 — Resolution above the field of two elements

**definition · missing**. §2, p.5, clauses(i)–(ii)

The hypothesis has TWO clauses: every proper integral F_2-variety admits a proper birational morphism from a smooth F_2-variety; and every smooth affine F_2-variety admits an open immersion into a smooth projective F_2-variety whose complement is a simple normal crossings divisor. This is an assumption, not a theorem asserted here.

Conditional input only; do not create an unconditional resolution milestone.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.resolutionF2.characterise` (characterisation): Project to the smooth proper birational-model clause.
- API `DittmannPop.resolutionF2.structure` (structure): Project to smooth projective compactification with SNC boundary.
- API `DittmannPop.resolutionF2.compatibility` (compatibility): The full hypothesis restricts to either clause in any fixed dimension.

- Use: PAPER-DITTMANN-POP-23/lgp-characteristic-two — Retain both resolution clauses in the high-dimensional characteristic-two Hasse input.

- Proposed test `DittmannPop.resolutionF2.test1`: The identity of a smooth projective F_2-variety meets the first-clause conclusion for that variety.
- Proposed test `DittmannPop.resolutionF2.test2`: A^1⊂P^1 over F_2 has a single smooth boundary point.
- Proposed test `DittmannPop.resolutionF2.test3`: A degree-two alteration is not a birational morphism.

### hypothesis-hd — Dimension-indexed field hypotheses

**definition · missing**. §1, p.2, (H_d)

For a fixed integer d>=3, H_d(K) means K is finitely generated, dim_Kr(K)=d, and if char K=2 and d>3 the two-clause resolution-above-F_2 hypothesis holds.

Prerequisites: PAPER-DITTMANN-POP-23/kronecker-dimension, PAPER-DITTMANN-POP-23/resolution-f2.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.hypothesisHd.characterise` (characterisation): Project to finite generation and dimension d.
- API `DittmannPop.hypothesisHd.structure` (structure): When char K≠2 and d>=3, no resolution clause remains.
- API `DittmannPop.hypothesisHd.compatibility` (compatibility): When char K=2 and d=3, no resolution clause remains.

- Use: PAPER-DITTMANN-POP-23/uniform-divisors — Track exactly when the resolution assumption is needed; do not impose it in dimension three.

- Proposed test `DittmannPop.hypothesisHd.test1`: H_3(F_2(x,y,z)) has no resolution assumption.
- Proposed test `DittmannPop.hypothesisHd.test2`: Q(x,y) has Kronecker dimension 3.
- Proposed test `DittmannPop.hypothesisHd.test3`: H_4(F_2(x,y,z)) is false by the dimension clause.

### prime-divisor — Geometric and arithmetic prime divisors

**definition · missing**. §1, p.2 before(H_d)

For F of finite Kronecker dimension a prime divisor is a nontrivial discrete valuation w with dim_Kr(Fw)=dim_Kr(F)-1, taken up to equivalence. It is geometric if char(Fw)=char(F), and arithmetic otherwise.

Prerequisites: PAPER-DITTMANN-POP-23/kronecker-dimension.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.primeDivisor.characterise` (characterisation): Extract the valuation ring, maximal ideal and residue field.
- API `DittmannPop.primeDivisor.structure` (structure): Geometric means equal field and residue characteristics.
- API `DittmannPop.primeDivisor.compatibility` (compatibility): Equivalent valuations determine the same divisor.

- Use: PAPER-DITTMANN-POP-23/uniform-divisors — Specify precisely which valuation rings must be enumerated by the formula.

- Proposed test `DittmannPop.primeDivisor.test1`: The t-adic valuation of F_p(t) is geometric.
- Proposed test `DittmannPop.primeDivisor.test2`: The p-adic valuation of Q is arithmetic.
- Proposed test `DittmannPop.primeDivisor.test3`: The trivial valuation is excluded.

### divisorial-discreteness — Residue-dimension characterization of prime divisors

**theorem · missing**. §1, p.2, citation EP Theorem 3.4.3

Let K be a finitely generated field and v any valuation with dim_Kr(Kv)=dim_Kr(K)−1. Then the valuation ring is a DVR and Kv is finitely generated over its prime field. Thus v is a prime divisor in the paper’s sense. The proof covers geometric and arithmetic valuations and does not assume discreteness in advance.

The exact criterion has a direct proof in both characteristic cases. Finite generation of K is essential: Fp(t^{1/p^∞}) has residue Fp and transcendence degree 1 but value group Z[1/p], which is not discrete. No new full reading of Engler–Prestel is claimed.

Prerequisites: PAPER-DITTMANN-POP-23/prime-divisor, PAPER-DITTMANN-POP-23/geometric-gauss-subfield, PAPER-DITTMANN-POP-23/arithmetic-gauss-subfield, PAPER-DITTMANN-POP-23/valuation-extension-ef, PAPER-DITTMANN-POP-23/finite-index-cyclic-value, PAPER-DITTMANN-POP-23/cyclic-value-dvr, PAPER-DITTMANN-POP-23/function-field-discreteness.

1. The valuation cannot be trivial because a trivial valuation has residue field K and preserves its Kronecker dimension.
2. In equal characteristic, geometric-gauss-subfield exhibits K as a one-variable function field over the subfield generated by residue-basis lifts. Its proper valuation subring contains that base, so import the already built function-field-discreteness theorem. Alternatively its restriction to F0 has cyclic value group, and the same finite-extension argument as below applies.
3. In mixed characteristic, the Kronecker-dimension equality is precisely trdeg_Fp(Kv)=trdeg_Q(K). Arithmetic-gauss-subfield gives a finite subextension F0=Q(x) with cyclic value group generated by v(p).
4. The general valuation-extension-ef theorem gives finite index of the base value group and finite degree of the residue extension in either case. Finite-index-cyclic-value and the pinned cyclic-value-dvr theorem give a DVR without assuming it.
5. The residue field of F0 is a finitely generated rational field over the residue prime field. Its finite residue extension Kv is therefore finitely generated. This supplies both discreteness and residue finite generation at the required scope.

### uniform-family — Uniform definable family of valuation rings

**definition · missing**. §1, Theorem 1.3; Poonen Definition 3.1

For fixed d a ring formula val_d(X,Y), with a fixed finite parameter tuple Y, defines all geometric prime-divisor rings of every H_d field K: each such ring is a fiber, and each parameter fiber is either such a ring or the empty set.

Prerequisites: PAPER-DITTMANN-POP-23/prime-divisor, PAPER-DITTMANN-POP-23/definable-set, PAPER-DITTMANN-POP-23/hypothesis-hd.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.uniformFamily.characterise` (characterisation): Evaluate a fiber at a parameter tuple.
- API `DittmannPop.uniformFamily.structure` (structure): Every geometric prime-divisor ring in H_d occurs as a fiber.
- API `DittmannPop.uniformFamily.compatibility` (compatibility): Every fiber is empty or a proper geometric prime-divisor ring.

- Use: PAPER-DITTMANN-POP-23/normalization-uniform — Turn the fixed-dimension divisor parameter tuple into quantified ring formulas.

- Proposed test `DittmannPop.uniformFamily.test1`: A nonempty fiber contains 1.
- Proposed test `DittmannPop.uniformFamily.test2`: A rejected tuple gives the empty fiber.
- Proposed test `DittmannPop.uniformFamily.test3`: No fiber equals K.

### uniform-divisors — Uniform definability of geometric prime divisors

**theorem · missing**. Theorem 1.3; Recipe 4.3

For each d>=3 a formula val_d as in uniform-family exists for every field satisfying H_d. The empty-fiber alternative holds for every parameter tuple, not only for admissible tuples.

Prerequisites: PAPER-DITTMANN-POP-23/uniform-family, PAPER-DITTMANN-POP-23/valuation-filter, PAPER-DITTMANN-POP-23/single-divisor.

1. Translate admissible test data and anisotropy into the ring language.
2. Use the singleton construction for surjectivity.
3. Filter by being a proper valuation ring; the finite-intersection theorem proves that every retained fiber is a geometric divisor ring.

### interpretation — Interpretation by a definable quotient

**definition · planned**. AKNS §2.2; invoked at §1 Theorem 1.2 and §5

An interpretation of B in A is a definable finite-power domain M⊆A^m with a surjection f:M→B whose equality kernel and pullbacks of the basic relation and function graphs of B are definable in A. Parameters are allowed and tracked. Equivalently pullbacks of every B-definable finite-power set are A-definable.

Planned: LogicAndDefinabilityInNumberTheory:LD.0.

Prerequisites: PAPER-DITTMANN-POP-23/definable-set.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.interpretation.characterise` (characterisation): Definable domain, kernel and operation graphs give the quotient structure.
- API `DittmannPop.interpretation.structure` (structure): Translate formulas to kernel-invariant formulas on representatives.
- API `DittmannPop.interpretation.compatibility` (compatibility): Compose interpretations by preimage domains and translated kernels.

- Use: PAPER-DITTMANN-POP-23/fraction-interpretation — Interpret a fraction field using equivalence classes of numerator/denominator pairs.

- Proposed test `DittmannPop.interpretation.test1`: Identity is an interpretation.
- Proposed test `DittmannPop.interpretation.test2`: Cross-multiplication classes of fraction pairs interpret Frac(R).
- Proposed test `DittmannPop.interpretation.test3`: A definable ideal I gives an interpretation of R/I without choosing residue representatives.

### biinterpretation — Parametric bi-interpretation

**definition · missing**. AKNS §2.3; §5, pp.17–18

Interpretations f:A⇝B and g:B⇝A form a bi-interpretation if both interpreted composites are definably isomorphic to the identity structures. Mutual interpretability alone is not sufficient.

Prerequisites: PAPER-DITTMANN-POP-23/interpretation.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.biinterpretation.characterise` (characterisation): Extract both definable composite comparison isomorphisms.
- API `DittmannPop.biinterpretation.structure` (structure): Swap the two directions of a bi-interpretation.
- API `DittmannPop.biinterpretation.compatibility` (compatibility): Compose two bi-interpretations with the transported comparison maps.

- Use: PAPER-DITTMANN-POP-23/main-biinterpretability — Compose the definable field/domain interpretations with the integer interpretation, including definable composite isomorphisms.

- Proposed test `DittmannPop.biinterpretation.test1`: Two identity maps form a bi-interpretation.
- Proposed test `DittmannPop.biinterpretation.test2`: Reversing a bi-interpretation gives a bi-interpretation.
- Proposed test `DittmannPop.biinterpretation.test3`: A finite structure cannot interpret the infinite structure Z.

### biinterpretation-transitivity — Transitivity of bi-interpretability

**theorem · missing**. AKNS §2.3; final proof in §5

Composing two parametric bi-interpretations gives a parametric bi-interpretation; the comparison isomorphisms are transported through the interpreted quotients.

Prerequisites: PAPER-DITTMANN-POP-23/biinterpretation.

1. Compose interpreted domains and quotient kernels.
2. Translate both comparison isomorphisms and compose them; accumulate the finite parameter tuples.

### main-biinterpretability — Finitely generated fields and integer arithmetic

**theorem · missing**. Theorem 1.2; §5, final proof

Every infinite finitely generated field K is parametrically bi-interpretable with (Z,+,×). Assume resolution above F_2 only when char K=2 and dim_Kr(K)>3.

Prerequisites: PAPER-DITTMANN-POP-23/domain-biinterpretability, PAPER-DITTMANN-POP-23/field-ring-biinterpretation, PAPER-DITTMANN-POP-23/small-dimension-inputs, PAPER-DITTMANN-POP-23/biinterpretation-transitivity, PAPER-DITTMANN-POP-23/low-dimensional-biinterpretability.

1. Use low-dimensional-biinterpretability when dim_Kr(K)<=2.
2. In H_d with d>=3, construct the definable normalization R_T and its fraction-pair bi-interpretation with K.
3. Apply AKNS Theorem 3.1 to the infinite finitely generated R_T and compose bi-interpretations.

### main-single-sentence — Single field axiom

**theorem · missing**. Theorem 1.1; final sentence of §5

For each finitely generated field K, subject to resolution above F_2 if char K=2 and dim_Kr(K)>3, there exists a parameter-free sentence θ_K in the ring language such that every finitely generated FIELD L satisfies θ_K exactly when L≅K.

Prerequisites: PAPER-DITTMANN-POP-23/main-biinterpretability, PAPER-DITTMANN-POP-23/inverse-language-bridge, PAPER-DITTMANN-POP-23/qfa-theorem, PAPER-DITTMANN-POP-23/finite-field-sentence.

1. For finite K use the exact-cardinality field sentence.
2. For infinite K, use main-biinterpretability and the total-inversion language bridge before applying the finite-language QFA theorem.

### finite-field-sentence — Finite-field base case

**theorem · missing**. Theorem 1.1, finite case; §1 reduction to infinite fields

For a finite field K of size q=p^n, the ring sentence saying characteristic p and exactly q elements characterizes K up to field isomorphism among fields. No bi-interpretation with Z is asserted for a finite field.

Elementary expansion of the finite case, not a claim of an effective uniform formula in q.

Prerequisites: PAPER-DITTMANN-POP-23/ring-language.

1. Assert exactly q elements with q existential witnesses, pairwise distinctness and a universal exhaustion clause.
2. Add characteristic p if desired; uniqueness of finite fields gives the isomorphism type among fields.

### kato-coefficients — Torsion Tate coefficient complex

**definition · missing**. §2, pp.3–4; Jannsen(0.2)

For n>0, Z/n(i)=μ_n^{⊗i} if char F does not divide n. If char F=p and n=mp^r with p∤m, use μ_m^{⊗i}⊕W_rΩ^i_log[-i] on the étale site. Hence H^j(F,Z/n(i)) has wild summand H^{j-i}(F,W_rΩ^i_log). The paper uses n=2 and i>=0.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.katoCoefficients.characterise` (characterisation): At n invertible in F the coefficient is μ_n^{⊗i} in degree zero.
- API `DittmannPop.katoCoefficients.structure` (structure): For n=p^r in characteristic p it is W_rΩ^i_log[-i].
- API `DittmannPop.katoCoefficients.compatibility` (compatibility): Field embeddings induce pullback of the coefficient complexes.

- Use: PAPER-DITTMANN-POP-23/kato-cohomology — Choose the tame twist or wild logarithmic coefficient object before forming the Hasse group.

- Proposed test `DittmannPop.katoCoefficients.test1`: Z/2(0) in characteristic≠2 is the constant coefficient Z/2.
- Proposed test `DittmannPop.katoCoefficients.test2`: At characteristic two the twist-i coefficient is Ω^i_log[-i].
- Proposed test `DittmannPop.katoCoefficients.test3`: The wild coefficient is not the trivial group of μ_2-points.

### kato-cohomology — Shifted Kato cohomology convention

**definition · missing**. §2, p.4 and footnote 2

For i>=0 set H^{i+1}(F)=H^{i+1}(F,Z/2(i)); in characteristic two this is H^1(F,Ω^i_log), not ordinary H^{i+1}(G_F,μ_2^{⊗i}).

Prerequisites: PAPER-DITTMANN-POP-23/kato-coefficients.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.katoCohomology.characterise` (characterisation): H^{i+1}(F) has cohomological degree i+1 and twist i.
- API `DittmannPop.katoCohomology.structure` (structure): At characteristic two it equals H^1(F,Ω^i_log).
- API `DittmannPop.katoCohomology.compatibility` (compatibility): Field extensions induce restriction in the same degree and twist.

- Use: PAPER-DITTMANN-POP-23/lgp-global-base — State the exact degree and twist for global-to-local injectivity.

- Proposed test `DittmannPop.katoCohomology.test1`: H^1(F) has twist zero.
- Proposed test `DittmannPop.katoCohomology.test2`: H^2(F)=Br(F)[2], not the whole Brauer group.
- Proposed test `DittmannPop.katoCohomology.test3`: At characteristic two H^3(F)=H^1(F,Ω^2_log).

### cohomology-restriction — Restriction in Kato cohomology

**construction · missing**. §2(a), p.4

For a field extension E/F, pullback of the coefficient complexes induces res_E/F:H^{i+1}(F)→H^{i+1}(E), compatible with identity and composition.

Prerequisites: PAPER-DITTMANN-POP-23/kato-cohomology.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.cohomologyRestriction.characterise` (characterisation): Restriction along the identity is identity.
- API `DittmannPop.cohomologyRestriction.structure` (structure): Restriction in a field tower is the composite of restrictions.
- API `DittmannPop.cohomologyRestriction.compatibility` (compatibility): Restriction carries a Pfister invariant to its base change invariant.

- Use: PAPER-DITTMANN-POP-23/odd-degree-injectivity — Use restriction/corestriction multiplication by odd degree on mod-two coefficients.

- Proposed test `DittmannPop.cohomologyRestriction.test1`: Restriction of zero is zero.
- Proposed test `DittmannPop.cohomologyRestriction.test2`: Restriction along F/F fixes every class.
- Proposed test `DittmannPop.cohomologyRestriction.test3`: Two-step restriction of a symbol equals one-step restriction to the top field.

### cohomology-residue — Discrete valuation residue

**construction · missing**. §2(b), p.4, Ka2 p.149

In the coefficient/valuation regimes used in Facts 2.1–2.3, a discrete valuation w of F has a boundary ∂_w:H^{i+1}(F)→H^i(Fw), factoring through restriction to the w-henselization. In mixed residue characteristic two the required hypotheses must be supplied separately; no unrestricted residue map is inferred.

Prerequisites: PAPER-DITTMANN-POP-23/kato-cohomology, PAPER-DITTMANN-POP-23/henselization.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.cohomologyResidue.characterise` (characterisation): Residue factors through restriction to henselization.
- API `DittmannPop.cohomologyResidue.structure` (structure): Residue preserves addition.
- API `DittmannPop.cohomologyResidue.compatibility` (compatibility): In residue characteristic≠2, the residue of a symbol {u_1,…,u_i,π} is {ū_1,…,ū_i} for units u_j and uniformizer π, with mod-two Kummer conventions.

- Use: PAPER-DITTMANN-POP-23/nice-detection — Pass a higher cohomology class through divisor residues to detect anisotropy.

- Proposed test `DittmannPop.cohomologyResidue.test1`: The degree-one residue of a uniformizer is 1 mod 2 when 2 is invertible in the residue field.
- Proposed test `DittmannPop.cohomologyResidue.test2`: The degree-one residue of a unit is zero in that regime.
- Proposed test `DittmannPop.cohomologyResidue.test3`: The residue of a zero class is zero.

### cohomology-low-degrees — Characters and Brauer torsion

**theorem · missing**. §2, p.3

For every field F and n>0 with the Kato coefficient convention, H^1(F,Z/n(0))=Hom_cont(G_F,Z/n), and H^2(F,Z/n(1))=Br(F)[n]. The characteristic-dividing case uses logarithmic coefficients.

Prerequisites: PAPER-DITTMANN-POP-23/kato-coefficients.

1. Use the constant étale coefficient in degree zero for H¹.
2. Use the Kummer sequence away from the characteristic and the logarithmic Kato coefficient comparison in the wild case for H².
3. The latter comparison is not implied by the triviality of μ_p-points.

### constant-place-fields — Fields obtained from global constant places

**construction · missing**. §2, p.4 preceding Fact 2.1

For a relatively algebraically closed global subfield k_1⊂K and a place v of k_1, take k_{1v} to be its henselization at finite v, its real closure at real v, and its algebraic closure at complex v inside the completion. Let K_v=Kk_{1v}, embedded in the corresponding function field over the completion. Keep henselian and completed fields distinct.

The PDF's displayed tensor defining the completed compositum has a notation mismatch; the original Jannsen formulation uses completed base change.

Prerequisites: PAPER-DITTMANN-POP-23/constant-field, PAPER-DITTMANN-POP-23/henselization.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.constantPlaceFields.characterise` (characterisation): At finite v the algebraic local base is the henselization.
- API `DittmannPop.constantPlaceFields.structure` (structure): At real v the algebraic local base is the specified real closure.
- API `DittmannPop.constantPlaceFields.compatibility` (compatibility): Restriction to completion-base function fields factors through K_v.

- Use: PAPER-DITTMANN-POP-23/lgp-global-base — Index constant-place base changes without confusing completion and henselization.

- Proposed test `DittmannPop.constantPlaceFields.test1`: For the real place of Q, k_{1v} is real algebraic, not all of R.
- Proposed test `DittmannPop.constantPlaceFields.test2`: The henselization of Q at p is algebraic over Q, unlike Q_p.
- Proposed test `DittmannPop.constantPlaceFields.test3`: If K=k_1 then K_v=k_{1v}.

### lgp-global-base — Jannsen local–global injectivity over a global base

**theorem · missing**. Fact 2.1; Jannsen Theorem 0.4, with transcendence dimension d−1

Let K be finitely generated of Kronecker dimension d>=1, char K≠2, and k_1⊂K a relatively algebraically closed global subfield. Then α∈H^{d+1}(K) is zero iff its restrictions to H^{d+1}(K_v) vanish for every place v of k_1.

Original theorem statement checked in published Jannsen pp.2–3; full 71-page proof not claimed read.

Prerequisites: PAPER-DITTMANN-POP-23/constant-place-fields, PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Apply Jannsen Theorem 0.4 to completed global-base function fields.
2. Relate the henselian/real algebraic base changes to the completions in the permitted setting; injectivity of the required map is a distinct comparison input.
3. The original higher Hasse proof and this comparison still need full dependency auditing.

### kato-complex — Arithmetic Bloch–Ogus complex

**construction · missing**. §2, pp.4–5; Kato Proposition 1.7

For the excellent normal integral d-dimensional schemes in Facts 2.2–2.3, form the homological complex with degree a term ⊕_{x:dim closure{x}=a}H^{a+1}(κ(x)); its top term is H^{d+1}(κ(X)) and top differential is the sum of codimension-one residues. The residue differentials satisfy d²=0.

Prerequisites: PAPER-DITTMANN-POP-23/cohomology-residue.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.katoComplex.characterise` (characterisation): Its degree-a term is the direct sum of H^{a+1}(κ(x)) over dimension-a points.
- API `DittmannPop.katoComplex.structure` (structure): Its top term is H^{d+1} of the function field.
- API `DittmannPop.katoComplex.compatibility` (compatibility): Consecutive residue differentials compose to zero.

- Use: PAPER-DITTMANN-POP-23/lgp-good-model — Encode the residue complex whose exactness supplies the local-global comparison.

- Proposed test `DittmannPop.katoComplex.test1`: For a curve the terms are H^2(K) and the sum of H^1 of closed-point residues.
- Proposed test `DittmannPop.katoComplex.test2`: For a zero-dimensional field model only the H^1 term remains.
- Proposed test `DittmannPop.katoComplex.test3`: The boundary composite is zero, not an arbitrary family of unrelated maps.

### lgp-good-model — Kerz–Saito divisorial detection

**theorem · missing**. Fact 2.2; Kerz–Saito Theorem 8.1

Let R be a finite field of characteristic≠2, or the henselian valuation ring of a global field at a finite place with residue characteristic≠2. For X proper, regular, integral, flat over R of positive dimension d, and K=κ(X), α∈H^{d+1}(K) vanishes iff its restrictions to the henselizations at all codimension-one points vanish.

R is not assumed an arbitrary valuation ring; theorem 8.1 statement and its reduction proof read, prerequisite theorem proofs remain open.

Prerequisites: PAPER-DITTMANN-POP-23/kato-complex, PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Apply Kerz–Saito Theorem 8.1 to the proper regular model with invertible coefficient 2.
2. Top-degree exactness in the Kato complex detects a class by codimension-one residues.
3. Residues factor through the corresponding henselizations; global zero clearly restricts to zero.

### lgp-characteristic-two — Divisorial detection in characteristic two

**theorem · missing**. Fact 2.3; Jannsen Theorem 0.10; Kato/Suwa in low dimension

Let K be finitely generated of characteristic two and Kronecker dimension d>0; for d>3 assume resolution above F_2. On a projective smooth F_2-model X of K, α∈H^{d+1}(K) vanishes iff its restrictions to the henselizations at all x∈X^(1) vanish.

The low-dimensional unconditional input and existence of the indicated model are distinct proof obligations.

Prerequisites: PAPER-DITTMANN-POP-23/kato-complex, PAPER-DITTMANN-POP-23/resolution-f2, PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Use the smooth projective model supplied in the applicable dimension/resolution regime.
2. Apply the wild Kato-complex Hasse principle, combining the Jannsen finite-field result with Suwa's logarithmic comparison.
3. Record Cossart–Piltant and the low-dimensional arguments separately; no general characteristic-two resolution theorem is claimed.

### odd-degree-injectivity — Odd-degree persistence of mod-two classes

**theorem · missing**. Proposition 3.4(1), Case 2

For a finite separable odd-degree extension E/F, restriction on the mod-two cohomology in question is injective, since cor∘res=[E:F] acts as the identity. The application is in characteristic≠2.

Prerequisites: PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Restriction followed by corestriction multiplies by the finite degree.
2. On a mod-two group an odd degree acts as identity, so a restricted zero was already zero.

### odd-degree-alteration — Prime-to-two regular alteration

**theorem · missing**. Proposition 3.4(1), p.9; ILO X.2.4

For the integral projective model X_v over the excellent henselian DVR R of residue characteristic≠2 used in Proposition 3.4, obtain a projective regular integral alteration X̃→X_v with finite odd-degree function-field extension, in the precise Gabber/ILO ExposéX Theorem 2.4 regime.

de Jong arbitrary-degree alterations do not imply this prime-to-two statement. Original theorem and proof are acquisition gaps.

1. Use Gabber's prime-to-2 alteration in the stated excellent henselian-DVR regime.
2. Retain the finite odd degree, regularity, projectivity and the valuations over the model.
3. The original ILO theorem's precise base extension and separability clauses require audit before implementation.

### pfister-odd — Pfister form with two invertible

**construction · planned**. §3, p.6

For a field F with char F≠2 and nonzero a_i,…,a_0, q_a is the tensor product of the diagonal binary forms ⟨1,−a_j⟩ for j=i,…,0; it has dimension 2^{i+1}.

Planned: tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.pfisterOdd.characterise` (characterisation): For one parameter a, q_a(x,y)=x²−ay².
- API `DittmannPop.pfisterOdd.structure` (structure): An outer parameter b constructs q⊥(−b)q.
- API `DittmannPop.pfisterOdd.compatibility` (compatibility): Base change acts on all parameters.

- Use: PAPER-DITTMANN-POP-23/pfister-invariant-zero — Match characteristic-not-two Pfister tensors to cohomological symbols.

- Proposed test `DittmannPop.pfisterOdd.test1`: q_1 over Q vanishes at (1,1).
- Proposed test `DittmannPop.pfisterOdd.test2`: q_{−1} over R is anisotropic.
- Proposed test `DittmannPop.pfisterOdd.test3`: q_{a,b} has diagonal 1,−b,−a,ab.

### pfister-two — Quadratic Pfister form in characteristic two

**construction · missing**. §3, p.6; EKM9.B

For char F=2 and a_i,…,a_0∈F×, q_a is the tensor product of the bilinear factors ⟨1,−a_j⟩, j=i,…,1, with the quadratic binary form x²+xy+a_0y². It is a nonsingular quadratic form of dimension 2^{i+1}; replacing the final factor by a diagonal form is wrong.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.pfisterTwo.characterise` (characterisation): The last factor is x²+xy+a_0y².
- API `DittmannPop.pfisterTwo.structure` (structure): An outer bilinear parameter b constructs q⊥(−b)q.
- API `DittmannPop.pfisterTwo.compatibility` (compatibility): Characteristic-two base change preserves the coefficient formula.

- Use: PAPER-DITTMANN-POP-23/pfister-invariant-zero — Use the nonsingular quadratic last factor with bilinear outer factors in characteristic two.

- Proposed test `DittmannPop.pfisterTwo.test1`: x²+xy+y² is anisotropic over F_2.
- Proposed test `DittmannPop.pfisterTwo.test2`: Over F_4 with ω²+ω+1=0, it vanishes at (ω,1).
- Proposed test `DittmannPop.pfisterTwo.test3`: An outer parameter 1 makes q⊥q isotropic using equal nonzero vectors.

### pfister-hyperbolic — Pfister isotropy and hyperbolicity

**theorem · missing**. §3, p.6; EKM Corollary 9.10

In either characteristic convention, a positive-fold quadratic Pfister form q_a is isotropic iff it is hyperbolic. In characteristic≠2 this exceeds the upstream result restricted to at most two folds.

Prerequisites: PAPER-DITTMANN-POP-23/pfister-odd, PAPER-DITTMANN-POP-23/pfister-two, PAPER-DITTMANN-POP-23/pfister-roundness.

1. Use roundness and EKM Proposition 9.8(2) to remove one binary outer factor.
2. For a single nonsingular binary factor, an isotropic vector gives a hyperbolic plane.
3. Induct on the fold number, in both characteristic conventions.

### pfister-invariant — Cohomological symbol of a Pfister form

**construction · missing**. §3, p.6

An (i+1)-fold quadratic Pfister form q_a has its canonical symbol invariant e(q_a)∈H^{i+1}(F,Z/2(i)): the usual mod-two Kummer symbol away from characteristic two and the characteristic-two quadratic/logarithmic invariant in EKM§16. Its normalization uses q=x²+xy+a_0y² in characteristic two.

The characteristic-two comparison is a separate theorem; do not substitute μ_2.

Prerequisites: PAPER-DITTMANN-POP-23/pfister-odd, PAPER-DITTMANN-POP-23/pfister-two, PAPER-DITTMANN-POP-23/kato-cohomology.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.pfisterInvariant.characterise` (characterisation): An n-fold form has invariant in H^n(F,Z/2(n−1)).
- API `DittmannPop.pfisterInvariant.structure` (structure): The invariant commutes with restriction.
- API `DittmannPop.pfisterInvariant.compatibility` (compatibility): The separately proved vanishing criterion identifies isotropy with zero invariant.

- Use: PAPER-DITTMANN-POP-23/nice-detection — Translate form anisotropy into nonzero cohomology classes with natural residue maps.

- Proposed test `DittmannPop.pfisterInvariant.test1`: A hyperbolic positive-fold Pfister form has zero invariant.
- Proposed test `DittmannPop.pfisterInvariant.test2`: The form x²+xy+y² over F_2 has nonzero invariant.
- Proposed test `DittmannPop.pfisterInvariant.test3`: Its invariant becomes zero after extension to F_4.

### pfister-invariant-zero — Vanishing of the Pfister symbol

**theorem · missing**. Fact 3.1(1); EKM Fact 16.2, Theorem 23.7(1)

q_a is isotropic over F iff e(q_a)=0 in H^{i+1}(F). The proof uses the symbol comparison and the Arason–Pfister dimension criterion, not merely a formal norm-residue isomorphism.

Original EKM proofs remain to be acquired.

Prerequisites: PAPER-DITTMANN-POP-23/pfister-invariant, PAPER-DITTMANN-POP-23/pfister-hyperbolic, PAPER-DITTMANN-POP-23/arason-pfister-bound, PAPER-DITTMANN-POP-23/graded-witt-invariant.

1. The zero invariant places the Witt class in I_q^{n+1}.
2. Its anisotropic part has dimension at most 2^n; the Arason–Pfister bound forces it to be zero.
3. Hyperbolic Pfister forms are isotropic, and conversely have zero invariant.

### pfister-invariant-natural — Naturality of the Pfister symbol

**theorem · missing**. Fact 3.1(2)

For every field extension E/F, e((q_a)_E)=res_E/F(e(q_a)).

Prerequisites: PAPER-DITTMANN-POP-23/pfister-invariant, PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Check the symbol's Kummer or Artin–Schreier/logarithmic construction commutes with field extension.
2. Transport this through the relevant cohomological comparison.

### henselization — Henselization of an arbitrary valued field

**construction · missing**. §2(b); Proposition 3.2; Lemma 3.9

For a valuation w of F, the w-henselization F_w is a separable algebraic immediate extension with its canonical extended henselian valuation, initial among compatible henselian valued extensions. Higher-rank valuations are permitted.

No pinned arbitrary-valuation henselization construction found; p-adic Hensel lemmas are narrower.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.henselization.characterise` (characterisation): The canonical field embedding respects the valuation.
- API `DittmannPop.henselization.structure` (structure): It extends uniquely to compatible henselian valued targets.
- API `DittmannPop.henselization.compatibility` (compatibility): Its residue-field and value-group maps are isomorphisms.

- Use: PAPER-DITTMANN-POP-23/henselian-prime-orbit — Use immediacy and the decomposition-field description for a finite henselian subextension.

- Proposed test `DittmannPop.henselization.test1`: Henselizing an already henselian field changes it only by canonical valued isomorphism.
- Proposed test `DittmannPop.henselization.test2`: The residue field is unchanged.
- Proposed test `DittmannPop.henselization.test3`: The extension is separable algebraic, unlike general completion.

### unit-reduction-isotropy — Unit Pfister isotropy and residue isotropy

**theorem · missing**. Proposition 3.2 proof, equation(*)

Let (F,w) be nontrivially henselian and non-dyadic, and all entries ε_j of a Pfister form be w-units. Then q_ε is isotropic over F iff its residue form is isotropic over Fw. Smoothness of the unit quadric and Hensel lifting give one direction; reduction of a minimally valued coordinate gives the other.

Prerequisites: PAPER-DITTMANN-POP-23/henselization, PAPER-DITTMANN-POP-23/pfister-odd, PAPER-DITTMANN-POP-23/pfister-two.

1. A nonzero residue zero of the nonsingular unit quadric lifts by Hensel's lemma.
2. For the converse scale a nonzero isotropic vector so a coordinate is a unit and all coordinates are integral; reduce it.
3. For arbitrary value groups choose a coordinate of minimal value among the finite set.

### principal-unit-isotropy — Principal-unit Pfister factor

**theorem · missing**. Proposition 3.2(1)

Under the preceding non-dyadic henselian unit hypotheses, if w(ε_1−1)>0 then q_{ε_1,ε_0} is isotropic, and so is any Pfister form having it as a factor.

Prerequisites: PAPER-DITTMANN-POP-23/unit-reduction-isotropy.

1. Its residue outer parameter is 1, so the residue binary-factor extension is hyperbolic.
2. Lift residue isotropy by unit-reduction-isotropy and then retain the zero vector in the larger tensor form.

### independent-values-isotropy — Independent valuation classes and anisotropy

**theorem · missing**. Proposition 3.2(2)

In a non-dyadic henselian field (F,w), let ε be a unit tuple and π_s,…,π_1∈F× have linearly independent images in wF/2wF. Then residue isotropy of q_ε, isotropy of q_ε over F, and isotropy of q_{π,ε} over F are equivalent.

In odd characteristic the tensor expansion carries (−1)^{|χ|}; these signs have value zero and do not change the distinct-value proof. Each block has N+1 coordinates; see E10.

Prerequisites: PAPER-DITTMANN-POP-23/unit-reduction-isotropy.

1. Expand into blocks weighted by products of the π_i.
2. Distinct mod-two value classes prevent cancellation among minimal-value anisotropic blocks.
3. The reverse direction extends an isotropic vector through one tensor summand.

### valuation-dimension-drop — Kronecker dimension drops under a valuation

**theorem · missing**. Proposition 3.2(3), proof p.7

For any field F of finite Kronecker dimension and any nontrivial valuation v, dim_Kr(Fv)<dim_Kr(F). No finite-generation, rank-one, discreteness or henselianity hypothesis is required. The direct residue-lifting proof separates equal and mixed characteristic and does not require the full Abhyankar inequality.

The exact dimension-drop input is now proved mathematically below. The general Engler–Prestel theorem is not claimed as newly read or formalized.

Prerequisites: PAPER-DITTMANN-POP-23/kronecker-dimension, PAPER-DITTMANN-POP-23/valued-prime-field, PAPER-DITTMANN-POP-23/residue-independent-unit-lifts.

1. If F and Fv have the same characteristic, the valuation is trivial on the prime field. Lift any finite residue-independent tuple and adjoin one element of positive value. The lifting lemma makes this enlarged tuple algebraically independent in F, so trdeg(Fv)+1≤trdeg(F). The two Kronecker dimensions have the same characteristic offset.
2. If char F=0 and char Fv=p, lift any residue-independent tuple over Fp. For a nonzero polynomial over Q, scale by a power of p so that all coefficients are p-integral and some coefficient is a unit. Its reduction cannot vanish at the tuple, so the lifts are Q-algebraically independent. Thus trdeg_Fp(Fv)≤trdeg_Q(F).
3. The Kronecker dimension of F is trdeg_Q(F)+1 in the second case, while that of Fv is trdeg_Fp(Fv), giving the strict inequality. The argument for all finite independent tuples also shows the residue transcendence degree is finite.

### finite-characteristic-c-field — Positive-characteristic C-field bound

**theorem · missing**. Proposition 3.2(3), Case 1

If E has characteristic p>0 and finite absolute transcendence degree e, it is C_{e+1}; in particular every quadratic form over E in more than 2^{e+1} variables is isotropic.

The source uses the usual algebraic-extension-stable C-field theorem; original proof remains a gap.

Prerequisites: PAPER-DITTMANN-POP-23/valuation-dimension-drop.

1. Finite fields are C_1; adjoining e independent variables raises the C-index by e.
2. Finite algebraic extensions preserve the bound; arbitrary algebraic extensions reduce every form to finite data.
3. Apply the degree-two variable-count criterion.

### real-place-finite-descent — Finite-stage descent of real-place isotropy

**theorem · missing**. Proposition 3.2(3), Case 2 and Claim

In the characteristic-zero residue case of Proposition 3.2(3), choose a residue field of representatives E⊂F and lift the unit coefficients to η∈E. If the original form is isotropic after every real closure of the constant field, there is a finitely generated E'⊂E containing η for which e(q_η) vanishes after every completion/real-closure base change of its constant field. The real-place step uses a projective system of finite bad-place sets and cohomology continuity.

Includes the coefficient-field and continuity inputs, not established by a name search.

Prerequisites: PAPER-DITTMANN-POP-23/valuation-dimension-drop, PAPER-DITTMANN-POP-23/pfister-invariant-zero, PAPER-DITTMANN-POP-23/equichar-zero-coefficient-field, PAPER-DITTMANN-POP-23/nonreal-local-cd-bound.

1. Lift residue coefficients through an equicharacteristic-zero coefficient field in the henselization.
2. For each nonreal constant place use nonreal-local-cd-bound directly; the printed finite bound on cd(E′) is false for formally real E′ (E6).
3. Descend coefficients and finitely many cohomology relations to a finitely generated subfield.
4. Use compactness of the inverse system of real-place bad sets to obtain one finite stage working at every real place.

### dimension-unit-isotropy — Dimension-bound isotropy of unit Pfister forms

**theorem · missing**. Proposition 3.2(3)

Let F be a nontrivially henselian non-dyadic valued field of finite Kronecker dimension r, with constant field k. For a unit tuple ε_r,…,ε_0, if q_ε is isotropic over Fk_v for every real closure k_v of k, then q_ε is isotropic over F.

Prerequisites: PAPER-DITTMANN-POP-23/unit-reduction-isotropy, PAPER-DITTMANN-POP-23/finite-characteristic-c-field, PAPER-DITTMANN-POP-23/real-place-finite-descent, PAPER-DITTMANN-POP-23/lgp-global-base.

1. Use the strict residue-dimension drop.
2. For positive residue characteristic apply the C-field bound.
3. For characteristic-zero residue use finite descent, the global-base Hasse principle and the Pfister vanishing criterion, then lift residue isotropy.

### nice-form — Niceness relative to a global subfield

**definition · missing**. Definition 3.3(1)–(2)

For a presented (d+1)-fold Pfister form q_a over an H_d field K and a global subfield k_1⊂K with a_1,a_0∈k_1×, call it k_1-nice if q_{a_1,a_0} is isotropic over k_{1v} whenever v is real, dyadic, has v(a_0)≠0, or has v(a_1)<0. Nice means k_1-nice for some global subfield.

These two clauses define one predicate and its existential abbreviation; presentation dependence is explicit.

Prerequisites: PAPER-DITTMANN-POP-23/hypothesis-hd, PAPER-DITTMANN-POP-23/pfister-odd, PAPER-DITTMANN-POP-23/pfister-two, PAPER-DITTMANN-POP-23/constant-place-fields.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.niceForm.characterise` (characterisation): The tail entries a_1,a_0 belong to the specified global subfield.
- API `DittmannPop.niceForm.structure` (structure): Each real, dyadic, nonunit-a_0 or negative-a_1 place makes the binary tail isotropic.
- API `DittmannPop.niceForm.compatibility` (compatibility): Changing outer parameters without changing the global tail preserves niceness.

- Use: PAPER-DITTMANN-POP-23/nice-parity — Force local anisotropy to occur at a non-dyadic place with odd last coefficient valuation.

- Proposed test `DittmannPop.niceForm.test1`: Over Q the tail a_1=a_0=1 is nice and hyperbolic.
- Proposed test `DittmannPop.niceForm.test2`: Over Q the tail a_1=a_0=−1 is not nice because its real form is positive definite.
- Proposed test `DittmannPop.niceForm.test3`: Every outer extension of a fixed nice presentation stays nice.

### nice-detection — Divisorial detection of a nice anisotropic form

**theorem · missing**. Proposition 3.4(1)

For H_d(K), a global subfield k_1⊂K and an anisotropic k_1-nice q_a, some prime divisor w of K has q_a anisotropic over K_w.

Prerequisites: PAPER-DITTMANN-POP-23/nice-form, PAPER-DITTMANN-POP-23/pfister-invariant-zero, PAPER-DITTMANN-POP-23/pfister-invariant-natural, PAPER-DITTMANN-POP-23/lgp-global-base, PAPER-DITTMANN-POP-23/lgp-good-model, PAPER-DITTMANN-POP-23/lgp-characteristic-two, PAPER-DITTMANN-POP-23/odd-degree-alteration, PAPER-DITTMANN-POP-23/odd-degree-injectivity.

1. Associate a nonzero cohomological Pfister invariant.
2. Use global-base local–global detection and choose a model at a detecting finite place.
3. Obtain a regular model through an odd-degree alteration without killing the class; apply model Hasse detection.
4. In characteristic two use the separate wild Hasse input.

### nice-parity — Parity and residue restrictions at detecting divisors

**theorem · missing**. Proposition 3.4(2)

Under Proposition 3.4's hypotheses, if q_a is anisotropic over K_w for a prime divisor w, then w is non-dyadic, w(a_0)=0, w(a_1)>=0, and at least one of w(a_i),1<=i<=d, is odd in the normalized value group Z.

Prerequisites: PAPER-DITTMANN-POP-23/nice-form, PAPER-DITTMANN-POP-23/dimension-unit-isotropy.

1. Niceness rules out dyadic, nonunit-a0 and negative-a1 restrictions.
2. If every remaining parameter value were even, remove squares to leave unit parameters.
3. Apply dimension-unit-isotropy to contradict the detecting anisotropy.

### global-nice-tail — Abundance of nice binary tails

**theorem · missing**. Lemma 3.5

For a finite separable extension l_1/k_1 of global fields and a finite set Σ of finite places of k_1, there are a_1,a_0∈k_1× whose valuations vanish at every v∈Σ such that q_{a_1,a_0} is k_1-nice and remains anisotropic over l_1.

Proof uses completely split places, weak and strong approximation, and openness of local norm groups in both global-field characteristics; those inputs need precise suppliers.

Prerequisites: PAPER-DITTMANN-POP-23/nice-form, PAPER-DITTMANN-POP-23/independent-values-isotropy, PAPER-DITTMANN-POP-23/split-place-input, PAPER-DITTMANN-POP-23/global-approximation-input.

1. Choose a completely split place outside the finite forbidden set and a0 with nonsplit residue binary form there.
2. Choose another place splitting the quadratic root field and prescribe a1 by strong approximation.
3. Local norms ensure niceness at all bad places; the odd value at the first split place preserves anisotropy over l1.

### separating-parameters — Separating parameters adapted to a geometric divisor

**theorem · missing**. Lemma 3.6

For H_d(K) and a geometric prime divisor w, there is a global subfield k_1 and an algebraically independent tuple u_{d−1},…,u_2 such that w is trivial on k_1(u) and Kw/k_1(u) is finite separable. Every u_d∈K with w(u_d)=1 extends u to a separating transcendence basis of K/k_1.

The inseparable-part argument uses the defectless fundamental equality for one-variable function fields; not general defectlessness of all valued fields.

Prerequisites: PAPER-DITTMANN-POP-23/prime-divisor.

1. Lift a separating residue transcendence basis and choose the constant/global subfield separately in each characteristic.
2. Add a uniformizer to obtain a transcendence basis upstairs.
3. For the remaining purely inseparable subextension, e=f=1; use the one-variable function-field fundamental equality to force degree one.

### test-form — Test form for a distinguished element

**definition · missing**. Definition 3.7

For H_d(K), global k_1⊂K, algebraically independent t_{d−1},…,t_2 over k_1 and a_d∈K×, a k_1,t-test form is a k_1-nice q_{a_d,…,a_0} with a_i=t_i−ε_i for 2<=i<d, where ε_i∈k_1× are units at every finite place v with v(a_1)>0.

Prerequisites: PAPER-DITTMANN-POP-23/nice-form.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.testForm.characterise` (characterisation): Extract the k_1-niceness predicate.
- API `DittmannPop.testForm.structure` (structure): Extract a_i=t_i−ε_i and ε_i∈k_1× for 2<=i<d.
- API `DittmannPop.testForm.compatibility` (compatibility): Each ε_i is a unit at every finite place where a_1 has positive value.

- Use: PAPER-DITTMANN-POP-23/test-abundance — Construct enough prescribed geometric-divisor tests with controlled global tails.

- Proposed test `DittmannPop.testForm.test1`: Every test form has a nice tail.
- Proposed test `DittmannPop.testForm.test2`: With transcendental t over Q and tail a_1=a_0=1, ε_2=1 satisfies the unit condition.
- Proposed test `DittmannPop.testForm.test3`: ε_i=0 is forbidden by the nonzero-parameter convention.

### test-abundance — Abundant test forms at a prescribed divisor

**theorem · missing**. Proposition 3.8

For H_d(K), geometric w, and global k_1 plus algebraically independent t such that w is trivial on k_1(t) and Kw/k_1(t) is finite separable, there is a Zariski open dense U⊂(k_1×)^{d−2} such that for each ε∈U a k_1-nice tail can be chosen so that every a_d with w(a_d) odd yields an anisotropic k_1,t-test form over K_w.

One tail per epsilon works for all odd-valuation a_d; requires finite normalization, its étale locus and the local power-series embedding. The paper correctly chooses Σ so every ε_i is a Σ-unit: this means a unit outside Σ. Thus Σ contains every nonunit place, and Lemma 3.5 makes a_1 a unit at each of them. This is a clarification, not a source error.

Prerequisites: PAPER-DITTMANN-POP-23/test-form, PAPER-DITTMANN-POP-23/global-nice-tail, PAPER-DITTMANN-POP-23/independent-values-isotropy, PAPER-DITTMANN-POP-23/etale-specialization-input.

1. Choose ε in the étale locus of the normalized torus and embed its function field into iterated Laurent series.
2. Apply global-nice-tail to the finite separable residue extension, taking the forbidden places to contain the nonunit places of ε.
3. Independent-value isotropy for the Laurent parameters and the odd value of a_d imply anisotropy.

### patch-spectrum — Patch topology of the valuation spectrum

**construction · library**. §3C, p.11; pinned carrier for Val(F)

The valuation spectrum Spv(A) of a commutative ring A has the topology induced by its injective relation-table map v↦((f,s)↦[v(f)<=v(s)]) into the Boolean product indexed by A×A.

Library: tauceti:TauCeti.ValuationSpectrum.patchTopology, tauceti:TauCeti.ValuationSpectrum.toPatch.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.patchSpectrum.characterise` (characterisation): Extract the Boolean valuation-comparison table.
- API `DittmannPop.patchSpectrum.structure` (structure): Equal comparison tables give equal spectrum points.
- API `DittmannPop.patchSpectrum.compatibility` (compatibility): Basic valuation comparisons with nonzero denominator are patch-clopen.

- Use: PAPER-DITTMANN-POP-23/henselian-generator-neighborhood — Make the finitely many polynomial valuation conditions clopen.

- Proposed test `DittmannPop.patchSpectrum.test1`: The trivial valuation is a point of Spv(F).
- Proposed test `DittmannPop.patchSpectrum.test2`: In the library's MULTIPLICATIVE convention, every point satisfies v(0)<=v(1) and not v(1)<=v(0).
- Proposed test `DittmannPop.patchSpectrum.test3`: For a field, valuation-ring membership a∈O_v is patch-clopen after the additive/multiplicative convention conversion.

### patch-compact — Compactness of the patch valuation spectrum

**theorem · library**. §3C, p.11; pinned compact-space theorem

For every commutative ring A the relation-table map of Spv(A) with its patch topology is a closed embedding into (A×A→Bool), and this patch space is compact. It is Hausdorff by the embedding into the Boolean product.

Library: tauceti:TauCeti.ValuationSpectrum.isClosedEmbedding_toPatch, tauceti:TauCeti.ValuationSpectrum.compactSpace_patchTopology.

Prerequisites: PAPER-DITTMANN-POP-23/patch-spectrum.

1. Use the pinned closed embedding into the Boolean product.
2. Compactness follows from the existing instance; the field-specific membership dictionary is a separate item.

### patch-field-dictionary — Valuation rings and the field patch topology

**theorem · missing**. §3C, p.11

For a field F, identify equivalence classes of valuations with valuation subrings and with Spv(F). The induced topology is the coarsest making {v:a∈O_v} clopen for every a∈F. For b≠0, a pairwise valuation comparison reduces to membership of a/b, so no new compactness proof is needed.

Adapter is missing even though the compactness input is built.

Prerequisites: PAPER-DITTMANN-POP-23/patch-spectrum, PAPER-DITTMANN-POP-23/patch-compact.

1. Over a field every valuation has zero support and yields a valuation subring.
2. For nonzero denominator convert comparisons into membership of ratios, translating additive/multiplicative conventions.
3. The two Boolean topologies therefore coincide, importing compactness.

### henselian-embedding-open — Open locus of henselian embeddings

**theorem · missing**. Lemma 3.9(1)

For a finite extension E/F the set of valuations w on F such that E admits an F-embedding into F_w is patch-open. If nonempty, E/F is separable; at each such w a henselian generator and derivative-unit condition give a clopen neighborhood.

Uses Kuhlmann–Novacoski Theorem 1.2 for the generator; original proof not read.

Prerequisites: PAPER-DITTMANN-POP-23/henselization, PAPER-DITTMANN-POP-23/patch-field-dictionary, PAPER-DITTMANN-POP-23/henselian-generator-input, PAPER-DITTMANN-POP-23/henselian-generator-neighborhood.

1. Choose the henselian generator and an approximate root x in F.
2. The finite coefficient-integrality, positive-polynomial-value and unit-derivative conditions define a patch-clopen neighborhood.
3. At every valuation in that neighborhood Hensel's lemma gives the required root and embedding.

### henselian-isotropy-open — Open locus of henselian isotropy

**theorem · missing**. Lemma 3.9(2)

For a quadratic form q over F the valuations w such that q is isotropic over F_w form a patch-open subset: an isotropic vector is defined over a finite subextension E/F of F_w and the embedding-open locus of E supplies a neighborhood.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-embedding-open.

1. An isotropic vector over a henselization has finitely many algebraic coordinates.
2. Descend it to a finite intermediate extension and use its patch-open embedding locus.

### quadratic-parameters — Quadratic changes of transcendence parameters

**construction · missing**. Notations 4.1(1); Proposition 3.10; Theorem 4.2(2)

For u_{d−1},…,u_2 algebraically independent over global k_1, put t_i=u_i²−u_i. Then k_1(u)/k_1(t) is finite separable, generated by these quadratic equations, and their relative algebraic closures in K agree. This construction is used in every characteristic.

Prerequisites: PAPER-DITTMANN-POP-23/separating-parameters.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.quadraticParameters.characterise` (characterisation): For every i, u_i²−u_i=t_i.
- API `DittmannPop.quadraticParameters.structure` (structure): The involution u_i↦1−u_i preserves t_i.
- API `DittmannPop.quadraticParameters.compatibility` (compatibility): The relative closures of k_1(u) and k_1(t) in K agree.

- Use: PAPER-DITTMANN-POP-23/detecting-domination — Translate the coordinate substitutions into test inequalities for the compactness argument.

- Proposed test `DittmannPop.quadraticParameters.test1`: u and 1−u give the same quadratic parameter.
- Proposed test `DittmannPop.quadraticParameters.test2`: In characteristic two the involution is u↦u+1.
- Proposed test `DittmannPop.quadraticParameters.test3`: For transcendental u the extension k(u)/k(u²−u) is separable of degree two.

### auxiliary-quadratic-field — Auxiliary quadratic root fields

**construction · missing**. Notations 4.1(3)

Fix a_d∈K×. For θ∈K× and τ∈K choose roots α²−α=a_d/θ² and β²−β=τ²/a_d in an algebraic closure, and set K_θ=K(α), K_τ=K(β), K_{θ,τ}=K(α,β). These are finite separable extensions (possibly trivial); different root choices give K-isomorphic fields.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.auxiliaryQuadraticField.characterise` (characterisation): Extract both generator equations.
- API `DittmannPop.auxiliaryQuadraticField.structure` (structure): The two root fields generate the compositum K_{θ,τ}.
- API `DittmannPop.auxiliaryQuadraticField.compatibility` (compatibility): Conjugating either generator by z↦1−z leaves its root field unchanged.

- Use: PAPER-DITTMANN-POP-23/anisotropy-union — Test isotropy over actual root fields, including trivial adjunctions.

- Proposed test `DittmannPop.auxiliaryQuadraticField.test1`: τ=0 gives K_τ=K.
- Proposed test `DittmannPop.auxiliaryQuadraticField.test2`: A generator already in K gives a trivial field extension.
- Proposed test `DittmannPop.auxiliaryQuadraticField.test3`: In characteristic two the derivative of X²−X−c is −1.

### detecting-nonnegative — Nonnegative coefficients in the auxiliary detection argument

**theorem · missing**. Proposition 3.10, Claim 1

In Proposition 3.10 fix N>0, θ=(a_{d−1}⋯a_1)^N and a detecting divisor w̃ of L(α). Then w̃(a_i)>=0 for i<d. Negative value of t_i−ε_i would make it a square times a principal unit and force isotropy.

Use a'_i=1−1/u_i−ε_i/u_i²; the printed plus sign on epsilon is a harmless-to-principal-unit but not literal algebraic identity.

Prerequisites: PAPER-DITTMANN-POP-23/nice-detection, PAPER-DITTMANN-POP-23/test-form, PAPER-DITTMANN-POP-23/quadratic-parameters, PAPER-DITTMANN-POP-23/principal-unit-isotropy.

1. If a_i=t_i−ε_i had negative value, the u_i²−u_i presentation makes u_i have negative value.
2. Divide by u_i²: the remaining factor is 1−1/u_i−ε_i/u_i², a principal unit.
3. Principal-unit isotropy contradicts detection; the minus sign before ε_i is essential in the identity.

### detecting-domination — Arbitrarily strong coefficient domination

**theorem · missing**. Proposition 3.10, Claim 2

With the same data, w̃(a_d)>N w̃(a_i) for every i<d and w̃(a_d)>0. If w̃(a_d)<2w̃(θ), the root equation again makes a_d a square times a principal unit.

Prerequisites: PAPER-DITTMANN-POP-23/detecting-nonnegative, PAPER-DITTMANN-POP-23/auxiliary-quadratic-field, PAPER-DITTMANN-POP-23/principal-unit-isotropy, PAPER-DITTMANN-POP-23/dimension-unit-isotropy.

1. Compare a_d with θ² using the auxiliary quadratic equation.
2. In the prohibited value range divide by a square and obtain a principal-unit factor.
3. Eliminate the zero-value case by dimension-unit-isotropy to obtain strict positivity.

### compact-detecting-valuation — Compactness produces an infinitely dominating valuation

**theorem · missing**. Proposition 3.10, pp.12–13

If the anisotropy hypotheses of Proposition 3.10 hold for every N>0, the nested patch-closed nonempty sets of valuations w on L for which q_a is anisotropic over L_w, w(a_i)>=0 and w(a_d)>Nw(a_i) have a common point w_a.

Prerequisites: PAPER-DITTMANN-POP-23/detecting-domination, PAPER-DITTMANN-POP-23/henselian-isotropy-open, PAPER-DITTMANN-POP-23/patch-compact, PAPER-DITTMANN-POP-23/patch-field-dictionary.

1. Each finite N has a detecting valuation by the previous claims.
2. Anisotropy is patch-closed, and finite value inequalities are clopen.
3. The closed sets are nested; compactness yields one valuation meeting every N-bound.

### coarsening-prime — Coarsening at an infinitely large coefficient

**construction · missing**. Proposition 3.10, p.13

For a valued field (F,w) and a∈F with γ=w(a)>0, put p={x∈F: γ<=Nw(x) for some positive integer N}, with zero included. This is a prime ideal of O_w. Localization (O_w)_p is a valuation ring coarsening w. If b≠0, w(b)>=0 and Nw(b)<γ for every N>0, b becomes a unit; a stays in the maximal ideal.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.coarseningPrime.characterise` (characterisation): Membership is γ<=Nw(x) for some N>0, including zero.
- API `DittmannPop.coarseningPrime.structure` (structure): Localization at this prime ideal gives the coarsened valuation ring.
- API `DittmannPop.coarseningPrime.compatibility` (compatibility): If 0<=w(b) and Nw(b)<γ for all N>0, b becomes a unit.

- Use: PAPER-DITTMANN-POP-23/coarsening-constant-trivial — Localize the valuation ring at the prime obtained from domination by the last coefficient.

- Proposed test `DittmannPop.coarseningPrime.test1`: For a discrete valuation and γ=1, this prime is the maximal ideal.
- Proposed test `DittmannPop.coarseningPrime.test2`: For lexicographic Z² and γ=(1,0), value (0,1) becomes a unit.
- Proposed test `DittmannPop.coarseningPrime.test3`: In that Z² example a positive first coordinate puts an element in the prime even if the second coordinate is negative.

### coarsening-henselian-inclusion — Henselizations under valuation coarsening

**theorem · missing**. Proposition 3.10, p.13(a)

For a coarsening w_L of w_a, compatible embeddings identify L_{w_L} with a subfield of L_{w_a}; consequently anisotropy over the latter implies anisotropy over the former.

Prerequisites: PAPER-DITTMANN-POP-23/henselization.

1. Compare decomposition groups or use the universal property of compatible henselizations under a valuation coarsening.
2. Embed the coarser henselization in the finer one; an isotropic vector upstairs in the former would contradict anisotropy in the latter.

### coarsening-constant-trivial — Triviality on the lower-dimensional base

**theorem · missing**. Proposition 3.10, Claim 3

The coarsened w_L in Proposition 3.10 is trivial on k_1(t). Nontriviality on k_1, then on k_1(t), each contradicts dimension-unit-isotropy for the unit tail. Since L/k_1(t) has transcendence degree one, w_L is a prime divisor.

Prerequisites: PAPER-DITTMANN-POP-23/coarsening-prime, PAPER-DITTMANN-POP-23/coarsening-henselian-inclusion, PAPER-DITTMANN-POP-23/dimension-unit-isotropy, PAPER-DITTMANN-POP-23/divisorial-discreteness, PAPER-DITTMANN-POP-23/function-field-discreteness.

1. Localize at the explicitly defined prime so lower parameters become units but a_d remains positive.
2. A nontrivial restriction to constants or k1(t) would force isotropy of the unit tail.
3. Use the one-variable discreteness theorem and residue-dimension comparison to identify a relative prime divisor.

### refined-detection — Refined positive odd divisor detection

**theorem · missing**. Proposition 3.10

Let H_d(K), L/K finite separable, a_d∈K×, k_1 global and u algebraically independent, t=u²−u. If a k_1,t-test form q_a stays anisotropic over L(α), α²−α=a_d/(a_{d−1}⋯a_1)^{2N}, for every N>0, then a prime divisor w_L of L trivial on k_1(t) satisfies w_L(a_d)>0 odd and q_a is anisotropic over L_{w_L}.

Prerequisites: PAPER-DITTMANN-POP-23/compact-detecting-valuation, PAPER-DITTMANN-POP-23/coarsening-constant-trivial, PAPER-DITTMANN-POP-23/nice-parity.

1. Combine the compact detecting valuation with its coarsening.
2. Apply the parity result once the coarsened prime divisor has been identified.

### relative-constant-field — The relative constant field k_t

**definition · missing**. Notations 4.1(2)

For k_1 and t=u²−u as above, k_t is the relative algebraic closure of k_1(t) in K; it equals k_u. Then K/k_t is a one-variable function field with k_t relatively algebraically closed in K.

Prerequisites: PAPER-DITTMANN-POP-23/quadratic-parameters.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.relativeConstantField.characterise` (characterisation): Membership means algebraicity over k_1(t).
- API `DittmannPop.relativeConstantField.structure` (structure): Algebraicity of k_1(u)/k_1(t) gives k_u=k_t.
- API `DittmannPop.relativeConstantField.compatibility` (compatibility): K/k_t is a one-variable function field with k_t relatively algebraically closed.

- Use: PAPER-DITTMANN-POP-23/refined-detection — Require the detecting valuation to be trivial on the algebraic constants of the selected rational subfield.

- Proposed test `DittmannPop.relativeConstantField.test1`: In k_1(u,v), the relative closure of k_1(u²−u) is k_1(u).
- Proposed test `DittmannPop.relativeConstantField.test2`: Every u_i belongs to k_t.
- Proposed test `DittmannPop.relativeConstantField.test3`: In k_1(u,v), v does not belong to this k_t.

### anisotropy-set — Universal auxiliary anisotropy set

**definition · missing**. Notations 4.1(4)

For the fixed test data a, define b_a={τ∈K: q_a is anisotropic over K_{θ,τ} for every θ∈k_t×}. The universal quantifier ranges over the definable relative subfield, not all of K×.

Prerequisites: PAPER-DITTMANN-POP-23/auxiliary-quadratic-field, PAPER-DITTMANN-POP-23/relative-constant-field, PAPER-DITTMANN-POP-23/test-form.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.anisotropySet.characterise` (characterisation): Membership universally quantifies θ over k_t×.
- API `DittmannPop.anisotropySet.structure` (structure): Changing the auxiliary root choices leaves membership unchanged.
- API `DittmannPop.anisotropySet.compatibility` (compatibility): For admissible test data b_a equals the union of the detecting balls.

- Use: PAPER-DITTMANN-POP-23/anisotropy-union — Identify the root-field anisotropy locus with a union of valuation balls.

- Proposed test `DittmannPop.anisotropySet.test1`: V_a empty implies b_a empty, hence zero is not a member.
- Proposed test `DittmannPop.anisotropySet.test2`: For singleton V_a, b_a equals that one ball.
- Proposed test `DittmannPop.anisotropySet.test3`: For nonempty V_a, zero belongs to b_a.

### stabilizer-ring — Multiplicative stabilizer of the anisotropy set

**definition · missing**. Notations 4.1(4)

Set O_a={x∈K: for every τ∈b_a, xτ∈b_a}. No assertion that this is a valuation ring is built into its definition.

Prerequisites: PAPER-DITTMANN-POP-23/anisotropy-set.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.stabilizerRing.characterise` (characterisation): x belongs iff it sends every element of b_a into b_a by multiplication.
- API `DittmannPop.stabilizerRing.structure` (structure): For admissible data it is the intersection of the detecting valuation rings.
- API `DittmannPop.stabilizerRing.compatibility` (compatibility): The stabilizer of the empty set is K.

- Use: PAPER-DITTMANN-POP-23/stabilizer-intersection — Recover the intersection of valuation rings from multiplicative preservation of the union.

- Proposed test `DittmannPop.stabilizerRing.test1`: Stab(empty)=K.
- Proposed test `DittmannPop.stabilizerRing.test2`: The stabilizer of a discrete valuation's maximal ideal is its valuation ring.
- Proposed test `DittmannPop.stabilizerRing.test3`: The scalar 1 belongs even when b_a is empty.

### detecting-divisor-set — Finite set of detecting divisors

**definition · missing**. Notations 4.1(5); Theorem 4.2 proof

V_a consists of prime divisors w of K trivial on k_t for which w(a_d)>0 and q_a is anisotropic over K_w. It is finite because positive valuations of a fixed rational function on its normal proper curve have finite support.

Prerequisites: PAPER-DITTMANN-POP-23/relative-constant-field, PAPER-DITTMANN-POP-23/test-form, PAPER-DITTMANN-POP-23/prime-divisor, PAPER-DITTMANN-POP-23/curve-model, PAPER-DITTMANN-POP-23/place-ring-dictionary.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.detectingDivisorSet.characterise` (characterisation): Membership requires triviality on k_t, positive value of a_d and henselian anisotropy.
- API `DittmannPop.detectingDivisorSet.structure` (structure): The set is finite, being inside the zero-support of a_d.
- API `DittmannPop.detectingDivisorSet.compatibility` (compatibility): Every member has positive odd normalized value on a_d.

- Use: PAPER-DITTMANN-POP-23/single-divisor — Use finite support and a prescribed odd pole to isolate one desired divisor.

- Proposed test `DittmannPop.detectingDivisorSet.test1`: If q_a is isotropic over K then V_a is empty.
- Proposed test `DittmannPop.detectingDivisorSet.test2`: If a_d has no relative zero then V_a is empty.
- Proposed test `DittmannPop.detectingDivisorSet.test3`: The isolation construction gives exactly {w}.

### valuation-ball — Odd-threshold valuation ball

**definition · missing**. Notations 4.1(5)

For w∈V_a put b_w={τ∈K: 2w(τ)>w(a_d)}. With w normalized and w(a_d)=2m+1>0 this is {τ:w(τ)>=m+1}, including zero.

Prerequisites: PAPER-DITTMANN-POP-23/detecting-divisor-set, PAPER-DITTMANN-POP-23/nice-parity.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.valuationBall.characterise` (characterisation): τ belongs iff 2w(τ)>w(a_d), with w(0)=infinity.
- API `DittmannPop.valuationBall.structure` (structure): For w(a_d)=2m+1 its threshold is w(τ)>=m+1.
- API `DittmannPop.valuationBall.compatibility` (compatibility): Addition and multiplication by O_w preserve the ball.

- Use: PAPER-DITTMANN-POP-23/ball-stabilizer — Use the strict inequality 2w(τ)>w(a_d), including parity and τ=0 conventions.

- Proposed test `DittmannPop.valuationBall.test1`: For w(a_d)=1 the ball is the maximal ideal.
- Proposed test `DittmannPop.valuationBall.test2`: For w(a_d)=3 value 1 is excluded and value 2 is included.
- Proposed test `DittmannPop.valuationBall.test3`: Zero belongs to the ball.

### ball-stabilizer — A valuation ball recovers its ring

**theorem · missing**. Notations 4.1(5)

For a nontrivial discrete valuation w and any integer threshold c, the multiplicative stabilizer of {τ:w(τ)>=c} equals O_w. In particular it recovers O_w from b_w above.

Prerequisites: PAPER-DITTMANN-POP-23/valuation-ball, PAPER-DITTMANN-POP-23/stabilizer-ring.

1. Nonnegative-value scalars preserve the threshold.
2. For a negative-value scalar choose an element of exact threshold using a uniformizer; its product falls outside.

### anisotropy-union — Auxiliary anisotropy is a union of balls

**theorem · missing**. Theorem 4.2(1), first equality

For data of Notations 4.1 in an H_d field, b_a=⋃_{w∈V_a}b_w. The reverse inclusion uses Hensel roots of both auxiliary equations; the forward inclusion applies refined-detection to L=K_τ and uses odd parity to obtain a strict inequality.

Prerequisites: PAPER-DITTMANN-POP-23/anisotropy-set, PAPER-DITTMANN-POP-23/valuation-ball, PAPER-DITTMANN-POP-23/refined-detection, PAPER-DITTMANN-POP-23/henselization, PAPER-DITTMANN-POP-23/principal-unit-isotropy.

1. If τ lies in a detecting ball, both auxiliary roots lie in the corresponding henselization, preserving anisotropy.
2. Conversely apply refined-detection to K_τ; restrict the resulting divisor to K.
3. The root equation and odd parity give 2w(τ)>w(a_d).

### stabilizer-intersection — Stabilizer equals an intersection of valuation rings

**theorem · missing**. Theorem 4.2(1), second equality

For the same data, O_a=⋂_{w∈V_a}O_w. If x has negative valuation at one w, weak approximation constructs y∈b_w with minimal w-value but xy outside every b_{w'}; this proves the nontrivial inclusion. Empty V_a gives b_a=empty and O_a=K.

Requires independent finite valuations and weak approximation, not the false claim that stabilization of any union equals the intersection of all stabilizers.

Prerequisites: PAPER-DITTMANN-POP-23/anisotropy-union, PAPER-DITTMANN-POP-23/ball-stabilizer, PAPER-DITTMANN-POP-23/function-field-weak-approximation.

1. Every scalar integral at all detecting divisors preserves the union of balls.
2. If x has negative value at one divisor, weak approximation chooses y at that ball's minimal threshold and arranges xy outside every other ball.
3. Handle the empty set separately: its stabilizer is the whole field.

### prescribed-pole — One prescribed pole in a function field

**theorem · library**. Theorem 4.2(2), Riemann–Roch input

For fields k⊂F with F a one-variable function field and k relatively algebraically closed in F, every place P and natural n>=2g admit f≠0 with ord_P(f)=−n and ord_Q(f)>=0 for every Q≠P. For n>0 this gives pole divisor nP.

Library: tauceti:TauCeti.Place.exists_ord_eq_neg_and_forall_ne_ord_nonneg.

1. Apply the pinned high-degree prescribed-pole theorem with n>=2g.
2. The downstream use chooses n positive and odd; no scheme-side Riemann–Roch is rebuilt.

### single-divisor — Isolation of one geometric prime divisor

**theorem · missing**. Theorem 4.2(2)

For every geometric prime divisor w of H_d(K), choose k_1,u and test data with V_a={w}. Choose an odd m>=2g and a function with sole pole mP, take a_d=1/f, and use test-abundance. Then O_w is the multiplicative stabilizer of b_a.

Prerequisites: PAPER-DITTMANN-POP-23/separating-parameters, PAPER-DITTMANN-POP-23/relative-constant-field, PAPER-DITTMANN-POP-23/prescribed-pole, PAPER-DITTMANN-POP-23/test-abundance, PAPER-DITTMANN-POP-23/stabilizer-intersection.

1. Choose separating data and its quadratic transform.
2. Use a function with sole pole of positive odd order, taking a_d to be its inverse.
3. Choose the test tail by test-abundance; finite zero support now isolates precisely w.

### valuation-filter — First-order valuation-ring filter

**construction · missing**. Recipe 4.3

Express admissibility of all test parameters and the definition of O_a in the ring language. Retain a fiber only if O_a is a proper valuation subring (for every x≠0, x or x^{-1} belongs); otherwise define the empty fiber. A finite intersection of the pairwise independent divisor rings is a proper valuation ring only when it is a single one.

Includes a finite-intersection lemma and parameter guard; neither is hidden in an informal instruction to check valuation.

Prerequisites: PAPER-DITTMANN-POP-23/stabilizer-intersection, PAPER-DITTMANN-POP-23/global-subfield-definability, PAPER-DITTMANN-POP-23/relative-independence, PAPER-DITTMANN-POP-23/quadratic-extension-formulas.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.valuationFilter.characterise` (characterisation): A nonempty accepted fiber has admissible parameters and is a proper valuation ring.
- API `DittmannPop.valuationFilter.structure` (structure): Rejected parameter tuples give the empty fiber.
- API `DittmannPop.valuationFilter.compatibility` (compatibility): Every isolated geometric divisor is attained.

- Use: PAPER-DITTMANN-POP-23/uniform-divisors — Reject the whole field and all non-proper valuation-ring candidates so invalid parameters give empty fibers.

- Proposed test `DittmannPop.valuationFilter.test1`: A candidate equal to K is rejected.
- Proposed test `DittmannPop.valuationFilter.test2`: A candidate missing both x and x^{-1} for some x≠0 is rejected.
- Proposed test `DittmannPop.valuationFilter.test3`: An isolated divisor's parameters return exactly its valuation ring.

### small-dimension-inputs — Uniform divisors in Kronecker dimensions one and two

**theorem · missing**. Remark 4.4, Rumely Introduction I–II and Pop 2017 Theorem 1.2

In dimension one, prime divisors of global fields are uniformly definable; geometric ones occur precisely for global function fields. In dimension two, geometric prime divisors are uniformly definable by Pop's curve-over-global-field theorem after choosing a global subfield on which the divisor is trivial.

Original Rumely and Pop proofs not yet read; must keep arithmetic places of number fields out of the geometric family.

Prerequisites: PAPER-DITTMANN-POP-23/prime-divisor.

1. Use Rumely's global-field family at dimension one.
2. Use Pop's function-field-of-a-curve-over-global-field result at dimension two.
3. Keep these as source-qualified inputs until the original definitions and proofs are audited.

### dimension-definability — First-order detection of Kronecker dimension

**theorem · missing**. §4 opening; Poonen Theorem 2.3 citing Pop 2002

For every nonnegative integer d there is a ring sentence which, among finitely generated fields, holds exactly in those of Kronecker dimension d.

Prerequisites: PAPER-DITTMANN-POP-23/kronecker-dimension.

1. Import the fixed-dimension sentence from the results summarized in Poonen Theorem 2.3.
2. Separate characteristic-zero and positive-characteristic Kronecker shifts.

### constant-definability — Uniform definition of constants

**theorem · missing**. §5 Proposition 5.1; Poonen Theorem 1.3

There is a ring formula ψ(t), independent of the finitely generated field K, whose solutions are exactly the relative algebraic closure κ of the prime field in K.

Prerequisites: PAPER-DITTMANN-POP-23/constant-field, PAPER-DITTMANN-POP-23/definable-set.

1. Use Poonen Theorem 1.3, whose proof is in the selected §5 reading.
2. Record its internal elliptic/global-subfield ingredients as remaining source leaves.

### global-subfield-definability — Uniform family of maximal global subfields

**theorem · missing**. §4 opening and Notations 4.1(1); Poonen Lemma 3.7, Proposition 4.10

The relatively algebraically closed global subfields k_1 of a finitely generated field K form a uniformly definable family. In characteristic zero the unique such field is κ; in positive characteristic use Poonen Proposition 4.10. A dimension-one filter excludes other subfields.

Poonen Theorem 1.4 by itself states absolute dependence, not this family; the extraction supplies the actual locators.

Prerequisites: PAPER-DITTMANN-POP-23/constant-definability, PAPER-DITTMANN-POP-23/dimension-definability.

1. In characteristic zero use the definable constant field.
2. In positive characteristic use Poonen Proposition 4.10's family.
3. Apply the dimension-one and relative-algebraic-closure conditions to select the intended global subfields.

### relative-independence — Definable algebraic independence over a global subfield

**theorem · missing**. §4 opening; Poonen Lemma 5.3

For each n, a formula in the ring language augmented with a predicate for a relatively algebraically closed global subfield L detects whether an n-tuple in a finitely generated extension K/L is algebraically dependent over L; negate it for independence.

Prerequisites: PAPER-DITTMANN-POP-23/global-subfield-definability.

1. Use Poonen Lemma 5.3 with an explicit predicate for the global subfield.
2. Replace that predicate by its uniform defining formula and negate dependence.

### quadratic-extension-formulas — First-order translation through quadratic extensions

**construction · missing**. §4 opening and Notations 4.1(3)–(4)

For fixed Pfister length and parameters defining K_θ,K_τ, express isotropy and anisotropy after their compositum by finitely many ring formulas on basis coordinates, splitting the cases of a root already in the field, a genuine quadratic extension, and collapse of the second extension. The translation is equivalent to anisotropy over the root FIELD, not over a reducible quotient algebra.

Necessary explicit bridge; the paper treats bounded finite-extension interpretation as standard.

Prerequisites: PAPER-DITTMANN-POP-23/auxiliary-quadratic-field, PAPER-DITTMANN-POP-23/interpretation, PAPER-DITTMANN-POP-23/ring-language.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.quadraticExtensionFormulas.characterise` (characterisation): Translate equality and operations using a basis of each genuine quadratic extension.
- API `DittmannPop.quadraticExtensionFormulas.structure` (structure): Split off the cases in which a root already lies in the base or the second adjunction collapses.
- API `DittmannPop.quadraticExtensionFormulas.compatibility` (compatibility): Isotropy over the root field agrees with the translated existential formula and anisotropy with its negation.

- Use: PAPER-DITTMANN-POP-23/uniform-divisors — Encode isotropy in quadratic root fields by ring formulas with explicit split/trivial branches.

- Proposed test `DittmannPop.quadraticExtensionFormulas.test1`: If τ=0 the second extension translation reduces to the first extension only.
- Proposed test `DittmannPop.quadraticExtensionFormulas.test2`: For X²−X with both roots in K, the translation uses K, not the split algebra K×K.
- Proposed test `DittmannPop.quadraticExtensionFormulas.test3`: In characteristic≠2 when 1+4c=0, adjoining a root of X²−X−c gives K, not a quadratic field.

### normalization-ring — Integral closure generated by a transcendence basis

**construction · missing**. Proposition 5.1

For a transcendence basis T of finitely generated K over its prime field, let R_T be the integral closure in K of the subring generated by T. Writing κ for constants and A=κ in characteristic p or O_κ in characteristic zero, the same ring is the integral closure of A[T] in K.

Prerequisites: PAPER-DITTMANN-POP-23/constant-field.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.normalizationRing.characterise` (characterisation): Membership is integrality over the prime-ring algebra generated by T.
- API `DittmannPop.normalizationRing.structure` (structure): This equals the integral closure of A[T] with A=κ or O_κ.
- API `DittmannPop.normalizationRing.compatibility` (compatibility): Its fraction field is K.

- Use: PAPER-DITTMANN-POP-23/normalization-finite — Obtain a finite module over A[T] and a finitely generated domain with fraction field K.

- Proposed test `DittmannPop.normalizationRing.test1`: For Q(t), R_{t}=Z[t].
- Proposed test `DittmannPop.normalizationRing.test2`: For F_q(t), R_{t}=F_q[t].
- Proposed test `DittmannPop.normalizationRing.test3`: For Q(√2)(t), R_{t}=Z[√2][t], not Q(√2)[t].

### normalization-finite — Finiteness of the normalization ring

**theorem · missing**. Proposition 5.1 proof; Eisenbud Corollary 13.13 and Proposition 13.14

R_T is finite as an A[T]-module and is consequently a finitely generated integral domain over the prime ring; its fraction field is K. The required finiteness is for arbitrary finite extensions in positive characteristic, including inseparable ones.

Separability-only integral-closure theorems do not cover the full statement.

Prerequisites: PAPER-DITTMANN-POP-23/normalization-ring, PAPER-DITTMANN-POP-23/finite-normalization-generic.

1. Apply finite-normalization-generic to A[T]⊂K.
2. Finite module generation over the finitely generated prime-ring algebra implies finite ring generation.
3. Localization of the integral closure has fraction field K.

### geometric-normalization — Normalization over the constant field

**construction · missing**. Proposition 5.1 proof, p.16

S_T is the integral closure of κ[T] in K. Let W_T be the geometric prime divisors w of K with T⊂O_w. This W_T is a rank-one family, distinct from the maximal-rank flags used later in characteristic zero.

Prerequisites: PAPER-DITTMANN-POP-23/normalization-ring, PAPER-DITTMANN-POP-23/prime-divisor.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.geometricNormalization.characterise` (characterisation): Membership in S_T is integrality over κ[T].
- API `DittmannPop.geometricNormalization.structure` (structure): W_T comprises rank-one geometric prime divisors integral on T.
- API `DittmannPop.geometricNormalization.compatibility` (compatibility): S_T is the intersection of their valuation rings.

- Use: PAPER-DITTMANN-POP-23/normalization-intersection — Intersect rank-one geometric divisors integral on the chosen basis.

- Proposed test `DittmannPop.geometricNormalization.test1`: For Q(t), S_{t}=Q[t] while R_{t}=Z[t].
- Proposed test `DittmannPop.geometricNormalization.test2`: For F_q(t), S_{t}=R_{t}.
- Proposed test `DittmannPop.geometricNormalization.test3`: The pole-at-infinity place of t is not in W_T.

### normalization-intersection — Geometric normalization as a divisorial intersection

**theorem · missing**. Proposition 5.1 proof, p.16; Matsumura Theorem 11.5(ii)

S_T=⋂_{w∈W_T}O_w. One inclusion uses integrality of valuation rings; the other uses the intersection of height-one localizations of the normal noetherian domain S_T. Consequently S_T is definable using the uniform divisor formula.

The underlying Krull-domain intersection input needs its own library check.

Prerequisites: PAPER-DITTMANN-POP-23/geometric-normalization, PAPER-DITTMANN-POP-23/normalization-finite, PAPER-DITTMANN-POP-23/uniform-divisors, PAPER-DITTMANN-POP-23/small-dimension-inputs, PAPER-DITTMANN-POP-23/krull-intersection.

1. Every valuation ring containing T and κ contains S_T by integrality.
2. Conversely height-one localizations of normal S_T are geometric prime-divisor rings containing T.
3. Intersect using the Krull-domain theorem, then translate the universal quantifier over the definable family.

### maximal-geometric-flags — Full-rank geometric valuation flags

**definition · missing**. Proposition 5.1 proof, p.16

In characteristic zero let e=trdeg(K/κ). A geometric prime e-divisor is a valuation trivial on κ with ordered value group Z^e in lexicographic order, obtained by composing e geometric rank-one residue valuations. Its final residue field κ_w is a finite extension of κ. Denote by G_T those for which T⊂O_w.

Uses a new symbol G_T to resolve the printed reuse of rank-one W_T in the subsequent V_T formula.

Prerequisites: PAPER-DITTMANN-POP-23/prime-divisor, PAPER-DITTMANN-POP-23/constant-field.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.maximalGeometricFlags.characterise` (characterisation): A full e-step geometric flag has value group Z^e lexicographically.
- API `DittmannPop.maximalGeometricFlags.structure` (structure): Its final residue field is finite over κ.
- API `DittmannPop.maximalGeometricFlags.compatibility` (compatibility): G_T requires the full composite valuation to be nonnegative on T.

- Use: PAPER-DITTMANN-POP-23/arithmetic-intersection — Iterate geometric residues until the final residue is a number field before using arithmetic primes.

- Proposed test `DittmannPop.maximalGeometricFlags.test1`: For Q(t), e=1 and the final residue is a number field.
- Proposed test `DittmannPop.maximalGeometricFlags.test2`: In Q(t_1,t_2), the single divisor t_1=0 is not a full rank-two flag.
- Proposed test `DittmannPop.maximalGeometricFlags.test3`: The flag t_1=0 followed by t_2=0 has final residue Q.

### residue-interpretation — Definable residue field

**construction · missing**. Fact 5.2

If O_w⊂F is a definable valuation ring, its maximal ideal is definable from nonunits, and the quotient O_w/m_w with its residue map is interpretable as a definable quotient in F.

Prerequisites: PAPER-DITTMANN-POP-23/interpretation.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.residueInterpretation.characterise` (characterisation): The maximal ideal consists of zero and nonunits of O_w.
- API `DittmannPop.residueInterpretation.structure` (structure): Representatives have equal residues iff their difference is in that ideal.
- API `DittmannPop.residueInterpretation.compatibility` (compatibility): Addition and multiplication descend from O_w.

- Use: PAPER-DITTMANN-POP-23/composition-definability — Compose the definable quotient interpretations along a fixed-length valuation flag.

- Proposed test `DittmannPop.residueInterpretation.test1`: The p-adic valuation ring of Q has interpreted residue F_p.
- Proposed test `DittmannPop.residueInterpretation.test2`: Representatives differing by an element of the maximal ideal agree.
- Proposed test `DittmannPop.residueInterpretation.test3`: Every unit has nonzero residue.

### composition-definability — Definability of composite valuations

**theorem · missing**. Fact 5.2

If O_{w'}⊂F and O_{w''}⊂Fw' are definable, the composite valuation ring is the inverse image of O_{w''} under O_{w'}→Fw'. It is definable in F after translating through the residue interpretation; an iterated fixed-length family remains uniform.

Prerequisites: PAPER-DITTMANN-POP-23/residue-interpretation.

1. Define nonunits of O_w as the maximal ideal and interpret the residue field by its equality kernel.
2. Pull the second valuation predicate back to representatives.
3. Iterate a fixed number of times, retaining all parameters.

### arithmetic-flags — Arithmetic refinements of geometric flags

**definition · missing**. Proposition 5.1 end; Lemma 5.3

In characteristic zero set V_T={v∘w: w∈G_T, v a finite prime of the number field κ_w=Kw, and each t∈T lies in O_{v∘w}}. Its members are full-rank arithmetic valuation rings, not merely discrete rank-one rings.

The full-rank interpretation is required by finiteness of κ_w; the printed W_T notation is ambiguous.

Prerequisites: PAPER-DITTMANN-POP-23/maximal-geometric-flags, PAPER-DITTMANN-POP-23/composition-definability, PAPER-DITTMANN-POP-23/rumely-global-definitions.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.arithmeticFlags.characterise` (characterisation): Extract a full-rank geometric prefix with finite number-field residue.
- API `DittmannPop.arithmeticFlags.structure` (structure): The final factor is a finite prime of that residue number field.
- API `DittmannPop.arithmeticFlags.compatibility` (compatibility): Every parameter of T has nonnegative composite value.

- Use: PAPER-DITTMANN-POP-23/coefficient-detection — Append a finite number-field prime to a full geometric flag to detect a nonintegral polynomial coefficient.

- Proposed test `DittmannPop.arithmeticFlags.test1`: For Q(t), t=0 followed by the p-adic place gives a permitted flag.
- Proposed test `DittmannPop.arithmeticFlags.test2`: A lone geometric divisor on Q(t_1,t_2) cannot provide a number-field residue for the final step.
- Proposed test `DittmannPop.arithmeticFlags.test3`: A real place is not an allowed final factor.

### arithmetic-intersection — Arithmetic normalization from composed valuations

**theorem · missing**. Lemma 5.3

In characteristic zero, R_T=⋂_{v∘w∈V_T}O_{v∘w}. Reduce finite extensions to K_0=κ(T) using prolongation of valuation rings and integral-closure detection, then detect every nonintegral coefficient of a polynomial with a residue-specialization flag.

Prerequisites: PAPER-DITTMANN-POP-23/arithmetic-flags, PAPER-DITTMANN-POP-23/normalization-intersection, PAPER-DITTMANN-POP-23/coefficient-detection, PAPER-DITTMANN-POP-23/valuation-prolongation-integrality.

1. One inclusion follows from integrality in every arithmetic flag ring.
2. Use all finite-extension prolongations to reduce to K=κ(T).
3. Full geometric flags remove non-polynomial elements; coefficient detection then removes nonintegral coefficients.

### coefficient-detection — Flags detect a nonintegral polynomial coefficient

**theorem · missing**. Lemma 5.3, proof of Claim

For K_0=κ(T), a finite place v of κ and f=cg with g∈O_v[T] having nonzero reduction, choose a tuple ζ over an algebraic closure of κv where gbar(ζ)≠0, lift its nonzero coordinates to prime-to-residue-characteristic roots of unity, and use the associated full-rank geometric flag plus a prolongation v'. Then g is a unit for v'∘w and nonintegrality of c forces nonintegrality of f.

Choose ζ in the torus, possible since a nonzero polynomial cannot vanish on every torus point over an infinite algebraic closure; this makes the roots-of-unity lifting literal.

Prerequisites: PAPER-DITTMANN-POP-23/arithmetic-flags.

1. Choose a nonzero residue evaluation on the algebraic torus, so every coordinate is nonzero.
2. Lift coordinates to roots of unity of order prime to the residue characteristic.
3. The full-rank flag plus prolonged finite place makes g a unit and records the valuation of c.

### normalization-definable — Definability of the finitely generated normalization ring

**theorem · missing**. Proposition 5.1

For H_d(K) and transcendence basis T, R_T is a parameter-definable finitely generated domain with fraction field K. In characteristic p it is S_T; in characteristic zero use V_T and arithmetic-intersection.

Prerequisites: PAPER-DITTMANN-POP-23/normalization-finite, PAPER-DITTMANN-POP-23/normalization-intersection, PAPER-DITTMANN-POP-23/arithmetic-intersection, PAPER-DITTMANN-POP-23/coefficient-detection, PAPER-DITTMANN-POP-23/constant-definability, PAPER-DITTMANN-POP-23/composition-definability.

1. Use definable constants and the rank-one geometric normalization intersection.
2. In characteristic zero iterate residue interpretations to obtain full-rank geometric flags, then use uniform global-prime predicates.
3. Apply arithmetic-intersection; finite generation was proved separately.

### normalization-uniform — Uniformity for fixed dimension

**theorem · missing**. Remark 5.4

For each fixed d the formula defining R_T can be chosen uniformly for H_d fields, with the elements of T among its parameter variables. This does not assert a parameter-free definition of each normalization.

Prerequisites: PAPER-DITTMANN-POP-23/normalization-definable.

1. For fixed d every tuple length and flag length is fixed.
2. Replace individual parameters and basis elements by formula variables; quantify over each definable family.

### fraction-interpretation — Interpretation of a fraction field

**construction · missing**. AKNS Examples 2.9(4); §5 final proof

For an integral domain R, represent Frac(R) by pairs (a,b)∈R×(R\{0}), modulo (a,b)~(c,d) iff ad=bc; field operations and equality have definable graphs. The quotient is an interpretation, not necessarily a definable subset of R itself.

Prerequisites: PAPER-DITTMANN-POP-23/interpretation.

1. Use the explicit formula or construction in the statement; the API below specifies its projections, semantic comparisons and downstream laws. Those laws are planning contracts, not implementation claims.

- API `DittmannPop.fractionInterpretation.characterise` (characterisation): Cross multiplication characterizes equality of valid pairs.
- API `DittmannPop.fractionInterpretation.structure` (structure): [(a,b)]+[(c,d)]=[(ad+bc,bd)].
- API `DittmannPop.fractionInterpretation.compatibility` (compatibility): [(a,b)]·[(c,d)]=[(ac,bd)].

- Use: PAPER-DITTMANN-POP-23/field-ring-biinterpretation — Recover the field from its definable normalization domain with a definable identification of fraction pairs.

- Proposed test `DittmannPop.fractionInterpretation.test1`: [(1,2)]=[(2,4)] in Frac(Z).
- Proposed test `DittmannPop.fractionInterpretation.test2`: [(1,2)]+[(1,3)]=[(5,6)].
- Proposed test `DittmannPop.fractionInterpretation.test3`: Pairs with denominator zero are excluded.

### field-ring-biinterpretation — Bi-interpretation with the definable normalization

**theorem · missing**. §5, final proof pp.17–18

If R⊂K is the definable normalization domain above and Frac(R)=K, the residue-free fraction-pair interpretation and the definable inclusion of R in K form a bi-interpretation. The composite identifications are x↦[(a,b)] with bx=a and r↦[(r,1)].

Prerequisites: PAPER-DITTMANN-POP-23/normalization-definable, PAPER-DITTMANN-POP-23/fraction-interpretation, PAPER-DITTMANN-POP-23/biinterpretation.

1. Interpret K as fraction pairs in R_T.
2. The equation bx=a identifies a field element with its fraction class.
3. The pair (r,1) identifies the composite copy of R_T, with the fixed definition parameters represented by fraction pairs.

### domain-biinterpretability — Integer arithmetic in an infinite finitely generated domain

**theorem · missing**. AKNS Theorem 3.1; §5 final proof

Every infinite finitely generated integral domain, in the ring language, is parametrically bi-interpretable with Z. This theorem is about finite ring generation and is applied to R_T, not directly to K as a ring.

AKNS §3.2 proof read; its normalization and interpretation lemmas remain explicit source-audit leaves.

Prerequisites: PAPER-DITTMANN-POP-23/biinterpretation.

1. Use AKNS Theorem 3.1; its §3.2 proof reduces through Noether normalization and finite extensions to one-dimensional arithmetic.
2. The graph comparison for polynomial rings is controlled by evaluation and the selected coding lemmas.
3. Unaudited §3.1/coding and global-number-field leaves remain explicit.

### qfa-theorem — Bi-interpretability yields quasi-finite axiomatizability

**theorem · missing**. AKNS §2.9, Proposition 2.28

Let L be a finite language and A a finitely generated L-structure bi-interpretable with Z. For a finite generating tuple a there is a formula φ_A(x) such that, for every finitely generated L-structure B and tuple b, B⊨φ_A(b) iff an L-isomorphism A→B sends a to b. Existentially quantifying x gives the corresponding sentence within this class.

Keep the finite-generation-of-L-structure premise. AKNS Lemma 2.29 imports a coding/standardness argument whose external proof is not yet audited.

Prerequisites: PAPER-DITTMANN-POP-23/biinterpretation.

1. Use AKNS Proposition 2.28 for a finitely generated structure in a finite language.
2. Its coding and rigidity lemmas produce a formula fixing the image of a generating tuple.
3. Existentially quantify that tuple to obtain one sentence; constants are not left in the concluding language.

### inverse-language-bridge — From field generation to the ring-language sentence

**theorem · missing**. §5 final sentence, explicit bridge to AKNS Proposition 2.28

Expand the ring language by total inversion with graph (x=0∧y=0)∨xy=1. A finitely generated field is finitely generated in this finite expanded language; definitional expansion preserves parametric bi-interpretability. Apply qfa-theorem there and eliminate inversion by its unique ring-definable graph. The resulting parameter-free ring sentence characterizes K among finitely generated fields.

Authored proof bridge making the source's compressed final implication valid; no claim that an infinite field is finitely generated as a ring.

Prerequisites: PAPER-DITTMANN-POP-23/qfa-theorem, PAPER-DITTMANN-POP-23/main-biinterpretability, PAPER-DITTMANN-POP-23/ring-language.

1. Expand by a total inverse symbol defined uniquely by (x=0 and y=0) or xy=1.
2. Field generation becomes structure generation in this finite language.
3. Transfer bi-interpretability through the definitional expansion, apply QFA, then eliminate the inverse symbol.

### function-field-discreteness — Discreteness of one-variable valuation rings

**theorem · library**. Proposition 3.10, last step; pinned OfValuationSubring.lean, theorem at line 217

Let k and F be fields with k→F and IsFunctionField k F. Every proper valuation subring A⊊F containing the image of k is a discrete valuation ring.

Library: tauceti:TauCeti.isDiscreteValuationRing_of_isFunctionField.

1. Apply the existing function-field theorem; no perfectness or separability assumption is required.

### place-ring-dictionary — Places recover their valuation rings

**theorem · library**. Notations 4.1 and Theorem 4.2, curve/place dictionary; pinned OfValuationSubring.lean lines 289–339

Under the preceding hypotheses there is a unique place P of F/k whose ring of integers is A.

Library: tauceti:TauCeti.Place.ofValuationSubring, tauceti:TauCeti.Place.integers_ofValuationSubring, tauceti:TauCeti.Place.existsUnique_integers_eq.

Prerequisites: PAPER-DITTMANN-POP-23/function-field-discreteness.

1. Use Place.ofValuationSubring and its integers equality; uniqueness is integers_injective.

### curve-model — Regular projective model of a one-variable field

**theorem · planned**. Notations 4.1(5), Theorem 4.2 proof

For a finitely generated extension F/k of transcendence degree one, normalization of P¹_k in F gives a regular projective integral k-curve with function field F and closed points corresponding to the places of F/k. Over imperfect k, do not replace regular by smooth without additional assumptions.

Planned: tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts.

1. Import upstream AlgebraicCurves Layer 12B–D and its point/place order dictionary.

### finite-normalization-generic — Finiteness of normalization over arithmetic polynomial rings

**theorem · planned**. Proposition 5.1; Eisenbud Corollary 13.13 and Proposition 13.14

Let A be a field or the ring of integers of a number field, T a finite tuple of independent variables, and E/Frac(A[T]) a finite field extension. The integral closure of A[T] in E is a finite A[T]-module, without a separability restriction.

Same existing A0-extension owner. The reviewed audit already identifies the purely inseparable polynomial result; this continuation imports it explicitly. General excellent-scheme normalization is a different, broader target.

Planned: AlgebraicModuliForArithmeticGeometry:A0-extension.

Prerequisites: PAPER-DITTMANN-POP-23/separable-normalization-finite, PAPER-DITTMANN-POP-23/purely-inseparable-normalization-finite, PAPER-DITTMANN-POP-23/normal-envelope-finite, PAPER-DITTMANN-POP-23/normal-fixed-field-pure, PAPER-DITTMANN-POP-23/finite-action-fixed-field-galois, PAPER-DITTMANN-POP-23/integral-closure-tower-bottom, PAPER-DITTMANN-POP-23/finite-normalization-injective-descent.

1. For characteristic-zero A (a field or a number-field integer ring), A[T] is normal noetherian and every finite fraction-field extension is separable: invoke IsIntegralClosure.finite.
2. For a field k of positive characteristic, put P=k[T] and enlarge E/Frac(P) to its finite normal envelope N.
3. Let I=N^Aut(N/Frac(P)). Import the purely inseparable lower step Frac(P)⊂I and the Galois upper step I⊂N. The reverse ordering is essential.
4. The integral closure C of P in I is finite over P by the pinned purely inseparable polynomial theorem. C is normal noetherian with fraction field I.
5. Apply the pinned separable theorem to C⊂N; transfer the resulting integral closure down to P using tower_bot and transitivity of module finiteness.
6. Descend to E using the pinned injective finite-normalization theorem. Only the assembly, normal/noetherian polynomial instances and algebra/fraction-field tower adapters remain; a new general excellence theory is unnecessary for this consumer.

### separable-normalization-finite — Existing separable finite-normalization theorem

**theorem · library**. Proposition 5.1 input, separable special case; Mathlib DedekindDomain/IntegralClosure.lean

Let A be an integrally closed noetherian domain, K its fraction field, L/K a finite separable extension, and C an integral closure of A in L with compatible algebra structures. Then C is a finite A-module.

Library: mathlib:IsIntegralClosure.finite.

1. Invoke IsIntegralClosure.finite with the fraction-field and scalar-tower instances.

### krull-intersection — Normal noetherian domains are intersections of height-one localizations

**theorem · planned**. Proposition 5.1; Stacks 031T(1)–(2), 0311; direct proof below

For a normal noetherian integral domain A with fraction field F, A equals the intersection inside F of A_p over height-one primes p. Those localizations are DVRs; for a field A the empty intersection is F=A.

The reviewed AUDIT-23 target at L4 explicitly plans the general normal-noetherian height-one descent. Import its early commutative-algebra theorem, not the later automorphic conclusions. Removed from the A0-extension route to avoid duplicate ownership.

Planned: AutomorphicCongruences:L4.

Prerequisites: PAPER-DITTMANN-POP-23/principal-associated-height-one, PAPER-DITTMANN-POP-23/associated-localization-detection, PAPER-DITTMANN-POP-23/normal-local-dvr.

1. Write x=b/a in Frac(A), a≠0. If x lies in every height-one localization, b mod a vanishes at each associated prime of A/aA by principal-associated-height-one.
2. Associated-localization-detection gives b∈aA, hence x∈A. The reverse inclusion is immediate.
3. At a height-one prime, localization is a noetherian normal local domain with a unique nonzero prime; import normal-local-dvr. If A is a field the intersection is empty and is Frac(A)=A.

### pfister-roundness — Roundness of quadratic Pfister forms

**theorem · missing**. EKM Proposition 9.8(1), Corollary 9.9; input to Fact 3.1

For every quadratic Pfister form in either characteristic, its nonzero represented values form its similarity-factor group. Tensoring a regular round quadratic form by a binary bilinear Pfister factor preserves roundness.

Prerequisites: PAPER-DITTMANN-POP-23/pfister-odd, PAPER-DITTMANN-POP-23/pfister-two.

1. Write a represented value as x−ay and, when both terms are nonzero, absorb x and y by similarity.
2. Induct on the number of factors; the norm binary form supplies the base case.

### arason-pfister-bound — Arason–Pfister dimension bound

**theorem · missing**. Fact 3.1; EKM Theorem 23.7(1)

For every field F and n>=1, a nonzero anisotropic nonsingular quadratic form with Witt class in I_q^n(F) has dimension at least 2^n, where I_q^n=I(F)^{n−1} I_q(F).

Prerequisites: PAPER-DITTMANN-POP-23/pfister-hyperbolic.

1. Write the class as a sum of scaled n-fold Pfister forms and induct on the number of summands.
2. Pass to the function field of the last Pfister quadric. If the form becomes hyperbolic, use the subform theorem; otherwise apply induction to its anisotropic part.
3. The subform theorem and Witt cancellation are imported proof leaves, not proved by this extraction.

### graded-witt-invariant — Graded quadratic Witt invariant

**theorem · missing**. Fact 3.1; EKM Fact 16.2

For n>=1 over every field F, the invariant e_n:I_q^n(F)→H^n(F,Z/2(n−1)) is surjective with kernel I_q^{n+1}(F), and agrees on n-fold Pfister forms with the symbol invariant. In characteristic two this uses Kato's quadratic/logarithmic comparison.

Prerequisites: PAPER-DITTMANN-POP-23/pfister-invariant, PAPER-DITTMANN-POP-23/kato-cohomology.

1. Away from characteristic two combine the graded Witt/Milnor-K comparison with the norm-residue theorem imported from MotivicEtaleKTheory:M.5d.
2. In characteristic two use Kato's theorem with logarithmic coefficients supplied by CrystallineCohomology:CR.4 and HigherLocalFieldsAndHigherClassFieldTheory:HL.2.
3. EKM states the general theorem as a fact with original references; their full proofs are not audited here.

### split-place-input — Completely split places outside a finite set

**theorem · planned**. Lemma 3.5, first and second choices of places

For a finite separable extension l/k of global fields and a finite set Σ of places of k, there is a finite place outside Σ splitting completely in l; in fact infinitely many such places exist.

Use the identity Frobenius class in the Galois closure. These already-owned prime-distribution theorems are imports, not re-planned in the Dittmann–Pop extension.

Planned: tauceti:TauCetiRoadmap/Chebotarev#layer-14-natural-density-and-consistency-theorems, FunctionFieldArithmetic:FA.5.

1. Pass to the Galois closure and apply the completely split case of the global Chebotarev theorem, treating the constant-field extension in the function-field case.
2. Import global prime-distribution ownership; original theorem matching remains a gap, not a new proof claim.

### global-approximation-input — Global approximation with one exceptional pole

**theorem · missing**. Lemma 3.5, Strong Approximation step

For a global field k, finite nonempty prescribed set S of places, local open conditions at S, and an auxiliary place v0 outside S, choose an element satisfying those conditions and integral at every finite place outside S∪{v0}.

Function-field branch is already available. Only the number-field off-a-finite-place variant and its local-open adapters remain for ownership/signature audit; do not rebuild the function-field theorem or upstream weak approximation.

Prerequisites: PAPER-DITTMANN-POP-23/function-field-strong-approximation.

1. Use strong approximation off v0 after arranging the local norm and valuation conditions are nonempty opens.
2. Weak approximation supplies the earlier choice of a0.

### henselian-generator-input — Henselian generator with simple reduction

**theorem · missing**. Lemma 3.9(1); Kuhlmann–Novacoski Theorem 1.2

If a finite extension E/F embeds in the henselization of (F,w), choose a primitive generator η which is a valuation unit and whose monic minimal polynomial has integral coefficients and unit derivative at η. Then there is x∈F with w(x−η)>0.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-simple-reduction.

1. Use the CRT residue-one generator η and its simple minimal polynomial; this is the residue-degree-one specialization of the fully read Kuhlmann–Novacoski Theorem 1.2 proof.
2. Take x=1, since w(η−1)>0. The more general residue approximation follows from immediacy.

### etale-specialization-input — Étale specialization and Laurent-series embedding

**theorem · missing**. Proposition 3.8, proof first paragraph

Let l/k(t_2,…,t_{d−1}) be finite separable. After restricting a dense open of the torus, its normalization is finite étale; at a point ε∈(k×)^{d−2} in that open, each point above ε has finite separable residue k_ε/k and completed local ring k_ε[[t_2−ε_2,…,t_{d−1}−ε_{d−1}]]. Consequently l embeds into the iterated Laurent-series field in those parameters.

Prerequisites: PAPER-DITTMANN-POP-23/finite-normalization-generic.

1. Use finite normalization for the field-base polynomial ring, then generic separability of the finite map.
2. Remove the non-étale locus, use formal étaleness to identify the completion, then embed its fraction field in iterated Laurent series.
3. Record the extension of the generic normalization input from A to a global field explicitly; do not use the arithmetic polynomial statement alone.

### valuation-prolongation-integrality — Integral closure detected by prolonged valuation rings

**theorem · missing**. Lemma 5.3, reduction to K=κ(T)

Let E/F be a finite field extension and B an intersection of valuation rings O_v in F. The integral closure of B in E equals the intersection of every valuation ring of E prolonging one of these v.

The empty selected family gives B=F and intersection E, consistent with finite algebraicity. No assumption Frac(B)=F is needed. All prolongations are essential; preserve the split-prime negative example in the report.

Prerequisites: PAPER-DITTMANN-POP-23/valuative-integrality-built, PAPER-DITTMANN-POP-23/integral-minpoly-coefficient-descent, PAPER-DITTMANN-POP-23/normal-envelope-finite, PAPER-DITTMANN-POP-23/valuation-extension-exact, PAPER-DITTMANN-POP-23/root-coefficient-descent.

1. Integral over B implies integral over every selected O_v and hence membership in every prolonged valuation ring, which is integrally closed.
2. For the converse fix a selected v and prolong it to a finite normal envelope of E/F. Every F-embedding of E into that envelope pulls the prolongation back to one of the quantified prolongations on E, so every conjugate of x has nonnegative valuation.
3. Write the monic minimal polynomial as the product of its conjugate roots WITH their inseparable multiplicities. Its coefficients belong to the prolonged valuation ring as sums of products of elements of that ring. They also belong to F, so exact contraction puts them in O_v.
4. Intersect the minimal-polynomial coefficient bounds over the chosen v; all coefficients lie in B and the monic equation proves integrality. Exact prolongation and coefficient descent are now separate items with proofs; their Lean adapters remain unimplemented.

### rumely-global-definitions — Uniform global-field prime and integer predicates

**theorem · missing**. Proposition 5.1 after Fact 5.2; Rumely Introduction I–III; Poonen Theorem 2.2

In global fields, the relevant finite-prime valuation rings form a uniformly ring-definable family; in number fields their intersection is the ring of integers and is uniformly definable. Interpret the same formulas in finite residue-number-field quotients.

Prerequisites: PAPER-DITTMANN-POP-23/definable-set.

1. Use the source-scoped global-field formulas, with their parameter domains and the number-field/global-function-field cases separated.
2. Original Rumely formula and proof audit remains open.

### low-dimensional-biinterpretability — The dimensions one and two base cases

**theorem · missing**. Theorems 1.1–1.2 reduction and Remark 4.4

Every infinite finitely generated field of Kronecker dimension at most two is parametrically bi-interpretable with Z, without a resolution-of-singularities assumption.

Prerequisites: PAPER-DITTMANN-POP-23/small-dimension-inputs, PAPER-DITTMANN-POP-23/domain-biinterpretability, PAPER-DITTMANN-POP-23/fraction-interpretation.

1. Use Rumely/Pop for the requisite low-dimensional valuation predicates and repeat the definable-normalization construction; the dimension-one number-field case uses its definable integer ring directly.
2. This extraction does not claim a completed original-source audit of these base cases.

### function-field-weak-approximation — Independent prescribed function-field orders

**theorem · library**. Lemma 3.5 / Theorem 4.2 proof input; TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:132

For fields k⊂F, any finite set of distinct places of F/k and integers r_P admit a nonzero g∈F with ord_P(g)=r_P at every chosen place.

Actual pinned statement read; additive infinity conventions require the indicated bridge from library multiplicative valuations.

Library: tauceti:TauCeti.Place.exists_ne_zero_forall_mem_ord_eq.

1. Apply the cited existing theorem with distinct places and the prescribed targets.

### function-field-strong-approximation — Function-field strong approximation

**theorem · library**. Lemma 3.5 / Theorem 4.2 proof input; TauCeti/FieldTheory/FunctionField/Consequences/StrongApproximation.lean:88

For IsFunctionField k F with k relatively algebraically closed in F, a proper set S of places, finite s⊆S, targets f_P and integer precisions r_P admit x∈F satisfying v_P(x−f_P)≤exp(−r_P) for P∈s and x∈O_P for P∈S\s. The multiplicative inequality includes exact hits.

Actual pinned statement read; additive infinity conventions require the indicated bridge from library multiplicative valuations.

Library: tauceti:TauCeti.Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers.

1. Apply the cited existing theorem with distinct places and the prescribed targets.

### purely-inseparable-normalization-finite — Existing finite polynomial normalization in a purely inseparable extension

**theorem · library**. Proposition 5.1 input; TauCeti IntegralClosure/PurelyInseparable.lean:167–173

Let k be any field, P=k[X_i : i∈I] for finite I, K=Frac(P), and M/K a finite purely inseparable extension. With compatible algebra maps, any integral closure C of P in M is finite as a P-module. No perfectness assumption on k is required.

Library: tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable.

1. Import the pinned theorem with all fraction-field and scalar-tower instances; its proof uses a bounded Frobenius exponent and a finite coefficient-root extension.

### normal-envelope-finite — Existing finite normal envelope

**theorem · library**. Proposition 5.1 normalization input; Mathlib Normal/Closure.lean:143–187

A finite field extension E/F embeds in a finite normal extension N/F: take its normal closure inside an algebraic closure of E, with the induced compatible F- and E-algebra structures.

Library: mathlib:normalClosure.normal, mathlib:normalClosure.is_finiteDimensional, mathlib:normalClosure.algebra.

1. Use the normal-closure algebra map for the embedding, the normal instance in the ambient algebraically closed field, and the finite-dimensional instance.

### normal-fixed-field-pure — Existing purely inseparable fixed-field step

**theorem · library**. Stacks 030M(2); TauCeti Normal/FixedField.lean:44–46

For a normal algebraic extension N/F, the intermediate field N^Aut(N/F) is purely inseparable over F. Finiteness of N/F is not needed for this assertion.

Library: tauceti:TauCeti.IntermediateField.isPurelyInseparable_fixedField_top.

1. Import the pinned theorem; its proof makes every separable element fixed by all automorphisms have minimal polynomial of degree one.

### finite-action-fixed-field-galois — Existing Galois extension over a finite-action fixed field

**theorem · library**. Stacks 030M(2); Mathlib Galois/Basic.lean:94–96

If a finite group G acts on a field N by semiring automorphisms, N/FixedPoints.subfield(G,N) is Galois. Applied to G=Aut(N/F) for finite N/F, this supplies the separable upper step over N^Aut(N/F).

Library: mathlib:IsGalois.of_fixed_field.

1. Use IsGalois.of_fixed_field; the IntermediateField fixedField carrier is compatible as demonstrated at Galois/Basic.lean:481–485.

### integral-closure-tower-bottom — Existing transfer of integral closure down an integral base extension

**theorem · library**. Stacks 0308; TauCeti IntegralClosure/Transfer.lean:52–59

For compatible commutative-ring maps R→A→B and C→B, if A is integral over R and C is an integral closure of A in B, then C is also an integral closure of R in B.

Library: tauceti:TauCeti.IsIntegralClosure.tower_bot.

1. Import tower_bot, using transitivity of integrality in one direction and extension of the base in the other.

### finite-normalization-injective-descent — Existing descent of finite normalization through an injection

**theorem · library**. Stacks 032N proof; TauCeti IntegralClosure/Transfer.lean:65–72

Let A be noetherian, C its integral closure in an A-algebra M, and C′ its integral closure in another A-algebra N. If C′ is finite over A and there is an injective A-algebra map M→N, then C is finite over A. Fields and separability are not required by this declaration.

Library: tauceti:TauCeti.IsIntegralClosure.finite_of_injective.

1. Lift the injection to integral closures and use noetherian finite-module descent, as in the pinned theorem.

### valuative-integrality-built — Existing valuative criterion for integrality

**theorem · library**. Lemma 5.3 input comparison; TauCeti Valuation/IntegralOfValuationLeOne.lean:112–114

For any commutative ring R, subring B and x∈R, if every valuative relation v on R bounded by one on B also has v(x)≤v(1), then x is integral over B. The quantifier is over ALL such valuative relations.

Library: tauceti:TauCeti.isIntegral_of_forall_valuation_le_one.

1. Invoke the pinned arbitrary-ring theorem. Do not substitute one chosen prolongation of each selected base valuation for its universal quantifier.

### integral-minpoly-coefficient-descent — Existing minimal-polynomial comparison over a normal domain

**theorem · library**. Kuhlmann–Novacoski Lemma 3.3(i) input; Mathlib Minpoly/IsIntegrallyClosed.lean:55–60

Let R be an integrally closed domain, K=Frac(R), S a domain with compatible R- and K-algebra structures, and s∈S integral over R. Then minpoly K s is the coefficientwise image of minpoly R s. In particular its coefficients lie in R.

Library: mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'.

1. Import the primed comparison for a K-algebra S. This theorem requires integrality of s; it does not prove integrality from selected valuation bounds.

### henselian-prime-orbit — Finite conjugate-prime data for a henselian subextension

**theorem · missing**. Kuhlmann–Novacoski setting(1), Definition 3.1, Lemmas 2.5,3.2 specialized to E⊂F_w

Let (F,w) be any valued field, fix a prolongation to F^sep, and let E/F be finite inside F_w. If A=O_w and C is its integral closure in E, the maximal ideals of C over m_A form a finite family of distinct pairwise comaximal ideals. The chosen p has C_p=O_{w|E} and C/p=κ(w). Among F-embeddings of E into a finite Galois hull, the identity is the unique one inducing the chosen prolongation; each other embedding induces a different prime of C.

Prerequisites: PAPER-DITTMANN-POP-23/henselization.

1. Use henselization as the decomposition field: its decomposition group fixes E pointwise.
2. Conjugacy of primes in the finite normal hull and the decomposition-group cosets give the finite embedding/prime correspondence.
3. Localization of the integral closure at the chosen prime gives the prolonged valuation ring; immediacy identifies its residue with κ(w). These valuation/Galois background interfaces still require implementation and source completion.

### henselian-crt-generator — CRT element with residue one at the chosen prime

**theorem · missing**. Kuhlmann–Novacoski proof of Theorem 1.2, p.11, residue-degree-one specialization

In henselian-prime-orbit, there exists η∈C congruent to 1 modulo p and to 0 modulo each other maximal ideal of C over m_A. Thus η is a unit in C_p, and every nonidentity F-embedding σ of E has σ(η) reducing to zero at the fixed prolongation to a Galois hull.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-prime-orbit.

1. Apply the finite Chinese remainder theorem to the distinct maximal ideals with residues 1,0,…,0.
2. Translate membership in the prime induced by σ into positive valuation of σ(η). No finite-generation claim for C_p as an A-algebra is used.

### henselian-crt-primitivity — Primitivity of the CRT henselian element

**theorem · missing**. Kuhlmann–Novacoski Theorem 1.2 proof, p.11

The η constructed by henselian-crt-generator generates E/F. Indeed no nonidentity F-embedding of E into a normal hull fixes η, so [F(η):F]=[E:F] by separability.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-crt-generator.

1. The identity conjugate has residue 1, whereas every other embedding sends η to residue 0.
2. Since E/F is separable, counting embeddings extending an embedding of F(η) gives the degree equality. The identity embedding is excluded from the nonfixing claim; the source index range includes it accidentally.

### henselian-simple-reduction — Simple unit root in the conjugate polynomial

**theorem · missing**. Kuhlmann–Novacoski Lemma 3.3(i), pp.10–11; Theorem 1.2, specialized to residue degree one

For η above and n=[E:F], its monic minimal polynomial h belongs to A[X], and its reduction at m_A is X^(n−1)(X−1). Consequently h(η)=0, w(η)=w(h′(η))=0, w(h(1))>0 and w(h′(1))=0. The assertions include n=1 and h(1)=0, with w(0)=∞.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-crt-primitivity, PAPER-DITTMANN-POP-23/integral-minpoly-coefficient-descent.

1. Integrality of η and normality of the valuation ring give h∈A[X] using the pinned minimal-polynomial comparison.
2. Over a Galois hull h is the product over the distinct embeddings; CRT makes exactly one root reduce to 1 and all others to 0.
3. The derivative of X^(n−1)(X−1) at 1 equals 1 in every characteristic.

### henselian-generator-neighborhood — Finite clopen inequalities giving henselian embeddability

**theorem · missing**. Dittmann–Pop Lemma 3.9(1), with the residue-one generator from Kuhlmann–Novacoski

For a finite E/F embedded in F_w, choose h from henselian-simple-reduction. The set of valuations v with v(a_i)≥0 for every coefficient a_i of h, v(h(1))>0, and v(h′(1))=0 is a patch-clopen neighborhood of w on which E embeds into F_v.

Prerequisites: PAPER-DITTMANN-POP-23/henselian-simple-reduction, PAPER-DITTMANN-POP-23/patch-field-dictionary.

1. Each condition is a field patch-clopen membership or strict-membership predicate; only finitely many coefficients occur.
2. The Hensel simple-root criterion at 1 produces a root of h in F_v. Its irreducibility over F identifies F[X]/(h) with E and gives an embedding.
3. Using 1 avoids an unstated integrality condition on an arbitrary approximate root. For the source’s x, integrality also follows from monicity, integral coefficients and v(h(x))>0.

### valuation-local-factor — A local ring map factors through a dominating valuation ring

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Valuation/LocalSubring.lean:250

For a commutative local ring R, field K and ring homomorphism f:R→K, there is a valuation subring V of K containing f(R) such that the induced map R→V is local. Injectivity and an algebraic field extension are not hypotheses of this declaration.

Library: mathlib:IsLocalRing.exists_factor_valuationRing.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### valuation-domination-maximal — Valuation subrings are maximal for domination

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Valuation/LocalSubring.lean:82

For a field F and valuation subring V⊂F, its associated local subring is maximal in the domination order: a local overring in F dominating V equals V.

Library: mathlib:ValuationSubring.isMax_toLocalSubring.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### valuation-pullback — Membership and composition for valuation pullbacks

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Valuation/ValuationSubring.lean:865

For field maps f:F→E, g:E→N and valuation subring W of N, x belongs to the pullback along g∘f exactly when g(f(x)) belongs to W; iterated pullback agrees with pullback along the composite. No extension or finiteness hypothesis is needed.

Library: mathlib:ValuationSubring.mem_comap, mathlib:ValuationSubring.comap_comap.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### determinant-integrality — Integrality from preservation of a finite nonzero module

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:92

Let A be a domain over a commutative ring R and M an A-module torsion-free over A, with compatible R-action. If a nonzero finitely generated R-submodule N of M is stable under multiplication by x∈A, then x is integral over R.

Library: mathlib:isIntegral_of_smul_mem_submodule.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### associated-prime-witness — A nonzero module element detects an associated prime

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean:136

For a module M over a commutative noetherian ring R and nonzero x∈M, there is an associated prime P of M containing Ann_R(x). The module need not be finite.

The pinned definition uses radical annihilators; isAssociatedPrime_iff removes the radical over a noetherian base. Both declarations were read.

Library: mathlib:exists_le_isAssociatedPrime_of_isNoetherianRing, mathlib:isAssociatedPrime_iff.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### principal-height-bound — Height bound for a principal ideal

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:108

In a commutative noetherian ring R, a prime ideal minimal over a principal ideal has height at most one.

Library: mathlib:Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### normal-local-dvr — Normal local dimension-one criterion for a DVR

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean:210

For a noetherian local domain R which is not a field, R is a DVR if and only if it is integrally closed and has exactly one nonzero prime ideal. This is the corresponding pair of entries in the pinned TFAE; converting a height-one localization into these hypotheses remains an adapter.

Library: mathlib:IsDiscreteValuationRing.TFAE.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### associated-prime-localization — An associated prime localizes to an associated maximal ideal

**theorem · library**. Pinned Mathlib Mathlib/RingTheory/Ideal/AssociatedPrime/Localization.lean:70

For a commutative ring R, R-module M and prime p associated to M in the pinned radical-annihilator convention, the maximal ideal of R_p is associated to M_p in that convention. Over a noetherian base, isAssociatedPrime_iff converts both sides to ordinary associated primes.

Library: mathlib:Module.associatedPrimes.mem_associatedPrimes_atPrime_of_mem_associatedPrimes.

1. Reuse the pinned declaration with its actual typeclass hypotheses; no new implementation is claimed.

### valuation-extension-exact — Existence of an exact valuation prolongation

**theorem · missing**. Stacks 00IA; direct assembly of pinned valuation-local-factor, domination-maximal and pullback

For any extension of fields E/F and valuation subring V⊂F, there exists a valuation subring W⊂E with W∩F=V, and V→W is local. Value groups may enlarge; equality means equality of valuation rings after contraction, not numerical equality of independently normalized valuations.

Prerequisites: PAPER-DITTMANN-POP-23/valuation-local-factor, PAPER-DITTMANN-POP-23/valuation-domination-maximal, PAPER-DITTMANN-POP-23/valuation-pullback.

1. Apply the local factorization theorem to V→E, obtaining a local injection V→W.
2. W∩F is a valuation subring of F; the map V→W∩F is local because any inverse in the smaller ring is also an inverse in W.
3. Maximality of V under domination forces W∩F=V. This works for arbitrary rank, the trivial valuation, and inseparable extensions.

### root-coefficient-descent — All conjugates control the coefficients of a minimal polynomial

**theorem · missing**. Lemma 5.3 valuation-intersection step; direct coefficient argument in this report

Let E/F be finite, N/F a finite normal extension containing E, V⊂F a valuation ring and W⊂N an exact prolongation of V. If σ(x)∈W for every F-embedding σ:E→N, then every coefficient of the monic minimal polynomial of x over F belongs to V. Repeated roots in inseparable characteristic are counted with multiplicity.

Acceptance: a split quadratic with two different valuations; a purely inseparable polynomial X^p−a with its repeated root; the trivial extension. Embedding extension and splitting APIs still need exact Lean adapters.

Prerequisites: PAPER-DITTMANN-POP-23/normal-envelope-finite, PAPER-DITTMANN-POP-23/valuation-extension-exact, PAPER-DITTMANN-POP-23/valuation-pullback.

1. Every root of minpoly_F(x) in N is the image of x under an F-embedding E→N: extend the embedding of F(x), using normality of N/F.
2. Factor the polynomial into linear factors with repetitions. Its coefficients lie in W because all roots lie there and W is a subring.
3. The coefficients are also in F, so W∩F=V puts them in V. No separability assumption removes multiplicities.

### principal-associated-height-one — Associated primes of a nonzero principal quotient have height one

**theorem · missing**. Stacks 031T(1); direct determinant proof supplied in this continuation

For a noetherian integrally closed domain A and nonzero a∈A, every associated prime of A/aA has height one. If a is a unit, the module is zero and the assertion is vacuous.

Use the noetherian isAssociatedPrime_iff recorded in associated-prime-witness to pass from the pinned radical-annihilator carrier to an exact annihilator. Localization normality, quotient comparison and fraction-field coercions remain Lean adapters.

Prerequisites: PAPER-DITTMANN-POP-23/associated-prime-localization, PAPER-DITTMANN-POP-23/determinant-integrality, PAPER-DITTMANN-POP-23/principal-height-bound, PAPER-DITTMANN-POP-23/associated-prime-witness.

1. Localize at an associated prime p. In the normal local domain R=A_p choose b mod a with annihilator its maximal ideal m, and put x=b/a∉R. Then xm⊂R.
2. If xm⊂m, apply determinant-integrality to the nonzero finite R-submodule m⊂Frac(R). Normality would give x∈R, a contradiction.
3. Otherwise choose t∈m with xt a unit. For y∈m, y/t=(xy)/(xt)∈R; hence m=(t). Principal-height-bound gives dim R≤1, and a≠0 in p gives dim R≥1.

### associated-localization-detection — Associated-prime localizations detect a module element

**theorem · missing**. Stacks 0311, full proof read; pinned associated-prime witness supplies the nonzero test

Over a commutative noetherian ring A, the map M→∏_{p∈Ass_A(M)} M_p is injective for any A-module M, without a finite-generation hypothesis on M.

Prerequisites: PAPER-DITTMANN-POP-23/associated-prime-witness.

1. For a nonzero x choose p∈Ass(M) with Ann(x)⊂p.
2. If x vanished in M_p, some s∉p would annihilate x, contradicting Ann(x)⊂p. Thus a nonzero element cannot vanish at every associated-prime localization.

### equichar-zero-coefficient-field — A coefficient field in a henselian equicharacteristic-zero valuation ring

**theorem · missing**. Proposition 3.2(3), Case 2, p.7; Milne LEC, Lemma 15.3 and proof, p.106

Let V be a henselian valuation ring of equicharacteristic zero, F=Frac(V), and κ=V/m. There exists a subfield E⊂V on which reduction is an isomorphism E≃κ. This E is relatively algebraically closed in F.

No completeness, rank-one or finitely generated residue-field assumption. Milne proves existence for a henselian local ring with separable residue over a contained field; the final relative-algebraic-closure assertion here uses the valuation-ring hypothesis.

Prerequisites: PAPER-DITTMANN-POP-23/henselization.

1. Lift a transcendence basis of κ/Q. Every nonzero rational function in the lifts has nonzero residue, so the generated field lies in V.
2. Take a maximal such subfield. Any missing residue element is separable algebraic; lift its minimal polynomial and use Hensel to lift its simple root, contradicting maximality.
3. If z∈F is algebraic over E and z≠0, its valuation is zero: in a polynomial relation a positive or negative value would yield a unique term of least value. Reduce z, lift its residue to e∈E, and apply the same observation to z−e; positivity forces z=e.

### nonreal-local-cd-bound — Cohomological dimension over nonreal local constants

**theorem · missing**. Proposition 3.2(3), p.7 Claim, corrected nonreal-place step; Milne LEC Theorem 15.2, p.105

Let k be a number field, v a finite or complex place, and k_v its henselization at a finite place or algebraic closure at a complex place. If L/k_v is finitely generated of transcendence degree n, then cd_2(L)≤n+2. At a complex place the sharper bound is n. In particular, L=E′k_v in Proposition 3.2(3) has cd_2(L)≤dim(E′)+1.

The transcendence-degree statement was read in Milne, whose proof refers to Shatz rather than supplying the full induction. Exact local-field and henselization comparison proofs remain in DP23-G3. This is a corrected planned proof input, not a newly verified proof of those general theorems.

Prerequisites: PAPER-DITTMANN-POP-23/cohomology-restriction.

1. Use the finite-local-field bound cd_2(k_v)=2 and its henselization/completion comparison; at a complex place k_v is algebraically closed.
2. Apply the transcendence-degree inequality cd_2(L)≤cd_2(k_v)+n.
3. Do not insert cd_2(E′) between these quantities: a formally real E′ has infinite 2-cohomological dimension.

### dominant-valuation-sum — A unique dominant valuation survives a finite sum

**theorem · library**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

For a valuation v:R→Γ₀ on a ring, a finite sum and an index j in its support, if v(f_i)<v(f_j) for every other index, then v(Σf_i)=v(f_j). In the paper’s additive convention, the unique least valuation survives. In particular a sum with a unique least finite additive valuation is nonzero.

A mathematical proof interface; no Lean implementation claimed.

Library: mathlib:Valuation.map_sum_eq_of_lt.

1. Read Valuation.map_sum_eq_of_lt at the pinned Mathlib, including j∈s and strict domination of all remaining summands. Translate multiplicative maximum to additive minimum.

### finite-algebraic-adjoin — A field generated by finitely many algebraic elements is finite

**theorem · library**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

For fields F⊂E and a finite set S⊂E whose elements are algebraic over F, the intermediate field F(S) is finite-dimensional over F. No separability hypothesis is required.

A mathematical proof interface; no Lean implementation claimed.

Library: mathlib:IntermediateField.finiteDimensional_adjoin.

1. Read IntermediateField.finiteDimensional_adjoin. Its IsIntegral hypotheses are equivalent to algebraicity over a field. Apply to a finite field-generating set after identifying the rational subfield in the two constructions below.

### cyclic-value-dvr — A nontrivial cyclic value group gives a DVR

**theorem · library**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

For a field valuation v with nontrivial cyclic actual value group, the valuation subring is a discrete valuation ring. The hypothesis is on the actual value group of v, not an ambient ordered group which may contain unused directions.

A mathematical proof interface; no Lean implementation claimed.

Library: mathlib:Valuation.IsRankOneDiscrete.mk', mathlib:Valuation.valuationSubring_isDiscreteValuationRing.

1. Read Valuation.IsRankOneDiscrete.mk′ and Valuation.valuationSubring_isDiscreteValuationRing at the pin with their IsCyclic and Nontrivial valueGroup binders.

### valued-prime-field — Restriction of a field valuation to the prime field

**theorem · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

Let v be any field valuation, written additively on nonzero elements, with residue field κ_v. If F and κ_v have the same characteristic, v is trivial on the prime field. If char F=0 and char κ_v=p>0, then v(p)>0 and v(q)=ord_p(q)·v(p) for every nonzero q∈Q. No rank, discreteness or henselianity hypothesis is imposed.

A mathematical proof interface; no Lean implementation claimed.

1. The image of Z lies in the valuation ring because v(1)=0 and the valuation inequality gives v(n)≥0. Its reduction kernel is (p) when the residue characteristic is p, and zero in characteristic zero.
2. A nonzero integer whose residue is nonzero is a unit of the valuation ring. Hence in mixed characteristic only p contributes, and writing a rational number as p^m*a/b with p∤ab gives the formula.
3. In positive equal characteristic, the nonzero prime-field elements form a finite multiplicative group. An ordered value group is torsion-free, so their valuations vanish. In characteristic zero with characteristic-zero residue, every nonzero rational has valuation zero.

### residue-independent-unit-lifts — Algebraically independent residues lift to a unit subfield

**theorem · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

Suppose v is trivial on a subfield k⊂F, so k embeds in the residue field. If units x_1,…,x_s have residues algebraically independent over k, then x is algebraically independent over k, v is trivial on k(x), and the residue map identifies k(x) with k(x̄). If t∈F has v(t)>0, the tuple(x,t) is algebraically independent over k.

A mathematical proof interface; no Lean implementation claimed.

Prerequisites: PAPER-DITTMANN-POP-23/dominant-valuation-sum.

1. For a nonzero polynomial P over k, reduction of P(x) is P(x̄)≠0. Thus P(x) is a unit and cannot vanish. Ratios give the field and residue identifications.
2. For a nonzero polynomial Σ_j P_j(x)t^j, each nonzero coefficient P_j(x) has value 0, so the nonzero summands have distinct values j*v(t). The unique least value survives by dominant-valuation-sum.
3. This argument holds for every finite residue-independent tuple, even when the residue field is not finitely generated.

### geometric-gauss-subfield — A one-variable valued subfield in the geometric case

**construction · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

Let K be finitely generated over its prime field k, let v be a nontrivial valuation with char Kv=char K, and suppose trdeg_k Kv=trdeg_k K−1=s. Lift a residue transcendence basis x̄ of length s to units x and choose t with v(t)>0. Then F0=k(x,t)⊂K has K/F0 finite, vF0=Z*v(t) and residue field k(x̄). Equivalently, K is a one-variable algebraic function field over k(x), and its valuation ring is proper and contains k(x).

A mathematical proof interface; no Lean implementation claimed.

Prerequisites: PAPER-DITTMANN-POP-23/valued-prime-field, PAPER-DITTMANN-POP-23/residue-independent-unit-lifts, PAPER-DITTMANN-POP-23/finite-algebraic-adjoin.

1. The residue-dimension assumption ensures s≥0 and trdeg_k K=s+1. Nontriviality permits choosing t of positive value, replacing an element by its inverse if needed.
2. The preceding lifting lemma makes(x,t) a transcendence basis of K/k. Because K is finitely generated as a field, it is finite over F0 by finite-algebraic-adjoin.
3. A polynomial in t with coefficients in k(x) has valuation equal to its least nonzero exponent times v(t). For a rational function, subtract the least exponents of numerator and denominator.
4. For a value-zero rational function, cancel the common t-power; its residue is the ratio of the two nonzero constant coefficients in k(x̄). This proves the full value-group and residue-field statements.
5. The alternative one-variable description lets the existing function-field-discreteness theorem prove the DVR assertion directly; it is an import, not another proof of that library theorem.

- API `DittmannPop.geometricGaussSubfield.exists` (constructor): Residue-independent unit lifts and one positive-value element provide F0=k(x,t) with K/F0 finite.
- API `DittmannPop.geometricGaussSubfield.valuation_rational` (characterisation): The additive value of P(t)/Q(t), with nonzero P,Q∈k(x)[T], is (ord_T P−ord_T Q)*v(t).
- API `DittmannPop.geometricGaussSubfield.residue` (compatibility): After cancelling the common t-power, reduction is the ratio of the nonzero constant coefficients; the residue field is k(x̄).

- Use: PAPER-DITTMANN-POP-23/divisorial-discreteness — Reduce the geometric branch to the built one-variable DVR theorem and finite residue extension.

- Proposed test `DittmannPop.geometricGaussSubfield.test1`: For K=Fp(x,t) and the t-adic valuation, the construction recovers residue Fp(x).
- Proposed test `DittmannPop.geometricGaussSubfield.test2`: A finite inseparable extension K/F0 is allowed; no separable transcendence basis is assumed here.
- Proposed test `DittmannPop.geometricGaussSubfield.test3`: For the trivial valuation no positive-value t exists, so the construction rejects that input.

### arithmetic-gauss-subfield — A Gauss valued rational subfield above a prime

**construction · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

Let K be finitely generated over Q, let v have residue characteristic p>0 and suppose trdeg_Fp Kv=trdeg_Q K=s. Lift a residue transcendence basis x̄ of length s to units x. Then F0=Q(x)⊂K has K/F0 finite, vF0=Z*v(p) and residue field Fp(x̄). For every nonzero polynomial P∈Q[X], v(P(x))=min_a ord_p(P_a)*v(p), the minimum taken over nonzero coefficients.

A mathematical proof interface; no Lean implementation claimed.

Prerequisites: PAPER-DITTMANN-POP-23/valued-prime-field, PAPER-DITTMANN-POP-23/dominant-valuation-sum, PAPER-DITTMANN-POP-23/finite-algebraic-adjoin.

1. Let m be the least p-adic order of a nonzero coefficient of P. Multiplying by p^−m gives coefficients integral at p and a nonzero reduction polynomial.
2. Algebraic independence of x̄ makes this polynomial nonzero after residue evaluation. The scaled value is 0, proving the stated Gauss formula and algebraic independence of x over Q.
3. The equality of transcendence degrees makes K algebraic over Q(x); finite field generation and finite-algebraic-adjoin make the extension finite.
4. For fractions subtract the two Gauss values. A value-zero ratio can be scaled to a ratio of polynomials with coefficient minimum 0, whose residue is the ratio of their nonzero reductions. This identifies the residue field with Fp(x̄), not just a subfield of it.
5. For s=0 this is the usual p-adic valuation on Q. Nothing requires henselianity or completion, and the initial valuation on K need not have rank one.

- API `DittmannPop.arithmeticGaussSubfield.exists` (constructor): Residue transcendence-basis lifts produce a finite subextension Q(x)⊂K under the equality of transcendence degrees.
- API `DittmannPop.arithmeticGaussSubfield.valuation_polynomial` (characterisation): A nonzero polynomial evaluates with value min ord_p(coefficients)*v(p).
- API `DittmannPop.arithmeticGaussSubfield.residue` (compatibility): Reduction of normalized value-zero rational functions identifies the residue field of Q(x) with Fp(x̄).

- Use: PAPER-DITTMANN-POP-23/divisorial-discreteness — Supply the discrete valued base for the arithmetic finite-extension argument.

- Proposed test `DittmannPop.arithmeticGaussSubfield.test1`: For K=Q with the p-adic valuation, the empty basis gives F0=Q.
- Proposed test `DittmannPop.arithmeticGaussSubfield.test2`: If a lift has algebraically dependent residue, X−a can have value greater than the coefficient minimum; the hypothesis must reject that case.
- Proposed test `DittmannPop.arithmeticGaussSubfield.test3`: For Q(x_1,x_2) with its coefficientwise p-adic Gauss valuation, the residue field is Fp(x̄_1,x̄_2) and the value group is cyclic.

### valuation-extension-ef — The fundamental inequality for one arbitrary valuation extension

**theorem · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

For a finite field extension E/F with a valuation w on E and its restriction v to F, let Γ_F⊂Γ_E be their actual value groups and κ_F⊂κ_E their residue fields. Then e=[Γ_E:Γ_F] and f=[κ_E:κ_F] are finite and e*f≤[E:F]. No discreteness, rank-one, henselianity or separability assumption is needed.

A mathematical proof interface; no Lean implementation claimed.

Prerequisites: PAPER-DITTMANN-POP-23/dominant-valuation-sum.

1. Choose a finite family u_i∈E× whose values lie in pairwise distinct cosets modulo Γ_F, and a finite family of units y_j whose residues are κ_F-linearly independent.
2. In a putative relation Σ_i,j a_ij*u_i*y_j=0, consider each nonzero coefficient block A_i=Σ_j a_ij*y_j. Choose a coefficient a_i0 of least value and divide the block by it. All resulting coefficients are v-integral, at least one has nonzero residue, and residue independence implies the reduced combination is nonzero. Thus A_i≠0 and w(A_i)=v(a_i0)∈Γ_F.
3. The nonzero terms u_i*A_i have pairwise distinct values, since their cosets are distinct. A unique least-valued term cannot cancel. Therefore the products u_i*y_j are F-linearly independent.
4. If N=[E:F], taking one residue vector bounds every finite family of value cosets by N, so there are at most N cosets. Taking one value coset bounds all finite residue-independent families by N, so the residue extension is finite-dimensional.
5. Now choose all e cosets and a residue basis of size f. The same independence argument gives e*f≤N. This directly proves the required arbitrary-valued input; the pinned TauCeti.Place inequality assumes discrete function-field places and is not used circularly.

### finite-index-cyclic-value — A finite-index cyclic subgroup forces an ordered value group to be cyclic

**theorem · missing**. §1 p.2 and Proposition 3.2(3) p.7 of arXiv2012.01307v2; direct proof refinement supplied in this continuation

Let Γ be a linearly ordered abelian group and β>0. If the subgroup Zβ has finite index e in Γ, then Γ is nontrivial cyclic and order-isomorphic to Z. In particular a valuation extending a discrete valuation across a finite field extension has a nontrivial cyclic actual value group, by valuation-extension-ef.

A mathematical proof interface; no Lean implementation claimed.

Prerequisites: PAPER-DITTMANN-POP-23/valuation-extension-ef.

1. The finite quotient Γ/Zβ has order e, so for every γ∈Γ there is a unique integer n with eγ=nβ. Uniqueness uses β≠0 and torsion-freeness of an ordered group.
2. The assignment γ↦n is an additive order-preserving injection into Z: multiplication by the positive integer e and by β preserve and reflect order.
3. Its image is a nonzero subgroup of Z, hence cyclic with a least positive generator. Transport that generator back to Γ.
4. When both valuations are normalized to Z, restriction multiplies by the index e. Equality of valuation rings under restriction does not mean equality of independently normalized numerical valuations.

## Validation

Paper checker and three-file intake passed. The structural check verified 152 unique items, 268 acyclic edges, all use/gap references, exact routing of 117 missing items, planned stages, 13 unchanged unreviewed findings and all 143 inherited IDs and 120 API/test names. The 512-file manifest records blob and SHA256 hashes; it is provenance, not a claim of fresh full reads. Publication rechecks those inputs and the original three deliverable blobs against current main.

The new certificate passed 217382 exact checks. The prior report attributes 3055 checks to its worker but did not embed the program; no unchanged-program rerun is claimed. The 126 proposed tests remain unexecuted in Lean. No Lean file was requested or compiled.

```json
{
  "residueField": 65,
  "basisIndependence": 69904,
  "coefficientInjectivity": 69904,
  "uniqueMinimumBlock": 69900,
  "basisImageCount": 4,
  "ramificationResidueDegree": 4,
  "dependentResidueCounterexample": 17,
  "nonFiniteGenerationTower": 24,
  "towerRamificationIndex": 24,
  "finiteIndexCyclic": 12,
  "orderedEmbedding": 7500,
  "rankTwoCounterexample": 24,
  "scope": "Finite Laurent-polynomial, residue, coset and ordering regressions only. The general valuation inequality, transcendence argument and infinite-tower counterexample are justified by the written proofs, not enumeration."
}
```

### Reproducible certificate

```python
"""Exact finite witnesses for the valuation-dimension proof; not a proof of it."""
from collections import Counter
from fractions import Fraction
from itertools import product
import json

counts=Counter()
def check(p,label):
    assert p,label
    counts[label]+=1

# F4=F2[a]/(a^2+a+1), encoded by the two binary coordinates.
def mul4(x,y):
    z=0
    while y:
        if y&1:z^=x
        y>>=1;x<<=1
        if x&4:x^=7
    return z
check(mul4(2,2)==3 and (mul4(2,2)^2^1)==0,'residueField')
for x,y,z in product(range(4),repeat=3):
    check(mul4(x,y^z)==(mul4(x,y)^mul4(x,z)),'residueField')

# E=F4(u), F=F2(t), t=u^e. The basis is u^i * (1,a), 0<=i<e.
# Test every combination whose F coefficients are c0+c1*t, ci in F2.
# Distinct i are value cosets and 1,a are residue-linearly independent.
for e in range(1,5):
    images=set()
    for coeffs in product(range(4),repeat=2*e):
        polynomial=[0]*(2*e)
        nonzero_blocks=[]
        for i in range(e):
            b0,b1=coeffs[2*i:2*i+2]
            low=(b0&1)^((b1&1)<<1)
            high=(b0>>1)^((b1>>1)<<1)
            polynomial[i]^=low;polynomial[i+e]^=high
            if low:nonzero_blocks.append((i,low))
            elif high:nonzero_blocks.append((i+e,high))
        polynomial=tuple(polynomial)
        check((not any(polynomial))==(not any(coeffs)),'basisIndependence')
        check(polynomial not in images,'coefficientInjectivity')
        images.add(polynomial)
        if nonzero_blocks:
            leading=min(nonzero_blocks)
            first=next(k for k,c in enumerate(polynomial) if c)
            check((first,polynomial[first])==leading,'uniqueMinimumBlock')
    check(len(images)==4**(2*e),'basisImageCount')
    check(e*2==2*e,'ramificationResidueDegree')

# Gauss valuation: a nonzero polynomial need not be a unit after specializing
# its variable to a residue value. Algebraic independence is indispensable.
for p in [2,3,5,7]:
    for a in range(p):
        # P=X-a has a coefficient unit but vanishes at the residue point a.
        check((a-a)%p==0 and 1%p!=0,'dependentResidueCounterexample')
    for n in range(1,7):
        step=Fraction(1,p**n)
        check(0<step/p<step,'nonFiniteGenerationTower')
        check(Fraction(p**n)*step==1,'towerRamificationIndex')

# Finite-index ordered overgroups: (1/e)Z / Z has e cosets, and multiplying
# by e embeds it in Z. This checks the normalization factor, not its converse.
for e in range(1,13):
    check(len({Fraction(i,e)%1 for i in range(e)})==e,'finiteIndexCyclic')
    for n,m in product(range(-12,13),repeat=2):
        x,y=Fraction(n,e),Fraction(m,e)
        check((x<y)==(e*x<e*y),'orderedEmbedding')

# A rank-two lexicographic valuation has a positive non-Archimedean value:
# any multiple of v(t)=(0,1) is below v(s)=(1,0).
for n in range(1,25):
    check((0,n)<(1,0),'rankTwoCounterexample')

counts['scope']='Finite Laurent-polynomial, residue, coset and ordering regressions only. The general valuation inequality, transcendence argument and infinite-tower counterexample are justified by the written proofs, not enumeration.'
print(json.dumps(counts,indent=2))
```

### niceness-definability — First-order expressibility of niceness and the test-form unit condition

Added by cc-442dc5 (E17). Missing; routed to FinitelyGeneratedFieldDefinability. No API or tests are proposed; the statement and proof steps are in the result.

### function-field-fundamental-equality — Fundamental equality for function fields in one variable, without separability

Added by cc-442dc5. Missing; routed to AlgebraicModuliForArithmeticGeometry:A0-extension, which owns separability-free finite normalization. Used for a purely inseparable extension in Lemma 3.6.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every prerequisite resolves. Every missing item is routed exactly once.
- **Findings.** Every `sourceIssues` locator was checked against the v2 text layer.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E17 and its repair.
- Check E18: where dimensions one and two of Theorem 1.2 come from.
- Check the owner chosen for the separability-free fundamental equality.


### Current review amendments to historical findings

E17 is an omitted formula-level justification. Its repaired finite-place test is the scaled derivative criterion in `niceness-definability`, with dyadic restricted to characteristic zero; the earlier bound involving `4a_1a_0` is superseded. E18 is **rejected** as a newly discovered error, while `low-dimensional-biinterpretability` remains the explicit adapter for implementation. The source-issue review objects are authoritative for these dispositions.
