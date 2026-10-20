# ArithmeticKTheory: independent package review

Job: `REV-PKG-ArithmeticKTheory~codex2`, issue #11353.
Reviewer: `independent-review-REV-PKG-ArithmeticKTheory~codex2`.
Agent: Codex, session `codex-Ut7za3`. Date: 2026-10-20.
Verdict: **accepted**, with the corrections below applied.

This is an independent assessment of the package after both fixes, not an
endorsement of the fix workers' review metadata. I read the package, effective
assembly inventory, the earlier adversarial review, both fix handoffs, the
library audit, and the primary sources listed below. The issue's old Mordell
title and reference to a nonexistent earlier `~codex` report are template
mismatches; its final instructions and ArithmeticKTheory deliverable paths
identify the work reviewed here.

Acceptance concerns a roadmap ready for a draft upstream PR. Its theorem
targets, requested supplier exports and explicit computational sub-targets
are not claims of completed formalization.

## Corrections in this review

1. Corrected **Example VI.2.4** to **Lemma VI.2.4**, printed p. 472 of the
   combined K-book, in the rational w-value paragraph.
2. Linked Groenewegen's public Leiden author preprint and changed all its
   local page references to that version's printed pages 1–16. Linked the
   Feng–Galatius–Venkatesh author PDF and changed its local references to
   printed pp. 12–15. These are the versions actually checked; no equivalence
   of uncollated journal pagination is assumed.
3. Named `caputoSexticArithmeticCertificate` as the open computational theorem
   target. The four arithmetic hypotheses, local degree and root orders were
   already specified; they now have an addressable target. The PARI-reported
   class group is still not represented as independently certified here.
4. Named `rawWildKernel_eq_symbol_of_localRestriction_eq_zero` and spelled
   out its hypothesis on the **actual** completion restriction maps. The
   higher-degree vanishing remains an explicit open sub-target. The
   unconditional symbol theorem is unchanged.
5. Distinguished the **current** library's `TauCeti.ExactK0` and `liftEquiv`
   from the older elaboration pin, and gave their supplying module. This
   prevents reading a current-library reuse statement as a pinned import.
6. Removed two standalone numerical Lean examples about ZMod 8 norms and
   ZMod 5 characters. Their mathematical negative controls remain in the
   README; neither example tested a real-bodied definition introduced in
   the Lean file. The twelve retained examples do, with at most two per
   definition. No theorem signature, general arithmetic target or README
   test was removed.

## Earlier proof requirements: independent dispositions

### U1: fixed modulus versus eventual divisibility

The fixed-modulus target is `coefficientKernel_eq_inter_mul`, not an
identification with ambient infinite height at every annihilator. For a
finite subgroup T containing div A, choose, for each element of T outside
div A, a positive multiplier whose image excludes it. A common multiple of
these finitely many multipliers excludes all those elements simultaneously.
This proves `inter_mul_eventually_eq_divisibleSubgroup`; an annihilator can
be included in that common multiple but cannot replace it. The Lean
signature has `[Finite T]`, not `[Finite A]`, and explicitly assumes
`divisibleSubgroup A ≤ T`.

The Z/4 example with T=2A disproves the abstract annihilator inference.
Caputo v2, Proposition 4 and Example 2, pp. 16–17, give the separate
arithmetic example under its stated field data. Theorem 1, pp. 12–14,
computes its fixed-modulus class-group obstruction. I checked the
degree-six local field calculation: the conductor-61 cubic splits at 3,
the conductor-9 cubic supplies the local cubic extension, and adjoining
μ₃ gives Q₃(μ₉), of degree six. Its 3-primary roots have order nine,
whereas the global group has order three. Moore's sequence then gives a
tame 3-part of order three, while the class-group obstruction at modulus
three is nonzero and the ambient infinite-height 3-part is zero.

The source reports the S-class group using PARI. I did **not** certify that
calculation, irreducibility or a complete arithmetic data record for this
polynomial. The new named certificate target retains those obligations.
The deduction from the four hypotheses, rather than an unchecked
computation, is the accepted proof route. Banaszak v1, equations
(56), (59)–(60), p. 17, and Remark 6.1/Theorem 6.4, p. 31, independently
confirm the distinction between the stabilization index and an exponent.
The unsupported uniform target is absent, and no later argument uses it.

### U2: exceptional dyadic descent and the real hidden kernel

The substitute for the invalid independent class/norm prescription is a
specified cohomological proof, `cyclotomicPicard_image_div`. I checked
Hutchinson's dated author preprint, Theorem 2.8 and Corollary 2.9,
pp. 6–8; Theorem 4.3, Corollaries 4.7–4.8 and Theorem 4.9(ii),
pp. 13–15; Lemma 5.1, Remark 5.4, Theorem 5.6 and Corollary 5.7,
pp. 16–19. The full cyclotomic-field complex has a middle defect of
order two for even weight over a very special field. The faithful twist
field removes that defect. In odd weight the two fields agree.

The S-local and all-place Sha¹ groups are not interchanged: all-place
injects into S-local, so the dual map is a surjection in the opposite
direction. In the special odd-weight case both have order two; in the
very-special even-weight case only the S-local group does. The real H³
Bockstein contribution is retained. The finite integral H² group then
uses the separate eventual multiplier from U1. No class-group norm-map
injectivity is assumed.

`compatibleClassCyclotomicPrime` separately requires equality of Artin
restrictions to the intersection of the class and cyclotomic fields.
Q(i) excludes norm residue 3 modulo 4 before any class is prescribed;
Q(sqrt(-17)) also detects a nontrivial intersection restriction. This
correct theorem explains the old failure without being used as a
replacement proof of the Picard-image assertion.

For real fields, I read the rendered wild-kernel preprint pp. 18–21,
including Proposition 8.4, Lemmas 8.5–8.6 and Theorem 8.7. The real
correction belongs to K→H²; it is not an invented kernel of the ring
motivic-H²/ordinary-H² comparison. Its finite subgroup lies in ambient
div K, by the stated transfer/signature argument. This yields the
`weibel_symbol_divisibility` quotient of order two exactly in odd weight
over special fields. The stronger raw-completion assertion remains
conditional, now under the named target above. U2 is closed at the
roadmap proof level with that boundary intact.

### U3: detected maps and cyclotomic inputs

- **Harris–Segal.** `cyclotomicWreathMap` uses finite free μ_m-sets and the
  monomial functor, not a chosen abstract cyclic summand. K-book VI.1.5
  and VI.2.5, pp. 466–467 and 473, and Mitchell Theorem 3.4 with its
  proof sketch, pp. 184–186, support the replacement route. I checked
  the Sylow valuation of GL_r, stable transfer on ordinary homology,
  the localized stable section, the infinite-loop counit factorization,
  and the Bockstein step controlling the order of the lifted class.
  Transfer is not claimed to be scalar on stable homotopy. At two the
  nonexceptional descent uses a surjective norm, with the explicit cyclic
  action, rather than division by two or a false blanket doubling rule.
- **Keune.** Caputo Proposition 3 and Remark 5, p. 8, together with
  Lemmas 4, 6 and 7, pp. 7–8, give the explicit ideal-cocycle,
  Kummer–Brauer and corestriction construction of
  `cyclotomicPicardInjection`. The vanishing of H₁ for its particular
  faithful odd cyclotomic module justifies this injection after
  coinvariants. Ramified odd primes remain allowed. I also read
  Calegari–Garoufalidis–Zagier v3, Lemma 3.5 and proof, p. 20: its
  unramified setting is a specialization, not the source of the more
  general proof. The diagonal twist gives χ⁻¹ coinvariants; the
  invariant-vanishing implication uses character projectors and finite
  p-group Nakayama, not an identification of the two functors.
- **Regular primes.** I checked Sharifi Theorem 4.4.2 and Corollaries
  4.4.4–4.4.5, pp. 111–113, Theorem 4.5.7, p. 117, and the bounded
  integral-measure moments in §5.2, pp. 134–136. I read all twelve
  article pages of Ribet's author scan, pp. 151–162, including the local
  finite-flat argument that removes ramification at p. Conjugation on
  the upper-right entry gives χ^(1−2k); at p=37,k=16 this is exponent
  five, not 31. Yokoyama Theorem 4 and proof, pp. 354–355, supply the
  one-prime tower argument. The three additional requests
  `cyclotomic_kummer_congruence`, `cyclotomic_finite_herbrand_ribet` and
  `cyclotomic_character_reflection` are explicit; the existing one-prime
  export is specialized rather than replanned. The all-index numerator
  step uses integral smoothed moments when p divides the index. The
  coefficient/Bott module includes p=3 with its safe operation, and
  Vandiver remains a separate hypothesis for the integral table.

I did not obtain Harris–Segal's or Keune's original articles. Their
original proofs are not being certified by bibliographic inference: the
explicit alternative constructions above close those evidence gaps.
Washington is not cleared by the library index; no copy was used.

## Source sample and source versions

Before making edits I selected fifteen parenthetical locator occurrences
outside the targeted U1–U3 passages, using pseudorandom seed 11353. All
fifteen and their companion citations were checked against the source.
The table uses the corrected author-version locators where applicable.

| Sample | Locators checked | Finding |
| --- | --- | --- |
| 1 | Bass–Tate II Theorem 3.1, p. 403; Groenewegen Theorem 15, pp. 12–13 | Finite-step descent; author pagination made explicit. |
| 2 | K-book V.6.8 and Corollaries 6.8.1–6.8.2, pp. 412–413 | Odd localization and coefficient route agree; fixed-modulus qualification is separate. |
| 3 | VI.2 after Example 2.2.2 and Proposition 2.3, p. 471 | Exceptionality is cyclotomic noncyclicity. |
| 4 | Example VI.2.1.2, p. 470; VI.2.4, p. 472 | Corrected result kind to Lemma; rational w-values retained. |
| 5 | Bass–Tate Appendix Proposition 2 and Lemma 2, pp. 431–433, Gaussian case p. 436; K-book III.5.2.2, p. 218 | Small norm-two step and completeness remain separate. |
| 6 | K-book Corollary VI.9.9, pp. 522–523 | Dyadic two-rank hypotheses and residue classes agree. |
| 7 | Exercise VI.8.3.1, p. 514 | Positive even Gaussian primary example has the stated range. |
| 8 | V.6.6.3–6.6.4, p. 410 | Transfer/residue degree and restriction/ramification roles agree. |
| 9 | Bass–Tate II Theorem 3.1 and Lemma 3.2, pp. 403–407; Groenewegen §§1–2, pp. 1–4 | Image filtration distinguished from abstract truncated presentations. |
| 10 | K-book Definition VI.1.7, p. 468; VI.2.1 and Example 2.1.1–2, pp. 469–470 | Twist and first e-invariant conventions agree. |
| 11 | Quillen pp. 179–180; K-book IV.6.3–6.3.2, p. 320, V.6.6.3–6.6.4, p. 410 | Low K₀/Steinitz and norm conventions agree. |
| 12 | Wild-kernel author preprint Proposition 8.1 and (8.2), pp. 20–21 | Checked rendered diagram and real symbol normalization. |
| 13 | K-book Theorem VI.9.12, p. 525 | Totally real order ratio retains positive even weight and real factor. |
| 14 | V.4.3–4.4, p. 401; V.6.1–6.1.2, p. 406; V.6.6, p. 409 | Dedekind localization and the classical rows agree. |
| 15 | Definition VI.9.6.1 and (9.6–2), pp. 520–521; proof of Corollary 9.8, p. 522 | Selmer signatures, narrow classes and modified dimensions agree. |

Additional primary checks covered Quillen Theorem 3 and its stability and
finite-generation arguments, pp. 181–185; Kahn v3 §§4.2–4.3,
pp. 16–18; Sun v1 pp. 5–6; Serre III §1, IV §§3,6 and V §§1–2;
Calmès et al. v4 Corollaries 2.3.16, 2.3.18 and 2.3.19 with proofs,
pp. 47–48; Rognes–Weibel §1, p. 8; and Feng–Galatius–Venkatesh
Proposition 2.9, Lemmas 2.10, 2.11, 2.14, Corollary 2.12 and
Remark 2.13, author pp. 12–15. Groenewegen's definitions, lattice
estimates, unit quotient, section and multiplicativity were read in
§§1–8, especially Lemmas 6,7,9,12, Propositions 10,13 and
Theorems 14–15. The public PostScript was read as document data, not
executed. All repository explanations are original paraphrases, not
source excerpts or a section-by-section digest.

For reproducibility, the principal source files read have these SHA-256
identities. The package bibliography supplies their public links and
version-specific theorem/page references.

| Source version | SHA-256 |
| --- | --- |
| K-book, combined author PDF, 29 August 2013 | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Caputo, arXiv:1002.2936v2 | `0dd2d646a440cacfc7f8a33f4e8922ac3eb96a8b84a509dc5780026c3212191b` |
| Hutchinson, author preprint, 16 July 2004 | `4b17df7ff67808e65b19aeec2f71c8002926583e26446b1aafd90cd97fc6686f` |
| Weibel, wild-kernel author preprint, 23 July 2004 | `2675756fe4e03556dac1b26538eeca0fd1b8bf0ae7d800433a3c708812f3478b` |
| Mitchell, MSRI 27, pp. 163–240 | `3c4315e7b40cfaee78a15a53dfb85ed94aa817e6ba08ffa684c17c1df769df7b` |
| Ribet, author scan, Inventiones 34, pp. 151–162 | `6985813b4026bb0fd7098aed3f816262e0922f62a5d2dab22e29bcc2eb323471` |
| Sharifi, author notes | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| Feng–Galatius–Venkatesh, Berkeley author PDF | `5d717b2a94288593049be2aed34e38dbde10750beba4bd3d3387820d038e8807` |

The known erroneous shortcuts in sources are not imported: the w₁₀(Q)
value is 264; a real closed field is nonexceptional under the stated
definition; special-field local tests include nonexceptional completions;
and the regular-prime H¹ parity is derived from the characters rather
than the inconsistent prose before K-book VI.10.6.

## Fidelity, generality and library ownership

The effective accepted assembly consists of nine own targets and 130
inherited targets, with 22 explicit contract revisions. I checked that
inventory against the README rather than treating every historical node
in an early partial packet as a separate package target. Its breakdown is
N.1: 7; N.2: 11; N.3 finite generation: 20; N.3 ranks: 3;
other N.3: 8; N.4: 7; N.5: 13; N.6: 46; N.7: 9; N.8: 15.
The three function-field/curve targets have their existing explicit
outside-number-field disposition. The remaining 136 have package homes.
No further target was dropped in this review.

I read the N.1–N.8 reviewed library audit, the two atlas examples
Multiquadratic and UniversalCovers, and the current ProfiniteArithmetic
and AlgebraicVectorBundles narratives with their signature-file forms.
The package keeps the detailed API, hypotheses and tests in its prose
while its Lean file states only what the existing carriers allow.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I inspected
the actual S-integer/units, class-number, finite abelian group structure,
presentation, lattice-index and Bernoulli declarations. At Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, I inspected the
S-integer Basic/ClassGroup/Unit and class-norm source files; their local
Git blob hashes match the files in the pinned GitHub tree. In particular:

- The existing S-integer carrier does not supply the localization
  criterion for every arbitrary Dedekind prime set.
- `integerClassGroupEquiv` already supplies the quotient class group;
  the package adds its K-theoretic interpretation, not that construction.
- `unit_fg_of_units` assumes finite S and finite generation of base
  units; it gives no S-unit rank formula.
- `ClassGroup.relNorm_extendedHom` is the degree-power composite, and
  does not remove the Steinitz correction in restriction of scalars.
- Presentation surjectivity and determinant-index declarations do not
  prove any of the arithmetic relation or spanning assertions.

I searched the current read-only TauCetiRoadmap at
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered
objects, fields and operations: rank subcategories and relative homology,
exact-category K₀, multiplication images, coefficient operations,
root twists, cyclotomic actions, ideal norms, class groups, congruence
lattices and quadratic arithmetic. The nine newer roadmap families and
the four named Completed roadmaps were included. OperatorTheory is a
family with child signature files, rather than a top-level Suggested.lean.

The closest overlaps are already suppliers: current exact K₀ is a
presentation with an additive universal property, not genuine higher
Q-theory; LocalGaloisGroups' local roots and cyclotomic character do not
give the global twisted W_i calculation; IntegralLattices' general
lattice results do not construct the arithmetic congruence lattice and
its residue quotient. Current `WorkedExamples.Sqrt5` does already
provide the degree, integral generator, discriminant, real places, class
number, units and dyadic arithmetic. I read those declarations and their
minimal-polynomial/generation hypotheses. They remain in the supplier
contract. No additional duplicate target was found or removed.

There is no `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder.
The four named later roadmaps were audited by section: SpecialValuesBirchTate
and K3BlochGroups each occur only in Downstream consumers, explicitly as
consumers; Polylogarithms and PeriodsAndSpecialValues do not occur. The
golden-field upper and lower bounds use no special-value equality. The
conditional integral table has the independent K-book VI.10.1, p. 527,
order input. The later comparison 4/120=1/30 is downstream of the
certificate, not evidence for its order.

The connected finite-type H.3 export, categorical comparison, finite-type
H.6 orbit control, K.7 coefficient maps, early M.7 edge, RT.4 real maps,
hermitian comparisons and the one-prime Brauer computation remain exact
named supplier obligations. They are not replaced by the existence of
object types. The package does not import the later M.8 Chern family to
prove its early edge. External packet synchronization remains outside
this review's deliverables.

## Adversarial pass over statements, definitions and conventions

Each row includes the subsection's named target APIs, maps and defining
properties, not only its headline. I checked their domains, identities,
composites, support, positivity and degree restrictions against the
following instances. Unless a correction is named, the statement is
retained with its explicit supplier hypotheses.

| README | Instances and distinguishing computations | Disposition |
| --- | --- | --- |
| Conventions | Field versus DVR; n=0/1; negative Bott degrees; β{5,2}=2 and β{2,5}=3 modulo 5 | Boundary and inverse tame symbol distinguished; no negative ordinary table. |
| 1.1 | Empty/full/infinite S; field; nonprincipal prime in Q(sqrt(-5)); 1 and 0 | Both denominator conditions required; torsion class group suffices without finite S. |
| 1.2 | Identity S-inclusion and field extension; Q⊂Q(i); an extra upper prime over 5 | Monotone direction and exact inverse-image prime set retained. |
| 1.3 | Unit ideal; rank-zero projective; quadratic free algebra; nontrivial Steinitz class | Transfer has determinant correction; norm composite is degree power. |
| 2.1 | No primes, one prime, two residue coordinates, infinitely many nonzero coordinates | Exact sequences use relative indexing and a direct sum. |
| 2.2 | Uniformizer p has valuation one; nonprincipal divisor; inverse-ideal class | Boundary and class-map signs match the low rows. |
| 2.3 | Totally ramified quadratic, unramified residue extension, split prime, identity and composition | Restriction uses e; transfer uses the actual residue transfer, without an extra e. |
| 2.4 | n=2 and 4; n=0 excluded; trivial residue even group | Tame input at two and finite-field vanishing in higher degrees distinguished. |
| 3.1 | Rank zero; nonfree rank one; two proper layers for dimension one; F₂² | Full projective Q-category; exclude (0,V); correct interval order. |
| 3.2 | St₁=Z; i<m; m=i then i+1; connected H-space with π₁=K₀ | Signed shift i−m and stability bounds retained; no simply connected shortcut. |
| 3.3 | Empty/singleton finite S; degree one versus n≥2; identity/composite localization | Actual rationalized map, not a basis-selected equivalence; degree-one free defect retained. |
| 3.4 | Q in degrees 2,3,5; imaginary quadratic in 3,5; infinite S | Correct ranks; finite even ring groups and infinite torsion field groups distinguished. |
| 3.5 | n<0 versus classical n≥0; symmetric/quadratic; characteristic two | Genuine/periodic/classical ranges and characteristic-zero hypothesis retained. |
| 4.1 | Trivial Galois action; twist zero; negative twist; separably closed field | Zero twist may be infinite; negative twists are duals. |
| 4.2 | Odd ℓ, image order dividing/not dividing i; i divisible by ℓ; i=0 | Residue-order and valuation conditions both present; finite formula excludes weight zero. |
| 4.3 | Q, Q(i), Q(sqrt(-2)), imaginary exceptional field, real closed field | Dyadic cyclicity branches retained; real places do not define exceptionality. |
| 4.4 | Weights 2,4,6,10 give 24,240,504,264 | Corrected Lemma locator; no source typo in weight ten imported. |
| 5.1 | n=1/3; modulus 2/3; q=2,i=1 | Odd degree-one exception; coefficient reduction rather than an unsafe ring product. |
| 5.2 | Degree-one roots; finite fields F₃ at weights 1/2; Q degrees 3/5 | Actual Bockstein/edge maps; dyadic real kernel/cokernel retained. |
| 5.3 | Imaginary exceptional field; i=1 excluded; S enlarged | cd≤2, not nonexceptionality, controls the odd torsion isomorphism. |
| 5.4 | w=24,r=1 gives C48; w=2,r=2 gives C4⊕C2; r=0 | Diagonal extension not split; index n modulo eight. |
| 5.5 | Odd ℓ; exact dyadic root order ≥4; finite rank transfer; nonexceptional dyadic norm | Actual monomial source and coefficient order control retained; U3 replacement verified. |
| 6.1 | One ℓ-place, zero class group; cyclic ℓ and ℓ² factors; real dyadic excluded | Rank t+s−1 is not a full order; integral quotient differs from coefficient group. |
| 6.2 | Same real signature with different Selmer signs; ordinary/narrow class group | Signature defect is not computed from units alone. |
| 6.3 | Q(sqrt(2)) versus Q(sqrt(7)); degree four hidden C | Real elementary kernel ρ remains in K→H². |
| 6.4 | All four even residues; odd n; n=0; s=0/1 | Numerical totalization separated from arithmetic range; s≥1 needed for increment. |
| 6.5 | Q at i=2/4 gives 1/12 and 1/120; i=0/odd excluded | Finite groups, real factor and zero-group order one retained. |
| 6.6 | Q, Z, C4, Q/Z; T=2C4; C(2^r); incompatible roots; Caputo hypotheses | Infinite height is ambient; eventual bound distinct; certificate target named. |
| 6.7 | Q sign class; Gaussian field; no real places; i=1/2; finite versus infinite support | Positive, raw and symbol groups have distinct defining maps. |
| 6.8 | One/missing ℓ-place; additional S-prime with ℓ dividing q^i−1; trivial wild group | Primary Moore sequence uses correct S; all order factors nonzero. |
| 6.9 | All local coordinates zero; real even weight; nonzero hidden C | Strict cohomological kernel and K comparison retain the real correction. |
| 6.10 | Q, Q(sqrt(-14)), Q(sqrt(-17)); m=4/8 and q odd; q=2 excluded | Special and very special distinct; faithful norm not multiplicative field norm. |
| 6.11 | Trivial G; C₂ acting by −1 on C4; H∩L=F versus L⊆H; real H³ | Coinvariant H₁ defect, compatible Artin restriction and twist-field passage retained. |
| 6.12 | Odd special obstruction C2; even very-special full-field defect; degree four real C; torsion into divisible torsion | Independent symbol proof verified; higher raw equality has explicit named conditional target. |
| 6.13 | F=Q(μ₃),p=3,n=1; p=2 excluded; principal ideal; χ=2,χ⁻¹=3 modulo 5 | Ramified generality and actual Kummer map retained; 2·3=1 fixes twist. |
| 6.14 | Empty presentation; C4↠C2; matching full primary orders; ρ=1 | Upper span does not prove equality; independent lower quotient mandatory. |
| 6.15 | j=0/−1/1; q=3 allowed, q=2 excluded; identity involution on C2 | Signed all-integer slots and odd-modulus projectors; author-version locators clarified. |
| 6.16 | Degree 0/1/2; p-prime uniformizer; negative Bott degree | Extra valuation Cq at ordinary degree one; no negative ordinary comparison. |
| 7.1 | k=0/1/2; p divides index; trivial character | Bernoulli value −1 at zero and positive reindexing retained; numerator reduced first. |
| 7.2 | p=0/1/2/3/37; finite range versus all indices; one-prime tower | Prime and odd hypotheses explicit; no Vandiver in regularity criterion. |
| 7.3 | p=37,k=16; projector denominator p−1; matrix conjugation; p-local extension | Direct exponent five; finite-flat proof removes ramification. |
| 7.4 | ℓ=3/5; one dyadic/ℓ-prime; irregular 37; changing primitive root; two Bott shifts | Coherent coefficient action and basis dimensions 3/5; no arbitrary integral permutation lattice. |
| 7.5 | One p versus all odd p; mod-p dimension zero/one; low n=2,3,6,7 | Vandiver, cyclicity and orders separate; K₄(Z)=0 unconditional. |
| 8.1 | Empty generators; arithmetic inputs without relation proofs; wrong lower quotient | Data do not contain the desired K-group; certificate needs relations, span and independent lower bound. |
| 8.2 | K₀ through K₄ of Z; one inverted prime; q=2 residue | C48 and degree-one exception retained; higher sequence not silently split. |
| 8.3 | Step zero; equal norm primes; change uniformizer by old unit | Actual image filtration and Tate triangle, not injectivity of truncated presentations. |
| 8.4 | Zero cross-difference; equal representatives; trivial residue group | No division by a−b at zero; trivial residue does not imply injectivity. |
| 8.5 | Gaussian prime 1+i of norm two, then norms ≥5 | Exceptional small step checked separately; zero tame kernel does not mean zero field K₂. |
| 8.6 | Two/three coordinates; q=4; t<q; common stretch with determinant one | Covolumes 5q and 5sqrt(5)q²; nonzero coordinates and old support justified. |
| 8.7 | Zero cross-difference; tied q′=q; inverse prime generator; q>33 | Strict norm bounds and unit heights give the cutoff without special values. |
| 8.8 | Every listed prime, relation and selected determinant | All 173 relations and 23 signed minors recomputed below. |
| 8.9 | Two sign vectors versus their product; g,h have order at most two | Independent upper/lower order four; source-method pages clarified. |
| 8.10 | Q has C48; Q(i) has Z⊕C24 though both w₂=24 | Arithmetic rank/torsion precedes downstream Bloch analysis. |

All 62 definition/target Checks blocks have at least three bullets.
The satisfying/failing cases test units, supports, zero weights, real
defects, nonprincipal ideals, character inversions and missing lower
bounds; they are not merely restatements of definition names. Every
README definition is either real-bodied in Lean or covered in the
closing named-object list. Extra API theorem targets remain in the
README without fabricated carriers.

## Independent finite-certificate recomputation

I wrote an exact rational-pair calculation for Z[ε], ε²=ε+1. Its product
is [a,b][c,d]=[ac+bd,ad+bc+bd], conjugation is [a+b,−b], and norm
is a²+ab−b². Negative powers use conjugation divided by the nonzero
norm. For each fenced relation I evaluated a−b−π_v w exactly and
obtained [0,0]. I formed the integer rows A−B and recomputed the
selected determinants in the stated column order. The listed old units
and their residue images generate a group of order q−1 in every case.

| π_v | q | Relations | Signed determinants | gcd |
| --- | ---: | ---: | --- | ---: |
| [2,0] | 4 | 4 | 6, −3 | 3 |
| [−1,2] | 5 | 3 | 4 | 4 |
| [3,0] | 9 | 4 | 8 | 8 |
| [3,1] | 11 | 15 | 60, −30, −10 | 10 |
| [4,−1] | 11 | 12 | 70, −20 | 10 |
| [4,1] | 19 | 14 | −54, −36 | 18 |
| [5,−1] | 19 | 16 | 216, −18 | 18 |
| [5,1] | 29 | 27 | −168, −224, 420 | 28 |
| [6,−1] | 29 | 20 | 56, 28 | 28 |
| [5,2] | 31 | 22 | 90, 60 | 30 |
| [7,−2] | 31 | 36 | −180, −240, −90 | 30 |

The totals are 173 relations and 23 determinants. The polynomials and
prime norms account for all eleven prime ideals up to norm 33, including
both primes at each split rational prime. The determinant gcd q−1 and
residue generation provide opposite index bounds; no single minor is
assumed to equal the index. This is an independent arithmetic check of
the displayed data, not a Lean proof of the certificate.

For the large-prime argument I checked the two- and three-coordinate
lattice covolumes, the 4tt′ cross-difference bound, simultaneous
representatives, tied preceding primes, the inverse-generator estimate,
and the ordinary-unit height bound. The strict inequalities give q>33
using 320/π²<33. Finally g and h have sign vectors (−1,−1) and
(1,−1), respectively. They give the lower bound four independently of
the upper two-generator, exponent-two presentation.

## Lean signatures and validation

The final file has seven light real-bodied definitions, thirteen theorem
targets and twelve proved examples in 225 lines. Its imports are
`Mathlib` and the actually used Tau Ceti S-integer module. There is no
sorry-defined data, ad hoc higher K carrier, auxiliary theory development
or admitted example. The heavy targets remain in the README.

I compared all thirteen theorem signatures, exceeding the ten-signature
requirement:

| Signature group | Agreement checked |
| --- | --- |
| `integer_isLocalization_iff` | Arbitrary Dedekind R, fraction field F, arbitrary S; both conditions on M. |
| `integer_isLocalization_of_torsion_classGroup` | Torsion class group, with no finite-S assumption. |
| `borelRank_even` | All numerical even inputs; arithmetic range stated separately. |
| `mem_divisibleSubgroup_iff`; `divisibleSubgroup_eq_bot_of_finite`; `divisibleSubgroup_int` | Positive multipliers, finite ambient group only for the finite theorem, and the separate integer theorem. |
| `inter_mul_eventually_eq_divisibleSubgroup` | Finite subgroup, containment of ambient div, positive eventual multiplier and all positive multiples. |
| `bottCohomologySlot_totalDegree` | Integer twist and signed subtraction; both Boolean signs. |
| `evenTwoRank_add_prime` | s≥1 and even n; numerical n=0 allowed. |
| `kummer_criterion` | Prime and odd hypotheses, finite nonzero Bernoulli range, reduced integer numerator. |
| `isRegularPrime_three`; `isRegularPrime_of_lt_37`; `not_isRegularPrime_37` | Separate boundary at three, all primes below 37 including two, and the irregular example. |

The retained definition examples cover S-unit 1/0; real/imaginary Borel
ranks; divisible Q and finite C4; Bott slots at zero and negative degree;
two-rank real/zero inputs; Bernoulli zero/one/two; regularity's totalized
0/1 inputs. None invokes a sorry'd theorem.

Final checks:

- `lean-check research/blueprint/packages/ArithmeticKTheory/Suggested.lean`
  exited **0** in the shared pinned build. Memory available beforehand
  was 78 GB. Its only diagnostics were the thirteen intended theorem
  `sorry` warnings.
- `python3 scripts/check_sorry_data.py` on the suggested file: **0**.
- `python3 scripts/check_blueprint.py` on each of the eight ArithmeticKTheory
  assembly/input packets, read-only: **0 errors, 0 warnings**. This is
  structural validation, not an assertion that their historical gap
  records were edited.
- `python3 research/blueprint/intake.py check-files` on the submission's
  files: **0 problems**; JSON parses and metadata is exactly
  `topic = "math.NT"` on one line.
- `git diff --check`: passed. The README is below the issue's 200 KB limit.

No unresolved defect requiring `needs_changes` remains within this package
review. The named computational and conditional extension obligations,
supplier requests and external packet updates above remain visible. No
source passages, private-library files or suspicious fetched instructions
were incorporated.
